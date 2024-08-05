#include "sysdep.h"
#include "bfd.h"
#include "libbfd.h"

const bfd_arch_info_type bfd_petuchpc_arch =
	{
		16,
		32,
		8,
		bfd_arch_petuchpc,
		bfd_mach_petuchpc,
		"petuchpc",
		"petuchpc",
		2,
		TRUE,
		bfd_default_compatible,
		bfd_default_scan,
		bfd_arch_default_fill,
		0,

	};
