	.arch armv7-a
	.eabi_attribute 20, 1	@ Tag_ABI_FP_denormal
	.eabi_attribute 21, 1	@ Tag_ABI_FP_exceptions
	.eabi_attribute 23, 3	@ Tag_ABI_FP_number_model
	.eabi_attribute 24, 1	@ Tag_ABI_align8_needed
	.eabi_attribute 25, 1	@ Tag_ABI_align8_preserved
	.eabi_attribute 26, 2	@ Tag_ABI_enum_size
	.eabi_attribute 30, 2	@ Tag_ABI_optimization_goals
	.eabi_attribute 34, 1	@ Tag_CPU_unaligned_access
	.eabi_attribute 18, 2	@ Tag_ABI_PCS_wchar_t
	.file	"asm-offsets.c"
@ GNU C11 (Linaro GCC 7.4-2019.02) version 7.4.1 20181213 [linaro-7.4-2019.02 revision 56ec6f6b99cc167ff0c2f8e1a2eed33b1edc85d4] (arm-linux-gnueabihf)
@	compiled by GNU C version 4.8.4, GMP version 6.1.2, MPFR version 3.1.5, MPC version 1.0.3, isl version none
@ GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
@Versions of loaded plugins:
 @arm_ssp_per_task_plugin: Unknown version.
@ options passed:  -nostdinc -I ../arch/arm/include
@ -I ./arch/arm/include/generated -I ../include -I ./include
@ -I ../arch/arm/include/uapi -I ./arch/arm/include/generated/uapi
@ -I ../include/uapi -I ./include/generated/uapi -I ../. -I . -imultilib .
@ -imultiarch arm-linux-gnueabihf
@ -iprefix /home/leraton/windows/Users/Thomas/Documents/ENS/M2_SETI/B4/TP/gcc-linaro-7.4.1-2019.02-x86_64_arm-linux-gnueabihf/bin/../lib/gcc/arm-linux-gnueabihf/7.4.1/
@ -isysroot /home/leraton/windows/Users/Thomas/Documents/ENS/M2_SETI/B4/TP/gcc-linaro-7.4.1-2019.02-x86_64_arm-linux-gnueabihf/bin/../arm-linux-gnueabihf/libc
@ -iplugindir=/home/leraton/windows/Users/Thomas/Documents/ENS/M2_SETI/B4/TP/gcc-linaro-7.4.1-2019.02-x86_64_arm-linux-gnueabihf/bin/../lib/gcc/arm-linux-gnueabihf/7.4.1/plugin
@ -D __KERNEL__ -D __LINUX_ARM_ARCH__=7 -U arm
@ -D KBUILD_MODFILE="./asm-offsets" -D KBUILD_BASENAME="asm_offsets"
@ -D KBUILD_MODNAME="asm_offsets" -D __KBUILD_MODNAME=kmod_asm_offsets
@ -include ../include/linux/compiler-version.h
@ -include ../include/linux/kconfig.h
@ -include ../include/linux/compiler_types.h
@ -MMD arch/arm/kernel/.asm-offsets.s.d ../arch/arm/kernel/asm-offsets.c
@ -iplugindir=/home/leraton/windows/Users/Thomas/Documents/ENS/M2_SETI/B4/TP/gcc-linaro-7.4.1-2019.02-x86_64_arm-linux-gnueabihf/bin/../lib/gcc/arm-linux-gnueabihf/7.4.1/plugin
@ -mlittle-endian -mtp=cp15 -mabi=aapcs-linux -mfpu=vfp -marm
@ -march=armv7-a -mfloat-abi=soft -mtune=cortex-a9 -mtls-dialect=gnu
@ -auxbase-strip arch/arm/kernel/asm-offsets.s -O2 -Wall -Wundef
@ -Werror=implicit-function-declaration -Werror=implicit-int
@ -Werror=return-type -Werror=strict-prototypes -Wno-format-security
@ -Wno-trigraphs -Wno-frame-address -Wmissing-declarations
@ -Wmissing-prototypes -Wframe-larger-than=1024 -Wno-main -Wvla
@ -Wno-pointer-sign -Wstringop-overflow=0 -Wimplicit-fallthrough=5
@ -Werror=date-time -Werror=incompatible-pointer-types
@ -Werror=designated-init -Wextra -Wunused -Wno-unused-but-set-variable
@ -Wunused-const-variable=0 -Wformat-overflow=0 -Wformat-truncation=0
@ -Wno-override-init -Wno-missing-field-initializers -Wno-type-limits
@ -Wno-shift-negative-value -Wno-maybe-uninitialized -Wno-sign-compare
@ -Wno-unused-parameter -std=gnu11 -fshort-wchar -funsigned-char
@ -fno-common -fno-PIE -fno-strict-aliasing -fno-dwarf2-cfi-asm
@ -fno-ipa-sra -funwind-tables -fno-delete-null-pointer-checks
@ -fstack-protector-strong -fomit-frame-pointer -fno-strict-overflow
@ -fstack-check=no -fconserve-stack
@ -fplugin=./scripts/gcc-plugins/arm_ssp_per_task_plugin.so -fverbose-asm
@ --param allow-store-data-races=0
@ options enabled:  -faggressive-loop-optimizations -falign-jumps
@ -falign-labels -falign-loops -fauto-inc-dec -fbranch-count-reg
@ -fcaller-saves -fchkp-check-incomplete-type -fchkp-check-read
@ -fchkp-check-write -fchkp-instrument-calls -fchkp-narrow-bounds
@ -fchkp-optimize -fchkp-store-bounds -fchkp-use-static-bounds
@ -fchkp-use-static-const-bounds -fchkp-use-wrappers -fcode-hoisting
@ -fcombine-stack-adjustments -fcompare-elim -fcprop-registers
@ -fcrossjumping -fcse-follow-jumps -fdefer-pop -fdevirtualize
@ -fdevirtualize-speculatively -fearly-inlining
@ -feliminate-unused-debug-types -fexpensive-optimizations
@ -fforward-propagate -ffp-int-builtin-inexact -ffunction-cse -fgcse
@ -fgcse-lm -fgnu-runtime -fgnu-unique -fguess-branch-probability
@ -fhoist-adjacent-loads -fident -fif-conversion -fif-conversion2
@ -findirect-inlining -finline -finline-atomics
@ -finline-functions-called-once -finline-small-functions -fipa-bit-cp
@ -fipa-cp -fipa-icf -fipa-icf-functions -fipa-icf-variables -fipa-profile
@ -fipa-pure-const -fipa-ra -fipa-reference -fipa-vrp -fira-hoist-pressure
@ -fira-share-save-slots -fira-share-spill-slots
@ -fisolate-erroneous-paths-dereference -fivopts -fkeep-static-consts
@ -fleading-underscore -flifetime-dse -flra-remat -flto-odr-type-merging
@ -fmath-errno -fmerge-constants -fmerge-debug-strings
@ -fmove-loop-invariants -fomit-frame-pointer -foptimize-sibling-calls
@ -foptimize-strlen -fpartial-inlining -fpeephole -fpeephole2 -fplt
@ -fprefetch-loop-arrays -freg-struct-return -freorder-blocks
@ -freorder-functions -frerun-cse-after-loop
@ -fsched-critical-path-heuristic -fsched-dep-count-heuristic
@ -fsched-group-heuristic -fsched-interblock -fsched-last-insn-heuristic
@ -fsched-pressure -fsched-rank-heuristic -fsched-spec
@ -fsched-spec-insn-heuristic -fsched-stalled-insns-dep -fschedule-insns
@ -fschedule-insns2 -fsection-anchors -fsemantic-interposition
@ -fshow-column -fshrink-wrap -fshrink-wrap-separate -fsigned-zeros
@ -fsplit-ivs-in-unroller -fsplit-wide-types -fssa-backprop -fssa-phiopt
@ -fstack-protector-strong -fstdarg-opt -fstore-merging
@ -fstrict-volatile-bitfields -fsync-libcalls -fthread-jumps
@ -ftoplevel-reorder -ftrapping-math -ftree-bit-ccp -ftree-builtin-call-dce
@ -ftree-ccp -ftree-ch -ftree-coalesce-vars -ftree-copy-prop -ftree-cselim
@ -ftree-dce -ftree-dominator-opts -ftree-dse -ftree-forwprop -ftree-fre
@ -ftree-loop-if-convert -ftree-loop-im -ftree-loop-ivcanon
@ -ftree-loop-optimize -ftree-parallelize-loops= -ftree-phiprop -ftree-pre
@ -ftree-pta -ftree-reassoc -ftree-scev-cprop -ftree-sink -ftree-slsr
@ -ftree-sra -ftree-switch-conversion -ftree-tail-merge -ftree-ter
@ -ftree-vrp -funit-at-a-time -funwind-tables -fverbose-asm
@ -fzero-initialized-in-bss -marm -mglibc -mlittle-endian
@ -mpic-data-is-text-relative -msched-prolog -munaligned-access
@ -mvectorize-with-neon-quad

	.text
	.syntax divided
	.syntax unified
	.arm
	.syntax unified
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
@ ../arch/arm/kernel/asm-offsets.c:41:   DEFINE(TSK_ACTIVE_MM,		offsetof(struct task_struct, active_mm));
	.syntax divided
@ 41 "../arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->TSK_ACTIVE_MM #1196 offsetof(struct task_struct, active_mm)"	@
@ 0 "" 2
@ ../arch/arm/kernel/asm-offsets.c:43:   DEFINE(TSK_STACK_CANARY,	offsetof(struct task_struct, stack_canary));
@ 43 "../arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->TSK_STACK_CANARY #1288 offsetof(struct task_struct, stack_canary)"	@
@ 0 "" 2
@ ../arch/arm/kernel/asm-offsets.c:45:   BLANK();
@ 45 "../arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->"
@ 0 "" 2
@ ../arch/arm/kernel/asm-offsets.c:46:   DEFINE(TI_FLAGS,		offsetof(struct thread_info, flags));
@ 46 "../arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->TI_FLAGS #0 offsetof(struct thread_info, flags)"	@
@ 0 "" 2
@ ../arch/arm/kernel/asm-offsets.c:47:   DEFINE(TI_PREEMPT,		offsetof(struct thread_info, preempt_count));
@ 47 "../arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->TI_PREEMPT #4 offsetof(struct thread_info, preempt_count)"	@
@ 0 "" 2
@ ../arch/arm/kernel/asm-offsets.c:48:   DEFINE(TI_CPU,		offsetof(struct thread_info, cpu));
@ 48 "../arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->TI_CPU #8 offsetof(struct thread_info, cpu)"	@
@ 0 "" 2
@ ../arch/arm/kernel/asm-offsets.c:49:   DEFINE(TI_CPU_DOMAIN,		offsetof(struct thread_info, cpu_domain));
@ 49 "../arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->TI_CPU_DOMAIN #12 offsetof(struct thread_info, cpu_domain)"	@
@ 0 "" 2
@ ../arch/arm/kernel/asm-offsets.c:50:   DEFINE(TI_CPU_SAVE,		offsetof(struct thread_info, cpu_context));
@ 50 "../arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->TI_CPU_SAVE #16 offsetof(struct thread_info, cpu_context)"	@
@ 0 "" 2
@ ../arch/arm/kernel/asm-offsets.c:51:   DEFINE(TI_ABI_SYSCALL,	offsetof(struct thread_info, abi_syscall));
@ 51 "../arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->TI_ABI_SYSCALL #64 offsetof(struct thread_info, abi_syscall)"	@
@ 0 "" 2
@ ../arch/arm/kernel/asm-offsets.c:52:   DEFINE(TI_TP_VALUE,		offsetof(struct thread_info, tp_value));
@ 52 "../arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->TI_TP_VALUE #68 offsetof(struct thread_info, tp_value)"	@
@ 0 "" 2
@ ../arch/arm/kernel/asm-offsets.c:53:   DEFINE(TI_FPSTATE,		offsetof(struct thread_info, fpstate));
@ 53 "../arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->TI_FPSTATE #80 offsetof(struct thread_info, fpstate)"	@
@ 0 "" 2
@ ../arch/arm/kernel/asm-offsets.c:55:   DEFINE(TI_VFPSTATE,		offsetof(struct thread_info, vfpstate));
@ 55 "../arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->TI_VFPSTATE #224 offsetof(struct thread_info, vfpstate)"	@
@ 0 "" 2
@ ../arch/arm/kernel/asm-offsets.c:57:   DEFINE(VFP_CPU,		offsetof(union vfp_state, hard.cpu));
@ 57 "../arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->VFP_CPU #272 offsetof(union vfp_state, hard.cpu)"	@
@ 0 "" 2
@ ../arch/arm/kernel/asm-offsets.c:60:   DEFINE(SOFTIRQ_DISABLE_OFFSET,SOFTIRQ_DISABLE_OFFSET);
@ 60 "../arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->SOFTIRQ_DISABLE_OFFSET #512 SOFTIRQ_DISABLE_OFFSET"	@
@ 0 "" 2
@ ../arch/arm/kernel/asm-offsets.c:67:   BLANK();
@ 67 "../arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->"
@ 0 "" 2
@ ../arch/arm/kernel/asm-offsets.c:68:   DEFINE(S_R0,			offsetof(struct pt_regs, ARM_r0));
@ 68 "../arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->S_R0 #0 offsetof(struct pt_regs, ARM_r0)"	@
@ 0 "" 2
@ ../arch/arm/kernel/asm-offsets.c:69:   DEFINE(S_R1,			offsetof(struct pt_regs, ARM_r1));
@ 69 "../arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->S_R1 #4 offsetof(struct pt_regs, ARM_r1)"	@
@ 0 "" 2
@ ../arch/arm/kernel/asm-offsets.c:70:   DEFINE(S_R2,			offsetof(struct pt_regs, ARM_r2));
@ 70 "../arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->S_R2 #8 offsetof(struct pt_regs, ARM_r2)"	@
@ 0 "" 2
@ ../arch/arm/kernel/asm-offsets.c:71:   DEFINE(S_R3,			offsetof(struct pt_regs, ARM_r3));
@ 71 "../arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->S_R3 #12 offsetof(struct pt_regs, ARM_r3)"	@
@ 0 "" 2
@ ../arch/arm/kernel/asm-offsets.c:72:   DEFINE(S_R4,			offsetof(struct pt_regs, ARM_r4));
@ 72 "../arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->S_R4 #16 offsetof(struct pt_regs, ARM_r4)"	@
@ 0 "" 2
@ ../arch/arm/kernel/asm-offsets.c:73:   DEFINE(S_R5,			offsetof(struct pt_regs, ARM_r5));
@ 73 "../arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->S_R5 #20 offsetof(struct pt_regs, ARM_r5)"	@
@ 0 "" 2
@ ../arch/arm/kernel/asm-offsets.c:74:   DEFINE(S_R6,			offsetof(struct pt_regs, ARM_r6));
@ 74 "../arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->S_R6 #24 offsetof(struct pt_regs, ARM_r6)"	@
@ 0 "" 2
@ ../arch/arm/kernel/asm-offsets.c:75:   DEFINE(S_R7,			offsetof(struct pt_regs, ARM_r7));
@ 75 "../arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->S_R7 #28 offsetof(struct pt_regs, ARM_r7)"	@
@ 0 "" 2
@ ../arch/arm/kernel/asm-offsets.c:76:   DEFINE(S_R8,			offsetof(struct pt_regs, ARM_r8));
@ 76 "../arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->S_R8 #32 offsetof(struct pt_regs, ARM_r8)"	@
@ 0 "" 2
@ ../arch/arm/kernel/asm-offsets.c:77:   DEFINE(S_R9,			offsetof(struct pt_regs, ARM_r9));
@ 77 "../arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->S_R9 #36 offsetof(struct pt_regs, ARM_r9)"	@
@ 0 "" 2
@ ../arch/arm/kernel/asm-offsets.c:78:   DEFINE(S_R10,			offsetof(struct pt_regs, ARM_r10));
@ 78 "../arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->S_R10 #40 offsetof(struct pt_regs, ARM_r10)"	@
@ 0 "" 2
@ ../arch/arm/kernel/asm-offsets.c:79:   DEFINE(S_FP,			offsetof(struct pt_regs, ARM_fp));
@ 79 "../arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->S_FP #44 offsetof(struct pt_regs, ARM_fp)"	@
@ 0 "" 2
@ ../arch/arm/kernel/asm-offsets.c:80:   DEFINE(S_IP,			offsetof(struct pt_regs, ARM_ip));
@ 80 "../arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->S_IP #48 offsetof(struct pt_regs, ARM_ip)"	@
@ 0 "" 2
@ ../arch/arm/kernel/asm-offsets.c:81:   DEFINE(S_SP,			offsetof(struct pt_regs, ARM_sp));
@ 81 "../arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->S_SP #52 offsetof(struct pt_regs, ARM_sp)"	@
@ 0 "" 2
@ ../arch/arm/kernel/asm-offsets.c:82:   DEFINE(S_LR,			offsetof(struct pt_regs, ARM_lr));
@ 82 "../arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->S_LR #56 offsetof(struct pt_regs, ARM_lr)"	@
@ 0 "" 2
@ ../arch/arm/kernel/asm-offsets.c:83:   DEFINE(S_PC,			offsetof(struct pt_regs, ARM_pc));
@ 83 "../arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->S_PC #60 offsetof(struct pt_regs, ARM_pc)"	@
@ 0 "" 2
@ ../arch/arm/kernel/asm-offsets.c:84:   DEFINE(S_PSR,			offsetof(struct pt_regs, ARM_cpsr));
@ 84 "../arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->S_PSR #64 offsetof(struct pt_regs, ARM_cpsr)"	@
@ 0 "" 2
@ ../arch/arm/kernel/asm-offsets.c:85:   DEFINE(S_OLD_R0,		offsetof(struct pt_regs, ARM_ORIG_r0));
@ 85 "../arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->S_OLD_R0 #68 offsetof(struct pt_regs, ARM_ORIG_r0)"	@
@ 0 "" 2
@ ../arch/arm/kernel/asm-offsets.c:86:   DEFINE(PT_REGS_SIZE,		sizeof(struct pt_regs));
@ 86 "../arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->PT_REGS_SIZE #72 sizeof(struct pt_regs)"	@
@ 0 "" 2
@ ../arch/arm/kernel/asm-offsets.c:87:   DEFINE(SVC_DACR,		offsetof(struct svc_pt_regs, dacr));
@ 87 "../arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->SVC_DACR #72 offsetof(struct svc_pt_regs, dacr)"	@
@ 0 "" 2
@ ../arch/arm/kernel/asm-offsets.c:88:   DEFINE(SVC_TTBCR,		offsetof(struct svc_pt_regs, ttbcr));
@ 88 "../arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->SVC_TTBCR #76 offsetof(struct svc_pt_regs, ttbcr)"	@
@ 0 "" 2
@ ../arch/arm/kernel/asm-offsets.c:89:   DEFINE(SVC_REGS_SIZE,		sizeof(struct svc_pt_regs));
@ 89 "../arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->SVC_REGS_SIZE #80 sizeof(struct svc_pt_regs)"	@
@ 0 "" 2
@ ../arch/arm/kernel/asm-offsets.c:90:   BLANK();
@ 90 "../arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->"
@ 0 "" 2
@ ../arch/arm/kernel/asm-offsets.c:91:   DEFINE(SIGFRAME_RC3_OFFSET,	offsetof(struct sigframe, retcode[3]));
@ 91 "../arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->SIGFRAME_RC3_OFFSET #756 offsetof(struct sigframe, retcode[3])"	@
@ 0 "" 2
@ ../arch/arm/kernel/asm-offsets.c:92:   DEFINE(RT_SIGFRAME_RC3_OFFSET, offsetof(struct rt_sigframe, sig.retcode[3]));
@ 92 "../arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->RT_SIGFRAME_RC3_OFFSET #884 offsetof(struct rt_sigframe, sig.retcode[3])"	@
@ 0 "" 2
@ ../arch/arm/kernel/asm-offsets.c:93:   BLANK();
@ 93 "../arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->"
@ 0 "" 2
@ ../arch/arm/kernel/asm-offsets.c:95:   DEFINE(L2X0_R_PHY_BASE,	offsetof(struct l2x0_regs, phy_base));
@ 95 "../arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->L2X0_R_PHY_BASE #0 offsetof(struct l2x0_regs, phy_base)"	@
@ 0 "" 2
@ ../arch/arm/kernel/asm-offsets.c:96:   DEFINE(L2X0_R_AUX_CTRL,	offsetof(struct l2x0_regs, aux_ctrl));
@ 96 "../arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->L2X0_R_AUX_CTRL #4 offsetof(struct l2x0_regs, aux_ctrl)"	@
@ 0 "" 2
@ ../arch/arm/kernel/asm-offsets.c:97:   DEFINE(L2X0_R_TAG_LATENCY,	offsetof(struct l2x0_regs, tag_latency));
@ 97 "../arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->L2X0_R_TAG_LATENCY #8 offsetof(struct l2x0_regs, tag_latency)"	@
@ 0 "" 2
@ ../arch/arm/kernel/asm-offsets.c:98:   DEFINE(L2X0_R_DATA_LATENCY,	offsetof(struct l2x0_regs, data_latency));
@ 98 "../arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->L2X0_R_DATA_LATENCY #12 offsetof(struct l2x0_regs, data_latency)"	@
@ 0 "" 2
@ ../arch/arm/kernel/asm-offsets.c:99:   DEFINE(L2X0_R_FILTER_START,	offsetof(struct l2x0_regs, filter_start));
@ 99 "../arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->L2X0_R_FILTER_START #16 offsetof(struct l2x0_regs, filter_start)"	@
@ 0 "" 2
@ ../arch/arm/kernel/asm-offsets.c:100:   DEFINE(L2X0_R_FILTER_END,	offsetof(struct l2x0_regs, filter_end));
@ 100 "../arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->L2X0_R_FILTER_END #20 offsetof(struct l2x0_regs, filter_end)"	@
@ 0 "" 2
@ ../arch/arm/kernel/asm-offsets.c:101:   DEFINE(L2X0_R_PREFETCH_CTRL,	offsetof(struct l2x0_regs, prefetch_ctrl));
@ 101 "../arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->L2X0_R_PREFETCH_CTRL #24 offsetof(struct l2x0_regs, prefetch_ctrl)"	@
@ 0 "" 2
@ ../arch/arm/kernel/asm-offsets.c:102:   DEFINE(L2X0_R_PWR_CTRL,	offsetof(struct l2x0_regs, pwr_ctrl));
@ 102 "../arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->L2X0_R_PWR_CTRL #28 offsetof(struct l2x0_regs, pwr_ctrl)"	@
@ 0 "" 2
@ ../arch/arm/kernel/asm-offsets.c:103:   BLANK();
@ 103 "../arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->"
@ 0 "" 2
@ ../arch/arm/kernel/asm-offsets.c:106:   DEFINE(MM_CONTEXT_ID,		offsetof(struct mm_struct, context.id.counter));
@ 106 "../arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->MM_CONTEXT_ID #584 offsetof(struct mm_struct, context.id.counter)"	@
@ 0 "" 2
@ ../arch/arm/kernel/asm-offsets.c:107:   BLANK();
@ 107 "../arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->"
@ 0 "" 2
@ ../arch/arm/kernel/asm-offsets.c:109:   DEFINE(VMA_VM_MM,		offsetof(struct vm_area_struct, vm_mm));
@ 109 "../arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->VMA_VM_MM #8 offsetof(struct vm_area_struct, vm_mm)"	@
@ 0 "" 2
@ ../arch/arm/kernel/asm-offsets.c:110:   DEFINE(VMA_VM_FLAGS,		offsetof(struct vm_area_struct, vm_flags));
@ 110 "../arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->VMA_VM_FLAGS #16 offsetof(struct vm_area_struct, vm_flags)"	@
@ 0 "" 2
@ ../arch/arm/kernel/asm-offsets.c:111:   BLANK();
@ 111 "../arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->"
@ 0 "" 2
@ ../arch/arm/kernel/asm-offsets.c:112:   DEFINE(VM_EXEC,	       	VM_EXEC);
@ 112 "../arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->VM_EXEC #4 VM_EXEC"	@
@ 0 "" 2
@ ../arch/arm/kernel/asm-offsets.c:113:   BLANK();
@ 113 "../arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->"
@ 0 "" 2
@ ../arch/arm/kernel/asm-offsets.c:114:   DEFINE(PAGE_SZ,	       	PAGE_SIZE);
@ 114 "../arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->PAGE_SZ #4096 PAGE_SIZE"	@
@ 0 "" 2
@ ../arch/arm/kernel/asm-offsets.c:115:   BLANK();
@ 115 "../arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->"
@ 0 "" 2
@ ../arch/arm/kernel/asm-offsets.c:116:   DEFINE(SYS_ERROR0,		0x9f0000);
@ 116 "../arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->SYS_ERROR0 #10420224 0x9f0000"	@
@ 0 "" 2
@ ../arch/arm/kernel/asm-offsets.c:117:   BLANK();
@ 117 "../arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->"
@ 0 "" 2
@ ../arch/arm/kernel/asm-offsets.c:118:   DEFINE(SIZEOF_MACHINE_DESC,	sizeof(struct machine_desc));
@ 118 "../arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->SIZEOF_MACHINE_DESC #100 sizeof(struct machine_desc)"	@
@ 0 "" 2
@ ../arch/arm/kernel/asm-offsets.c:119:   DEFINE(MACHINFO_TYPE,		offsetof(struct machine_desc, nr));
@ 119 "../arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->MACHINFO_TYPE #0 offsetof(struct machine_desc, nr)"	@
@ 0 "" 2
@ ../arch/arm/kernel/asm-offsets.c:120:   DEFINE(MACHINFO_NAME,		offsetof(struct machine_desc, name));
@ 120 "../arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->MACHINFO_NAME #4 offsetof(struct machine_desc, name)"	@
@ 0 "" 2
@ ../arch/arm/kernel/asm-offsets.c:121:   BLANK();
@ 121 "../arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->"
@ 0 "" 2
@ ../arch/arm/kernel/asm-offsets.c:122:   DEFINE(PROC_INFO_SZ,		sizeof(struct proc_info_list));
@ 122 "../arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->PROC_INFO_SZ #52 sizeof(struct proc_info_list)"	@
@ 0 "" 2
@ ../arch/arm/kernel/asm-offsets.c:123:   DEFINE(PROCINFO_INITFUNC,	offsetof(struct proc_info_list, __cpu_flush));
@ 123 "../arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->PROCINFO_INITFUNC #16 offsetof(struct proc_info_list, __cpu_flush)"	@
@ 0 "" 2
@ ../arch/arm/kernel/asm-offsets.c:124:   DEFINE(PROCINFO_MM_MMUFLAGS,	offsetof(struct proc_info_list, __cpu_mm_mmu_flags));
@ 124 "../arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->PROCINFO_MM_MMUFLAGS #8 offsetof(struct proc_info_list, __cpu_mm_mmu_flags)"	@
@ 0 "" 2
@ ../arch/arm/kernel/asm-offsets.c:125:   DEFINE(PROCINFO_IO_MMUFLAGS,	offsetof(struct proc_info_list, __cpu_io_mmu_flags));
@ 125 "../arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->PROCINFO_IO_MMUFLAGS #12 offsetof(struct proc_info_list, __cpu_io_mmu_flags)"	@
@ 0 "" 2
@ ../arch/arm/kernel/asm-offsets.c:126:   BLANK();
@ 126 "../arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->"
@ 0 "" 2
@ ../arch/arm/kernel/asm-offsets.c:134:   DEFINE(CPU_SLEEP_SIZE,	offsetof(struct processor, suspend_size));
@ 134 "../arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->CPU_SLEEP_SIZE #40 offsetof(struct processor, suspend_size)"	@
@ 0 "" 2
@ ../arch/arm/kernel/asm-offsets.c:135:   DEFINE(CPU_DO_SUSPEND,	offsetof(struct processor, do_suspend));
@ 135 "../arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->CPU_DO_SUSPEND #44 offsetof(struct processor, do_suspend)"	@
@ 0 "" 2
@ ../arch/arm/kernel/asm-offsets.c:136:   DEFINE(CPU_DO_RESUME,		offsetof(struct processor, do_resume));
@ 136 "../arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->CPU_DO_RESUME #48 offsetof(struct processor, do_resume)"	@
@ 0 "" 2
@ ../arch/arm/kernel/asm-offsets.c:142:   DEFINE(SLEEP_SAVE_SP_SZ,	sizeof(struct sleep_save_sp));
@ 142 "../arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->SLEEP_SAVE_SP_SZ #8 sizeof(struct sleep_save_sp)"	@
@ 0 "" 2
@ ../arch/arm/kernel/asm-offsets.c:143:   DEFINE(SLEEP_SAVE_SP_PHYS,	offsetof(struct sleep_save_sp, save_ptr_stash_phys));
@ 143 "../arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->SLEEP_SAVE_SP_PHYS #4 offsetof(struct sleep_save_sp, save_ptr_stash_phys)"	@
@ 0 "" 2
@ ../arch/arm/kernel/asm-offsets.c:144:   DEFINE(SLEEP_SAVE_SP_VIRT,	offsetof(struct sleep_save_sp, save_ptr_stash));
@ 144 "../arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->SLEEP_SAVE_SP_VIRT #0 offsetof(struct sleep_save_sp, save_ptr_stash)"	@
@ 0 "" 2
@ ../arch/arm/kernel/asm-offsets.c:146:   DEFINE(ARM_SMCCC_QUIRK_ID_OFFS,	offsetof(struct arm_smccc_quirk, id));
@ 146 "../arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->ARM_SMCCC_QUIRK_ID_OFFS #0 offsetof(struct arm_smccc_quirk, id)"	@
@ 0 "" 2
@ ../arch/arm/kernel/asm-offsets.c:147:   DEFINE(ARM_SMCCC_QUIRK_STATE_OFFS,	offsetof(struct arm_smccc_quirk, state));
@ 147 "../arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->ARM_SMCCC_QUIRK_STATE_OFFS #4 offsetof(struct arm_smccc_quirk, state)"	@
@ 0 "" 2
@ ../arch/arm/kernel/asm-offsets.c:148:   BLANK();
@ 148 "../arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->"
@ 0 "" 2
@ ../arch/arm/kernel/asm-offsets.c:149:   DEFINE(DMA_BIDIRECTIONAL,	DMA_BIDIRECTIONAL);
@ 149 "../arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->DMA_BIDIRECTIONAL #0 DMA_BIDIRECTIONAL"	@
@ 0 "" 2
@ ../arch/arm/kernel/asm-offsets.c:150:   DEFINE(DMA_TO_DEVICE,		DMA_TO_DEVICE);
@ 150 "../arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->DMA_TO_DEVICE #1 DMA_TO_DEVICE"	@
@ 0 "" 2
@ ../arch/arm/kernel/asm-offsets.c:151:   DEFINE(DMA_FROM_DEVICE,	DMA_FROM_DEVICE);
@ 151 "../arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->DMA_FROM_DEVICE #2 DMA_FROM_DEVICE"	@
@ 0 "" 2
@ ../arch/arm/kernel/asm-offsets.c:152:   BLANK();
@ 152 "../arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->"
@ 0 "" 2
@ ../arch/arm/kernel/asm-offsets.c:153:   DEFINE(CACHE_WRITEBACK_ORDER, __CACHE_WRITEBACK_ORDER);
@ 153 "../arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->CACHE_WRITEBACK_ORDER #6 __CACHE_WRITEBACK_ORDER"	@
@ 0 "" 2
@ ../arch/arm/kernel/asm-offsets.c:154:   DEFINE(CACHE_WRITEBACK_GRANULE, __CACHE_WRITEBACK_GRANULE);
@ 154 "../arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->CACHE_WRITEBACK_GRANULE #64 __CACHE_WRITEBACK_GRANULE"	@
@ 0 "" 2
@ ../arch/arm/kernel/asm-offsets.c:155:   BLANK();
@ 155 "../arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->"
@ 0 "" 2
@ ../arch/arm/kernel/asm-offsets.c:157:   DEFINE(VDSO_DATA_SIZE,	sizeof(union vdso_data_store));
@ 157 "../arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->VDSO_DATA_SIZE #4096 sizeof(union vdso_data_store)"	@
@ 0 "" 2
@ ../arch/arm/kernel/asm-offsets.c:159:   BLANK();
@ 159 "../arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->"
@ 0 "" 2
@ ../arch/arm/kernel/asm-offsets.c:171:   DEFINE(KEXEC_START_ADDR,	offsetof(struct kexec_relocate_data, kexec_start_address));
@ 171 "../arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->KEXEC_START_ADDR #0 offsetof(struct kexec_relocate_data, kexec_start_address)"	@
@ 0 "" 2
@ ../arch/arm/kernel/asm-offsets.c:172:   DEFINE(KEXEC_INDIR_PAGE,	offsetof(struct kexec_relocate_data, kexec_indirection_page));
@ 172 "../arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->KEXEC_INDIR_PAGE #4 offsetof(struct kexec_relocate_data, kexec_indirection_page)"	@
@ 0 "" 2
@ ../arch/arm/kernel/asm-offsets.c:173:   DEFINE(KEXEC_MACH_TYPE,	offsetof(struct kexec_relocate_data, kexec_mach_type));
@ 173 "../arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->KEXEC_MACH_TYPE #8 offsetof(struct kexec_relocate_data, kexec_mach_type)"	@
@ 0 "" 2
@ ../arch/arm/kernel/asm-offsets.c:174:   DEFINE(KEXEC_R2,		offsetof(struct kexec_relocate_data, kexec_r2));
@ 174 "../arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->KEXEC_R2 #12 offsetof(struct kexec_relocate_data, kexec_r2)"	@
@ 0 "" 2
@ ../arch/arm/kernel/asm-offsets.c:176: }
	.arm
	.syntax unified
	mov	r0, #0	@,
	bx	lr	@
	.fnend
	.size	main, .-main
	.ident	"GCC: (Linaro GCC 7.4-2019.02) 7.4.1 20181213 [linaro-7.4-2019.02 revision 56ec6f6b99cc167ff0c2f8e1a2eed33b1edc85d4]"
	.section	.note.GNU-stack,"",%progbits
