#ifndef _ELF_PETUCHPC_H
#define _ELF_PETUCHPC_H

#include "elf/reloc-macros.h"

START_RELOC_NUMBERS (elf_petuchpc_reloc_type)
  RELOC_NUMBER (R_PETUCHPC_NONE, 0)
  RELOC_NUMBER (R_PETUCHPC_DIR32, 1)
END_RELOC_NUMBERS (R_PETUCHPC_max)

#endif
