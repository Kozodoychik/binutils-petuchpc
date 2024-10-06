#include "as.h"
#include "safe-ctype.h"
#include "opcode/petuchpc.h"
//#include <math.h>

#define NEXT_OPERAND(s) while (ISSPACE(*(++s))) {}

extern const petuchpc_reg_info_t petuchpc_reg_info[17];
extern const petuchpc_opc_info_t petuchpc_opc_info[128];

const char comment_chars[]		= "#";
const char line_separator_chars[]	= ";";
const char line_comment_chars[] 	= ";#";

static int pending_reloc;
static htab_t *opcode_hash_control;
static htab_t *register_hash_control;

const pseudo_typeS md_pseudo_table[] =
{
	{0, 0, 0}
};

const char FLT_CHARS[] = "rRsSfFdDxXpP";
const char EXP_CHARS[] = "eE";

void
md_operand (expressionS *op __attribute__((unused)))
{

}

void
md_begin (void)
{
	const petuchpc_opc_info_t *opc;
	const petuchpc_reg_info_t *reg;
	opcode_hash_control = str_htab_create();
	register_hash_control = str_htab_create();

	for (opc = petuchpc_opc_info; opc->name; opc++)
		str_hash_insert(opcode_hash_control, opc->name, (char*)opc, 0);

	for (reg = petuchpc_reg_info; reg->name; reg++)
		str_hash_insert(register_hash_control, reg->name, (char*)reg, 0);

	bfd_set_arch_mach(stdoutput, TARGET_ARCH, 0);
}

static char*
parse_exp (char* str, expressionS* exp)
{
	char* save = input_line_pointer;

	input_line_pointer = str;
	expression(exp);
	str = input_line_pointer;
	input_line_pointer = save;
	return str;
}

static int is_pointer_operand(char* str){
	if (*str != '[') return FALSE;

	while (*str != ']' && !ISSPACE(*str) && !is_end_of_line[*str & 0xff]) str++;

	if (*str != ']') return FALSE;

	return TRUE;
}

static char* parse_reg (char* str, int* r){
	char* start = str+1;
	petuchpc_reg_info_t* reg;
	
	if (*str != '$'){
		as_bad(_("Invalid operand: %s"), str);
		ignore_rest_of_line();
		*r = -1;
		return str;
	} 

	while (*str != ',' && *str != ']' && !ISSPACE(*str) && !is_end_of_line[*str & 0xff]) str++;

	char tmp = *str;
	*str = 0;

	reg = (petuchpc_reg_info_t*)str_hash_find(register_hash_control, start);

	if (reg == NULL){
		as_bad(_("Invalid register: %s"), start);
		ignore_rest_of_line();
		*r = -1;
		return str;
	}

	*str = tmp;
	*r = reg->reg;
	return str;

}

void
md_assemble (char* str)
{
	char* op_start;
	char* op_end;

	petuchpc_opc_info_t* opcode;
	char* out;
	int idx = 0;
	char pend;
	unsigned short iword = 0;

	int nlen = 0;

	while (*str == ' ') str++;

	op_start = str;
	for (op_end = str; *op_end && !is_end_of_line[*op_end & 0xff] && *op_end != ' ' && *op_end != '.'; op_end++) nlen++;

	pend = *op_end;
	*op_end = 0;

	if (nlen == 0)
		as_bad(_("shto"));

	opcode = (petuchpc_opc_info_t*)str_hash_find(opcode_hash_control, op_start);
	*op_end = pend;

	if (opcode == NULL)
	{
		as_bad(_("Invalid opcode: %s"), op_start);
		return;
	}

	switch (opcode->type){
		case PETUCHPC_TYPE0:{
			int reg1;
			int reg2;

			NEXT_OPERAND(op_end);

			op_end = parse_reg(op_end, &reg1);
			if (reg1 < 0) return;

			if (*op_end != ','){
				as_bad("gde zapyataya");
				ignore_rest_of_line();
				return;
			}

			NEXT_OPERAND(op_end);

			op_end = parse_reg(op_end, &reg2);
			if (reg2 < 0) return;

			iword = (opcode->opcode << 10) | ((reg1 & 0xf) << 6) | ((reg2 & 0xf) << 2);

			out = frag_more(2);
			out[idx++] = iword & 0xff;
			out[idx++] = (iword & 0xff00) >> 8;

			break;
		}
		case PETUCHPC_TYPE1:{
			int reg;
			int size_arg = 0;
			char size = 'b';
			expressionS operand2;

			if (*op_end == '.')
				size = *(++op_end);

			switch (size){
				case 'b': size_arg = 0; break;
				case 'w': size_arg = 1; break;
				case 'l': size_arg = 2; break;
				default:{
					as_bad("Invalid size");
					ignore_rest_of_line();
					return;
				}
			}

			NEXT_OPERAND(op_end);

			op_end = parse_reg(op_end, &reg);
			if (reg < 0) return;

			if (*op_end != ','){
				as_bad("gde zapyataya");
				ignore_rest_of_line();
				return;
			}

			NEXT_OPERAND(op_end);

			if (!is_pointer_operand(op_end)){
				as_bad("Invalid operand");
				ignore_rest_of_line();
				return;
			}

			op_end = parse_exp(op_end+1, &operand2);

			iword = (opcode->opcode << 10) | ((size_arg & 0b11) << 8) | ((reg & 0xf) << 4);

			out = frag_more(2);
			out[idx++] = iword & 0xff;
			out[idx++] = (iword & 0xff00) >> 8;

			char* where = frag_more(4);

			fix_new_exp(frag_now,
						(where - frag_now->fr_literal),
						4,
						&operand2,
						0,
						BFD_RELOC_32);

			break;
		}
		case PETUCHPC_TYPE2:{
			int reloc = BFD_RELOC_32;
			int len = 4;
			expressionS operand2;

			if (opcode->opcode == 0x18){
				reloc = BFD_RELOC_16;
				len = 2;
			}

			NEXT_OPERAND(op_end);

			op_end = parse_exp(op_end, &operand2);

			char* where;

			iword = (opcode->opcode << 10) | ((opcode->condition & 0b111) << 7);

			out = frag_more(2);
			out[idx++] = iword & 0xff;
			out[idx++] = (iword & 0xff00) >> 8;

			where = frag_more(len);

			fix_new_exp(frag_now,
						(where - frag_now->fr_literal),
						len,
						&operand2,
						0,
						reloc);			

			break;
		}
		case PETUCHPC_TYPE3:{
			expressionS operand2;
			int reg;
			
			char size = 'l';
			
			if (*op_end == '.')
				size = *(++op_end);
			
			NEXT_OPERAND(op_end);

			op_end = parse_reg(op_end, &reg);
			if (reg < 0) return;

			if (*op_end != ','){
				as_bad("gde zapyataya");
				ignore_rest_of_line();
				return;
			}

			NEXT_OPERAND(op_end);

			if (*op_end == '$'){
				as_bad("invalid operand");
				ignore_rest_of_line();
				return;
			}

			op_end = parse_exp(op_end, &operand2);
			
			char* where;
			char size_arg = 2;
			char len = 4;
			int reloc = BFD_RELOC_32;
			
			switch (size){
				case 'b':{
					size_arg = 0;
					len = 1;
					reloc = BFD_RELOC_8;
					break;
				}
				case 'w':{
					size_arg = 1;
					len = 2;
					reloc = BFD_RELOC_16;
					break;
				}
				case 'l':{
					size_arg = 2;
					break;
				}
				default:{
					as_bad("Invalid size");
					ignore_rest_of_line();
					return;
				}
			}

			iword = (opcode->opcode << 10) | ((size_arg & 0b11) << 8) | ((reg & 0xf) << 4);

			out = frag_more(2);
			out[idx++] = iword & 0xff;
			out[idx++] = (iword & 0xff00) >> 8;

			where = frag_more(len);
			fix_new_exp(frag_now,
						(where - frag_now->fr_literal),
						len,
						&operand2,
						0,
						reloc);
			break;
		}
		case PETUCHPC_TYPE4:{
			int reg;

			NEXT_OPERAND(op_end);

			op_end = parse_reg(op_end, &reg);
			if (reg < 0) return;

			iword = (opcode->opcode << 10) | ((reg & 0xf) << 6);

			out = frag_more(2);
			out[idx++] = iword & 0xff;
			out[idx++] = (iword & 0xff00) >> 8;

			break;
		}
		case PETUCHPC_TYPE5:{
			iword = opcode->opcode << 10;
			out = frag_more(2);
			out[idx++] = iword & 0xff;
			out[idx++] = (iword & 0xff00) >> 8;
			break;
		}
		case PETUCHPC_TYPE6:{
			int reg1;
			int reg2;
			int size_arg = 0;
			char size = 'b';

			if (*op_end == '.')
				size = *(++op_end);

			switch (size){
				case 'b': size_arg = 0; break;
				case 'w': size_arg = 1; break;
				case 'l': size_arg = 2; break;
				default:{
					as_bad("Invalid size");
					ignore_rest_of_line();
					return;
				}
			}

			NEXT_OPERAND(op_end);

			op_end = parse_reg(op_end, &reg1);
			if (reg1 < 0) return;

			if (*op_end != ','){
				as_bad("gde zapyataya");
				ignore_rest_of_line();
				return;
			}

			NEXT_OPERAND(op_end);

			if (!is_pointer_operand(op_end)){
				as_bad("Invalid operand");
				ignore_rest_of_line();
				return;
			}

			op_end = parse_reg(++op_end, &reg2);
			if (reg2 < 0) return;
			op_end++;

			iword = (opcode->opcode << 10) | ((reg1 & 0xf) << 6) | ((reg2 & 0xf) << 2) | (size_arg & 0b11);

			out = frag_more(2);
			out[idx++] = iword & 0xff;
			out[idx++] = (iword & 0xff00) >> 8;

			break;
		}
	}

	//out = frag_more(1);
	//out[idx++] = opcode->opcode;

	while (ISSPACE(*op_end))
		op_end++;

	if (*op_end != 0)
		as_warn("aaaaaaaa");

	if (pending_reloc)
		as_bad("piezdets\n");
}

const char*
md_atof (int type, char *litP, int *sizeP)
{
	int prec;
	LITTLENUM_TYPE words[4];
	char *t;
	int i;

	switch (type){
		case 'f':
			prec = 2;
			break;
		case 'd':
			prec = 4;
			break;
		default:
			*sizeP = 0;
			return _("bad call to md_atof");
	}

	t = atof_ieee(input_line_pointer, type, words);
	if (t)
		input_line_pointer = t;

	*sizeP = prec * 2;

	for (i=prec-1;i>=0;i--){
		md_number_to_chars(litP, (valueT)words[i], 2);
		litP += 2;
	}

	return NULL;
}

const char *md_shortopts = "";

struct option md_longopts[] =
{
	{NULL, no_argument, NULL, 0}
};

size_t md_longopts_size = sizeof(md_longopts);

int
md_parse_option(int c ATTRIBUTE_UNUSED, const char *arg ATTRIBUTE_UNUSED)
{
	return 0;
}

void
md_show_usage (FILE *stream ATTRIBUTE_UNUSED)
{
}

void
md_apply_fix (fixS *fixP, valueT * valP, segT seg ATTRIBUTE_UNUSED)
{
	char* buf = fixP->fx_where + fixP->fx_frag->fr_literal;
	long val = *valP;
	long max, min;
	//int shift;

	max = min = 0;
	//shift = 0;
	switch (fixP->fx_r_type)
	{
		case BFD_RELOC_32:{
			*buf++ = (val & 0xff);
			*buf++ = (val & 0xff00) >> 8;
			*buf++ = (val & 0xff0000) >> 16;
			*buf++ = (val & 0xff000000) >> 24;
			break;
		}
		case BFD_RELOC_16:{
			*buf++ = (val & 0xff);
			*buf++ = (val & 0xff00) >> 8;
			break;
		}
		case BFD_RELOC_8:{
			*buf++ = (val & 0xff);
			break;
		}
		default: abort();
	}
	if (max != 0 && (val < min || val > max))
		as_bad_where(fixP->fx_file, fixP->fx_line, _("offset out of range"));

	if (fixP->fx_addsy == NULL && fixP->fx_pcrel == 0)
		fixP->fx_done = 1;
}

long
md_pcrel_from (fixS* fixP)
{
	valueT addr = fixP->fx_where + fixP->fx_frag->fr_address;

	fprintf(stderr, "md_pcrel_from 0x%d\n", fixP->fx_r_type);

	switch (fixP->fx_r_type){
		case BFD_RELOC_32:
			return addr+4;
		default:
			abort(); return addr;
	}
}

/*void
md_number_to_chars (char* ptr, valueT use, int nbytes)
{
	number_to_chars_littleendian(ptr, use, nbytes);
}*/

arelent*
tc_gen_reloc (asection* section ATTRIBUTE_UNUSED, fixS* fixp)
{
	arelent *rel;
	bfd_reloc_code_real_type r_type;

	rel = xmalloc(sizeof(arelent));
	rel->sym_ptr_ptr = xmalloc(sizeof(asymbol*));
	*rel->sym_ptr_ptr = symbol_get_bfdsym(fixp->fx_addsy);
	rel->address = fixp->fx_frag->fr_address + fixp->fx_where;

	r_type = fixp->fx_r_type;
	rel->addend = fixp->fx_addnumber;
	rel->howto = bfd_reloc_type_lookup(stdoutput, r_type);

	if (rel->howto == NULL){
		as_bad_where(fixp->fx_file, fixp->fx_line,
			_("Cannot represent relocation type %s"),
			bfd_get_reloc_code_name(r_type));
		rel->howto = bfd_reloc_type_lookup(stdoutput, BFD_RELOC_32);
		gas_assert(rel->howto != NULL);
	}
	return rel;
}
