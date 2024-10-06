#define PETUCHPC_GET_OPCODE(instr)		((instr & 0b1111110000000000) >> 10)

#define GET_TYPE0_DEST(a) 				((a & 0b0000001111000000) >> 6)
#define GET_TYPE0_SRC(a) 				((a & 0b0000000000111100) >> 2)

#define GET_TYPE1_SIZE(a) 				((a & 0b0000001100000000) >> 8)
#define GET_TYPE1_DEST(a) 				((a & 0b0000000011110000) >> 4)


#define GET_TYPE2_CONDITION(a) 			((a & 0b1110000000) >> 7)

#define GET_TYPE3_SIZE(a) 				((a & 0b0000001100000000) >> 8)
#define GET_TYPE3_DEST(a) 				((a & 0b0000000011110000) >> 4)

#define GET_TYPE4_DEST(a) 				((a & 0b0000001111000000) >> 6)

#define GET_TYPE6_DEST(a) 				((a & 0b0000001111000000) >> 6)
#define GET_TYPE6_SRC(a) 				((a & 0b0000000000111100) >> 2)
#define GET_TYPE6_SIZE(a) 				(a & 0b11)

enum petuchpc_opc_types
{
	PETUCHPC_TYPE0,
	PETUCHPC_TYPE1,
	PETUCHPC_TYPE2,
	PETUCHPC_TYPE3,
	PETUCHPC_TYPE4,
	PETUCHPC_TYPE5,
	PETUCHPC_TYPE6
};

enum petuchpc_opc_condition
{
	PETUCHPC_COND_ALWAYS,
	PETUCHPC_COND_EQ,
	PETUCHPC_COND_NEQ,
	PETUCHPC_COND_GR,
	PETUCHPC_COND_L
};

typedef struct petuchpc_reg_info_t
{
	short reg;
	const char* name;
} petuchpc_reg_info_t;

typedef struct petuchpc_opc_info_t
{
	short opcode;
	const char* name;
	enum petuchpc_opc_types type;
	enum petuchpc_opc_condition condition;
} petuchpc_opc_info_t;
