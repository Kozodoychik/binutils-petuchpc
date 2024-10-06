# Check 64bit AVX512{F,VL} swap instructions

	.text
_start:
	vmovapd	%xmm29, %xmm30	 # AVX512{F,VL}
	vmovapd.s	%xmm29, %xmm30	 # AVX512{F,VL}
	vmovapd	%xmm29, %xmm30{%k7}	 # AVX512{F,VL}
	vmovapd.s	%xmm29, %xmm30{%k7}	 # AVX512{F,VL}
	vmovapd	%xmm29, %xmm30{%k7}{z}	 # AVX512{F,VL}
	vmovapd.s	%xmm29, %xmm30{%k7}{z}	 # AVX512{F,VL}
	vmovapd	%xmm29, %xmm30	 # AVX512{F,VL}
	vmovapd.s	%xmm29, %xmm30	 # AVX512{F,VL}
	vmovapd	%xmm29, %xmm30{%k7}	 # AVX512{F,VL}
	vmovapd.s	%xmm29, %xmm30{%k7}	 # AVX512{F,VL}
	vmovapd	%xmm29, %xmm30{%k7}{z}	 # AVX512{F,VL}
	vmovapd.s	%xmm29, %xmm30{%k7}{z}	 # AVX512{F,VL}
	vmovapd	%ymm29, %ymm30	 # AVX512{F,VL}
	vmovapd.s	%ymm29, %ymm30	 # AVX512{F,VL}
	vmovapd	%ymm29, %ymm30{%k7}	 # AVX512{F,VL}
	vmovapd.s	%ymm29, %ymm30{%k7}	 # AVX512{F,VL}
	vmovapd	%ymm29, %ymm30{%k7}{z}	 # AVX512{F,VL}
	vmovapd.s	%ymm29, %ymm30{%k7}{z}	 # AVX512{F,VL}
	vmovapd	%ymm29, %ymm30	 # AVX512{F,VL}
	vmovapd.s	%ymm29, %ymm30	 # AVX512{F,VL}
	vmovapd	%ymm29, %ymm30{%k7}	 # AVX512{F,VL}
	vmovapd.s	%ymm29, %ymm30{%k7}	 # AVX512{F,VL}
	vmovapd	%ymm29, %ymm30{%k7}{z}	 # AVX512{F,VL}
	vmovapd.s	%ymm29, %ymm30{%k7}{z}	 # AVX512{F,VL}
	vmovaps	%xmm29, %xmm30	 # AVX512{F,VL}
	vmovaps.s	%xmm29, %xmm30	 # AVX512{F,VL}
	vmovaps	%xmm29, %xmm30{%k7}	 # AVX512{F,VL}
	vmovaps.s	%xmm29, %xmm30{%k7}	 # AVX512{F,VL}
	vmovaps	%xmm29, %xmm30{%k7}{z}	 # AVX512{F,VL}
	vmovaps.s	%xmm29, %xmm30{%k7}{z}	 # AVX512{F,VL}
	vmovaps	%xmm29, %xmm30	 # AVX512{F,VL}
	vmovaps.s	%xmm29, %xmm30	 # AVX512{F,VL}
	vmovaps	%xmm29, %xmm30{%k7}	 # AVX512{F,VL}
	vmovaps.s	%xmm29, %xmm30{%k7}	 # AVX512{F,VL}
	vmovaps	%xmm29, %xmm30{%k7}{z}	 # AVX512{F,VL}
	vmovaps.s	%xmm29, %xmm30{%k7}{z}	 # AVX512{F,VL}
	vmovaps	%ymm29, %ymm30	 # AVX512{F,VL}
	vmovaps.s	%ymm29, %ymm30	 # AVX512{F,VL}
	vmovaps	%ymm29, %ymm30{%k7}	 # AVX512{F,VL}
	vmovaps.s	%ymm29, %ymm30{%k7}	 # AVX512{F,VL}
	vmovaps	%ymm29, %ymm30{%k7}{z}	 # AVX512{F,VL}
	vmovaps.s	%ymm29, %ymm30{%k7}{z}	 # AVX512{F,VL}
	vmovaps	%ymm29, %ymm30	 # AVX512{F,VL}
	vmovaps.s	%ymm29, %ymm30	 # AVX512{F,VL}
	vmovaps	%ymm29, %ymm30{%k7}	 # AVX512{F,VL}
	vmovaps.s	%ymm29, %ymm30{%k7}	 # AVX512{F,VL}
	vmovaps	%ymm29, %ymm30{%k7}{z}	 # AVX512{F,VL}
	vmovaps.s	%ymm29, %ymm30{%k7}{z}	 # AVX512{F,VL}
	vmovdqa32	%xmm29, %xmm30	 # AVX512{F,VL}
	vmovdqa32.s	%xmm29, %xmm30	 # AVX512{F,VL}
	vmovdqa32	%xmm29, %xmm30{%k7}	 # AVX512{F,VL}
	vmovdqa32.s	%xmm29, %xmm30{%k7}	 # AVX512{F,VL}
	vmovdqa32	%xmm29, %xmm30{%k7}{z}	 # AVX512{F,VL}
	vmovdqa32.s	%xmm29, %xmm30{%k7}{z}	 # AVX512{F,VL}
	vmovdqa32	%xmm29, %xmm30	 # AVX512{F,VL}
	vmovdqa32.s	%xmm29, %xmm30	 # AVX512{F,VL}
	vmovdqa32	%xmm29, %xmm30{%k7}	 # AVX512{F,VL}
	vmovdqa32.s	%xmm29, %xmm30{%k7}	 # AVX512{F,VL}
	vmovdqa32	%xmm29, %xmm30{%k7}{z}	 # AVX512{F,VL}
	vmovdqa32.s	%xmm29, %xmm30{%k7}{z}	 # AVX512{F,VL}
	vmovdqa32	%ymm29, %ymm30	 # AVX512{F,VL}
	vmovdqa32.s	%ymm29, %ymm30	 # AVX512{F,VL}
	vmovdqa32	%ymm29, %ymm30{%k7}	 # AVX512{F,VL}
	vmovdqa32.s	%ymm29, %ymm30{%k7}	 # AVX512{F,VL}
	vmovdqa32	%ymm29, %ymm30{%k7}{z}	 # AVX512{F,VL}
	vmovdqa32.s	%ymm29, %ymm30{%k7}{z}	 # AVX512{F,VL}
	vmovdqa32	%ymm29, %ymm30	 # AVX512{F,VL}
	vmovdqa32.s	%ymm29, %ymm30	 # AVX512{F,VL}
	vmovdqa32	%ymm29, %ymm30{%k7}	 # AVX512{F,VL}
	vmovdqa32.s	%ymm29, %ymm30{%k7}	 # AVX512{F,VL}
	vmovdqa32	%ymm29, %ymm30{%k7}{z}	 # AVX512{F,VL}
	vmovdqa32.s	%ymm29, %ymm30{%k7}{z}	 # AVX512{F,VL}
	vmovdqa64	%xmm29, %xmm30	 # AVX512{F,VL}
	vmovdqa64.s	%xmm29, %xmm30	 # AVX512{F,VL}
	vmovdqa64	%xmm29, %xmm30{%k7}	 # AVX512{F,VL}
	vmovdqa64.s	%xmm29, %xmm30{%k7}	 # AVX512{F,VL}
	vmovdqa64	%xmm29, %xmm30{%k7}{z}	 # AVX512{F,VL}
	vmovdqa64.s	%xmm29, %xmm30{%k7}{z}	 # AVX512{F,VL}
	vmovdqa64	%xmm29, %xmm30	 # AVX512{F,VL}
	vmovdqa64.s	%xmm29, %xmm30	 # AVX512{F,VL}
	vmovdqa64	%xmm29, %xmm30{%k7}	 # AVX512{F,VL}
	vmovdqa64.s	%xmm29, %xmm30{%k7}	 # AVX512{F,VL}
	vmovdqa64	%xmm29, %xmm30{%k7}{z}	 # AVX512{F,VL}
	vmovdqa64.s	%xmm29, %xmm30{%k7}{z}	 # AVX512{F,VL}
	vmovdqa64	%ymm29, %ymm30	 # AVX512{F,VL}
	vmovdqa64.s	%ymm29, %ymm30	 # AVX512{F,VL}
	vmovdqa64	%ymm29, %ymm30{%k7}	 # AVX512{F,VL}
	vmovdqa64.s	%ymm29, %ymm30{%k7}	 # AVX512{F,VL}
	vmovdqa64	%ymm29, %ymm30{%k7}{z}	 # AVX512{F,VL}
	vmovdqa64.s	%ymm29, %ymm30{%k7}{z}	 # AVX512{F,VL}
	vmovdqa64	%ymm29, %ymm30	 # AVX512{F,VL}
	vmovdqa64.s	%ymm29, %ymm30	 # AVX512{F,VL}
	vmovdqa64	%ymm29, %ymm30{%k7}	 # AVX512{F,VL}
	vmovdqa64.s	%ymm29, %ymm30{%k7}	 # AVX512{F,VL}
	vmovdqa64	%ymm29, %ymm30{%k7}{z}	 # AVX512{F,VL}
	vmovdqa64.s	%ymm29, %ymm30{%k7}{z}	 # AVX512{F,VL}
	vmovdqu32	%xmm29, %xmm30	 # AVX512{F,VL}
	vmovdqu32.s	%xmm29, %xmm30	 # AVX512{F,VL}
	vmovdqu32	%xmm29, %xmm30{%k7}	 # AVX512{F,VL}
	vmovdqu32.s	%xmm29, %xmm30{%k7}	 # AVX512{F,VL}
	vmovdqu32	%xmm29, %xmm30{%k7}{z}	 # AVX512{F,VL}
	vmovdqu32.s	%xmm29, %xmm30{%k7}{z}	 # AVX512{F,VL}
	vmovdqu32	%xmm29, %xmm30	 # AVX512{F,VL}
	vmovdqu32.s	%xmm29, %xmm30	 # AVX512{F,VL}
	vmovdqu32	%xmm29, %xmm30{%k7}	 # AVX512{F,VL}
	vmovdqu32.s	%xmm29, %xmm30{%k7}	 # AVX512{F,VL}
	vmovdqu32	%xmm29, %xmm30{%k7}{z}	 # AVX512{F,VL}
	vmovdqu32.s	%xmm29, %xmm30{%k7}{z}	 # AVX512{F,VL}
	vmovdqu32	%ymm29, %ymm30	 # AVX512{F,VL}
	vmovdqu32.s	%ymm29, %ymm30	 # AVX512{F,VL}
	vmovdqu32	%ymm29, %ymm30{%k7}	 # AVX512{F,VL}
	vmovdqu32.s	%ymm29, %ymm30{%k7}	 # AVX512{F,VL}
	vmovdqu32	%ymm29, %ymm30{%k7}{z}	 # AVX512{F,VL}
	vmovdqu32.s	%ymm29, %ymm30{%k7}{z}	 # AVX512{F,VL}
	vmovdqu32	%ymm29, %ymm30	 # AVX512{F,VL}
	vmovdqu32.s	%ymm29, %ymm30	 # AVX512{F,VL}
	vmovdqu32	%ymm29, %ymm30{%k7}	 # AVX512{F,VL}
	vmovdqu32.s	%ymm29, %ymm30{%k7}	 # AVX512{F,VL}
	vmovdqu32	%ymm29, %ymm30{%k7}{z}	 # AVX512{F,VL}
	vmovdqu32.s	%ymm29, %ymm30{%k7}{z}	 # AVX512{F,VL}
	vmovdqu64	%xmm29, %xmm30	 # AVX512{F,VL}
	vmovdqu64.s	%xmm29, %xmm30	 # AVX512{F,VL}
	vmovdqu64	%xmm29, %xmm30{%k7}	 # AVX512{F,VL}
	vmovdqu64.s	%xmm29, %xmm30{%k7}	 # AVX512{F,VL}
	vmovdqu64	%xmm29, %xmm30{%k7}{z}	 # AVX512{F,VL}
	vmovdqu64.s	%xmm29, %xmm30{%k7}{z}	 # AVX512{F,VL}
	vmovdqu64	%xmm29, %xmm30	 # AVX512{F,VL}
	vmovdqu64.s	%xmm29, %xmm30	 # AVX512{F,VL}
	vmovdqu64	%xmm29, %xmm30{%k7}	 # AVX512{F,VL}
	vmovdqu64.s	%xmm29, %xmm30{%k7}	 # AVX512{F,VL}
	vmovdqu64	%xmm29, %xmm30{%k7}{z}	 # AVX512{F,VL}
	vmovdqu64.s	%xmm29, %xmm30{%k7}{z}	 # AVX512{F,VL}
	vmovdqu64	%ymm29, %ymm30	 # AVX512{F,VL}
	vmovdqu64.s	%ymm29, %ymm30	 # AVX512{F,VL}
	vmovdqu64	%ymm29, %ymm30{%k7}	 # AVX512{F,VL}
	vmovdqu64.s	%ymm29, %ymm30{%k7}	 # AVX512{F,VL}
	vmovdqu64	%ymm29, %ymm30{%k7}{z}	 # AVX512{F,VL}
	vmovdqu64.s	%ymm29, %ymm30{%k7}{z}	 # AVX512{F,VL}
	vmovdqu64	%ymm29, %ymm30	 # AVX512{F,VL}
	vmovdqu64.s	%ymm29, %ymm30	 # AVX512{F,VL}
	vmovdqu64	%ymm29, %ymm30{%k7}	 # AVX512{F,VL}
	vmovdqu64.s	%ymm29, %ymm30{%k7}	 # AVX512{F,VL}
	vmovdqu64	%ymm29, %ymm30{%k7}{z}	 # AVX512{F,VL}
	vmovdqu64.s	%ymm29, %ymm30{%k7}{z}	 # AVX512{F,VL}
	vmovupd	%xmm29, %xmm30	 # AVX512{F,VL}
	vmovupd.s	%xmm29, %xmm30	 # AVX512{F,VL}
	vmovupd	%xmm29, %xmm30{%k7}	 # AVX512{F,VL}
	vmovupd.s	%xmm29, %xmm30{%k7}	 # AVX512{F,VL}
	vmovupd	%xmm29, %xmm30{%k7}{z}	 # AVX512{F,VL}
	vmovupd.s	%xmm29, %xmm30{%k7}{z}	 # AVX512{F,VL}
	vmovupd	%xmm29, %xmm30	 # AVX512{F,VL}
	vmovupd.s	%xmm29, %xmm30	 # AVX512{F,VL}
	vmovupd	%xmm29, %xmm30{%k7}	 # AVX512{F,VL}
	vmovupd.s	%xmm29, %xmm30{%k7}	 # AVX512{F,VL}
	vmovupd	%xmm29, %xmm30{%k7}{z}	 # AVX512{F,VL}
	vmovupd.s	%xmm29, %xmm30{%k7}{z}	 # AVX512{F,VL}
	vmovupd	%ymm29, %ymm30	 # AVX512{F,VL}
	vmovupd.s	%ymm29, %ymm30	 # AVX512{F,VL}
	vmovupd	%ymm29, %ymm30{%k7}	 # AVX512{F,VL}
	vmovupd.s	%ymm29, %ymm30{%k7}	 # AVX512{F,VL}
	vmovupd	%ymm29, %ymm30{%k7}{z}	 # AVX512{F,VL}
	vmovupd.s	%ymm29, %ymm30{%k7}{z}	 # AVX512{F,VL}
	vmovupd	%ymm29, %ymm30	 # AVX512{F,VL}
	vmovupd.s	%ymm29, %ymm30	 # AVX512{F,VL}
	vmovupd	%ymm29, %ymm30{%k7}	 # AVX512{F,VL}
	vmovupd.s	%ymm29, %ymm30{%k7}	 # AVX512{F,VL}
	vmovupd	%ymm29, %ymm30{%k7}{z}	 # AVX512{F,VL}
	vmovupd.s	%ymm29, %ymm30{%k7}{z}	 # AVX512{F,VL}
	vmovups	%xmm29, %xmm30	 # AVX512{F,VL}
	vmovups.s	%xmm29, %xmm30	 # AVX512{F,VL}
	vmovups	%xmm29, %xmm30{%k7}	 # AVX512{F,VL}
	vmovups.s	%xmm29, %xmm30{%k7}	 # AVX512{F,VL}
	vmovups	%xmm29, %xmm30{%k7}{z}	 # AVX512{F,VL}
	vmovups.s	%xmm29, %xmm30{%k7}{z}	 # AVX512{F,VL}
	vmovups	%xmm29, %xmm30	 # AVX512{F,VL}
	vmovups.s	%xmm29, %xmm30	 # AVX512{F,VL}
	vmovups	%xmm29, %xmm30{%k7}	 # AVX512{F,VL}
	vmovups.s	%xmm29, %xmm30{%k7}	 # AVX512{F,VL}
	vmovups	%xmm29, %xmm30{%k7}{z}	 # AVX512{F,VL}
	vmovups.s	%xmm29, %xmm30{%k7}{z}	 # AVX512{F,VL}
	vmovups	%ymm29, %ymm30	 # AVX512{F,VL}
	vmovups.s	%ymm29, %ymm30	 # AVX512{F,VL}
	vmovups	%ymm29, %ymm30{%k7}	 # AVX512{F,VL}
	vmovups.s	%ymm29, %ymm30{%k7}	 # AVX512{F,VL}
	vmovups	%ymm29, %ymm30{%k7}{z}	 # AVX512{F,VL}
	vmovups.s	%ymm29, %ymm30{%k7}{z}	 # AVX512{F,VL}
	vmovups	%ymm29, %ymm30	 # AVX512{F,VL}
	vmovups.s	%ymm29, %ymm30	 # AVX512{F,VL}
	vmovups	%ymm29, %ymm30{%k7}	 # AVX512{F,VL}
	vmovups.s	%ymm29, %ymm30{%k7}	 # AVX512{F,VL}
	vmovups	%ymm29, %ymm30{%k7}{z}	 # AVX512{F,VL}
	vmovups.s	%ymm29, %ymm30{%k7}{z}	 # AVX512{F,VL}

	.intel_syntax noprefix
	vmovapd	xmm30, xmm29	 # AVX512{F,VL}
	vmovapd.s	xmm30, xmm29	 # AVX512{F,VL}
	vmovapd	xmm30{k7}, xmm29	 # AVX512{F,VL}
	vmovapd.s	xmm30{k7}, xmm29	 # AVX512{F,VL}
	vmovapd	xmm30{k7}{z}, xmm29	 # AVX512{F,VL}
	vmovapd.s	xmm30{k7}{z}, xmm29	 # AVX512{F,VL}
	vmovapd	xmm30, xmm29	 # AVX512{F,VL}
	vmovapd.s	xmm30, xmm29	 # AVX512{F,VL}
	vmovapd	xmm30{k7}, xmm29	 # AVX512{F,VL}
	vmovapd.s	xmm30{k7}, xmm29	 # AVX512{F,VL}
	vmovapd	xmm30{k7}{z}, xmm29	 # AVX512{F,VL}
	vmovapd.s	xmm30{k7}{z}, xmm29	 # AVX512{F,VL}
	vmovapd	ymm30, ymm29	 # AVX512{F,VL}
	vmovapd.s	ymm30, ymm29	 # AVX512{F,VL}
	vmovapd	ymm30{k7}, ymm29	 # AVX512{F,VL}
	vmovapd.s	ymm30{k7}, ymm29	 # AVX512{F,VL}
	vmovapd	ymm30{k7}{z}, ymm29	 # AVX512{F,VL}
	vmovapd.s	ymm30{k7}{z}, ymm29	 # AVX512{F,VL}
	vmovapd	ymm30, ymm29	 # AVX512{F,VL}
	vmovapd.s	ymm30, ymm29	 # AVX512{F,VL}
	vmovapd	ymm30{k7}, ymm29	 # AVX512{F,VL}
	vmovapd.s	ymm30{k7}, ymm29	 # AVX512{F,VL}
	vmovapd	ymm30{k7}{z}, ymm29	 # AVX512{F,VL}
	vmovapd.s	ymm30{k7}{z}, ymm29	 # AVX512{F,VL}
	vmovaps	xmm30, xmm29	 # AVX512{F,VL}
	vmovaps.s	xmm30, xmm29	 # AVX512{F,VL}
	vmovaps	xmm30{k7}, xmm29	 # AVX512{F,VL}
	vmovaps.s	xmm30{k7}, xmm29	 # AVX512{F,VL}
	vmovaps	xmm30{k7}{z}, xmm29	 # AVX512{F,VL}
	vmovaps.s	xmm30{k7}{z}, xmm29	 # AVX512{F,VL}
	vmovaps	xmm30, xmm29	 # AVX512{F,VL}
	vmovaps.s	xmm30, xmm29	 # AVX512{F,VL}
	vmovaps	xmm30{k7}, xmm29	 # AVX512{F,VL}
	vmovaps.s	xmm30{k7}, xmm29	 # AVX512{F,VL}
	vmovaps	xmm30{k7}{z}, xmm29	 # AVX512{F,VL}
	vmovaps.s	xmm30{k7}{z}, xmm29	 # AVX512{F,VL}
	vmovaps	ymm30, ymm29	 # AVX512{F,VL}
	vmovaps.s	ymm30, ymm29	 # AVX512{F,VL}
	vmovaps	ymm30{k7}, ymm29	 # AVX512{F,VL}
	vmovaps.s	ymm30{k7}, ymm29	 # AVX512{F,VL}
	vmovaps	ymm30{k7}{z}, ymm29	 # AVX512{F,VL}
	vmovaps.s	ymm30{k7}{z}, ymm29	 # AVX512{F,VL}
	vmovaps	ymm30, ymm29	 # AVX512{F,VL}
	vmovaps.s	ymm30, ymm29	 # AVX512{F,VL}
	vmovaps	ymm30{k7}, ymm29	 # AVX512{F,VL}
	vmovaps.s	ymm30{k7}, ymm29	 # AVX512{F,VL}
	vmovaps	ymm30{k7}{z}, ymm29	 # AVX512{F,VL}
	vmovaps.s	ymm30{k7}{z}, ymm29	 # AVX512{F,VL}
	vmovdqa32	xmm30, xmm29	 # AVX512{F,VL}
	vmovdqa32.s	xmm30, xmm29	 # AVX512{F,VL}
	vmovdqa32	xmm30{k7}, xmm29	 # AVX512{F,VL}
	vmovdqa32.s	xmm30{k7}, xmm29	 # AVX512{F,VL}
	vmovdqa32	xmm30{k7}{z}, xmm29	 # AVX512{F,VL}
	vmovdqa32.s	xmm30{k7}{z}, xmm29	 # AVX512{F,VL}
	vmovdqa32	xmm30, xmm29	 # AVX512{F,VL}
	vmovdqa32.s	xmm30, xmm29	 # AVX512{F,VL}
	vmovdqa32	xmm30{k7}, xmm29	 # AVX512{F,VL}
	vmovdqa32.s	xmm30{k7}, xmm29	 # AVX512{F,VL}
	vmovdqa32	xmm30{k7}{z}, xmm29	 # AVX512{F,VL}
	vmovdqa32.s	xmm30{k7}{z}, xmm29	 # AVX512{F,VL}
	vmovdqa32	ymm30, ymm29	 # AVX512{F,VL}
	vmovdqa32.s	ymm30, ymm29	 # AVX512{F,VL}
	vmovdqa32	ymm30{k7}, ymm29	 # AVX512{F,VL}
	vmovdqa32.s	ymm30{k7}, ymm29	 # AVX512{F,VL}
	vmovdqa32	ymm30{k7}{z}, ymm29	 # AVX512{F,VL}
	vmovdqa32.s	ymm30{k7}{z}, ymm29	 # AVX512{F,VL}
	vmovdqa32	ymm30, ymm29	 # AVX512{F,VL}
	vmovdqa32.s	ymm30, ymm29	 # AVX512{F,VL}
	vmovdqa32	ymm30{k7}, ymm29	 # AVX512{F,VL}
	vmovdqa32.s	ymm30{k7}, ymm29	 # AVX512{F,VL}
	vmovdqa32	ymm30{k7}{z}, ymm29	 # AVX512{F,VL}
	vmovdqa32.s	ymm30{k7}{z}, ymm29	 # AVX512{F,VL}
	vmovdqa64	xmm30, xmm29	 # AVX512{F,VL}
	vmovdqa64.s	xmm30, xmm29	 # AVX512{F,VL}
	vmovdqa64	xmm30{k7}, xmm29	 # AVX512{F,VL}
	vmovdqa64.s	xmm30{k7}, xmm29	 # AVX512{F,VL}
	vmovdqa64	xmm30{k7}{z}, xmm29	 # AVX512{F,VL}
	vmovdqa64.s	xmm30{k7}{z}, xmm29	 # AVX512{F,VL}
	vmovdqa64	xmm30, xmm29	 # AVX512{F,VL}
	vmovdqa64.s	xmm30, xmm29	 # AVX512{F,VL}
	vmovdqa64	xmm30{k7}, xmm29	 # AVX512{F,VL}
	vmovdqa64.s	xmm30{k7}, xmm29	 # AVX512{F,VL}
	vmovdqa64	xmm30{k7}{z}, xmm29	 # AVX512{F,VL}
	vmovdqa64.s	xmm30{k7}{z}, xmm29	 # AVX512{F,VL}
	vmovdqa64	ymm30, ymm29	 # AVX512{F,VL}
	vmovdqa64.s	ymm30, ymm29	 # AVX512{F,VL}
	vmovdqa64	ymm30{k7}, ymm29	 # AVX512{F,VL}
	vmovdqa64.s	ymm30{k7}, ymm29	 # AVX512{F,VL}
	vmovdqa64	ymm30{k7}{z}, ymm29	 # AVX512{F,VL}
	vmovdqa64.s	ymm30{k7}{z}, ymm29	 # AVX512{F,VL}
	vmovdqa64	ymm30, ymm29	 # AVX512{F,VL}
	vmovdqa64.s	ymm30, ymm29	 # AVX512{F,VL}
	vmovdqa64	ymm30{k7}, ymm29	 # AVX512{F,VL}
	vmovdqa64.s	ymm30{k7}, ymm29	 # AVX512{F,VL}
	vmovdqa64	ymm30{k7}{z}, ymm29	 # AVX512{F,VL}
	vmovdqa64.s	ymm30{k7}{z}, ymm29	 # AVX512{F,VL}
	vmovdqu32	xmm30, xmm29	 # AVX512{F,VL}
	vmovdqu32.s	xmm30, xmm29	 # AVX512{F,VL}
	vmovdqu32	xmm30{k7}, xmm29	 # AVX512{F,VL}
	vmovdqu32.s	xmm30{k7}, xmm29	 # AVX512{F,VL}
	vmovdqu32	xmm30{k7}{z}, xmm29	 # AVX512{F,VL}
	vmovdqu32.s	xmm30{k7}{z}, xmm29	 # AVX512{F,VL}
	vmovdqu32	xmm30, xmm29	 # AVX512{F,VL}
	vmovdqu32.s	xmm30, xmm29	 # AVX512{F,VL}
	vmovdqu32	xmm30{k7}, xmm29	 # AVX512{F,VL}
	vmovdqu32.s	xmm30{k7}, xmm29	 # AVX512{F,VL}
	vmovdqu32	xmm30{k7}{z}, xmm29	 # AVX512{F,VL}
	vmovdqu32.s	xmm30{k7}{z}, xmm29	 # AVX512{F,VL}
	vmovdqu32	ymm30, ymm29	 # AVX512{F,VL}
	vmovdqu32.s	ymm30, ymm29	 # AVX512{F,VL}
	vmovdqu32	ymm30{k7}, ymm29	 # AVX512{F,VL}
	vmovdqu32.s	ymm30{k7}, ymm29	 # AVX512{F,VL}
	vmovdqu32	ymm30{k7}{z}, ymm29	 # AVX512{F,VL}
	vmovdqu32.s	ymm30{k7}{z}, ymm29	 # AVX512{F,VL}
	vmovdqu32	ymm30, ymm29	 # AVX512{F,VL}
	vmovdqu32.s	ymm30, ymm29	 # AVX512{F,VL}
	vmovdqu32	ymm30{k7}, ymm29	 # AVX512{F,VL}
	vmovdqu32.s	ymm30{k7}, ymm29	 # AVX512{F,VL}
	vmovdqu32	ymm30{k7}{z}, ymm29	 # AVX512{F,VL}
	vmovdqu32.s	ymm30{k7}{z}, ymm29	 # AVX512{F,VL}
	vmovdqu64	xmm30, xmm29	 # AVX512{F,VL}
	vmovdqu64.s	xmm30, xmm29	 # AVX512{F,VL}
	vmovdqu64	xmm30{k7}, xmm29	 # AVX512{F,VL}
	vmovdqu64.s	xmm30{k7}, xmm29	 # AVX512{F,VL}
	vmovdqu64	xmm30{k7}{z}, xmm29	 # AVX512{F,VL}
	vmovdqu64.s	xmm30{k7}{z}, xmm29	 # AVX512{F,VL}
	vmovdqu64	xmm30, xmm29	 # AVX512{F,VL}
	vmovdqu64.s	xmm30, xmm29	 # AVX512{F,VL}
	vmovdqu64	xmm30{k7}, xmm29	 # AVX512{F,VL}
	vmovdqu64.s	xmm30{k7}, xmm29	 # AVX512{F,VL}
	vmovdqu64	xmm30{k7}{z}, xmm29	 # AVX512{F,VL}
	vmovdqu64.s	xmm30{k7}{z}, xmm29	 # AVX512{F,VL}
	vmovdqu64	ymm30, ymm29	 # AVX512{F,VL}
	vmovdqu64.s	ymm30, ymm29	 # AVX512{F,VL}
	vmovdqu64	ymm30{k7}, ymm29	 # AVX512{F,VL}
	vmovdqu64.s	ymm30{k7}, ymm29	 # AVX512{F,VL}
	vmovdqu64	ymm30{k7}{z}, ymm29	 # AVX512{F,VL}
	vmovdqu64.s	ymm30{k7}{z}, ymm29	 # AVX512{F,VL}
	vmovdqu64	ymm30, ymm29	 # AVX512{F,VL}
	vmovdqu64.s	ymm30, ymm29	 # AVX512{F,VL}
	vmovdqu64	ymm30{k7}, ymm29	 # AVX512{F,VL}
	vmovdqu64.s	ymm30{k7}, ymm29	 # AVX512{F,VL}
	vmovdqu64	ymm30{k7}{z}, ymm29	 # AVX512{F,VL}
	vmovdqu64.s	ymm30{k7}{z}, ymm29	 # AVX512{F,VL}
	vmovupd	xmm30, xmm29	 # AVX512{F,VL}
	vmovupd.s	xmm30, xmm29	 # AVX512{F,VL}
	vmovupd	xmm30{k7}, xmm29	 # AVX512{F,VL}
	vmovupd.s	xmm30{k7}, xmm29	 # AVX512{F,VL}
	vmovupd	xmm30{k7}{z}, xmm29	 # AVX512{F,VL}
	vmovupd.s	xmm30{k7}{z}, xmm29	 # AVX512{F,VL}
	vmovupd	xmm30, xmm29	 # AVX512{F,VL}
	vmovupd.s	xmm30, xmm29	 # AVX512{F,VL}
	vmovupd	xmm30{k7}, xmm29	 # AVX512{F,VL}
	vmovupd.s	xmm30{k7}, xmm29	 # AVX512{F,VL}
	vmovupd	xmm30{k7}{z}, xmm29	 # AVX512{F,VL}
	vmovupd.s	xmm30{k7}{z}, xmm29	 # AVX512{F,VL}
	vmovupd	ymm30, ymm29	 # AVX512{F,VL}
	vmovupd.s	ymm30, ymm29	 # AVX512{F,VL}
	vmovupd	ymm30{k7}, ymm29	 # AVX512{F,VL}
	vmovupd.s	ymm30{k7}, ymm29	 # AVX512{F,VL}
	vmovupd	ymm30{k7}{z}, ymm29	 # AVX512{F,VL}
	vmovupd.s	ymm30{k7}{z}, ymm29	 # AVX512{F,VL}
	vmovupd	ymm30, ymm29	 # AVX512{F,VL}
	vmovupd.s	ymm30, ymm29	 # AVX512{F,VL}
	vmovupd	ymm30{k7}, ymm29	 # AVX512{F,VL}
	vmovupd.s	ymm30{k7}, ymm29	 # AVX512{F,VL}
	vmovupd	ymm30{k7}{z}, ymm29	 # AVX512{F,VL}
	vmovupd.s	ymm30{k7}{z}, ymm29	 # AVX512{F,VL}
	vmovups	xmm30, xmm29	 # AVX512{F,VL}
	vmovups.s	xmm30, xmm29	 # AVX512{F,VL}
	vmovups	xmm30{k7}, xmm29	 # AVX512{F,VL}
	vmovups.s	xmm30{k7}, xmm29	 # AVX512{F,VL}
	vmovups	xmm30{k7}{z}, xmm29	 # AVX512{F,VL}
	vmovups.s	xmm30{k7}{z}, xmm29	 # AVX512{F,VL}
	vmovups	xmm30, xmm29	 # AVX512{F,VL}
	vmovups.s	xmm30, xmm29	 # AVX512{F,VL}
	vmovups	xmm30{k7}, xmm29	 # AVX512{F,VL}
	vmovups.s	xmm30{k7}, xmm29	 # AVX512{F,VL}
	vmovups	xmm30{k7}{z}, xmm29	 # AVX512{F,VL}
	vmovups.s	xmm30{k7}{z}, xmm29	 # AVX512{F,VL}
	vmovups	ymm30, ymm29	 # AVX512{F,VL}
	vmovups.s	ymm30, ymm29	 # AVX512{F,VL}
	vmovups	ymm30{k7}, ymm29	 # AVX512{F,VL}
	vmovups.s	ymm30{k7}, ymm29	 # AVX512{F,VL}
	vmovups	ymm30{k7}{z}, ymm29	 # AVX512{F,VL}
	vmovups.s	ymm30{k7}{z}, ymm29	 # AVX512{F,VL}
	vmovups	ymm30, ymm29	 # AVX512{F,VL}
	vmovups.s	ymm30, ymm29	 # AVX512{F,VL}
	vmovups	ymm30{k7}, ymm29	 # AVX512{F,VL}
	vmovups.s	ymm30{k7}, ymm29	 # AVX512{F,VL}
	vmovups	ymm30{k7}{z}, ymm29	 # AVX512{F,VL}
	vmovups.s	ymm30{k7}{z}, ymm29	 # AVX512{F,VL}
