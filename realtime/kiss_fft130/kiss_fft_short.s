	.file	"kiss_fft.c"
# GNU C (Ubuntu/Linaro 4.7.2-2ubuntu1) version 4.7.2 (x86_64-linux-gnu)
#	compiled by GNU C version 4.7.2, GMP version 5.0.2, MPFR version 3.1.0-p3, MPC version 0.9
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -imultiarch x86_64-linux-gnu -D FIXED_POINT kiss_fft.c
# --param l1-cache-size=32 --param l1-cache-line-size=64
# --param l2-cache-size=3072 -mtune=generic -march=x86-64
# -auxbase-strip kiss_fft_short.s -O3 -ffast-math -fomit-frame-pointer
# -fverbose-asm -fstack-protector
# options enabled:  -fassociative-math -fasynchronous-unwind-tables
# -fauto-inc-dec -fbranch-count-reg -fcaller-saves
# -fcombine-stack-adjustments -fcommon -fcompare-elim -fcprop-registers
# -fcrossjumping -fcse-follow-jumps -fcx-limited-range
# -fdebug-types-section -fdefer-pop -fdelete-null-pointer-checks
# -fdevirtualize -fdwarf2-cfi-asm -fearly-inlining
# -feliminate-unused-debug-types -fexpensive-optimizations
# -ffinite-math-only -fforward-propagate -ffunction-cse -fgcse
# -fgcse-after-reload -fgcse-lm -fgnu-runtime -fguess-branch-probability
# -fident -fif-conversion -fif-conversion2 -findirect-inlining -finline
# -finline-atomics -finline-functions -finline-functions-called-once
# -finline-small-functions -fipa-cp -fipa-cp-clone -fipa-profile
# -fipa-pure-const -fipa-reference -fipa-sra -fira-share-save-slots
# -fira-share-spill-slots -fivopts -fkeep-static-consts
# -fleading-underscore -fmerge-constants -fmerge-debug-strings
# -fmove-loop-invariants -fomit-frame-pointer -foptimize-register-move
# -foptimize-sibling-calls -foptimize-strlen -fpartial-inlining -fpeephole
# -fpeephole2 -fpredictive-commoning -fprefetch-loop-arrays
# -freciprocal-math -free -freg-struct-return -fregmove -freorder-blocks
# -freorder-functions -frerun-cse-after-loop
# -fsched-critical-path-heuristic -fsched-dep-count-heuristic
# -fsched-group-heuristic -fsched-interblock -fsched-last-insn-heuristic
# -fsched-rank-heuristic -fsched-spec -fsched-spec-insn-heuristic
# -fsched-stalled-insns-dep -fschedule-insns2 -fshow-column -fshrink-wrap
# -fsplit-ivs-in-unroller -fsplit-wide-types -fstack-protector
# -fstrict-aliasing -fstrict-overflow -fstrict-volatile-bitfields
# -fthread-jumps -ftoplevel-reorder -ftree-bit-ccp -ftree-builtin-call-dce
# -ftree-ccp -ftree-ch -ftree-copy-prop -ftree-copyrename -ftree-cselim
# -ftree-dce -ftree-dominator-opts -ftree-dse -ftree-forwprop -ftree-fre
# -ftree-loop-distribute-patterns -ftree-loop-if-convert -ftree-loop-im
# -ftree-loop-ivcanon -ftree-loop-optimize -ftree-parallelize-loops=
# -ftree-partial-pre -ftree-phiprop -ftree-pre -ftree-pta -ftree-reassoc
# -ftree-scev-cprop -ftree-sink -ftree-slp-vectorize -ftree-sra
# -ftree-switch-conversion -ftree-tail-merge -ftree-ter
# -ftree-vect-loop-version -ftree-vectorize -ftree-vrp -funit-at-a-time
# -funsafe-math-optimizations -funswitch-loops -funwind-tables
# -fvect-cost-model -fverbose-asm -fzero-initialized-in-bss
# -m128bit-long-double -m64 -m80387 -maccumulate-outgoing-args
# -malign-stringops -mfancy-math-387 -mfp-ret-in-387 -mglibc -mmmx
# -mno-sse4 -mpush-args -mred-zone -msse -msse2 -mtls-direct-seg-refs

	.text
	.p2align 4,,15
	.type	kf_work, @function
kf_work:
.LFB81:
	.cfi_startproc
# BLOCK 2 freq:44 seq:0
# PRED: ENTRY [100.0%]  (fallthru)
	pushq	%r15	#
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movq	%rdi, %r15	# Fout, Fout
	pushq	%r14	#
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%r9, %r14	# st, st
	pushq	%r13	#
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12	#
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rsi, %r12	# f, f
	pushq	%rbp	#
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx	#
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$136, %rsp	#,
	.cfi_def_cfa_offset 192
	movl	(%r8), %ebp	# *factors_7(D),
	movq	%rdx, 104(%rsp)	# fstride, %sfp
	movl	%ecx, 16(%rsp)	# in_stride, %sfp
	movl	%ebp, 8(%rsp)	#, %sfp
	movl	4(%r8), %ebp	# MEM[(int *)factors_7(D) + 4B],
	movl	8(%rsp), %edx	# %sfp, tmp1135
	movl	%ebp, 40(%rsp)	#, %sfp
	imull	%ebp, %edx	#, tmp1135
	cmpl	$1, %ebp	#,
	movslq	%edx, %rdx	# tmp1135, tmp1136
	leaq	(%rdi,%rdx,4), %rbx	#, Fout_end
# SUCC: 26 [28.0%]  (can_fallthru) 3 [72.0%]  (fallthru,can_fallthru)
	je	.L42	#,
# BLOCK 3 freq:32 seq:1
# PRED: 2 [72.0%]  (fallthru,can_fallthru)
	movslq	16(%rsp), %rdx	# %sfp, pretmp.151
	movq	104(%rsp), %rax	# %sfp,
	movq	%rdi, %r15	# Fout, Fout
	movslq	8(%rsp), %rbp	# %sfp, pretmp.151
	movq	%rdi, 32(%rsp)	# Fout, %sfp
	imulq	104(%rsp), %rbp	# %sfp, pretmp.151
	salq	$2, %rax	#,
	imulq	%rax, %rdx	#, pretmp.151
	movslq	40(%rsp), %rax	# %sfp, pretmp.151
	salq	$2, %rax	#,
	movq	%rdx, (%rsp)	# pretmp.151, %sfp
	movq	%rax, 24(%rsp)	#, %sfp
	leaq	8(%r8), %rax	#, tmp1558
# SUCC: 4 [100.0%]  (fallthru,can_fallthru)
	movq	%rax, %r13	# tmp1558, tmp1558
# BLOCK 4 freq:226 seq:2
# PRED: 3 [100.0%]  (fallthru,can_fallthru) 4 [86.0%]  (dfs_back,can_fallthru)
	.p2align 4,,10
	.p2align 3
.L5:
	movl	16(%rsp), %ecx	# %sfp,
	movq	%r12, %rsi	# f,
	movq	%r15, %rdi	# Fout,
	movq	%r14, %r9	# st,
	movq	%r13, %r8	# tmp1558,
	movq	%rbp, %rdx	# pretmp.151,
	call	kf_work	#
	addq	24(%rsp), %r15	# %sfp, Fout
	addq	(%rsp), %r12	# %sfp, f
	cmpq	%rbx, %r15	# Fout_end, Fout
# SUCC: 4 [86.0%]  (dfs_back,can_fallthru) 5 [14.0%]  (fallthru,can_fallthru,loop_exit)
	jne	.L5	#,
# BLOCK 5 freq:32 seq:3
# PRED: 4 [14.0%]  (fallthru,can_fallthru,loop_exit)
	cmpl	$3, 8(%rsp)	#, %sfp
	movq	32(%rsp), %r15	# %sfp, Fout
# SUCC: 29 [29.0%]  (can_fallthru) 6 [71.0%]  (fallthru,can_fallthru)
	je	.L8	#,
# BLOCK 6 freq:31 seq:4
# PRED: 5 [71.0%]  (fallthru,can_fallthru) 28 [71.0%]  (can_fallthru)
.L44:
# SUCC: 20 [50.0%]  (can_fallthru) 7 [50.0%]  (fallthru,can_fallthru)
	jg	.L11	#,
# BLOCK 7 freq:16 seq:5
# PRED: 6 [50.0%]  (fallthru,can_fallthru)
	cmpl	$2, 8(%rsp)	#, %sfp
# SUCC: 32 [29.0%]  (can_fallthru) 8 [71.0%]  (fallthru,can_fallthru)
	je	.L43	#,
# BLOCK 8 freq:9 seq:6
# PRED: 21 [71.0%]  (can_fallthru) 7 [71.0%]  (fallthru,can_fallthru)
.L6:
	movslq	8(%rsp), %rdi	# %sfp, p
	movl	(%r14), %ebp	# st_26(D)->nfft, Norig
	salq	$2, %rdi	#, tmp1518
	call	malloc	#
	movl	40(%rsp), %edx	# %sfp,
	movq	%rax, 16(%rsp)	#, %sfp
	testl	%edx, %edx	#
# SUCC: 9 [91.0%]  (fallthru,can_fallthru) 19 [9.0%]  (can_fallthru)
	jle	.L19	#,
# BLOCK 9 freq:8 seq:7
# PRED: 8 [91.0%]  (fallthru,can_fallthru)
	movq	%rax, %rsi	#,
	movslq	40(%rsp), %rax	# %sfp, m
	movl	104(%rsp), %ecx	# %sfp,
	movl	40(%rsp), %r12d	# %sfp,
	movq	%r15, 48(%rsp)	# Fout, %sfp
	movl	$0, 64(%rsp)	#, %sfp
	movl	$0, 68(%rsp)	#, %sfp
	movl	%ecx, 60(%rsp)	#, %sfp
	salq	$2, %rax	#,
	movq	%rax, 24(%rsp)	#, %sfp
	movl	8(%rsp), %eax	# %sfp,
	imull	%ecx, %r12d	#,
	subl	$1, %eax	#, tmp1522
	leaq	4(%rsi,%rax,4), %rax	#,
	movl	%r12d, 56(%rsp)	#, %sfp
	movq	%rax, 72(%rsp)	#, %sfp
	movl	8(%rsp), %eax	# %sfp,
	subl	$2, %eax	#, tmp1526
	leaq	4(%rsi,%rax,4), %r15	#, D.6713
# SUCC: 10 [100.0%]  (fallthru,can_fallthru)
# BLOCK 10 freq:89 seq:8
# PRED: 18 [91.0%]  (dfs_back,can_fallthru) 9 [100.0%]  (fallthru,can_fallthru)
.L20:
	movl	8(%rsp), %eax	# %sfp,
	testl	%eax, %eax	#
# SUCC: 11 [91.0%]  (fallthru,can_fallthru) 18 [9.0%]  (can_fallthru)
	jle	.L27	#,
# BLOCK 11 freq:81 seq:9
# PRED: 10 [91.0%]  (fallthru,can_fallthru)
	movl	$32767, %eax	#, tmp1554
	movq	48(%rsp), %rsi	# %sfp, ivtmp.255
	movq	24(%rsp), %r8	# %sfp, D.6732
	movl	%eax, %edx	# tmp1554, tmp1555
	movq	72(%rsp), %r9	# %sfp, D.6771
	sarl	$31, %edx	#, tmp1555
	idivl	8(%rsp)	# %sfp
# SUCC: 12 [100.0%]  (fallthru,can_fallthru)
	movq	16(%rsp), %rdx	# %sfp, ivtmp.257
# BLOCK 12 freq:900 seq:10
# PRED: 12 [91.0%]  (dfs_back,can_fallthru) 11 [100.0%]  (fallthru,can_fallthru)
	.p2align 4,,10
	.p2align 3
.L21:
	movl	(%rsi), %ecx	# MEM[base: D.6759_1208, offset: 0B], MEM[base: D.6759_1208, offset: 0B]
	addq	%r8, %rsi	# D.6732, ivtmp.255
	movswl	%cx, %edi	# MEM[base: D.6759_1208, offset: 0B], tmp1531
	sarl	$16, %ecx	#, tmp1535
	imull	%eax, %edi	# tmp1554, tmp1531
	imull	%eax, %ecx	# tmp1554, tmp1535
	addl	$16384, %edi	#, tmp1533
	addl	$16384, %ecx	#, tmp1537
	sarl	$15, %edi	#, tmp1533
	sarl	$15, %ecx	#, tmp1537
	movw	%di, (%rdx)	# tmp1533, MEM[base: D.6760_1209, offset: 0B]
	movw	%cx, 2(%rdx)	# tmp1537, MEM[base: D.6760_1209, offset: 2B]
	addq	$4, %rdx	#, ivtmp.257
	cmpq	%r9, %rdx	# D.6771, ivtmp.257
# SUCC: 12 [91.0%]  (dfs_back,can_fallthru) 13 [9.0%]  (fallthru,can_fallthru,loop_exit)
	jne	.L21	#,
# BLOCK 13 freq:81 seq:11
# PRED: 12 [9.0%]  (fallthru,can_fallthru,loop_exit)
	movq	16(%rsp), %rax	# %sfp,
	movq	48(%rsp), %rbx	# %sfp, ivtmp.247
	movl	64(%rsp), %r13d	# %sfp, ivtmp.245
	movl	$0, (%rsp)	#, %sfp
	movl	(%rax), %eax	# *scratch_816,
# SUCC: 14 [100.0%]  (fallthru,can_fallthru)
	movl	%eax, 32(%rsp)	#, %sfp
# BLOCK 14 freq:900 seq:12
# PRED: 17 [91.0%]  (dfs_back,can_fallthru) 13 [100.0%]  (fallthru,can_fallthru)
	.p2align 4,,10
	.p2align 3
.L26:
	cmpl	$1, 8(%rsp)	#, %sfp
	movl	32(%rsp), %edx	# %sfp,
	movl	%edx, (%rbx)	#, MEM[base: D.6737_1198, offset: 0B]
# SUCC: 15 [91.0%]  (fallthru,can_fallthru) 17 [9.0%]  (can_fallthru)
	je	.L22	#,
# BLOCK 15 freq:819 seq:13
# PRED: 14 [91.0%]  (fallthru,can_fallthru)
	movzwl	(%rbx), %edi	# MEM[base: D.6737_1198, offset: 0B], prephitmp.123
	movzwl	2(%rbx), %esi	# MEM[base: D.6737_1198, offset: 2B], prephitmp.123
	xorl	%eax, %eax	# twidx
# SUCC: 16 [100.0%]  (fallthru,can_fallthru)
	movq	16(%rsp), %rdx	# %sfp, ivtmp.257
# BLOCK 16 freq:9100 seq:14
# PRED: 16 [91.0%]  (dfs_back,can_fallthru) 15 [100.0%]  (fallthru,can_fallthru)
	.p2align 4,,10
	.p2align 3
.L25:
	leal	0(%r13,%rax), %ecx	#, D.6507
	movswl	4(%rdx), %r11d	# MEM[base: D.6705_1177, offset: 4B], D.6502
	movswl	6(%rdx), %r8d	# MEM[base: D.6705_1177, offset: 6B], D.6495
	movl	%ecx, %eax	# D.6507, twidx
	subl	%ebp, %eax	# Norig, twidx
	cmpl	%ecx, %ebp	# D.6507, Norig
	cmovg	%ecx, %eax	# D.6507,, twidx
	movl	%r8d, %r12d	# D.6495, tmp1545
	addq	$4, %rdx	#, ivtmp.257
	movslq	%eax, %rcx	# twidx, twidx
	leaq	256(%r14,%rcx,4), %rcx	#, tmp1543
	movswl	8(%rcx), %r9d	# D.6500_860->r, D.6498
	movswl	10(%rcx), %r10d	# D.6500_860->i, D.6493
	movl	%r11d, %ecx	# D.6502, tmp1546
	imull	%r10d, %r12d	# D.6493, tmp1545
	imull	%r9d, %ecx	# D.6498, tmp1546
	imull	%r11d, %r10d	# D.6502, tmp1549
	subl	%r12d, %ecx	# tmp1545, tmp1546
	imull	%r9d, %r8d	# D.6498, tmp1550
	addl	$16384, %ecx	#, tmp1548
	sarl	$15, %ecx	#, tmp1548
	addl	%ecx, %edi	# tmp1548, prephitmp.123
	leal	16384(%r10,%r8), %ecx	#, tmp1553
	movw	%di, (%rbx)	# prephitmp.123, MEM[base: D.6737_1198, offset: 0B]
	sarl	$15, %ecx	#, tmp1553
	addl	%ecx, %esi	# tmp1553, prephitmp.123
	cmpq	%r15, %rdx	# D.6713, ivtmp.257
	movw	%si, 2(%rbx)	# prephitmp.123, MEM[base: D.6737_1198, offset: 2B]
# SUCC: 16 [91.0%]  (dfs_back,can_fallthru) 17 [9.0%]  (fallthru,can_fallthru,loop_exit)
	jne	.L25	#,
# BLOCK 17 freq:900 seq:15
# PRED: 16 [9.0%]  (fallthru,can_fallthru,loop_exit) 14 [9.0%]  (can_fallthru)
.L22:
	addl	$1, (%rsp)	#, %sfp
	addl	56(%rsp), %r13d	# %sfp, ivtmp.245
	addq	24(%rsp), %rbx	# %sfp, ivtmp.247
	movl	8(%rsp), %r12d	# %sfp,
	cmpl	%r12d, (%rsp)	#, %sfp
# SUCC: 14 [91.0%]  (dfs_back,can_fallthru) 18 [9.0%]  (fallthru,can_fallthru,loop_exit)
	jne	.L26	#,
# BLOCK 18 freq:89 seq:16
# PRED: 17 [9.0%]  (fallthru,can_fallthru,loop_exit) 10 [9.0%]  (can_fallthru)
.L27:
	addl	$1, 68(%rsp)	#, %sfp
	movl	60(%rsp), %ecx	# %sfp,
	addq	$4, 48(%rsp)	#, %sfp
	movl	40(%rsp), %r12d	# %sfp,
	addl	%ecx, 64(%rsp)	#, %sfp
	cmpl	%r12d, 68(%rsp)	#, %sfp
# SUCC: 10 [91.0%]  (dfs_back,can_fallthru) 19 [9.0%]  (fallthru,can_fallthru,loop_exit)
	jne	.L20	#,
# BLOCK 19 freq:9 seq:17
# PRED: 18 [9.0%]  (fallthru,can_fallthru,loop_exit) 8 [9.0%]  (can_fallthru)
.L19:
	movq	16(%rsp), %rdi	# %sfp,
	addq	$136, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx	#
	.cfi_def_cfa_offset 48
	popq	%rbp	#
	.cfi_def_cfa_offset 40
	popq	%r12	#
	.cfi_def_cfa_offset 32
	popq	%r13	#
	.cfi_def_cfa_offset 24
	popq	%r14	#
	.cfi_def_cfa_offset 16
	popq	%r15	#
	.cfi_def_cfa_offset 8
# SUCC: EXIT [100.0%]  (ab,sibcall)
	jmp	free	#
# BLOCK 20 freq:16 seq:18
# PRED: 6 [50.0%]  (can_fallthru)
.L11:
	.cfi_restore_state
	cmpl	$4, 8(%rsp)	#, %sfp
# SUCC: 35 [29.0%]  (can_fallthru) 21 [71.0%]  (fallthru,can_fallthru)
	je	.L9	#,
# BLOCK 21 freq:11 seq:19
# PRED: 20 [71.0%]  (fallthru,can_fallthru)
	cmpl	$5, 8(%rsp)	#, %sfp
# SUCC: 22 [29.0%]  (fallthru,can_fallthru) 8 [71.0%]  (can_fallthru)
	jne	.L6	#,
# BLOCK 22 freq:9 seq:20
# PRED: 21 [29.0%]  (fallthru,can_fallthru)
	movslq	40(%rsp), %rax	# %sfp, D.6459
	movq	104(%rsp), %rdx	# %sfp, D.6458
	movl	40(%rsp), %r9d	# %sfp,
	imulq	%rax, %rdx	# D.6459, D.6458
	leaq	(%r15,%rax,4), %r11	#, Fout1
	movl	40(%rsp), %eax	# %sfp, tmp1341
	addl	%eax, %eax	# tmp1341
	movslq	%eax, %r8	# tmp1341, tmp1342
	addl	40(%rsp), %eax	# %sfp, tmp1346
	leaq	256(%r14,%rdx,4), %rcx	#, tmp1337
	leaq	264(%r14,%rdx,8), %rdx	#, D.6456
	leaq	(%r15,%r8,4), %r12	#, Fout2
	movswl	8(%rcx), %edi	# D.6168_460->r,
	movswl	10(%rcx), %ecx	# D.6168_460->i,
	movswl	(%rdx), %esi	# D.6456_464->r,
	movswl	2(%rdx), %edx	# D.6456_464->i,
	cltq
	leaq	(%r15,%rax,4), %r10	#, Fout3
	movl	40(%rsp), %eax	# %sfp, tmp1349
	sall	$2, %eax	#, tmp1349
	testl	%r9d, %r9d	#
	cltq
	leaq	(%r15,%rax,4), %r8	#, Fout4
# SUCC: 23 [91.0%]  (fallthru,can_fallthru) 25 [9.0%]  (can_fallthru)
	jle	.L1	#,
# BLOCK 23 freq:8 seq:21
# PRED: 22 [91.0%]  (fallthru,can_fallthru)
	movl	40(%rsp), %eax	# %sfp,
	movl	%edi, 32(%rsp)	#, %sfp
	movl	%esi, 56(%rsp)	#, %sfp
	movl	%ecx, 48(%rsp)	#, %sfp
	movl	%edx, 64(%rsp)	#, %sfp
	movq	$0, (%rsp)	#, %sfp
	subl	$1, %eax	#, tmp1353
	movq	%r14, 40(%rsp)	# st, %sfp
	leaq	4(%r8,%rax,4), %rax	#,
	movq	%rax, 120(%rsp)	#, %sfp
# SUCC: 24 [100.0%]  (fallthru,can_fallthru)
	movq	%r8, %rax	# Fout4, Fout4
# BLOCK 24 freq:89 seq:22
# PRED: 24 [91.0%]  (dfs_back,can_fallthru) 23 [100.0%]  (fallthru,can_fallthru)
.L18:
	movswl	(%r15), %edx	# MEM[base: Fout_634, offset: 0B], MEM[base: Fout_634, offset: 0B]
	movq	(%rsp), %rdi	# %sfp,
	imull	$6553, %edx, %edx	#, MEM[base: Fout_634, offset: 0B], tmp1357
	addl	$16384, %edx	#, tmp1359
	sarl	$15, %edx	#, tmp1359
	movw	%dx, (%r15)	# tmp1359, MEM[base: Fout_634, offset: 0B]
	movswl	2(%r15), %edx	# MEM[base: Fout_634, offset: 2B], MEM[base: Fout_634, offset: 2B]
	imull	$6553, %edx, %edx	#, MEM[base: Fout_634, offset: 2B], tmp1361
	addl	$16384, %edx	#, tmp1363
	sarl	$15, %edx	#, tmp1363
	movw	%dx, 2(%r15)	# tmp1363, MEM[base: Fout_634, offset: 2B]
	movswl	(%r11), %edx	# MEM[base: Fout1_631, offset: 0B], MEM[base: Fout1_631, offset: 0B]
	imull	$6553, %edx, %edx	#, MEM[base: Fout1_631, offset: 0B], tmp1365
	addl	$16384, %edx	#, tmp1367
	sarl	$15, %edx	#, tmp1367
	movw	%dx, (%r11)	# tmp1367, MEM[base: Fout1_631, offset: 0B]
	movswl	2(%r11), %edx	# MEM[base: Fout1_631, offset: 2B], MEM[base: Fout1_631, offset: 2B]
	imull	$6553, %edx, %edx	#, MEM[base: Fout1_631, offset: 2B], tmp1369
	addl	$16384, %edx	#, tmp1371
	sarl	$15, %edx	#, tmp1371
	movw	%dx, 2(%r11)	# tmp1371, MEM[base: Fout1_631, offset: 2B]
	movswl	(%r12), %edx	# MEM[base: Fout2_630, offset: 0B], MEM[base: Fout2_630, offset: 0B]
	imull	$6553, %edx, %edx	#, MEM[base: Fout2_630, offset: 0B], tmp1373
	addl	$16384, %edx	#, tmp1375
	sarl	$15, %edx	#, tmp1375
	movw	%dx, (%r12)	# tmp1375, MEM[base: Fout2_630, offset: 0B]
	movswl	2(%r12), %edx	# MEM[base: Fout2_630, offset: 2B], MEM[base: Fout2_630, offset: 2B]
	imull	$6553, %edx, %edx	#, MEM[base: Fout2_630, offset: 2B], tmp1377
	addl	$16384, %edx	#, tmp1379
	sarl	$15, %edx	#, tmp1379
	movw	%dx, 2(%r12)	# tmp1379, MEM[base: Fout2_630, offset: 2B]
	movswl	(%r10), %edx	# MEM[base: Fout3_621, offset: 0B], MEM[base: Fout3_621, offset: 0B]
	imull	$6553, %edx, %edx	#, MEM[base: Fout3_621, offset: 0B], tmp1381
	addl	$16384, %edx	#, tmp1383
	sarl	$15, %edx	#, tmp1383
	movw	%dx, (%r10)	# tmp1383, MEM[base: Fout3_621, offset: 0B]
	movswl	2(%r10), %edx	# MEM[base: Fout3_621, offset: 2B], MEM[base: Fout3_621, offset: 2B]
	imull	$6553, %edx, %edx	#, MEM[base: Fout3_621, offset: 2B], tmp1385
	addl	$16384, %edx	#, tmp1387
	sarl	$15, %edx	#, tmp1387
	movw	%dx, 2(%r10)	# tmp1387, MEM[base: Fout3_621, offset: 2B]
	movswl	(%rax), %ecx	# MEM[base: Fout4_604, offset: 0B], MEM[base: Fout4_604, offset: 0B]
	movswl	2(%rax), %edx	# MEM[base: Fout4_604, offset: 2B], MEM[base: Fout4_604, offset: 2B]
	imull	$6553, %ecx, %ecx	#, MEM[base: Fout4_604, offset: 0B], tmp1389
	imull	$6553, %edx, %edx	#, MEM[base: Fout4_604, offset: 2B], tmp1391
	addl	$16384, %ecx	#, D.6396
	addl	$16384, %edx	#, D.6390
	sarl	$15, %ecx	#, D.6396
	sarl	$15, %edx	#, D.6390
	movw	%cx, (%rax)	# D.6396, MEM[base: Fout4_604, offset: 0B]
	movw	%dx, 2(%rax)	# D.6390, MEM[base: Fout4_604, offset: 2B]
	movzwl	2(%r15), %r8d	# MEM[base: Fout_634, offset: 2B],
	movswl	(%r11), %r13d	# MEM[base: Fout1_631, offset: 0B], D.6432
	movswl	2(%r11), %r9d	# MEM[base: Fout1_631, offset: 2B], D.6426
	movw	%r8w, 68(%rsp)	#, %sfp
	movq	40(%rsp), %r8	# %sfp,
	movl	%r9d, %r14d	# D.6426, tmp1410
	leaq	256(%r8,%rdi,4), %rsi	#, tmp1394
	movswl	8(%rsi), %ebx	# D.6383_553->r, D.6381
	movswl	10(%rsi), %ebp	# D.6383_553->i, D.6378
	movswl	(%r12), %esi	# MEM[base: Fout2_630, offset: 0B],
	imull	%ebp, %r14d	# D.6378, tmp1410
	movl	%esi, 60(%rsp)	#, %sfp
	movq	%rdi, %rsi	#, tmp1395
	addq	%rsi, %rsi	# tmp1395
	leaq	256(%r8,%rsi,4), %rdi	#, tmp1398
	movswl	8(%rdi), %r8d	# D.6363_584->r,
	movl	%r8d, 72(%rsp)	#, %sfp
	movswl	2(%r12), %r8d	# MEM[base: Fout2_630, offset: 2B],
	movl	%r8d, 80(%rsp)	#, %sfp
	movswl	10(%rdi), %edi	# D.6363_584->i,
	movq	(%rsp), %r8	# %sfp,
	movl	%edi, 88(%rsp)	#, %sfp
	movswl	(%r10), %edi	# MEM[base: Fout3_621, offset: 0B],
	leaq	64(%r8,%rsi), %rsi	#, tmp1402
	movl	%edi, 96(%rsp)	#, %sfp
	movq	40(%rsp), %rdi	# %sfp,
	leaq	(%rdi,%rsi,4), %rsi	#, tmp1404
	movswl	2(%r10), %edi	# MEM[base: Fout3_621, offset: 2B],
	movswl	8(%rsi), %r8d	# D.6343_615->r,
	movswl	10(%rsi), %esi	# D.6343_615->i,
	movl	%edi, 112(%rsp)	#, %sfp
	movq	40(%rsp), %rdi	# %sfp,
	movl	%r8d, 100(%rsp)	#, %sfp
	movq	(%rsp), %r8	# %sfp,
	movl	%esi, 116(%rsp)	#, %sfp
	leaq	64(,%r8,4), %rsi	#, tmp1406
	leaq	(%rdi,%rsi,4), %rsi	#, tmp1408
	movswl	8(%rsi), %edi	# D.6323_645->r, D.6321
	movswl	10(%rsi), %r8d	# D.6323_645->i, D.6318
	movl	%r13d, %esi	# D.6432, tmp1411
	imull	%ebx, %esi	# D.6381, tmp1411
	subl	%r14d, %esi	# tmp1410, tmp1411
	movl	%edx, %r14d	# D.6390, tmp1415
	addl	$16384, %esi	#,
	sarl	$15, %esi	#,
	imull	%edi, %edx	# D.6321, tmp1425
	movl	%esi, 8(%rsp)	#, %sfp
	movl	%ecx, %esi	# D.6396, tmp1416
	imull	%r8d, %ecx	# D.6318, tmp1424
	imull	%edi, %esi	# D.6321, tmp1416
	leal	16384(%rcx,%rdx), %ecx	#, tmp1428
	movl	80(%rsp), %edi	# %sfp, tmp1430
	movl	60(%rsp), %edx	# %sfp, tmp1431
	imull	88(%rsp), %edi	# %sfp, tmp1430
	imull	72(%rsp), %edx	# %sfp, tmp1431
	imull	%r8d, %r14d	# D.6318, tmp1415
	sarl	$15, %ecx	#, tmp1428
	imull	%r13d, %ebp	# D.6432, tmp1419
	subl	%r14d, %esi	# tmp1415, tmp1416
	imull	%ebx, %r9d	# D.6381, tmp1420
	leal	16384(%rsi), %r14d	#, tmp1418
	movzwl	8(%rsp), %esi	# %sfp, D.6304
	subl	%edi, %edx	# tmp1430, tmp1431
	movl	112(%rsp), %edi	# %sfp, tmp1435
	addl	$16384, %edx	#,
	sarl	$15, %r14d	#, tmp1418
	sarl	$15, %edx	#,
	leal	16384(%rbp,%r9), %r9d	#, tmp1423
	movzwl	(%r15), %ebp	# MEM[base: Fout_634, offset: 0B],
	imull	116(%rsp), %edi	# %sfp, tmp1435
	movl	%edx, 16(%rsp)	#, %sfp
	movl	96(%rsp), %edx	# %sfp, tmp1436
	addl	%r14d, %esi	# tmp1418, D.6304
	imull	100(%rsp), %edx	# %sfp, tmp1436
	sarl	$15, %r9d	#, tmp1423
	leal	(%rcx,%r9), %r8d	#, D.6300
	subl	%edi, %edx	# tmp1435, tmp1436
	movl	60(%rsp), %edi	# %sfp, tmp1439
	addl	$16384, %edx	#,
	sarl	$15, %edx	#,
	imull	88(%rsp), %edi	# %sfp, tmp1439
	movl	%edx, 24(%rsp)	#, %sfp
	movl	72(%rsp), %edx	# %sfp, tmp1440
	imull	80(%rsp), %edx	# %sfp, tmp1440
	movzwl	24(%rsp), %ebx	# %sfp, D.6292
	addw	16(%rsp), %bx	# %sfp, D.6292
	leal	16384(%rdi,%rdx), %r13d	#, tmp1443
	movl	96(%rsp), %edi	# %sfp, tmp1444
	movl	100(%rsp), %edx	# %sfp, tmp1445
	imull	116(%rsp), %edi	# %sfp, tmp1444
	imull	112(%rsp), %edx	# %sfp, tmp1445
	movw	%bp, 60(%rsp)	#, %sfp
	addl	%ebx, %ebp	# D.6292, tmp1449
	sarl	$15, %r13d	#, tmp1443
	addl	%esi, %ebp	# D.6304, tmp1450
	movswl	%si, %esi	# D.6304,
	movw	%bp, (%r15)	# tmp1450, MEM[base: Fout_634, offset: 0B]
	movzwl	68(%rsp), %ebp	# %sfp, tmp1451
	movl	%esi, 72(%rsp)	#, %sfp
	leal	16384(%rdi,%rdx), %edx	#, tmp1448
	sarl	$15, %edx	#, tmp1448
	leal	(%rdx,%r13), %edi	#, D.6288
	addl	%edi, %ebp	# D.6288, tmp1451
	movswl	%di, %edi	# D.6288,
	subl	%ecx, %r9d	# tmp1428, tmp1467
	addl	%r8d, %ebp	# D.6300, tmp1452
	movl	%edi, 96(%rsp)	#, %sfp
	movswl	%r8w, %r8d	# D.6300,
	movw	%bp, 2(%r15)	# tmp1452, MEM[base: Fout_634, offset: 2B]
	movswl	%bx, %ebp	# D.6292, D.6267
	movl	56(%rsp), %ebx	# %sfp, tmp1453
	imull	32(%rsp), %esi	# %sfp, tmp1457
	imull	56(%rsp), %edi	# %sfp, tmp1460
	imull	%ebp, %ebx	# D.6267, tmp1453
	subl	%edx, %r13d	# tmp1448, tmp1468
	movl	48(%rsp), %ecx	# %sfp, tmp1469
	movl	64(%rsp), %edx	# %sfp, tmp1472
	movl	%r8d, 88(%rsp)	#, %sfp
	movswl	%r9w, %r9d	# tmp1467,
	movl	%r9d, 100(%rsp)	#, %sfp
	addl	$16384, %ebx	#, tmp1455
	sarl	$15, %ebx	#, tmp1455
	addw	60(%rsp), %bx	# %sfp, tmp1456
	addl	$16384, %esi	#, tmp1459
	sarl	$15, %esi	#, tmp1459
	addl	$16384, %edi	#, tmp1462
	sarl	$15, %edi	#, tmp1462
	addw	68(%rsp), %di	# %sfp, tmp1463
	imull	%r9d, %ecx	#, tmp1469
	addl	%ebx, %esi	# tmp1456,
	movzwl	16(%rsp), %ebx	# %sfp, tmp1476
	movw	%si, 80(%rsp)	#, %sfp
	movl	32(%rsp), %esi	# %sfp, tmp1464
	subw	24(%rsp), %bx	# %sfp, tmp1476
	addl	$16384, %ecx	#, tmp1471
	sarl	$15, %ecx	#, tmp1471
	imull	%r8d, %esi	#, tmp1464
	movswl	%r13w, %r8d	# tmp1468, D.6242
	imull	%r8d, %edx	# D.6242, tmp1472
	movswl	%bx, %ebx	# tmp1476, D.6229
	addl	$16384, %esi	#, tmp1466
	sarl	$15, %esi	#, tmp1466
	addl	$16384, %edx	#, tmp1474
	addl	%esi, %edi	# tmp1466, D.6249
	movzwl	8(%rsp), %esi	# %sfp, tmp1475
	sarl	$15, %edx	#, tmp1474
	addl	%ecx, %edx	# tmp1471, D.6236
	movl	64(%rsp), %ecx	# %sfp, tmp1480
	subl	%r14d, %esi	# tmp1418, tmp1475
	movswl	%si, %r9d	# tmp1475, D.6235
	movl	48(%rsp), %esi	# %sfp, tmp1477
	imull	%ebx, %ecx	# D.6229, tmp1480
	imull	%r9d, %esi	# D.6235, tmp1477
	addl	$16384, %esi	#, tmp1479
	sarl	$15, %esi	#, tmp1479
	addl	$16384, %ecx	#, tmp1482
	sarl	$15, %ecx	#, tmp1482
	addl	%esi, %ecx	# tmp1479, D.6230
	movzwl	80(%rsp), %esi	# %sfp, tmp1483
	subl	%edx, %esi	# D.6236, tmp1483
	addw	80(%rsp), %dx	# %sfp, tmp1485
	movw	%si, (%r11)	# tmp1483, MEM[base: Fout1_631, offset: 0B]
	leal	(%rcx,%rdi), %esi	#, tmp1484
	subl	%ecx, %edi	# D.6230, tmp1486
	movl	72(%rsp), %ecx	# %sfp, tmp1491
	movw	%si, 2(%r11)	# tmp1484, MEM[base: Fout1_631, offset: 2B]
	movl	88(%rsp), %esi	# %sfp, tmp1498
	movw	%dx, (%rax)	# tmp1485, MEM[base: Fout4_604, offset: 0B]
	movl	32(%rsp), %edx	# %sfp, tmp1487
	imull	56(%rsp), %ecx	# %sfp, tmp1491
	imull	56(%rsp), %esi	# %sfp, tmp1498
	imull	%ebp, %edx	# D.6267, tmp1487
	movw	%di, 2(%rax)	# tmp1486, MEM[base: Fout4_604, offset: 2B]
	movl	100(%rsp), %edi	# %sfp, tmp1504
	imull	64(%rsp), %edi	# %sfp, tmp1504
	addl	$16384, %edx	#, tmp1489
	sarl	$15, %edx	#, tmp1489
	addw	60(%rsp), %dx	# %sfp, tmp1490
	addl	$16384, %ecx	#, tmp1493
	sarl	$15, %ecx	#, tmp1493
	addl	$16384, %esi	#, tmp1500
	sarl	$15, %esi	#, tmp1500
	addl	$16384, %edi	#, tmp1506
	addl	%ecx, %edx	# tmp1493, D.6206
	movl	96(%rsp), %ecx	# %sfp, tmp1494
	sarl	$15, %edi	#, tmp1506
	imull	32(%rsp), %ecx	# %sfp, tmp1494
	addl	$16384, %ecx	#, tmp1496
	sarl	$15, %ecx	#, tmp1496
	addw	68(%rsp), %cx	# %sfp, tmp1497
	addl	%ecx, %esi	# tmp1497, D.6196
	movl	48(%rsp), %ecx	# %sfp, tmp1501
	imull	%r8d, %ecx	# D.6242, tmp1501
	movl	48(%rsp), %r8d	# %sfp, tmp1510
	addl	$16384, %ecx	#, tmp1503
	sarl	$15, %ecx	#, tmp1503
	subl	%edi, %ecx	# tmp1506, D.6187
	movl	64(%rsp), %edi	# %sfp, tmp1507
	imull	%ebx, %r8d	# D.6229, tmp1510
	imull	%r9d, %edi	# D.6235, tmp1507
	addl	$16384, %edi	#, tmp1509
	sarl	$15, %edi	#, tmp1509
	addl	$16384, %r8d	#, tmp1512
	addq	$4, %r15	#, Fout
	sarl	$15, %r8d	#, tmp1512
	addq	$4, %r11	#, Fout1
	addq	$4, %rax	#, Fout4
	subl	%r8d, %edi	# tmp1512, D.6178
	leal	(%rcx,%rdx), %r8d	#, tmp1513
	subl	%ecx, %edx	# D.6187, tmp1515
	movw	%r8w, (%r12)	# tmp1513, MEM[base: Fout2_630, offset: 0B]
	leal	(%rdi,%rsi), %r8d	#, tmp1514
	subl	%edi, %esi	# D.6178, tmp1516
	movw	%r8w, 2(%r12)	# tmp1514, MEM[base: Fout2_630, offset: 2B]
	movw	%dx, (%r10)	# tmp1515, MEM[base: Fout3_621, offset: 0B]
	addq	$4, %r12	#, Fout2
	movw	%si, 2(%r10)	# tmp1516, MEM[base: Fout3_621, offset: 2B]
	movq	104(%rsp), %rdx	# %sfp,
	addq	$4, %r10	#, Fout3
	addq	%rdx, (%rsp)	#, %sfp
	cmpq	120(%rsp), %rax	# %sfp, Fout4
# SUCC: 24 [91.0%]  (dfs_back,can_fallthru) 25 [9.0%]  (fallthru,can_fallthru,loop_exit)
	jne	.L18	#,
# BLOCK 25 freq:35 seq:23
# PRED: 37 [14.0%]  (can_fallthru,loop_exit) 22 [9.0%]  (can_fallthru) 31 [100.0%]  24 [9.0%]  (fallthru,can_fallthru,loop_exit) 34 [100.0%] 
.L1:
	addq	$136, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx	#
	.cfi_def_cfa_offset 48
	popq	%rbp	#
	.cfi_def_cfa_offset 40
	popq	%r12	#
	.cfi_def_cfa_offset 32
	popq	%r13	#
	.cfi_def_cfa_offset 24
	popq	%r14	#
	.cfi_def_cfa_offset 16
	popq	%r15	#
	.cfi_def_cfa_offset 8
# SUCC: EXIT [100.0%] 
	ret
# BLOCK 26 freq:12 seq:24
# PRED: 2 [28.0%]  (can_fallthru)
.L42:
	.cfi_restore_state
	movq	104(%rsp), %rsi	# %sfp, pretmp.153
	movslq	%ecx, %r13	# in_stride, pretmp.153
	movq	%rdi, %rdx	# Fout, Fout
	salq	$2, %rsi	#, pretmp.153
# SUCC: 27 [100.0%]  (fallthru,can_fallthru)
	imulq	%r13, %rsi	# pretmp.153, pretmp.153
# BLOCK 27 freq:88 seq:25
# PRED: 26 [100.0%]  (fallthru,can_fallthru) 27 [86.0%]  (dfs_back,can_fallthru)
.L3:
	movl	(%r12), %eax	# MEM[base: f_3, offset: 0B], MEM[base: f_3, offset: 0B]
	addq	%rsi, %r12	# pretmp.153, f
	movl	%eax, (%rdx)	# MEM[base: f_3, offset: 0B], MEM[base: Fout_1, offset: 0B]
	addq	$4, %rdx	#, Fout
	cmpq	%rbx, %rdx	# Fout_end, Fout
# SUCC: 27 [86.0%]  (dfs_back,can_fallthru) 28 [14.0%]  (fallthru,can_fallthru,loop_exit)
	jne	.L3	#,
# BLOCK 28 freq:12 seq:26
# PRED: 27 [14.0%]  (fallthru,can_fallthru,loop_exit)
	cmpl	$3, 8(%rsp)	#, %sfp
# SUCC: 29 [29.0%]  (fallthru,can_fallthru) 6 [71.0%]  (can_fallthru)
	jne	.L44	#,
# BLOCK 29 freq:9 seq:27
# PRED: 5 [29.0%]  (can_fallthru) 28 [29.0%]  (fallthru,can_fallthru)
.L8:
	movslq	40(%rsp), %rdx	# %sfp,
	leaq	264(%r14), %r9	#, tw2
	movq	%r9, %rbp	# tw2, tw2
	movq	%rdx, (%rsp)	#, %sfp
	movq	(%rsp), %rax	# %sfp, tmp1176
	imulq	104(%rsp), %rax	# %sfp, tmp1176
	movq	104(%rsp), %rdx	# %sfp,
	movq	(%rsp), %rcx	# %sfp,
	salq	$2, %rdx	#,
	movq	%rdx, 24(%rsp)	#, %sfp
	movq	104(%rsp), %rdx	# %sfp,
	movswl	266(%r14,%rax,4), %eax	# MEM[(struct kiss_fft_state *)D.5872_128].i,
	salq	$3, %rdx	#,
	movq	%rdx, 32(%rsp)	#, %sfp
	leaq	(%r15,%rcx,8), %rdx	#, ivtmp.306
	movl	%eax, 16(%rsp)	#, %sfp
# SUCC: 30 [100.0%]  (fallthru,can_fallthru)
	leaq	(%r15,%rcx,4), %rax	#, ivtmp.303
# BLOCK 30 freq:63 seq:28
# PRED: 29 [100.0%]  (fallthru,can_fallthru) 30 [86.0%]  (dfs_back,can_fallthru)
.L14:
	movswl	(%r15), %ecx	# MEM[base: Fout_131, offset: 0B], MEM[base: Fout_131, offset: 0B]
	imull	$10922, %ecx, %ecx	#, MEM[base: Fout_131, offset: 0B], tmp1182
	addl	$16384, %ecx	#, tmp1184
	sarl	$15, %ecx	#, tmp1184
	movw	%cx, (%r15)	# tmp1184, MEM[base: Fout_131, offset: 0B]
	movswl	2(%r15), %ecx	# MEM[base: Fout_131, offset: 2B], MEM[base: Fout_131, offset: 2B]
	imull	$10922, %ecx, %ecx	#, MEM[base: Fout_131, offset: 2B], tmp1186
	addl	$16384, %ecx	#, tmp1188
	sarl	$15, %ecx	#, tmp1188
	movw	%cx, 2(%r15)	# tmp1188, MEM[base: Fout_131, offset: 2B]
	movswl	(%rax), %ecx	# MEM[base: D.6826_824, offset: 0B], MEM[base: D.6826_824, offset: 0B]
	imull	$10922, %ecx, %ecx	#, MEM[base: D.6826_824, offset: 0B], tmp1190
	addl	$16384, %ecx	#, tmp1192
	sarl	$15, %ecx	#, tmp1192
	movw	%cx, (%rax)	# tmp1192, MEM[base: D.6826_824, offset: 0B]
	movswl	2(%rax), %ecx	# MEM[base: D.6826_824, offset: 2B], MEM[base: D.6826_824, offset: 2B]
	imull	$10922, %ecx, %ecx	#, MEM[base: D.6826_824, offset: 2B], tmp1194
	addl	$16384, %ecx	#, tmp1196
	sarl	$15, %ecx	#, tmp1196
	movw	%cx, 2(%rax)	# tmp1196, MEM[base: D.6826_824, offset: 2B]
	movswl	(%rdx), %esi	# MEM[base: D.6830_1223, offset: 0B], MEM[base: D.6830_1223, offset: 0B]
	movswl	2(%rdx), %ecx	# MEM[base: D.6830_1223, offset: 2B], MEM[base: D.6830_1223, offset: 2B]
	imull	$10922, %esi, %esi	#, MEM[base: D.6830_1223, offset: 0B], tmp1198
	imull	$10922, %ecx, %ecx	#, MEM[base: D.6830_1223, offset: 2B], tmp1200
	addl	$16384, %esi	#, D.5968
	addl	$16384, %ecx	#, D.5962
	sarl	$15, %esi	#, D.5968
	sarl	$15, %ecx	#, D.5962
	movw	%si, (%rdx)	# D.5968, MEM[base: D.6830_1223, offset: 0B]
	movw	%cx, 2(%rdx)	# D.5962, MEM[base: D.6830_1223, offset: 2B]
	movswl	0(%rbp), %edi	# MEM[base: tw2_194, offset: 0B],
	movl	%ecx, %r14d	# D.5962, tmp1207
	movswl	(%rax), %r13d	# MEM[base: D.6826_824, offset: 0B], D.5982
	movswl	2(%rax), %r11d	# MEM[base: D.6826_824, offset: 2B], D.5976
	movswl	(%r9), %ebx	# MEM[base: tw2_174, offset: 0B], D.5956
	movswl	2(%r9), %r12d	# MEM[base: tw2_174, offset: 2B], D.5953
	movswl	2(%rbp), %r10d	# MEM[base: tw2_194, offset: 2B], D.5937
	movl	%edi, 8(%rsp)	#, %sfp
	movl	%r13d, %r8d	# D.5982, tmp1203
	movl	%r11d, %edi	# D.5976, tmp1202
	imull	%r12d, %edi	# D.5953, tmp1202
	imull	%ebx, %r8d	# D.5956, tmp1203
	imull	8(%rsp), %ecx	# %sfp, tmp1217
	subl	%edi, %r8d	# tmp1202, tmp1203
	movl	8(%rsp), %edi	# %sfp, tmp1208
	addl	$16384, %r8d	#, tmp1205
	imull	%r10d, %r14d	# D.5937, tmp1207
	sarl	$15, %r8d	#, tmp1205
	imull	%esi, %edi	# D.5968, tmp1208
	imull	%r10d, %esi	# D.5937, tmp1216
	subl	%r14d, %edi	# tmp1207, tmp1208
	imull	%ebx, %r11d	# D.5956, tmp1212
	addl	$16384, %edi	#, tmp1210
	sarl	$15, %edi	#, tmp1210
	leal	(%rdi,%r8), %r14d	#, D.5923
	leal	16384(%rsi,%rcx), %ecx	#, tmp1220
	movzwl	(%r15), %esi	# MEM[base: Fout_131, offset: 0B], tmp1222
	imull	%r13d, %r12d	# D.5982, tmp1211
	movl	%r14d, %ebx	# D.5923, tmp1221
	leal	16384(%r12,%r11), %r11d	#, tmp1215
	sarl	$15, %r11d	#, tmp1215
	sarl	$15, %ecx	#, tmp1220
	sarw	%bx	# tmp1221
	subl	%ebx, %esi	# tmp1221, tmp1222
	leal	(%rcx,%r11), %r10d	#, D.5919
	subl	%ecx, %r11d	# tmp1220, tmp1227
	movw	%si, (%rax)	# tmp1222, MEM[base: D.6826_824, offset: 0B]
	movzwl	2(%r15), %esi	# MEM[base: Fout_131, offset: 2B], tmp1225
	subl	%edi, %r8d	# tmp1210, tmp1234
	movl	%r10d, %ebx	# D.5919, tmp1224
	addq	24(%rsp), %r9	# %sfp, tw2
	addq	32(%rsp), %rbp	# %sfp, tw2
	sarw	%bx	# tmp1224
	subl	%ebx, %esi	# tmp1224, tmp1225
	movw	%si, 2(%rax)	# tmp1225, MEM[base: D.6826_824, offset: 2B]
	movswl	%r11w, %esi	# tmp1227, tmp1229
	addw	%r14w, (%r15)	# D.5923, MEM[base: Fout_131, offset: 0B]
	imull	16(%rsp), %esi	# %sfp, tmp1229
	addw	%r10w, 2(%r15)	# D.5919, MEM[base: Fout_131, offset: 2B]
	addq	$4, %r15	#, Fout
	movzwl	(%rax), %ecx	# MEM[base: D.6826_824, offset: 0B], tmp1232
	addl	$16384, %esi	#, tmp1231
	sarl	$15, %esi	#, tmp1231
	addl	%esi, %ecx	# tmp1231, tmp1232
	movw	%cx, (%rdx)	# tmp1232, MEM[base: D.6830_1223, offset: 0B]
	movswl	%r8w, %ecx	# tmp1234, tmp1236
	movzwl	2(%rax), %edi	# MEM[base: D.6826_824, offset: 2B], tmp1239
	imull	16(%rsp), %ecx	# %sfp, tmp1236
	addl	$16384, %ecx	#, tmp1238
	sarl	$15, %ecx	#, tmp1238
	subl	%ecx, %edi	# tmp1238, tmp1239
	movw	%di, 2(%rdx)	# tmp1239, MEM[base: D.6830_1223, offset: 2B]
	addq	$4, %rdx	#, ivtmp.306
	subw	%si, (%rax)	# tmp1231, MEM[base: D.6826_824, offset: 0B]
	addw	%cx, 2(%rax)	# tmp1238, MEM[base: D.6826_824, offset: 2B]
	addq	$4, %rax	#, ivtmp.303
	subq	$1, (%rsp)	#, %sfp
# SUCC: 30 [86.0%]  (dfs_back,can_fallthru) 31 [14.0%]  (fallthru)
	jne	.L14	#,
# BLOCK 31 freq:9 seq:29
# PRED: 30 [14.0%]  (fallthru)
# SUCC: 25 [100.0%] 
	jmp	.L1	#
# BLOCK 32 freq:9 seq:30
# PRED: 7 [29.0%]  (can_fallthru)
.L43:
	movslq	40(%rsp), %rax	# %sfp, m
	movq	104(%rsp), %r9	# %sfp, pretmp.148
	leaq	264(%r14), %rdi	#, tw1
	movl	40(%rsp), %r10d	# %sfp, m
	salq	$2, %r9	#, pretmp.148
# SUCC: 33 [100.0%]  (fallthru,can_fallthru)
	leaq	(%r15,%rax,4), %rax	#, Fout2
# BLOCK 33 freq:98 seq:31
# PRED: 32 [100.0%]  (fallthru,can_fallthru) 33 [91.0%]  (dfs_back,can_fallthru)
	.p2align 4,,10
	.p2align 3
.L12:
	movswl	(%r15), %ecx	# MEM[base: Fout_57, offset: 0B], MEM[base: Fout_57, offset: 0B]
	movl	%ecx, %edx	# MEM[base: Fout_57, offset: 0B], tmp1145
	sall	$14, %edx	#, tmp1145
	subl	%ecx, %edx	# MEM[base: Fout_57, offset: 0B], tmp1145
	movswl	2(%r15), %ecx	# MEM[base: Fout_57, offset: 2B], MEM[base: Fout_57, offset: 2B]
	addl	$16384, %edx	#, tmp1147
	sarl	$15, %edx	#, tmp1147
	movw	%dx, (%r15)	# tmp1147, MEM[base: Fout_57, offset: 0B]
	movl	%ecx, %edx	# MEM[base: Fout_57, offset: 2B], tmp1151
	sall	$14, %edx	#, tmp1151
	subl	%ecx, %edx	# MEM[base: Fout_57, offset: 2B], tmp1151
	addl	$16384, %edx	#, tmp1153
	sarl	$15, %edx	#, tmp1153
	movw	%dx, 2(%r15)	# tmp1153, MEM[base: Fout_57, offset: 2B]
	movswl	(%rax), %edx	# MEM[base: Fout2_70, offset: 0B], MEM[base: Fout2_70, offset: 0B]
	movswl	2(%rax), %esi	# MEM[base: Fout2_70, offset: 2B], MEM[base: Fout2_70, offset: 2B]
	movl	%edx, %ecx	# MEM[base: Fout2_70, offset: 0B], tmp1157
	sall	$14, %ecx	#, tmp1157
	subl	%edx, %ecx	# MEM[base: Fout2_70, offset: 0B], tmp1157
	movl	%esi, %edx	# MEM[base: Fout2_70, offset: 2B], tmp1161
	sall	$14, %edx	#, tmp1161
	addl	$16384, %ecx	#, D.5848
	subl	%esi, %edx	# MEM[base: Fout2_70, offset: 2B], tmp1161
	sarl	$15, %ecx	#, D.5848
	addl	$16384, %edx	#, D.5842
	movw	%cx, (%rax)	# D.5848, MEM[base: Fout2_70, offset: 0B]
	movl	%ecx, %esi	# D.5848, tmp1164
	sarl	$15, %edx	#, D.5842
	movw	%dx, 2(%rax)	# D.5842, MEM[base: Fout2_70, offset: 2B]
	movswl	(%rdi), %r11d	# MEM[base: tw1_84, offset: 0B], D.5836
	movl	%edx, %r8d	# D.5842, tmp1163
	movswl	2(%rdi), %ebx	# MEM[base: tw1_84, offset: 2B], D.5833
	addq	%r9, %rdi	# pretmp.148, tw1
	imull	%r11d, %esi	# D.5836, tmp1164
	imull	%ebx, %r8d	# D.5833, tmp1163
	subl	%r8d, %esi	# tmp1163, tmp1164
	movzwl	(%r15), %r8d	# MEM[base: Fout_57, offset: 0B], tmp1167
	imull	%ebx, %ecx	# D.5833, tmp1169
	addl	$16384, %esi	#, tmp1166
	imull	%r11d, %edx	# D.5836, tmp1170
	sarl	$15, %esi	#, tmp1166
	subl	%esi, %r8d	# tmp1166, tmp1167
	movw	%r8w, (%rax)	# tmp1167, MEM[base: Fout2_70, offset: 0B]
	leal	16384(%rcx,%rdx), %edx	#, tmp1173
	movzwl	2(%r15), %ecx	# MEM[base: Fout_57, offset: 2B], tmp1174
	sarl	$15, %edx	#, tmp1173
	subl	%edx, %ecx	# tmp1173, tmp1174
	movw	%cx, 2(%rax)	# tmp1174, MEM[base: Fout2_70, offset: 2B]
	addq	$4, %rax	#, Fout2
	addw	%si, (%r15)	# tmp1166, MEM[base: Fout_57, offset: 0B]
	addw	%dx, 2(%r15)	# tmp1173, MEM[base: Fout_57, offset: 2B]
	addq	$4, %r15	#, Fout
	subl	$1, %r10d	#, m
# SUCC: 33 [91.0%]  (dfs_back,can_fallthru) 34 [9.0%]  (fallthru)
	jne	.L12	#,
# BLOCK 34 freq:9 seq:32
# PRED: 33 [9.0%]  (fallthru)
# SUCC: 25 [100.0%] 
	jmp	.L1	#
# BLOCK 35 freq:9 seq:33
# PRED: 20 [29.0%]  (can_fallthru)
.L9:
	movq	104(%rsp), %rdx	# %sfp,
	movslq	40(%rsp), %rbp	# %sfp,
	leaq	264(%r14), %r8	#, tw3
	movl	4(%r14), %r14d	# st_26(D)->inverse,
	movq	%r8, %r9	# tw3, tw3
	movq	%r8, (%rsp)	# tw3, %sfp
	salq	$2, %rdx	#,
	movq	%rdx, 72(%rsp)	#, %sfp
	movq	104(%rsp), %rdx	# %sfp,
	leaq	(%r15,%rbp,4), %r10	#, ivtmp.332
	movq	%rbp, 8(%rsp)	#, %sfp
	leaq	(%r15,%rbp,8), %rdi	#, ivtmp.335
	salq	$3, %rdx	#,
	movq	%rdx, 80(%rsp)	#, %sfp
	movq	104(%rsp), %rdx	# %sfp,
	movl	%r14d, 104(%rsp)	#, %sfp
	leaq	(%rdx,%rdx,2), %rax	#, tmp1243
	salq	$2, %rax	#,
	movq	%rax, 88(%rsp)	#, %sfp
	leaq	0(%rbp,%rbp,2), %rax	#, tmp1249
	leaq	(%r15,%rax,4), %rbx	#, ivtmp.338
# SUCC: 38 [100.0%] 
	jmp	.L17	#
# BLOCK 36 freq:31 seq:34
# PRED: 38 [50.0%]  (can_fallthru)
.L45:
	subl	%r13d, %eax	# D.6029, tmp1327
	addw	64(%rsp), %r13w	# %sfp, tmp1329
	movw	%ax, (%r10)	# tmp1327, MEM[base: D.6883_1249, offset: 0B]
	movzwl	60(%rsp), %eax	# %sfp, tmp1328
	addl	%esi, %eax	# D.6030, tmp1328
	movw	%ax, 2(%r10)	# tmp1328, MEM[base: D.6883_1249, offset: 2B]
	movzwl	60(%rsp), %eax	# %sfp, tmp1330
	movw	%r13w, (%rbx)	# tmp1329, MEM[base: D.6891_1257, offset: 0B]
	subl	%esi, %eax	# D.6030, tmp1330
# SUCC: 37 [100.0%]  (fallthru,can_fallthru)
	movw	%ax, 2(%rbx)	# tmp1330, MEM[base: D.6891_1257, offset: 2B]
# BLOCK 37 freq:63 seq:35
# PRED: 36 [100.0%]  (fallthru,can_fallthru) 39 [100.0%] 
.L16:
	addq	$4, %r15	#, Fout
	addq	$4, %r10	#, ivtmp.332
	addq	$4, %rdi	#, ivtmp.335
	addq	$4, %rbx	#, ivtmp.338
	subq	$1, 8(%rsp)	#, %sfp
# SUCC: 38 [86.0%]  (fallthru,dfs_back,can_fallthru) 25 [14.0%]  (can_fallthru,loop_exit)
	je	.L1	#,
# BLOCK 38 freq:63 seq:36
# PRED: 37 [86.0%]  (fallthru,dfs_back,can_fallthru) 35 [100.0%] 
.L17:
	movswl	(%r15), %edx	# MEM[base: Fout_283, offset: 0B], MEM[base: Fout_283, offset: 0B]
	movq	(%rsp), %r12	# %sfp,
	movl	%edx, %eax	# MEM[base: Fout_283, offset: 0B], tmp1254
	sall	$13, %eax	#, tmp1254
	subl	%edx, %eax	# MEM[base: Fout_283, offset: 0B], tmp1254
	movswl	2(%r15), %edx	# MEM[base: Fout_283, offset: 2B], MEM[base: Fout_283, offset: 2B]
	addl	$16384, %eax	#, tmp1256
	sarl	$15, %eax	#, tmp1256
	movw	%ax, (%r15)	# tmp1256, MEM[base: Fout_283, offset: 0B]
	movl	%edx, %eax	# MEM[base: Fout_283, offset: 2B], tmp1260
	sall	$13, %eax	#, tmp1260
	subl	%edx, %eax	# MEM[base: Fout_283, offset: 2B], tmp1260
	addl	$16384, %eax	#, tmp1262
	sarl	$15, %eax	#, tmp1262
	movw	%ax, 2(%r15)	# tmp1262, MEM[base: Fout_283, offset: 2B]
	movswl	(%r10), %edx	# MEM[base: D.6883_1249, offset: 0B], MEM[base: D.6883_1249, offset: 0B]
	movl	%edx, %eax	# MEM[base: D.6883_1249, offset: 0B], tmp1266
	sall	$13, %eax	#, tmp1266
	subl	%edx, %eax	# MEM[base: D.6883_1249, offset: 0B], tmp1266
	movswl	2(%r10), %edx	# MEM[base: D.6883_1249, offset: 2B], MEM[base: D.6883_1249, offset: 2B]
	addl	$16384, %eax	#, tmp1268
	sarl	$15, %eax	#, tmp1268
	movw	%ax, (%r10)	# tmp1268, MEM[base: D.6883_1249, offset: 0B]
	movl	%edx, %eax	# MEM[base: D.6883_1249, offset: 2B], tmp1272
	sall	$13, %eax	#, tmp1272
	subl	%edx, %eax	# MEM[base: D.6883_1249, offset: 2B], tmp1272
	addl	$16384, %eax	#, tmp1274
	sarl	$15, %eax	#, tmp1274
	movw	%ax, 2(%r10)	# tmp1274, MEM[base: D.6883_1249, offset: 2B]
	movswl	(%rdi), %edx	# MEM[base: D.6887_1253, offset: 0B], MEM[base: D.6887_1253, offset: 0B]
	movl	%edx, %eax	# MEM[base: D.6887_1253, offset: 0B], tmp1278
	sall	$13, %eax	#, tmp1278
	subl	%edx, %eax	# MEM[base: D.6887_1253, offset: 0B], tmp1278
	movswl	2(%rdi), %edx	# MEM[base: D.6887_1253, offset: 2B], MEM[base: D.6887_1253, offset: 2B]
	addl	$16384, %eax	#, tmp1280
	sarl	$15, %eax	#, tmp1280
	movw	%ax, (%rdi)	# tmp1280, MEM[base: D.6887_1253, offset: 0B]
	movl	%edx, %eax	# MEM[base: D.6887_1253, offset: 2B], tmp1284
	sall	$13, %eax	#, tmp1284
	subl	%edx, %eax	# MEM[base: D.6887_1253, offset: 2B], tmp1284
	addl	$16384, %eax	#, tmp1286
	sarl	$15, %eax	#, tmp1286
	movw	%ax, 2(%rdi)	# tmp1286, MEM[base: D.6887_1253, offset: 2B]
	movswl	(%rbx), %eax	# MEM[base: D.6891_1257, offset: 0B], MEM[base: D.6891_1257, offset: 0B]
	movswl	2(%rbx), %ecx	# MEM[base: D.6891_1257, offset: 2B], MEM[base: D.6891_1257, offset: 2B]
	movl	%eax, %edx	# MEM[base: D.6891_1257, offset: 0B], tmp1290
	sall	$13, %edx	#, tmp1290
	subl	%eax, %edx	# MEM[base: D.6891_1257, offset: 0B], tmp1290
	movl	%ecx, %eax	# MEM[base: D.6891_1257, offset: 2B], tmp1294
	sall	$13, %eax	#, tmp1294
	addl	$16384, %edx	#, D.6105
	subl	%ecx, %eax	# MEM[base: D.6891_1257, offset: 2B], tmp1294
	sarl	$15, %edx	#, D.6105
	addl	$16384, %eax	#, D.6099
	movw	%dx, (%rbx)	# D.6105, MEM[base: D.6891_1257, offset: 0B]
	sarl	$15, %eax	#, D.6099
	movw	%ax, 2(%rbx)	# D.6099, MEM[base: D.6891_1257, offset: 2B]
	movswl	(%r8), %ecx	# MEM[base: tw3_340, offset: 0B],
	movswl	2(%r8), %ebp	# MEM[base: tw3_340, offset: 2B],
	movswl	2(%r10), %esi	# MEM[base: D.6883_1249, offset: 2B],
	movswl	(%r12), %r11d	# MEM[base: tw3_361, offset: 0B], D.6077
	movswl	(%rdi), %r13d	# MEM[base: D.6887_1253, offset: 0B], D.6119
	movswl	(%r10), %r14d	# MEM[base: D.6883_1249, offset: 0B], D.6133
	movl	%ecx, 16(%rsp)	#, %sfp
	movswl	(%r9), %ecx	# MEM[base: tw3_381, offset: 0B],
	movl	%esi, 24(%rsp)	#, %sfp
	movl	%ebp, 32(%rsp)	#, %sfp
	movswl	2(%rdi), %esi	# MEM[base: D.6887_1253, offset: 2B], D.6113
	movswl	2(%r12), %ebp	# MEM[base: tw3_361, offset: 2B], D.6074
	movswl	2(%r9), %r12d	# MEM[base: tw3_381, offset: 2B],
	movl	%ecx, 56(%rsp)	#, %sfp
	movl	%r13d, %ecx	# D.6119, tmp1297
	imull	%r11d, %ecx	# D.6077, tmp1297
	movl	%r12d, 40(%rsp)	#, %sfp
	movl	%esi, %r12d	# D.6113, tmp1296
	imull	%ebp, %r12d	# D.6074, tmp1296
	imull	%r11d, %esi	# D.6077, tmp1301
	subl	%r12d, %ecx	# tmp1296, tmp1297
	movzwl	(%r15), %r12d	# MEM[base: Fout_283, offset: 0B],
	imull	%r13d, %ebp	# D.6119, tmp1300
	addl	$16384, %ecx	#, tmp1299
	sarl	$15, %ecx	#, tmp1299
	subl	%ecx, %r12d	# tmp1299,
	leal	16384(%rbp,%rsi), %ebp	#, tmp1304
	movw	%r12w, 64(%rsp)	#, %sfp
	movzwl	2(%r15), %esi	# MEM[base: Fout_283, offset: 2B],
	movzwl	(%r15), %r12d	# MEM[base: Fout_283, offset: 0B], D.6040
	sarl	$15, %ebp	#, tmp1304
	movl	40(%rsp), %r11d	# %sfp, tmp1311
	movl	16(%rsp), %r13d	# %sfp, tmp1316
	addq	72(%rsp), %r8	# %sfp, tw3
	imull	24(%rsp), %r13d	# %sfp, tmp1316
	subl	%ebp, %esi	# tmp1304,
	addw	2(%r15), %bp	# MEM[base: Fout_283, offset: 2B], D.6038
	addl	%ecx, %r12d	# tmp1299, D.6040
	movw	%si, 60(%rsp)	#, %sfp
	movl	24(%rsp), %ecx	# %sfp, tmp1306
	movl	16(%rsp), %esi	# %sfp, tmp1307
	movw	%r12w, (%r15)	# D.6040, MEM[base: Fout_283, offset: 0B]
	imull	32(%rsp), %ecx	# %sfp, tmp1306
	imull	%eax, %r11d	# D.6099, tmp1311
	movw	%bp, 2(%r15)	# D.6038, MEM[base: Fout_283, offset: 2B]
	imull	%r14d, %esi	# D.6133, tmp1307
	imull	56(%rsp), %eax	# %sfp, tmp1321
	imull	32(%rsp), %r14d	# %sfp, tmp1315
	subl	%ecx, %esi	# tmp1306, tmp1307
	movl	56(%rsp), %ecx	# %sfp, tmp1312
	addl	$16384, %esi	#, tmp1309
	sarl	$15, %esi	#, tmp1309
	imull	%edx, %ecx	# D.6105, tmp1312
	imull	40(%rsp), %edx	# %sfp, tmp1320
	leal	16384(%r14,%r13), %r13d	#, tmp1319
	subl	%r11d, %ecx	# tmp1311, tmp1312
	addl	$16384, %ecx	#, tmp1314
	sarl	$15, %r13d	#, tmp1319
	sarl	$15, %ecx	#, tmp1314
	leal	(%rcx,%rsi), %r11d	#, D.6034
	subl	%ecx, %esi	# tmp1314, D.6030
	leal	16384(%rdx,%rax), %eax	#, tmp1324
	subl	%r11d, %r12d	# D.6034, tmp1325
	sarl	$15, %eax	#, tmp1324
	movw	%r12w, (%rdi)	# tmp1325, MEM[base: D.6887_1253, offset: 0B]
	leal	(%rax,%r13), %edx	#, D.6031
	subl	%eax, %r13d	# tmp1324, D.6029
	movzwl	64(%rsp), %eax	# %sfp, tmp1327
	subl	%edx, %ebp	# D.6031, tmp1326
	movw	%bp, 2(%rdi)	# tmp1326, MEM[base: D.6887_1253, offset: 2B]
	movq	80(%rsp), %rbp	# %sfp,
	addq	%rbp, (%rsp)	#, %sfp
	addq	88(%rsp), %r9	# %sfp, tw3
	addw	%r11w, (%r15)	# D.6034, MEM[base: Fout_283, offset: 0B]
	movl	104(%rsp), %r11d	# %sfp,
	addw	%dx, 2(%r15)	# D.6031, MEM[base: Fout_283, offset: 2B]
	testl	%r11d, %r11d	#
# SUCC: 36 [50.0%]  (can_fallthru) 39 [50.0%]  (fallthru,can_fallthru)
	jne	.L45	#,
# BLOCK 39 freq:31 seq:37
# PRED: 38 [50.0%]  (fallthru,can_fallthru)
	addl	%r13d, %eax	# D.6029, tmp1331
	movw	%ax, (%r10)	# tmp1331, MEM[base: D.6883_1249, offset: 0B]
	movzwl	60(%rsp), %eax	# %sfp, tmp1332
	subl	%esi, %eax	# D.6030, tmp1332
	addw	60(%rsp), %si	# %sfp, tmp1334
	movw	%ax, 2(%r10)	# tmp1332, MEM[base: D.6883_1249, offset: 2B]
	movzwl	64(%rsp), %eax	# %sfp, tmp1333
	movw	%si, 2(%rbx)	# tmp1334, MEM[base: D.6891_1257, offset: 2B]
	subl	%r13d, %eax	# D.6029, tmp1333
	movw	%ax, (%rbx)	# tmp1333, MEM[base: D.6891_1257, offset: 0B]
# SUCC: 37 [100.0%] 
	jmp	.L16	#
	.cfi_endproc
.LFE81:
	.size	kf_work, .-kf_work
	.p2align 4,,15
	.globl	kiss_fft_alloc
	.type	kiss_fft_alloc, @function
kiss_fft_alloc:
.LFB83:
	.cfi_startproc
# BLOCK 2 freq:501 seq:0
# PRED: ENTRY [100.0%]  (fallthru)
	pushq	%r15	#
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	leal	-1(%rdi), %eax	#, tmp122
	pushq	%r14	#
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	cltq
	pushq	%r13	#
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12	#
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp	#
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx	#
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	%edi, %ebx	# nfft, nfft
	leaq	268(,%rax,4), %rdi	#, memneeded
	subq	$72, %rsp	#,
	.cfi_def_cfa_offset 128
	testq	%rcx, %rcx	# lenmem
# SUCC: 33 [6.7%]  (can_fallthru) 3 [93.3%]  (fallthru,can_fallthru)
	je	.L81	#,
# BLOCK 3 freq:468 seq:1
# PRED: 2 [93.3%]  (fallthru,can_fallthru)
	xorl	%ebp, %ebp	# st
	testq	%rdx, %rdx	# mem
# SUCC: 4 [85.0%]  (fallthru,can_fallthru) 5 [15.0%]  (can_fallthru)
	je	.L49	#,
# BLOCK 4 freq:397 seq:2
# PRED: 3 [85.0%]  (fallthru,can_fallthru)
	cmpq	(%rcx), %rdi	# *lenmem_11(D), memneeded
# SUCC: 5 [100.0%]  (fallthru,can_fallthru)
	cmovbe	%rdx, %rbp	# mem,, st
# BLOCK 5 freq:468 seq:3
# PRED: 3 [15.0%]  (can_fallthru) 4 [100.0%]  (fallthru,can_fallthru)
.L49:
# SUCC: 6 [100.0%]  (fallthru,can_fallthru)
	movq	%rdi, (%rcx)	# memneeded, *lenmem_11(D)
# BLOCK 6 freq:501 seq:4
# PRED: 5 [100.0%]  (fallthru,can_fallthru) 33 [100.0%] 
.L48:
	testq	%rbp, %rbp	# st
# SUCC: 7 [89.9%]  (fallthru,can_fallthru) 18 [10.1%]  (can_fallthru)
	je	.L78	#,
# BLOCK 7 freq:451 seq:5
# PRED: 6 [89.9%]  (fallthru,can_fallthru)
	cvtsi2sd	%ebx, %xmm1	# nfft,
	testl	%ebx, %ebx	# nfft
	movl	%ebx, 0(%rbp)	# nfft, st_2->nfft
	movl	%esi, 4(%rbp)	# inverse_fft, st_2->inverse
	movsd	%xmm1, 40(%rsp)	#, %sfp
# SUCC: 8 [91.0%]  (fallthru,can_fallthru) 14 [9.0%]  (can_fallthru)
	jle	.L52	#,
# BLOCK 8 freq:410 seq:6
# PRED: 7 [91.0%]  (fallthru,can_fallthru)
	movsd	.LC2(%rip), %xmm0	#, reciptmp.402
	xorl	%r12d, %r12d	# i
	testl	%esi, %esi	# inverse_fft
	movq	%rbp, %r13	# st, ivtmp.408
	leaq	56(%rsp), %r15	#, tmp186
	divsd	%xmm1, %xmm0	#, reciptmp.402
	leaq	48(%rsp), %r14	#, tmp191
	movsd	.LC4(%rip), %xmm1	#,
	movsd	%xmm1, 16(%rsp)	#, %sfp
	mulsd	.LC3(%rip), %xmm0	#, reciptmp.402
	movsd	.LC5(%rip), %xmm1	#,
	movsd	%xmm1, 24(%rsp)	#, %sfp
	movsd	%xmm0, 32(%rsp)	# reciptmp.402, %sfp
# SUCC: 9 [50.0%]  (fallthru,can_fallthru) 19 [50.0%]  (can_fallthru)
	jne	.L60	#,
# BLOCK 9 freq:2278 seq:7
# PRED: 8 [50.0%]  (fallthru,can_fallthru) 13 [91.0%]  (dfs_back,can_fallthru)
	.p2align 4,,10
	.p2align 3
.L56:
	cvtsi2sd	%r12d, %xmm0	# i, tmp133
	movq	%r14, %rsi	# tmp191,
	movq	%r15, %rdi	# tmp186,
	mulsd	32(%rsp), %xmm0	# %sfp, tmp133
	call	sincos	#
	movsd	16(%rsp), %xmm1	# %sfp, tmp137
	movsd	56(%rsp), %xmm0	#, sincostmp.391
	mulsd	48(%rsp), %xmm1	#, tmp137
	addsd	24(%rsp), %xmm1	# %sfp, tmp137
	cvttsd2si	%xmm1, %eax	# tmp137, tmp139
	cvtsi2sd	%eax, %xmm2	# tmp139, tmp140
	ucomisd	%xmm1, %xmm2	# tmp137, tmp140
# SUCC: 11 [50.0%]  (can_fallthru) 10 [50.0%]  (fallthru,can_fallthru)
	jbe	.L54	#,
# BLOCK 10 freq:1139 seq:8
# PRED: 9 [50.0%]  (fallthru,can_fallthru)
# SUCC: 11 [100.0%]  (fallthru,can_fallthru)
	subl	$1, %eax	#, tmp139
# BLOCK 11 freq:2278 seq:9
# PRED: 9 [50.0%]  (can_fallthru) 10 [100.0%]  (fallthru,can_fallthru)
.L54:
	mulsd	16(%rsp), %xmm0	# %sfp, tmp145
	movw	%ax, 264(%r13)	# tmp139, MEM[base: D.6996_108, offset: 264B]
	addsd	24(%rsp), %xmm0	# %sfp, tmp145
	cvttsd2si	%xmm0, %eax	# tmp145, tmp147
	cvtsi2sd	%eax, %xmm1	# tmp147, tmp148
	ucomisd	%xmm0, %xmm1	# tmp145, tmp148
# SUCC: 13 [50.0%]  (can_fallthru) 12 [50.0%]  (fallthru,can_fallthru)
	jbe	.L55	#,
# BLOCK 12 freq:1139 seq:10
# PRED: 11 [50.0%]  (fallthru,can_fallthru)
# SUCC: 13 [100.0%]  (fallthru,can_fallthru)
	subl	$1, %eax	#, tmp147
# BLOCK 13 freq:2278 seq:11
# PRED: 11 [50.0%]  (can_fallthru) 12 [100.0%]  (fallthru,can_fallthru)
.L55:
	addl	$1, %r12d	#, i
	movw	%ax, 266(%r13)	# tmp147, MEM[base: D.6996_108, offset: 266B]
	addq	$4, %r13	#, ivtmp.408
	cmpl	%ebx, %r12d	# nfft, i
# SUCC: 9 [91.0%]  (dfs_back,can_fallthru) 14 [9.0%]  (fallthru,can_fallthru,loop_exit)
	jne	.L56	#,
# BLOCK 14 freq:451 seq:12
# PRED: 13 [9.0%]  (fallthru,can_fallthru,loop_exit) 7 [9.0%]  (can_fallthru) 24 [100.0%] 
.L52:
	movsd	.LC8(%rip), %xmm0	#, tmp177
	sqrtsd	40(%rsp), %xmm1	# %sfp, D.6967
	leaq	8(%rbp), %rsi	#, facbuf
	movsd	.LC7(%rip), %xmm2	#, tmp175
	andpd	%xmm1, %xmm0	# D.6967, tmp177
	ucomisd	%xmm0, %xmm2	# tmp177, tmp175
# SUCC: 15 [50.0%]  (fallthru,can_fallthru) 32 [50.0%]  (can_fallthru)
	ja	.L82	#,
# BLOCK 15 freq:452 seq:13
# PRED: 14 [50.0%]  (fallthru,can_fallthru) 32 [100.0%] 
.L61:
	movsd	.LC1(%rip), %xmm3	#, prephitmp.396
	movl	$4, %ecx	#, nfft
# SUCC: 16 [100.0%]  (fallthru,can_fallthru)
	movsd	.LC0(%rip), %xmm2	#, prephitmp.396
# BLOCK 16 freq:10000 seq:14
# PRED: 17 [91.0%]  (dfs_back,can_fallthru) 15 [100.0%]  (fallthru,can_fallthru) 28 [50.0%]  (dfs_back,can_fallthru) 29 [100.0%] 
	.p2align 4,,10
	.p2align 3
.L77:
	movl	%ebx, %edx	# tmp183, tmp182
	movl	%ebx, %eax	# nfft, tmp183
	sarl	$31, %edx	#, tmp182
	idivl	%ecx	# nfft
	testl	%edx, %edx	# tmp182
# SUCC: 25 [50.0%]  (can_fallthru) 17 [50.0%]  (fallthru,can_fallthru)
	jne	.L67	#,
# BLOCK 17 freq:5000 seq:15
# PRED: 16 [50.0%]  (fallthru,can_fallthru)
	movl	%ecx, (%rsi)	# nfft, *facbuf_61
	movl	%eax, 4(%rsi)	# nfft, MEM[(int *)facbuf_61 + 4B]
	addq	$8, %rsi	#, facbuf
	cmpl	$1, %eax	#, nfft
	movl	%eax, %ebx	# tmp183, nfft
# SUCC: 16 [91.0%]  (dfs_back,can_fallthru) 18 [9.0%]  (fallthru,can_fallthru,loop_exit)
	jg	.L77	#,
# BLOCK 18 freq:1002 seq:16
# PRED: 17 [9.0%]  (fallthru,can_fallthru,loop_exit) 6 [10.1%]  (can_fallthru)
.L78:
	addq	$72, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%rbp, %rax	# st,
	popq	%rbx	#
	.cfi_def_cfa_offset 48
	popq	%rbp	#
	.cfi_def_cfa_offset 40
	popq	%r12	#
	.cfi_def_cfa_offset 32
	popq	%r13	#
	.cfi_def_cfa_offset 24
	popq	%r14	#
	.cfi_def_cfa_offset 16
	popq	%r15	#
	.cfi_def_cfa_offset 8
# SUCC: EXIT [100.0%] 
	ret
# BLOCK 19 freq:2278 seq:17
# PRED: 23 [91.0%]  (dfs_back,can_fallthru) 8 [50.0%]  (can_fallthru)
	.p2align 4,,10
	.p2align 3
.L60:
	.cfi_restore_state
	cvtsi2sd	%r12d, %xmm0	# i, tmp155
	movq	%r14, %rsi	# tmp191,
	movq	%r15, %rdi	# tmp186,
	mulsd	32(%rsp), %xmm0	# %sfp, tmp155
	xorpd	.LC6(%rip), %xmm0	#, tmp155
	call	sincos	#
	movsd	16(%rsp), %xmm1	# %sfp, tmp160
	movsd	56(%rsp), %xmm0	#, sincostmp.391
	mulsd	48(%rsp), %xmm1	#, tmp160
	addsd	24(%rsp), %xmm1	# %sfp, tmp160
	cvttsd2si	%xmm1, %eax	# tmp160, tmp162
	cvtsi2sd	%eax, %xmm2	# tmp162, tmp163
	ucomisd	%xmm1, %xmm2	# tmp160, tmp163
# SUCC: 21 [50.0%]  (can_fallthru) 20 [50.0%]  (fallthru,can_fallthru)
	jbe	.L58	#,
# BLOCK 20 freq:1139 seq:18
# PRED: 19 [50.0%]  (fallthru,can_fallthru)
# SUCC: 21 [100.0%]  (fallthru,can_fallthru)
	subl	$1, %eax	#, tmp162
# BLOCK 21 freq:2278 seq:19
# PRED: 19 [50.0%]  (can_fallthru) 20 [100.0%]  (fallthru,can_fallthru)
.L58:
	mulsd	16(%rsp), %xmm0	# %sfp, tmp168
	movw	%ax, 264(%r13)	# tmp162, MEM[base: D.7005_112, offset: 264B]
	addsd	24(%rsp), %xmm0	# %sfp, tmp168
	cvttsd2si	%xmm0, %eax	# tmp168, tmp170
	cvtsi2sd	%eax, %xmm1	# tmp170, tmp171
	ucomisd	%xmm0, %xmm1	# tmp168, tmp171
# SUCC: 23 [50.0%]  (can_fallthru) 22 [50.0%]  (fallthru,can_fallthru)
	jbe	.L59	#,
# BLOCK 22 freq:1139 seq:20
# PRED: 21 [50.0%]  (fallthru,can_fallthru)
# SUCC: 23 [100.0%]  (fallthru,can_fallthru)
	subl	$1, %eax	#, tmp170
# BLOCK 23 freq:2278 seq:21
# PRED: 21 [50.0%]  (can_fallthru) 22 [100.0%]  (fallthru,can_fallthru)
.L59:
	addl	$1, %r12d	#, i
	movw	%ax, 266(%r13)	# tmp170, MEM[base: D.7005_112, offset: 266B]
	addq	$4, %r13	#, ivtmp.415
	cmpl	%ebx, %r12d	# nfft, i
# SUCC: 19 [91.0%]  (dfs_back,can_fallthru) 24 [9.0%]  (fallthru)
	jne	.L60	#,
# BLOCK 24 freq:205 seq:22
# PRED: 23 [9.0%]  (fallthru)
# SUCC: 14 [100.0%] 
	jmp	.L52	#
# BLOCK 25 freq:5000 seq:23
# PRED: 16 [50.0%]  (can_fallthru)
	.p2align 4,,10
	.p2align 3
.L67:
	cmpl	$2, %ecx	#, nfft
# SUCC: 30 [29.0%]  (can_fallthru) 26 [71.0%]  (fallthru,can_fallthru)
	je	.L71	#,
# BLOCK 26 freq:3550 seq:24
# PRED: 25 [71.0%]  (fallthru,can_fallthru)
	cmpl	$4, %ecx	#, nfft
	.p2align 4,,5
# SUCC: 31 [29.0%]  (can_fallthru) 27 [71.0%]  (fallthru,can_fallthru)
	je	.L83	#,
# BLOCK 27 freq:1666 seq:25
# PRED: 26 [71.0%]  (fallthru,can_fallthru)
	addl	$2, %ecx	#, nfft
# SUCC: 28 [100.0%]  (fallthru,can_fallthru)
	cvtsi2sd	%ecx, %xmm0	# nfft, prephitmp.396
# BLOCK 28 freq:4999 seq:26
# PRED: 30 [100.0%]  27 [100.0%]  (fallthru,can_fallthru) 31 [100.0%] 
.L64:
	comisd	%xmm1, %xmm0	# D.6967, prephitmp.396
# SUCC: 29 [50.0%]  (fallthru,can_fallthru) 16 [50.0%]  (dfs_back,can_fallthru)
	jbe	.L77	#,
# BLOCK 29 freq:2500 seq:27
# PRED: 28 [50.0%]  (fallthru,can_fallthru)
	movl	%ebx, %ecx	# nfft, nfft
# SUCC: 16 [100.0%] 
	jmp	.L77	#
# BLOCK 30 freq:1667 seq:28
# PRED: 25 [29.0%]  (can_fallthru)
	.p2align 4,,10
	.p2align 3
.L71:
	movapd	%xmm3, %xmm0	# prephitmp.396, prephitmp.396
	movl	$3, %ecx	#, nfft
# SUCC: 28 [100.0%] 
	jmp	.L64	#
# BLOCK 31 freq:1667 seq:29
# PRED: 26 [29.0%]  (can_fallthru)
	.p2align 4,,10
	.p2align 3
.L83:
	movapd	%xmm2, %xmm0	# prephitmp.396, prephitmp.396
	movb	$2, %cl	#,
# SUCC: 28 [100.0%] 
	jmp	.L64	#
# BLOCK 32 freq:226 seq:30
# PRED: 14 [50.0%]  (can_fallthru)
	.p2align 4,,10
	.p2align 3
.L82:
	cvttsd2siq	%xmm1, %rax	# D.6967, tmp180
	cvtsi2sdq	%rax, %xmm1	# tmp180, D.6967
# SUCC: 15 [100.0%] 
	jmp	.L61	#
# BLOCK 33 freq:34 seq:31
# PRED: 2 [6.7%]  (can_fallthru)
.L81:
	movl	%esi, 8(%rsp)	#,
	call	malloc	#
	movl	8(%rsp), %esi	#,
	movq	%rax, %rbp	#, st
# SUCC: 6 [100.0%] 
	jmp	.L48	#
	.cfi_endproc
.LFE83:
	.size	kiss_fft_alloc, .-kiss_fft_alloc
	.p2align 4,,15
	.globl	kiss_fft_stride
	.type	kiss_fft_stride, @function
kiss_fft_stride:
.LFB84:
	.cfi_startproc
# BLOCK 2 freq:10000 seq:0
# PRED: ENTRY [100.0%]  (fallthru)
	movq	%rbx, -24(%rsp)	#,
	movq	%rbp, -16(%rsp)	#,
	.cfi_offset 3, -32
	.cfi_offset 6, -24
	movq	%rdi, %rbx	# st, st
	movq	%r12, -8(%rsp)	#,
	subq	$40, %rsp	#,
	.cfi_def_cfa_offset 48
	.cfi_offset 12, -16
	cmpq	%rdx, %rsi	# fout, fin
	movq	%rsi, %rbp	# fin, fin
	movq	%rdx, %rdi	# fout, fout
# SUCC: 4 [10.1%]  (can_fallthru) 3 [89.9%]  (fallthru,can_fallthru)
	je	.L87	#,
# BLOCK 3 freq:8986 seq:1
# PRED: 2 [89.9%]  (fallthru,can_fallthru)
	movq	%rbx, %r9	# st,
	leaq	8(%rbx), %r8	#,
	movq	24(%rsp), %rbp	#,
	movq	16(%rsp), %rbx	#,
	movq	32(%rsp), %r12	#,
	movl	$1, %edx	#,
	addq	$40, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 8
# SUCC: EXIT [100.0%]  (ab,sibcall)
	jmp	kf_work	#
# BLOCK 4 freq:1014 seq:2
# PRED: 2 [10.1%]  (can_fallthru)
	.p2align 4,,10
	.p2align 3
.L87:
	.cfi_restore_state
	movslq	(%rbx), %rdi	# st_3(D)->nfft, st_3(D)->nfft
	movl	%ecx, 8(%rsp)	#,
	salq	$2, %rdi	#, tmp74
	call	malloc	#
	movl	8(%rsp), %ecx	#,
	leaq	8(%rbx), %r8	#,
	movq	%rbx, %r9	# st,
	movq	%rbp, %rsi	# fin,
	movq	%rax, %rdi	# tmp75,
	movl	$1, %edx	#,
	movq	%rax, %r12	#, tmp75
	call	kf_work	#
	movslq	(%rbx), %rdx	# st_3(D)->nfft, st_3(D)->nfft
	movq	%rbp, %rdi	# fin,
	movq	%r12, %rsi	# tmp75,
	salq	$2, %rdx	#, tmp79
	call	memcpy	#
	movq	%r12, %rdi	# tmp75,
	movq	16(%rsp), %rbx	#,
	movq	24(%rsp), %rbp	#,
	movq	32(%rsp), %r12	#,
	addq	$40, %rsp	#,
	.cfi_def_cfa_offset 8
# SUCC: EXIT [100.0%]  (ab,sibcall)
	jmp	free	#
	.cfi_endproc
.LFE84:
	.size	kiss_fft_stride, .-kiss_fft_stride
	.p2align 4,,15
	.globl	kiss_fft
	.type	kiss_fft, @function
kiss_fft:
.LFB85:
	.cfi_startproc
# BLOCK 2 freq:10000 seq:0
# PRED: ENTRY [100.0%]  (fallthru)
	movq	%rbx, -24(%rsp)	#,
	movq	%rbp, -16(%rsp)	#,
	.cfi_offset 3, -32
	.cfi_offset 6, -24
	movq	%rdi, %rbx	# cfg, cfg
	movq	%r12, -8(%rsp)	#,
	subq	$24, %rsp	#,
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -16
	cmpq	%rdx, %rsi	# fout, fin
	movq	%rsi, %rbp	# fin, fin
	movq	%rdx, %rdi	# fout, fout
# SUCC: 4 [10.1%]  (can_fallthru) 3 [89.9%]  (fallthru,can_fallthru)
	je	.L91	#,
# BLOCK 3 freq:8986 seq:1
# PRED: 2 [89.9%]  (fallthru,can_fallthru)
	movq	%rbx, %r9	# cfg,
	leaq	8(%rbx), %r8	#,
	movq	8(%rsp), %rbp	#,
	movq	(%rsp), %rbx	#,
	movq	16(%rsp), %r12	#,
	movl	$1, %ecx	#,
	movl	$1, %edx	#,
	addq	$24, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 8
# SUCC: EXIT [100.0%]  (ab,sibcall)
	jmp	kf_work	#
# BLOCK 4 freq:1014 seq:2
# PRED: 2 [10.1%]  (can_fallthru)
	.p2align 4,,10
	.p2align 3
.L91:
	.cfi_restore_state
	movslq	(%rbx), %rdi	# cfg_1(D)->nfft, cfg_1(D)->nfft
	salq	$2, %rdi	#, tmp73
	call	malloc	#
	leaq	8(%rbx), %r8	#,
	movq	%rbx, %r9	# cfg,
	movq	%rbp, %rsi	# fin,
	movq	%rax, %rdi	# tmp74,
	movl	$1, %ecx	#,
	movl	$1, %edx	#,
	movq	%rax, %r12	#, tmp74
	call	kf_work	#
	movslq	(%rbx), %rdx	# cfg_1(D)->nfft, cfg_1(D)->nfft
	movq	%rbp, %rdi	# fin,
	movq	%r12, %rsi	# tmp74,
	salq	$2, %rdx	#, tmp78
	call	memcpy	#
	movq	%r12, %rdi	# tmp74,
	movq	(%rsp), %rbx	#,
	movq	8(%rsp), %rbp	#,
	movq	16(%rsp), %r12	#,
	addq	$24, %rsp	#,
	.cfi_def_cfa_offset 8
# SUCC: EXIT [100.0%]  (ab,sibcall)
	jmp	free	#
	.cfi_endproc
.LFE85:
	.size	kiss_fft, .-kiss_fft
	.p2align 4,,15
	.globl	kiss_fft_cleanup
	.type	kiss_fft_cleanup, @function
kiss_fft_cleanup:
.LFB86:
	.cfi_startproc
# BLOCK 2 freq:10000 seq:0
# PRED: ENTRY [100.0%]  (fallthru)
# SUCC: EXIT [100.0%] 
	rep
	ret
	.cfi_endproc
.LFE86:
	.size	kiss_fft_cleanup, .-kiss_fft_cleanup
	.p2align 4,,15
	.globl	kiss_fft_next_fast_size
	.type	kiss_fft_next_fast_size, @function
kiss_fft_next_fast_size:
.LFB87:
	.cfi_startproc
# BLOCK 2 freq:81 seq:0
# PRED: ENTRY [100.0%]  (fallthru)
	movl	$1431655766, %r8d	#, tmp134
# SUCC: 3 [100.0%]  (fallthru,can_fallthru)
	movl	$1717986919, %esi	#, tmp135
# BLOCK 3 freq:900 seq:1
# PRED: 2 [100.0%]  (fallthru,can_fallthru) 10 [100.0%] 
	.p2align 4,,10
	.p2align 3
.L101:
	testb	$1, %dil	#, n
	movl	%edi, %ecx	# n, m
# SUCC: 4 [91.0%]  (fallthru,can_fallthru) 5 [9.0%]  (can_fallthru)
	jne	.L94	#,
# BLOCK 4 freq:9100 seq:2
# PRED: 3 [91.0%]  (fallthru,can_fallthru) 4 [91.0%]  (dfs_back,can_fallthru)
	.p2align 4,,10
	.p2align 3
.L95:
	movl	%ecx, %eax	# m, tmp84
	shrl	$31, %eax	#, tmp84
	addl	%eax, %ecx	# tmp84, m
	sarl	%ecx	# m
	testb	$1, %cl	#, m
# SUCC: 4 [91.0%]  (dfs_back,can_fallthru) 5 [9.0%]  (fallthru,can_fallthru,loop_exit)
	je	.L95	#,
# BLOCK 5 freq:900 seq:3
# PRED: 3 [9.0%]  (can_fallthru) 4 [9.0%]  (fallthru,can_fallthru,loop_exit)
.L94:
	movl	%ecx, %eax	# m,
	imull	%r8d	# tmp134
	movl	%ecx, %eax	# m, tmp91
	sarl	$31, %eax	#, tmp91
	subl	%eax, %edx	# tmp91, tmp88
	leal	(%rdx,%rdx,2), %eax	#, tmp94
	cmpl	%eax, %ecx	# tmp94, m
# SUCC: 6 [91.0%]  (fallthru,can_fallthru) 7 [9.0%]  (can_fallthru)
	jne	.L96	#,
# BLOCK 6 freq:9100 seq:4
# PRED: 5 [91.0%]  (fallthru,can_fallthru) 6 [91.0%]  (dfs_back,can_fallthru)
	.p2align 4,,10
	.p2align 3
.L110:
	movl	%ecx, %eax	# m,
	sarl	$31, %ecx	#, tmp99
	imull	%r8d	# tmp134
	subl	%ecx, %edx	# tmp99, tmp97
	movl	%edx, %eax	# m,
	movl	%edx, %ecx	# tmp97, m
	imull	%r8d	# tmp134
	movl	%ecx, %r9d	# m, tmp103
	sarl	$31, %r9d	#, tmp103
	subl	%r9d, %edx	# tmp103, tmp100
	leal	(%rdx,%rdx,2), %edx	#, tmp106
	cmpl	%edx, %ecx	# tmp106, m
# SUCC: 6 [91.0%]  (dfs_back,can_fallthru) 7 [9.0%]  (fallthru,can_fallthru,loop_exit)
	je	.L110	#,
# BLOCK 7 freq:900 seq:5
# PRED: 6 [9.0%]  (fallthru,can_fallthru,loop_exit) 5 [9.0%]  (can_fallthru)
.L96:
	movl	%ecx, %eax	# m,
	imull	%esi	# tmp135
	movl	%ecx, %eax	# m, tmp112
	sarl	$31, %eax	#, tmp112
	sarl	%edx	# tmp108
	subl	%eax, %edx	# tmp112, tmp108
	leal	(%rdx,%rdx,4), %eax	#, tmp115
	cmpl	%eax, %ecx	# tmp115, m
# SUCC: 8 [91.0%]  (fallthru,can_fallthru) 9 [9.0%]  (can_fallthru)
	jne	.L98	#,
# BLOCK 8 freq:9100 seq:6
# PRED: 7 [91.0%]  (fallthru,can_fallthru) 8 [91.0%]  (dfs_back,can_fallthru)
	.p2align 4,,10
	.p2align 3
.L109:
	movl	%ecx, %eax	# m,
	sarl	$31, %ecx	#, tmp121
	imull	%esi	# tmp135
	sarl	%edx	# tmp120
	subl	%ecx, %edx	# tmp121, tmp120
	movl	%edx, %eax	# m,
	movl	%edx, %ecx	# tmp120, m
	imull	%esi	# tmp135
	movl	%ecx, %r9d	# m, tmp126
	sarl	$31, %r9d	#, tmp126
	sarl	%edx	# tmp122
	subl	%r9d, %edx	# tmp126, tmp122
	leal	(%rdx,%rdx,4), %edx	#, tmp129
	cmpl	%edx, %ecx	# tmp129, m
# SUCC: 8 [91.0%]  (dfs_back,can_fallthru) 9 [9.0%]  (fallthru,can_fallthru,loop_exit)
	je	.L109	#,
# BLOCK 9 freq:900 seq:7
# PRED: 8 [9.0%]  (fallthru,can_fallthru,loop_exit) 7 [9.0%]  (can_fallthru)
.L98:
	cmpl	$1, %ecx	#, m
# SUCC: 11 [9.0%]  (can_fallthru,loop_exit) 10 [91.0%]  (fallthru,can_fallthru)
	jle	.L100	#,
# BLOCK 10 freq:819 seq:8
# PRED: 9 [91.0%]  (fallthru,can_fallthru)
	addl	$1, %edi	#, n
# SUCC: 3 [100.0%] 
	jmp	.L101	#
# BLOCK 11 freq:81 seq:9
# PRED: 9 [9.0%]  (can_fallthru,loop_exit)
.L100:
	movl	%edi, %eax	# n,
	.p2align 4,,3
# SUCC: EXIT [100.0%] 
	ret
	.cfi_endproc
.LFE87:
	.size	kiss_fft_next_fast_size, .-kiss_fft_next_fast_size
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	0
	.long	1073741824
	.align 8
.LC1:
	.long	0
	.long	1074266112
	.align 8
.LC2:
	.long	0
	.long	1072693248
	.align 8
.LC3:
	.long	1413754136
	.long	-1072094725
	.align 8
.LC4:
	.long	0
	.long	1088421824
	.align 8
.LC5:
	.long	0
	.long	1071644672
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC6:
	.long	0
	.long	-2147483648
	.long	0
	.long	0
	.section	.rodata.cst8
	.align 8
.LC7:
	.long	0
	.long	1127219200
	.section	.rodata.cst16
	.align 16
.LC8:
	.long	4294967295
	.long	2147483647
	.long	0
	.long	0
	.ident	"GCC: (Ubuntu/Linaro 4.7.2-2ubuntu1) 4.7.2"
	.section	.note.GNU-stack,"",@progbits
