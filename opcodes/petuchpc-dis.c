#include "sysdep.h"
#include <stdio.h>
#define STATIC_TABLE
#define DEFINE_TABLE

#include "opcode/petuchpc.h"
#include "dis-asm.h"

extern const petuchpc_opc_info_t petuchpc_opc_info[128];

static fprintf_ftype fpr;
static void *stream;

static char petuchpc_sizes[3] = {'b', 'w', 'l'};

int petuchpc_pow(int a, int n) // math.h отказывается работать
{
	if (n==0) return 1;
	for (int i=0;i<n-1;i++){
		a *= a;
	}
	return a;
}

int
print_insn_petuchpc (bfd_vma addr, struct disassemble_info* info)
{
	int status;
	stream = info->stream;
	bfd_byte buffer[4];
	petuchpc_opc_info_t opc_info;

	fpr = info->fprintf_func;

	if ((status = info->read_memory_func(addr, buffer, 2, info)))
		goto fail;

	unsigned short iword = bfd_getl16(buffer);

	unsigned char opcode = (unsigned char)PETUCHPC_GET_OPCODE(iword);

	opc_info = petuchpc_opc_info[opcode];

	if (opcode > 0x16){
		opc_info = petuchpc_opc_info[opcode+4];
	}

	switch(opc_info.type){
		case PETUCHPC_TYPE0:{
			unsigned char reg1 = GET_TYPE0_DEST(iword);
			unsigned char reg2 = GET_TYPE0_SRC(iword);

			fpr(stream, "%s\t$r%d, $r%d", opc_info.name, reg1, reg2);
			
			return 2;
		}
		case PETUCHPC_TYPE1:{
			unsigned char reg = GET_TYPE1_DEST(iword);
			unsigned char size = GET_TYPE1_SIZE(iword);
			unsigned long pointer = 0;
			char size_c = 'b';

			switch (size){
				case 1:
					size_c = 'w'; break;
				case 2:
					size_c = 'l'; break;
			}

			if ((status = info->read_memory_func(addr+2, buffer, 4, info)))
				goto fail;

			pointer = bfd_getl32(buffer);

			fpr(stream, "%s.%c\t$r%d, [0x%lx]", opc_info.name, size_c, reg, pointer);

			return 6;
		}
		case PETUCHPC_TYPE2:{
			unsigned char condition = GET_TYPE2_CONDITION(iword);
			unsigned long imm = 0;
			int size = 4;
			
			if (opcode == 0x16){
				opc_info = petuchpc_opc_info[opcode+condition];
			}

			if (opcode == 0x18){
				size = 2;
				if ((status = info->read_memory_func(addr+2, buffer, size, info)))
					goto fail;
				imm = bfd_getl16(buffer);
			}else{
				if ((status = info->read_memory_func(addr+2, buffer, size, info)))
					goto fail;
				imm = bfd_getl32(buffer);
			}

			fpr(stream, "%s\t0x%lx", opc_info.name, imm);

			return 2+size;
		}
		case PETUCHPC_TYPE3:{
			unsigned char reg = GET_TYPE3_DEST(iword);
			unsigned char size = GET_TYPE3_SIZE(iword);
			unsigned char b_size = petuchpc_pow((int)2, (int)size);
			unsigned long imm = 0;

			if ((status = info->read_memory_func(addr+2, buffer, b_size, info)))
				goto fail;

			switch (size){
				case 0: imm = buffer[0]&0xff; break;
				case 1: imm = bfd_getl16(buffer); break;
				case 2: imm = bfd_getl32(buffer); break;
			}

			fpr(stream, "%s.%c\t$r%d, 0x%lx", opc_info.name, petuchpc_sizes[size], reg, imm);

			return b_size+2;
		}
		case PETUCHPC_TYPE4:{
			unsigned char reg = GET_TYPE4_DEST(iword);

			fpr(stream, "%s\t$r%d", opc_info.name, reg);

			return 2;
		}
		case PETUCHPC_TYPE5:{
			fpr(stream, "%s", opc_info.name);
			return 2;
		}
		case PETUCHPC_TYPE6:{
			unsigned char reg1 = GET_TYPE6_DEST(iword);
			unsigned char reg2 = GET_TYPE6_SRC(iword);
			unsigned char size = GET_TYPE6_SIZE(iword);

			fpr(stream, "%s.%c\t$r%d, [$r%d]", opc_info.name, petuchpc_sizes[size], reg1, reg2);
			return 2;
		}
	}

	fpr(stream, "%s", opc_info.name);
	return 2;

	fail:
	info->memory_error_func(status, addr, info);
	return -1;
}
