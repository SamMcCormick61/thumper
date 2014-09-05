	.file	"kiss_fft.c"
# GNU C (Ubuntu/Linaro 4.7.2-2ubuntu1) version 4.7.2 (x86_64-linux-gnu)
#	compiled by GNU C version 4.7.2, GMP version 5.0.2, MPFR version 3.1.0-p3, MPC version 0.9
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -imultiarch x86_64-linux-gnu kiss_fft.c
# --param l1-cache-size=32 --param l1-cache-line-size=64
# --param l2-cache-size=3072 -mtune=generic -march=x86-64 -O3 -ffast-math
# -fomit-frame-pointer -fverbose-asm -fstack-protector
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
	pushq	%r13	#
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movq	%rdx, %r13	# fstride, fstride
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
	movq	%r9, %rbx	# st, st
	subq	$56, %rsp	#,
	.cfi_def_cfa_offset 112
	movl	4(%r8), %eax	# MEM[(int *)factors_7(D) + 4B],
	movl	(%r8), %ebp	# *factors_7(D), p
	movl	%ecx, 12(%rsp)	# in_stride, %sfp
	movl	%eax, %edx	#, tmp613
	movl	%eax, 24(%rsp)	#, %sfp
	imull	%ebp, %edx	# p, tmp613
	cmpl	$1, %eax	#,
	movslq	%edx, %rdx	# tmp613, tmp614
	leaq	(%rdi,%rdx,8), %r10	#, Fout_end
# SUCC: 25 [28.0%]  (can_fallthru) 3 [72.0%]  (fallthru,can_fallthru)
	je	.L46	#,
# BLOCK 3 freq:32 seq:1
# PRED: 2 [72.0%]  (fallthru,can_fallthru)
	movslq	12(%rsp), %rdx	# %sfp, pretmp.130
	leaq	0(,%r13,8), %rax	#, pretmp.130
	leaq	8(%r8), %r11	#, tmp811
	movl	%ebp, 28(%rsp)	# p, %sfp
	movq	%r13, 40(%rsp)	# fstride, %sfp
	movq	%rdi, 32(%rsp)	# Fout, %sfp
	movq	%r11, %r14	# tmp811, tmp811
	imulq	%rdx, %rax	# pretmp.130, pretmp.130
	movslq	%ebp, %rdx	# p,
	movq	%rdi, %rbp	# Fout, Fout
	imulq	%r13, %rdx	# fstride,
	movq	%r10, %r13	# Fout_end, Fout_end
	movq	%rax, %r15	# pretmp.130, pretmp.130
	movq	%rdx, (%rsp)	#, %sfp
	movslq	24(%rsp), %rdx	# %sfp, pretmp.130
	salq	$3, %rdx	#,
# SUCC: 4 [100.0%]  (fallthru,can_fallthru)
	movq	%rdx, 16(%rsp)	#, %sfp
# BLOCK 4 freq:226 seq:2
# PRED: 3 [100.0%]  (fallthru,can_fallthru) 4 [86.0%]  (dfs_back,can_fallthru)
	.p2align 4,,10
	.p2align 3
.L5:
	movl	12(%rsp), %ecx	# %sfp,
	movq	(%rsp), %rdx	# %sfp,
	movq	%r12, %rsi	# f,
	movq	%rbp, %rdi	# Fout,
	movq	%rbx, %r9	# st,
	movq	%r14, %r8	# tmp811,
	addq	%r15, %r12	# pretmp.130, f
	call	kf_work	#
	addq	16(%rsp), %rbp	# %sfp, Fout
	cmpq	%r13, %rbp	# Fout_end, Fout
# SUCC: 4 [86.0%]  (dfs_back,can_fallthru) 5 [14.0%]  (fallthru,can_fallthru,loop_exit)
	jne	.L5	#,
# BLOCK 5 freq:32 seq:3
# PRED: 4 [14.0%]  (fallthru,can_fallthru,loop_exit)
	movl	28(%rsp), %ebp	# %sfp, p
	movq	32(%rsp), %r15	# %sfp, Fout
	movq	40(%rsp), %r13	# %sfp, fstride
	cmpl	$3, %ebp	#, p
# SUCC: 28 [29.0%]  (can_fallthru) 6 [71.0%]  (fallthru,can_fallthru)
	je	.L8	#,
# BLOCK 6 freq:31 seq:4
# PRED: 5 [71.0%]  (fallthru,can_fallthru) 27 [71.0%]  (can_fallthru)
.L48:
# SUCC: 19 [50.0%]  (can_fallthru) 7 [50.0%]  (fallthru,can_fallthru)
	jg	.L11	#,
# BLOCK 7 freq:16 seq:5
# PRED: 6 [50.0%]  (fallthru,can_fallthru)
	cmpl	$2, %ebp	#, p
# SUCC: 31 [29.0%]  (can_fallthru) 8 [71.0%]  (fallthru,can_fallthru)
	je	.L47	#,
# BLOCK 8 freq:9 seq:6
# PRED: 20 [71.0%]  (can_fallthru) 7 [71.0%]  (fallthru,can_fallthru)
.L6:
	movslq	%ebp, %rdi	# p, p
	movl	(%rbx), %r12d	# st_26(D)->nfft, Norig
	salq	$3, %rdi	#, tmp791
	call	malloc	#
	movl	24(%rsp), %edx	# %sfp,
	testl	%edx, %edx	#
# SUCC: 9 [91.0%]  (fallthru,can_fallthru) 18 [9.0%]  (can_fallthru)
	jle	.L19	#,
# BLOCK 9 freq:8 seq:7
# PRED: 8 [91.0%]  (fallthru,can_fallthru)
	movl	%r13d, 16(%rsp)	# fstride, %sfp
	movslq	24(%rsp), %rdi	# %sfp, m
	leal	-2(%rbp), %edx	#, tmp795
	imull	24(%rsp), %r13d	# %sfp, D.5812
	leaq	8(%rax,%rdx,8), %r10	#, D.5797
	movl	$0, 12(%rsp)	#, %sfp
	movl	$0, (%rsp)	#, %sfp
# SUCC: 10 [100.0%]  (fallthru,can_fallthru)
	salq	$3, %rdi	#, D.5816
# BLOCK 10 freq:89 seq:8
# PRED: 17 [91.0%]  (dfs_back,can_fallthru) 9 [100.0%]  (fallthru,can_fallthru)
.L20:
	xorl	%edx, %edx	# ivtmp.155
	testl	%ebp, %ebp	# p
	movq	%r15, %rcx	# ivtmp.160, ivtmp.160
# SUCC: 11 [91.0%]  (fallthru,can_fallthru) 17 [9.0%]  (can_fallthru)
	jle	.L27	#,
# BLOCK 11 freq:900 seq:9
# PRED: 10 [91.0%]  (fallthru,can_fallthru) 11 [91.0%]  (dfs_back,can_fallthru)
	.p2align 4,,10
	.p2align 3
.L31:
	movq	(%rcx), %rsi	# MEM[base: D.5841_614, offset: 0B], MEM[base: D.5841_614, offset: 0B]
	addq	%rdi, %rcx	# D.5816, ivtmp.160
	movq	%rsi, (%rax,%rdx,8)	# MEM[base: D.5841_614, offset: 0B], MEM[base: scratch_395, index: ivtmp.155_528, step: 8, offset: 0B]
	addq	$1, %rdx	#, ivtmp.155
	cmpl	%edx, %ebp	# ivtmp.155, p
# SUCC: 11 [91.0%]  (dfs_back,can_fallthru) 12 [9.0%]  (fallthru,can_fallthru,loop_exit)
	jg	.L31	#,
# BLOCK 12 freq:81 seq:10
# PRED: 11 [9.0%]  (fallthru,can_fallthru,loop_exit)
	movl	12(%rsp), %r9d	# %sfp, ivtmp.150
	movq	(%rax), %r14	# *scratch_395, *scratch_395
	movq	%r15, %r8	# ivtmp.160, ivtmp.152
# SUCC: 13 [100.0%]  (fallthru,can_fallthru)
	xorl	%r11d, %r11d	# q1
# BLOCK 13 freq:900 seq:11
# PRED: 16 [91.0%]  (dfs_back,can_fallthru) 12 [100.0%]  (fallthru,can_fallthru)
	.p2align 4,,10
	.p2align 3
.L26:
	cmpl	$1, %ebp	#, p
	movq	%r14, (%r8)	# *scratch_395, MEM[base: D.5821_623, offset: 0B]
# SUCC: 14 [91.0%]  (fallthru,can_fallthru) 16 [9.0%]  (can_fallthru)
	je	.L22	#,
# BLOCK 14 freq:819 seq:12
# PRED: 13 [91.0%]  (fallthru,can_fallthru)
	movss	(%r8), %xmm3	# MEM[base: D.5821_623, offset: 0B], prephitmp.102
	movq	%rax, %rcx	# scratch, ivtmp.139
	movss	4(%r8), %xmm2	# MEM[base: D.5821_623, offset: 4B], prephitmp.102
# SUCC: 15 [100.0%]  (fallthru,can_fallthru)
	xorl	%edx, %edx	# twidx
# BLOCK 15 freq:9100 seq:13
# PRED: 15 [91.0%]  (dfs_back,can_fallthru) 14 [100.0%]  (fallthru,can_fallthru)
	.p2align 4,,10
	.p2align 3
.L25:
	leal	(%rdx,%r9), %esi	#, D.5696
	movss	8(%rcx), %xmm5	# MEM[base: D.5789_32, offset: 8B], D.5692
	movss	12(%rcx), %xmm6	# MEM[base: D.5789_32, offset: 12B], D.5687
	movl	%esi, %edx	# D.5696, twidx
	movaps	%xmm5, %xmm1	# D.5692, tmp807
	subl	%r12d, %edx	# Norig, twidx
	cmpl	%esi, %r12d	# D.5696, Norig
	cmovg	%esi, %edx	# D.5696,, twidx
	movaps	%xmm6, %xmm7	# D.5687, tmp806
	movslq	%edx, %rsi	# twidx, twidx
	addq	$8, %rcx	#, ivtmp.139
	leaq	256(%rbx,%rsi,8), %rsi	#, tmp804
	cmpq	%r10, %rcx	# D.5797, ivtmp.139
	movss	8(%rsi), %xmm0	# D.5690_425->r, D.5689
	movss	12(%rsi), %xmm4	# D.5690_425->i, D.5686
	mulss	%xmm0, %xmm1	# D.5689, tmp807
	mulss	%xmm4, %xmm7	# D.5686, tmp806
	mulss	%xmm6, %xmm0	# D.5687, tmp810
	mulss	%xmm5, %xmm4	# D.5692, tmp809
	subss	%xmm7, %xmm1	# tmp806, tmp807
	addss	%xmm4, %xmm0	# tmp809, tmp810
	addss	%xmm1, %xmm3	# tmp807, prephitmp.102
	addss	%xmm0, %xmm2	# tmp810, prephitmp.102
	movss	%xmm3, (%r8)	# prephitmp.102, MEM[base: D.5821_623, offset: 0B]
	movss	%xmm2, 4(%r8)	# prephitmp.102, MEM[base: D.5821_623, offset: 4B]
# SUCC: 15 [91.0%]  (dfs_back,can_fallthru) 16 [9.0%]  (fallthru,can_fallthru,loop_exit)
	jne	.L25	#,
# BLOCK 16 freq:900 seq:14
# PRED: 15 [9.0%]  (fallthru,can_fallthru,loop_exit) 13 [9.0%]  (can_fallthru)
.L22:
	addl	$1, %r11d	#, q1
	addl	%r13d, %r9d	# D.5812, ivtmp.150
	addq	%rdi, %r8	# D.5816, ivtmp.152
	cmpl	%ebp, %r11d	# p, q1
# SUCC: 13 [91.0%]  (dfs_back,can_fallthru) 17 [9.0%]  (fallthru,can_fallthru,loop_exit)
	jne	.L26	#,
# BLOCK 17 freq:89 seq:15
# PRED: 16 [9.0%]  (fallthru,can_fallthru,loop_exit) 10 [9.0%]  (can_fallthru)
.L27:
	addl	$1, (%rsp)	#, %sfp
	movl	16(%rsp), %edx	# %sfp,
	addq	$8, %r15	#, ivtmp.160
	addl	%edx, 12(%rsp)	#, %sfp
	movl	24(%rsp), %edx	# %sfp,
	cmpl	%edx, (%rsp)	#, %sfp
# SUCC: 10 [91.0%]  (dfs_back,can_fallthru) 18 [9.0%]  (fallthru,can_fallthru,loop_exit)
	jne	.L20	#,
# BLOCK 18 freq:9 seq:16
# PRED: 17 [9.0%]  (fallthru,can_fallthru,loop_exit) 8 [9.0%]  (can_fallthru)
.L19:
	addq	$56, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%rax, %rdi	# scratch,
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
# BLOCK 19 freq:16 seq:17
# PRED: 6 [50.0%]  (can_fallthru)
.L11:
	.cfi_restore_state
	cmpl	$4, %ebp	#, p
# SUCC: 34 [29.0%]  (can_fallthru) 20 [71.0%]  (fallthru,can_fallthru)
	je	.L9	#,
# BLOCK 20 freq:11 seq:18
# PRED: 19 [71.0%]  (fallthru,can_fallthru)
	cmpl	$5, %ebp	#, p
# SUCC: 21 [29.0%]  (fallthru,can_fallthru) 8 [71.0%]  (can_fallthru)
	jne	.L6	#,
# BLOCK 21 freq:9 seq:19
# PRED: 20 [29.0%]  (fallthru,can_fallthru)
	movslq	24(%rsp), %rax	# %sfp, D.5664
	movl	24(%rsp), %edi	# %sfp,
	movq	%rax, %rdx	# D.5664, D.5663
	leaq	(%r15,%rax,8), %rsi	#, Fout1
	imulq	%r13, %rdx	# fstride, D.5663
	leaq	256(%rbx,%rdx,8), %rcx	#, tmp706
	salq	$4, %rdx	#, tmp708
	leaq	264(%rbx,%rdx), %rdx	#, D.5661
	movss	8(%rcx), %xmm0	# D.5545_233->r,
	movss	%xmm0, (%rsp)	#, %sfp
	movss	12(%rcx), %xmm0	# D.5545_233->i,
	movss	%xmm0, 12(%rsp)	#, %sfp
	movss	4(%rdx), %xmm4	# D.5661_237->i, yb$i
	movss	(%rdx), %xmm0	# D.5661_237->r,
	movl	24(%rsp), %edx	# %sfp, tmp710
	movss	%xmm0, 16(%rsp)	#, %sfp
	addl	%edx, %edx	# tmp710
	movslq	%edx, %rax	# tmp710, tmp711
	addl	24(%rsp), %edx	# %sfp, tmp715
	leaq	(%r15,%rax,8), %rax	#, Fout2
	movslq	%edx, %rdx	# tmp715, tmp716
	leaq	(%r15,%rdx,8), %rcx	#, Fout3
	movl	24(%rsp), %edx	# %sfp, tmp718
	sall	$2, %edx	#, tmp718
	testl	%edi, %edi	#
	movslq	%edx, %rdx	# tmp718, tmp719
	leaq	(%r15,%rdx,8), %rdx	#, Fout4
# SUCC: 22 [91.0%]  (fallthru,can_fallthru) 24 [9.0%]  (can_fallthru)
	jle	.L1	#,
# BLOCK 22 freq:8 seq:20
# PRED: 21 [91.0%]  (fallthru,can_fallthru)
	movl	24(%rsp), %edi	# %sfp,
	leaq	0(%r13,%r13,2), %r11	#, tmp723
	xorl	%r8d, %r8d	# ivtmp.272
	subl	$1, %edi	#, tmp725
	leaq	8(%rax,%rdi,8), %rbp	#, D.5997
# SUCC: 23 [100.0%]  (fallthru,can_fallthru)
	xorl	%edi, %edi	# ivtmp.266
# BLOCK 23 freq:89 seq:21
# PRED: 23 [91.0%]  (dfs_back,can_fallthru) 22 [100.0%]  (fallthru,can_fallthru)
.L18:
	movss	(%rsi), %xmm1	# MEM[base: Fout1_331, offset: 0B], D.5650
	leaq	256(%rbx,%rdi,8), %r9	#, tmp730
	movss	4(%rsi), %xmm13	# MEM[base: Fout1_331, offset: 4B], D.5644
	movaps	%xmm1, %xmm12	# D.5650, D.5641
	movaps	%xmm13, %xmm3	# D.5644, tmp732
	movss	8(%r9), %xmm2	# D.5647_262->r, D.5646
	movss	12(%r9), %xmm0	# D.5647_262->i, D.5643
	mulss	%xmm2, %xmm12	# D.5646, D.5641
	leaq	32(%rdi,%rdi), %r9	#, tmp736
	mulss	%xmm0, %xmm3	# D.5643, tmp732
	movss	4(%rax), %xmm14	# MEM[base: Fout2_294, offset: 4B], D.5630
	mulss	%xmm1, %xmm0	# D.5650, tmp734
	leaq	(%rbx,%r9,8), %r9	#, tmp738
	mulss	%xmm2, %xmm13	# D.5646, D.5638
	movss	(%rax), %xmm1	# MEM[base: Fout2_294, offset: 0B], D.5637
	movaps	%xmm1, %xmm11	# D.5637, D.5627
	subss	%xmm3, %xmm12	# tmp732, D.5641
	movaps	%xmm14, %xmm3	# D.5630, tmp740
	movss	8(%r9), %xmm2	# D.5633_282->r, D.5632
	addss	%xmm0, %xmm13	# tmp734, D.5638
	movss	12(%r9), %xmm0	# D.5633_282->i, D.5629
	mulss	%xmm0, %xmm3	# D.5629, tmp740
	movss	4(%rcx), %xmm6	# MEM[base: Fout3_313, offset: 4B], D.5616
	mulss	%xmm2, %xmm11	# D.5632, D.5627
	leaq	256(%rbx,%r8,8), %r9	#, tmp745
	addq	%r11, %r8	# tmp723, ivtmp.272
	mulss	%xmm1, %xmm0	# D.5637, tmp742
	movaps	%xmm6, %xmm7	# D.5616, tmp747
	mulss	%xmm2, %xmm14	# D.5632, D.5624
	movss	12(%r9), %xmm2	# D.5619_302->i, D.5615
	mulss	%xmm2, %xmm7	# D.5615, tmp747
	movss	4(%rdx), %xmm9	# MEM[base: Fout4_311, offset: 4B], D.5602
	subss	%xmm3, %xmm11	# tmp740, D.5627
	movss	(%rcx), %xmm3	# MEM[base: Fout3_313, offset: 0B], D.5623
	movaps	%xmm3, %xmm1	# D.5623, D.5613
	mulss	%xmm3, %xmm2	# D.5623, tmp749
	addss	%xmm0, %xmm14	# tmp742, D.5624
	movss	8(%r9), %xmm0	# D.5619_302->r, D.5618
	mulss	%xmm0, %xmm1	# D.5618, D.5613
	leaq	32(,%rdi,4), %r9	#, tmp751
	addq	%r13, %rdi	# fstride, ivtmp.266
	mulss	%xmm6, %xmm0	# D.5616, D.5610
	movaps	%xmm9, %xmm10	# D.5602, tmp755
	leaq	(%rbx,%r9,8), %r9	#, tmp753
	movss	(%r15), %xmm8	# MEM[base: Fout_333, offset: 0B], scratch$0$r
	movss	4(%r15), %xmm5	# MEM[base: Fout_333, offset: 4B], scratch$0$i
	subss	%xmm7, %xmm1	# tmp747, D.5613
	movss	(%rdx), %xmm7	# MEM[base: Fout4_311, offset: 0B], D.5609
	movaps	%xmm7, %xmm3	# D.5609, D.5599
	movss	12(%r9), %xmm6	# D.5605_322->i, D.5601
	addss	%xmm2, %xmm0	# tmp749, D.5610
	movss	8(%r9), %xmm2	# D.5605_322->r, D.5604
	mulss	%xmm6, %xmm10	# D.5601, tmp755
	mulss	%xmm2, %xmm3	# D.5604, D.5599
	movss	12(%rsp), %xmm15	# %sfp, tmp771
	mulss	%xmm7, %xmm6	# D.5609, tmp757
	mulss	%xmm9, %xmm2	# D.5602, D.5596
	movaps	%xmm1, %xmm9	# D.5613, D.5591
	subss	%xmm10, %xmm3	# tmp755, D.5599
	addss	%xmm11, %xmm9	# D.5627, D.5591
	addss	%xmm6, %xmm2	# tmp757, D.5596
	movaps	%xmm0, %xmm6	# D.5610, D.5590
	subss	%xmm1, %xmm11	# D.5613, D.5589
	movss	(%rsp), %xmm1	# %sfp, D.5580
	movaps	%xmm3, %xmm10	# D.5599, D.5595
	addss	%xmm14, %xmm6	# D.5624, D.5590
	addss	%xmm12, %xmm10	# D.5641, D.5595
	movaps	%xmm2, %xmm7	# D.5596, D.5594
	subss	%xmm0, %xmm14	# D.5610, D.5588
	addss	%xmm13, %xmm7	# D.5638, D.5594
	subss	%xmm2, %xmm13	# D.5596, D.5592
	movss	16(%rsp), %xmm2	# %sfp, tmp766
	movaps	%xmm10, %xmm0	# D.5595, tmp759
	mulss	%xmm10, %xmm1	# D.5595, D.5580
	mulss	%xmm6, %xmm2	# D.5590, tmp766
	subss	%xmm3, %xmm12	# D.5599, D.5593
	addss	%xmm9, %xmm0	# D.5591, tmp759
	movaps	%xmm14, %xmm3	# D.5588, D.5573
	mulss	16(%rsp), %xmm10	# %sfp, D.5561
	mulss	%xmm4, %xmm3	# yb$i, D.5573
	mulss	%xmm12, %xmm15	# D.5593, tmp771
	addss	%xmm8, %xmm0	# scratch$0$r, tmp759
	mulss	12(%rsp), %xmm14	# %sfp, D.5554
	mulss	%xmm4, %xmm12	# yb$i, D.5551
	movss	%xmm0, (%r15)	# tmp759, MEM[base: Fout_333, offset: 0B]
	movaps	%xmm7, %xmm0	# D.5594, tmp761
	addss	%xmm6, %xmm0	# D.5590, tmp761
	mulss	(%rsp), %xmm6	# %sfp, tmp780
	addss	%xmm5, %xmm0	# scratch$0$i, tmp761
	movss	%xmm0, 4(%r15)	# tmp761, MEM[base: Fout_333, offset: 4B]
	addq	$8, %r15	#, Fout
	movss	16(%rsp), %xmm0	# %sfp, tmp763
	mulss	%xmm9, %xmm0	# D.5591, tmp763
	mulss	(%rsp), %xmm9	# %sfp, tmp777
	addss	%xmm0, %xmm1	# tmp763, D.5580
	movss	(%rsp), %xmm0	# %sfp, D.5576
	mulss	%xmm7, %xmm0	# D.5594, D.5576
	mulss	16(%rsp), %xmm7	# %sfp, D.5557
	addss	%xmm9, %xmm10	# tmp777, D.5561
	addss	%xmm8, %xmm1	# scratch$0$r, D.5580
	addss	%xmm2, %xmm0	# tmp766, D.5576
	movss	12(%rsp), %xmm2	# %sfp, tmp769
	mulss	%xmm13, %xmm2	# D.5592, tmp769
	mulss	%xmm4, %xmm13	# yb$i, tmp783
	addss	%xmm8, %xmm10	# scratch$0$r, D.5561
	addss	%xmm6, %xmm7	# tmp780, D.5557
	addss	%xmm5, %xmm0	# scratch$0$i, D.5576
	addss	%xmm2, %xmm3	# tmp769, D.5573
	movaps	%xmm11, %xmm2	# D.5589, D.5571
	subss	%xmm13, %xmm14	# tmp783, D.5554
	mulss	12(%rsp), %xmm11	# %sfp, tmp785
	mulss	%xmm4, %xmm2	# yb$i, D.5571
	addss	%xmm5, %xmm7	# scratch$0$i, D.5557
	addss	%xmm15, %xmm2	# tmp771, D.5571
	movaps	%xmm1, %xmm15	# D.5580, tmp772
	addss	%xmm3, %xmm1	# D.5573, tmp774
	subss	%xmm3, %xmm15	# D.5573, tmp772
	subss	%xmm11, %xmm12	# tmp785, D.5551
	movss	%xmm15, (%rsi)	# tmp772, MEM[base: Fout1_331, offset: 0B]
	movaps	%xmm0, %xmm15	# D.5576, tmp773
	subss	%xmm2, %xmm0	# D.5571, tmp775
	addss	%xmm2, %xmm15	# D.5571, tmp773
	movss	%xmm15, 4(%rsi)	# tmp773, MEM[base: Fout1_331, offset: 4B]
	addq	$8, %rsi	#, Fout1
	movss	%xmm0, 4(%rdx)	# tmp775, MEM[base: Fout4_311, offset: 4B]
	movaps	%xmm10, %xmm0	# D.5561, tmp786
	movss	%xmm1, (%rdx)	# tmp774, MEM[base: Fout4_311, offset: 0B]
	subss	%xmm14, %xmm10	# D.5554, tmp788
	addq	$8, %rdx	#, Fout4
	addss	%xmm14, %xmm0	# D.5554, tmp786
	movss	%xmm0, (%rax)	# tmp786, MEM[base: Fout2_294, offset: 0B]
	movaps	%xmm7, %xmm0	# D.5557, tmp787
	subss	%xmm12, %xmm7	# D.5551, tmp789
	addss	%xmm12, %xmm0	# D.5551, tmp787
	movss	%xmm0, 4(%rax)	# tmp787, MEM[base: Fout2_294, offset: 4B]
	addq	$8, %rax	#, Fout2
	movss	%xmm10, (%rcx)	# tmp788, MEM[base: Fout3_313, offset: 0B]
	movss	%xmm7, 4(%rcx)	# tmp789, MEM[base: Fout3_313, offset: 4B]
	addq	$8, %rcx	#, Fout3
	cmpq	%rbp, %rax	# D.5997, Fout2
# SUCC: 23 [91.0%]  (dfs_back,can_fallthru) 24 [9.0%]  (fallthru,can_fallthru,loop_exit)
	jne	.L18	#,
# BLOCK 24 freq:17 seq:22
# PRED: 36 [14.0%]  (can_fallthru,loop_exit) 21 [9.0%]  (can_fallthru) 23 [9.0%]  (fallthru,can_fallthru,loop_exit)
.L1:
	addq	$56, %rsp	#,
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
# BLOCK 25 freq:12 seq:23
# PRED: 2 [28.0%]  (can_fallthru)
.L46:
	.cfi_restore_state
	leaq	0(,%r13,8), %rsi	#, pretmp.132
	movslq	%ecx, %rdx	#, pretmp.132
	movq	%r10, %rcx	# Fout_end, Fout_end
	imulq	%rdx, %rsi	# pretmp.132, pretmp.132
# SUCC: 26 [100.0%]  (fallthru,can_fallthru)
	movq	%rdi, %rdx	# Fout, Fout
# BLOCK 26 freq:88 seq:24
# PRED: 25 [100.0%]  (fallthru,can_fallthru) 26 [86.0%]  (dfs_back,can_fallthru)
.L3:
	movq	(%r12), %rax	# MEM[base: f_3, offset: 0B], MEM[base: f_3, offset: 0B]
	addq	%rsi, %r12	# pretmp.132, f
	movq	%rax, (%rdx)	# MEM[base: f_3, offset: 0B], MEM[base: Fout_1, offset: 0B]
	addq	$8, %rdx	#, Fout
	cmpq	%rcx, %rdx	# Fout_end, Fout
# SUCC: 26 [86.0%]  (dfs_back,can_fallthru) 27 [14.0%]  (fallthru,can_fallthru,loop_exit)
	jne	.L3	#,
# BLOCK 27 freq:12 seq:25
# PRED: 26 [14.0%]  (fallthru,can_fallthru,loop_exit)
	cmpl	$3, %ebp	#, p
# SUCC: 28 [29.0%]  (fallthru,can_fallthru) 6 [71.0%]  (can_fallthru)
	jne	.L48	#,
# BLOCK 28 freq:9 seq:26
# PRED: 5 [29.0%]  (can_fallthru) 27 [29.0%]  (fallthru,can_fallthru)
.L8:
	movslq	24(%rsp), %rsi	# %sfp, k
	movsd	.LC0(%rip), %xmm8	#, tmp813
	leaq	0(,%r13,8), %rdi	#, pretmp.124
	movq	%rsi, %rax	# k, tmp632
	movq	%rsi, %rdx	# k, tmp636
	imulq	%r13, %rax	# fstride, tmp632
	salq	$4, %rdx	#, tmp636
	salq	$4, %r13	#, pretmp.124
	addq	%r15, %rdx	# Fout, ivtmp.209
	movss	268(%rbx,%rax,8), %xmm9	# MEM[(struct kiss_fft_state *)D.5404_86].i, epi3$i
	addq	$264, %rbx	#, tw2
	leaq	(%r15,%rsi,8), %rax	#, ivtmp.204
# SUCC: 29 [100.0%]  (fallthru,can_fallthru)
	movq	%rbx, %rcx	# tw2, tw2
# BLOCK 29 freq:63 seq:27
# PRED: 28 [100.0%]  (fallthru,can_fallthru) 29 [86.0%]  (dfs_back,can_fallthru)
.L14:
	movss	(%rax), %xmm3	# MEM[base: D.5896_403, offset: 0B], D.5454
	movss	4(%rax), %xmm4	# MEM[base: D.5896_403, offset: 4B], D.5451
	movaps	%xmm3, %xmm0	# D.5454, D.5448
	movaps	%xmm4, %xmm5	# D.5451, tmp638
	movss	(%rbx), %xmm1	# MEM[base: tw2_93, offset: 0B], D.5453
	movss	4(%rbx), %xmm2	# MEM[base: tw2_93, offset: 4B], D.5450
	mulss	%xmm1, %xmm0	# D.5453, D.5448
	addq	%rdi, %rbx	# pretmp.124, tw2
	mulss	%xmm2, %xmm5	# D.5450, tmp638
	movss	4(%rdx), %xmm6	# MEM[base: D.5898_608, offset: 4B], D.5439
	mulss	%xmm3, %xmm2	# D.5454, tmp640
	movaps	%xmm6, %xmm7	# D.5439, tmp642
	mulss	%xmm4, %xmm1	# D.5451, D.5445
	movss	4(%rcx), %xmm4	# MEM[base: tw2_106, offset: 4B], D.5438
	mulss	%xmm4, %xmm7	# D.5438, tmp642
	subss	%xmm5, %xmm0	# tmp638, D.5448
	movss	(%rdx), %xmm5	# MEM[base: D.5898_608, offset: 0B], D.5442
	movaps	%xmm5, %xmm3	# D.5442, D.5436
	mulss	%xmm5, %xmm4	# D.5442, tmp644
	addss	%xmm2, %xmm1	# tmp640, D.5445
	movss	(%rcx), %xmm2	# MEM[base: tw2_106, offset: 0B], D.5441
	mulss	%xmm2, %xmm3	# D.5441, D.5436
	addq	%r13, %rcx	# pretmp.124, tw2
	mulss	%xmm6, %xmm2	# D.5439, D.5433
	subss	%xmm7, %xmm3	# tmp642, D.5436
	addss	%xmm4, %xmm2	# tmp644, D.5433
	movss	(%r15), %xmm4	# MEM[base: Fout_90, offset: 0B], tmp649
	cvtps2pd	%xmm4, %xmm4	# tmp649, tmp649
	movaps	%xmm3, %xmm7	# D.5436, D.5432
	movaps	%xmm2, %xmm6	# D.5433, D.5431
	addss	%xmm0, %xmm7	# D.5448, D.5432
	addss	%xmm1, %xmm6	# D.5445, D.5431
	subss	%xmm2, %xmm1	# D.5433, D.5413
	subss	%xmm3, %xmm0	# D.5436, D.5414
	unpcklps	%xmm7, %xmm7	# D.5432, D.5432
	unpcklps	%xmm6, %xmm6	# D.5431, D.5431
	mulss	%xmm9, %xmm1	# epi3$i, D.5413
	cvtps2pd	%xmm7, %xmm5	# D.5432, tmp647
	mulss	%xmm9, %xmm0	# epi3$i, D.5414
	mulsd	%xmm8, %xmm5	# tmp813, tmp647
	subsd	%xmm5, %xmm4	# tmp647, tmp649
	cvtps2pd	%xmm6, %xmm5	# D.5431, tmp652
	mulsd	%xmm8, %xmm5	# tmp813, tmp652
	unpcklpd	%xmm4, %xmm4	# tmp649
	cvtpd2ps	%xmm4, %xmm4	# tmp649,
	movss	%xmm4, (%rax)	#, MEM[base: D.5896_403, offset: 0B]
	movss	4(%r15), %xmm4	# MEM[base: Fout_90, offset: 4B], tmp654
	cvtps2pd	%xmm4, %xmm4	# tmp654, tmp654
	subsd	%xmm5, %xmm4	# tmp652, tmp654
	unpcklpd	%xmm4, %xmm4	# tmp654
	cvtpd2ps	%xmm4, %xmm4	# tmp654,
	movss	%xmm4, 4(%rax)	#, MEM[base: D.5896_403, offset: 4B]
	addss	(%r15), %xmm7	# MEM[base: Fout_90, offset: 0B], tmp657
	addss	4(%r15), %xmm6	# MEM[base: Fout_90, offset: 4B], tmp659
	movss	%xmm7, (%r15)	# tmp657, MEM[base: Fout_90, offset: 0B]
	movss	%xmm6, 4(%r15)	# tmp659, MEM[base: Fout_90, offset: 4B]
	addq	$8, %r15	#, Fout
	movss	(%rax), %xmm2	# MEM[base: D.5896_403, offset: 0B], tmp661
	addss	%xmm1, %xmm2	# D.5413, tmp661
	movss	%xmm2, (%rdx)	# tmp661, MEM[base: D.5898_608, offset: 0B]
	movss	4(%rax), %xmm2	# MEM[base: D.5896_403, offset: 4B], tmp662
	subss	%xmm0, %xmm2	# D.5414, tmp662
	movss	%xmm2, 4(%rdx)	# tmp662, MEM[base: D.5898_608, offset: 4B]
	addq	$8, %rdx	#, ivtmp.209
	addss	4(%rax), %xmm0	# MEM[base: D.5896_403, offset: 4B], tmp666
	movss	(%rax), %xmm2	# MEM[base: D.5896_403, offset: 0B], tmp664
	subss	%xmm1, %xmm2	# D.5413, tmp664
	movss	%xmm0, 4(%rax)	# tmp666, MEM[base: D.5896_403, offset: 4B]
	movss	%xmm2, (%rax)	# tmp664, MEM[base: D.5896_403, offset: 0B]
	addq	$8, %rax	#, ivtmp.204
	subq	$1, %rsi	#, k
# SUCC: 29 [86.0%]  (dfs_back,can_fallthru) 30 [14.0%]  (fallthru,can_fallthru,loop_exit)
	jne	.L14	#,
# BLOCK 30 freq:9 seq:28
# PRED: 29 [14.0%]  (fallthru,can_fallthru,loop_exit)
	addq	$56, %rsp	#,
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
# BLOCK 31 freq:9 seq:29
# PRED: 7 [29.0%]  (can_fallthru)
.L47:
	.cfi_restore_state
	movslq	24(%rsp), %rax	# %sfp, m
	movl	24(%rsp), %edx	# %sfp, m
	addq	$264, %rbx	#, tw1
	salq	$3, %r13	#, pretmp.127
# SUCC: 32 [100.0%]  (fallthru,can_fallthru)
	leaq	(%r15,%rax,8), %rax	#, Fout2
# BLOCK 32 freq:98 seq:30
# PRED: 31 [100.0%]  (fallthru,can_fallthru) 32 [91.0%]  (dfs_back,can_fallthru)
	.p2align 4,,10
	.p2align 3
.L12:
	movss	(%rbx), %xmm0	# MEM[base: tw1_59, offset: 0B], D.5392
	movss	4(%rbx), %xmm3	# MEM[base: tw1_59, offset: 4B], D.5389
	movaps	%xmm0, %xmm1	# D.5392, D.5387
	movaps	%xmm3, %xmm5	# D.5389, tmp621
	addq	%r13, %rbx	# pretmp.127, tw1
	movss	(%rax), %xmm2	# MEM[base: Fout2_57, offset: 0B], D.5393
	movss	4(%rax), %xmm4	# MEM[base: Fout2_57, offset: 4B], D.5390
	mulss	%xmm2, %xmm1	# D.5393, D.5387
	mulss	%xmm4, %xmm5	# D.5390, tmp621
	mulss	%xmm3, %xmm2	# D.5389, tmp623
	mulss	%xmm4, %xmm0	# D.5390, D.5384
	subss	%xmm5, %xmm1	# tmp621, D.5387
	addss	%xmm2, %xmm0	# tmp623, D.5384
	movss	(%r15), %xmm2	# MEM[base: Fout_71, offset: 0B], tmp624
	subss	%xmm1, %xmm2	# D.5387, tmp624
	movss	%xmm2, (%rax)	# tmp624, MEM[base: Fout2_57, offset: 0B]
	movss	4(%r15), %xmm2	# MEM[base: Fout_71, offset: 4B], tmp626
	subss	%xmm0, %xmm2	# D.5384, tmp626
	movss	%xmm2, 4(%rax)	# tmp626, MEM[base: Fout2_57, offset: 4B]
	addq	$8, %rax	#, Fout2
	addss	(%r15), %xmm1	# MEM[base: Fout_71, offset: 0B], tmp628
	addss	4(%r15), %xmm0	# MEM[base: Fout_71, offset: 4B], tmp630
	movss	%xmm1, (%r15)	# tmp628, MEM[base: Fout_71, offset: 0B]
	movss	%xmm0, 4(%r15)	# tmp630, MEM[base: Fout_71, offset: 4B]
	addq	$8, %r15	#, Fout
	subl	$1, %edx	#, m
# SUCC: 32 [91.0%]  (dfs_back,can_fallthru) 33 [9.0%]  (fallthru,can_fallthru,loop_exit)
	jne	.L12	#,
# BLOCK 33 freq:9 seq:31
# PRED: 32 [9.0%]  (fallthru,can_fallthru,loop_exit)
	addq	$56, %rsp	#,
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
# BLOCK 34 freq:9 seq:32
# PRED: 19 [29.0%]  (can_fallthru)
.L9:
	.cfi_restore_state
	movslq	24(%rsp), %r9	# %sfp, k
	leaq	264(%rbx), %rsi	#, tw3
	leaq	0(%r13,%r13,2), %rbp	#, tmp670
	movq	%r13, %r12	# fstride, pretmp.121
	leaq	0(,%r13,8), %r14	#, pretmp.121
	movl	4(%rbx), %r11d	# st_26(D)->inverse, D.5472
	salq	$4, %r12	#, pretmp.121
	salq	$3, %rbp	#, tmp671
	movq	%rsi, %r8	# tw3, tw3
	movq	%rsi, %rdi	# tw3, tw3
	movq	%r9, %rdx	# k, tmp673
	leaq	(%r9,%r9,2), %rax	#, tmp676
	leaq	(%r15,%r9,8), %rcx	#, ivtmp.233
	salq	$4, %rdx	#, tmp673
	addq	%r15, %rdx	# Fout, ivtmp.238
	leaq	(%r15,%rax,8), %rax	#, ivtmp.243
# SUCC: 37 [100.0%] 
	jmp	.L17	#
# BLOCK 35 freq:31 seq:33
# PRED: 37 [50.0%]  (can_fallthru)
.L49:
	movaps	%xmm7, %xmm0	# D.5488, tmp696
	subss	%xmm1, %xmm0	# D.5480, tmp696
	addss	%xmm7, %xmm1	# D.5488, tmp698
	movss	%xmm0, (%rcx)	# tmp696, MEM[base: D.5947_682, offset: 0B]
	movaps	%xmm3, %xmm0	# D.5481, tmp697
	addss	%xmm6, %xmm0	# D.5486, tmp697
	subss	%xmm3, %xmm6	# D.5481, tmp699
	movss	%xmm0, 4(%rcx)	# tmp697, MEM[base: D.5947_682, offset: 4B]
	movss	%xmm1, (%rax)	# tmp698, MEM[base: D.5951_686, offset: 0B]
# SUCC: 36 [100.0%]  (fallthru,can_fallthru)
	movss	%xmm6, 4(%rax)	# tmp699, MEM[base: D.5951_686, offset: 4B]
# BLOCK 36 freq:63 seq:34
# PRED: 35 [100.0%]  (fallthru,can_fallthru) 38 [100.0%] 
.L16:
	addq	$8, %r15	#, Fout
	addq	$8, %rcx	#, ivtmp.233
	addq	$8, %rdx	#, ivtmp.238
	addq	$8, %rax	#, ivtmp.243
	subq	$1, %r9	#, k
# SUCC: 37 [86.0%]  (fallthru,dfs_back,can_fallthru) 24 [14.0%]  (can_fallthru,loop_exit)
	je	.L1	#,
# BLOCK 37 freq:63 seq:35
# PRED: 36 [86.0%]  (fallthru,dfs_back,can_fallthru) 34 [100.0%] 
.L17:
	movss	(%rcx), %xmm2	# MEM[base: D.5947_682, offset: 0B], D.5523
	movss	4(%rcx), %xmm4	# MEM[base: D.5947_682, offset: 4B], D.5520
	movaps	%xmm2, %xmm3	# D.5523, D.5517
	movaps	%xmm4, %xmm5	# D.5520, tmp679
	movss	(%rsi), %xmm1	# MEM[base: tw3_160, offset: 0B], D.5522
	movss	4(%rsi), %xmm0	# MEM[base: tw3_160, offset: 4B], D.5519
	mulss	%xmm1, %xmm3	# D.5522, D.5517
	addq	%r14, %rsi	# pretmp.121, tw3
	mulss	%xmm0, %xmm5	# D.5519, tmp679
	movss	4(%rdx), %xmm6	# MEM[base: D.5949_684, offset: 4B], D.5508
	mulss	%xmm2, %xmm0	# D.5523, tmp681
	movss	(%rdx), %xmm2	# MEM[base: D.5949_684, offset: 0B], D.5511
	mulss	%xmm4, %xmm1	# D.5520, D.5514
	movaps	%xmm6, %xmm7	# D.5508, tmp683
	movss	(%rdi), %xmm4	# MEM[base: tw3_173, offset: 0B], D.5510
	subss	%xmm5, %xmm3	# tmp679, D.5517
	movaps	%xmm2, %xmm5	# D.5511, D.5505
	movss	4(%rax), %xmm8	# MEM[base: D.5951_686, offset: 4B], D.5496
	addss	%xmm0, %xmm1	# tmp681, D.5514
	movss	4(%rdi), %xmm0	# MEM[base: tw3_173, offset: 4B], D.5507
	mulss	%xmm0, %xmm7	# D.5507, tmp683
	movaps	%xmm8, %xmm9	# D.5496, tmp687
	mulss	%xmm4, %xmm5	# D.5510, D.5505
	addq	%r12, %rdi	# pretmp.121, tw3
	mulss	%xmm2, %xmm0	# D.5511, tmp685
	mulss	%xmm6, %xmm4	# D.5508, D.5502
	movss	4(%r8), %xmm6	# MEM[base: tw3_186, offset: 4B], D.5495
	mulss	%xmm6, %xmm9	# D.5495, tmp687
	subss	%xmm7, %xmm5	# tmp683, D.5505
	movss	(%rax), %xmm7	# MEM[base: D.5951_686, offset: 0B], D.5499
	movaps	%xmm7, %xmm2	# D.5499, D.5493
	mulss	%xmm7, %xmm6	# D.5499, tmp689
	addss	%xmm0, %xmm4	# tmp685, D.5502
	movss	(%r8), %xmm0	# MEM[base: tw3_186, offset: 0B], D.5498
	mulss	%xmm0, %xmm2	# D.5498, D.5493
	addq	%rbp, %r8	# tmp671, tw3
	testl	%r11d, %r11d	# D.5472
	mulss	%xmm8, %xmm0	# D.5496, D.5490
	movss	4(%r15), %xmm8	# MEM[base: Fout_157, offset: 4B], D.5487
	subss	%xmm9, %xmm2	# tmp687, D.5493
	movss	(%r15), %xmm9	# MEM[base: Fout_157, offset: 0B], D.5489
	addss	%xmm6, %xmm0	# tmp689, D.5490
	movaps	%xmm9, %xmm7	# D.5489, D.5488
	movaps	%xmm8, %xmm6	# D.5487, D.5486
	subss	%xmm5, %xmm7	# D.5505, D.5488
	subss	%xmm4, %xmm6	# D.5502, D.5486
	addss	%xmm9, %xmm5	# D.5489, D.5485
	movaps	%xmm2, %xmm9	# D.5493, D.5483
	addss	%xmm8, %xmm4	# D.5487, D.5484
	movaps	%xmm0, %xmm8	# D.5490, D.5482
	addss	%xmm3, %xmm9	# D.5517, D.5483
	addss	%xmm1, %xmm8	# D.5514, D.5482
	movss	%xmm5, (%r15)	# D.5485, MEM[base: Fout_157, offset: 0B]
	subss	%xmm2, %xmm3	# D.5493, D.5481
	movss	%xmm4, 4(%r15)	# D.5484, MEM[base: Fout_157, offset: 4B]
	subss	%xmm0, %xmm1	# D.5490, D.5480
	subss	%xmm9, %xmm5	# D.5483, tmp690
	subss	%xmm8, %xmm4	# D.5482, tmp691
	movss	%xmm5, (%rdx)	# tmp690, MEM[base: D.5949_684, offset: 0B]
	movss	%xmm4, 4(%rdx)	# tmp691, MEM[base: D.5949_684, offset: 4B]
	addss	(%r15), %xmm9	# MEM[base: Fout_157, offset: 0B], tmp692
	addss	4(%r15), %xmm8	# MEM[base: Fout_157, offset: 4B], tmp694
	movss	%xmm9, (%r15)	# tmp692, MEM[base: Fout_157, offset: 0B]
	movss	%xmm8, 4(%r15)	# tmp694, MEM[base: Fout_157, offset: 4B]
# SUCC: 35 [50.0%]  (can_fallthru) 38 [50.0%]  (fallthru,can_fallthru)
	jne	.L49	#,
# BLOCK 38 freq:31 seq:36
# PRED: 37 [50.0%]  (fallthru,can_fallthru)
	movaps	%xmm1, %xmm0	# D.5480, tmp700
	addss	%xmm7, %xmm0	# D.5488, tmp700
	subss	%xmm1, %xmm7	# D.5480, tmp702
	movss	%xmm0, (%rcx)	# tmp700, MEM[base: D.5947_682, offset: 0B]
	movaps	%xmm6, %xmm0	# D.5486, tmp701
	subss	%xmm3, %xmm0	# D.5481, tmp701
	addss	%xmm6, %xmm3	# D.5486, tmp703
	movss	%xmm0, 4(%rcx)	# tmp701, MEM[base: D.5947_682, offset: 4B]
	movss	%xmm7, (%rax)	# tmp702, MEM[base: D.5951_686, offset: 0B]
	movss	%xmm3, 4(%rax)	# tmp703, MEM[base: D.5951_686, offset: 4B]
# SUCC: 36 [100.0%] 
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
	leal	-1(%rdi), %eax	#, tmp110
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
	leaq	272(,%rax,8), %rdi	#, memneeded
	subq	$56, %rsp	#,
	.cfi_def_cfa_offset 112
	testq	%rcx, %rcx	# lenmem
# SUCC: 25 [6.7%]  (can_fallthru) 3 [93.3%]  (fallthru,can_fallthru)
	je	.L81	#,
# BLOCK 3 freq:468 seq:1
# PRED: 2 [93.3%]  (fallthru,can_fallthru)
	xorl	%ebp, %ebp	# st
	testq	%rdx, %rdx	# mem
# SUCC: 4 [85.0%]  (fallthru,can_fallthru) 5 [15.0%]  (can_fallthru)
	je	.L53	#,
# BLOCK 4 freq:397 seq:2
# PRED: 3 [85.0%]  (fallthru,can_fallthru)
	cmpq	(%rcx), %rdi	# *lenmem_11(D), memneeded
# SUCC: 5 [100.0%]  (fallthru,can_fallthru)
	cmovbe	%rdx, %rbp	# mem,, st
# BLOCK 5 freq:468 seq:3
# PRED: 3 [15.0%]  (can_fallthru) 4 [100.0%]  (fallthru,can_fallthru)
.L53:
# SUCC: 6 [100.0%]  (fallthru,can_fallthru)
	movq	%rdi, (%rcx)	# memneeded, *lenmem_11(D)
# BLOCK 6 freq:501 seq:4
# PRED: 5 [100.0%]  (fallthru,can_fallthru) 25 [100.0%] 
.L52:
	testq	%rbp, %rbp	# st
# SUCC: 7 [89.9%]  (fallthru,can_fallthru) 14 [10.1%]  (can_fallthru)
	je	.L78	#,
# BLOCK 7 freq:451 seq:5
# PRED: 6 [89.9%]  (fallthru,can_fallthru)
	cvtsi2sd	%ebx, %xmm1	# nfft,
	testl	%ebx, %ebx	# nfft
	movl	%ebx, 0(%rbp)	# nfft, st_2->nfft
	movl	%esi, 4(%rbp)	# inverse_fft, st_2->inverse
	movsd	%xmm1, 24(%rsp)	#, %sfp
# SUCC: 8 [91.0%]  (fallthru,can_fallthru) 10 [9.0%]  (can_fallthru)
	jle	.L56	#,
# BLOCK 8 freq:410 seq:6
# PRED: 7 [91.0%]  (fallthru,can_fallthru)
	movsd	.LC3(%rip), %xmm0	#, reciptmp.305
	xorl	%r12d, %r12d	# i
	testl	%esi, %esi	# inverse_fft
	movq	%rbp, %r13	# st, ivtmp.311
	leaq	40(%rsp), %r15	#, tmp142
	divsd	%xmm1, %xmm0	#, reciptmp.305
	leaq	32(%rsp), %r14	#, tmp145
	mulsd	.LC4(%rip), %xmm0	#, reciptmp.305
	movsd	%xmm0, 16(%rsp)	# reciptmp.305, %sfp
# SUCC: 9 [50.0%]  (fallthru,can_fallthru) 15 [50.0%]  (can_fallthru)
	jne	.L60	#,
# BLOCK 9 freq:2278 seq:7
# PRED: 8 [50.0%]  (fallthru,can_fallthru) 9 [91.0%]  (dfs_back,can_fallthru)
	.p2align 4,,10
	.p2align 3
.L58:
	cvtsi2sd	%r12d, %xmm0	# i, tmp121
	movq	%r14, %rsi	# tmp145,
	movq	%r15, %rdi	# tmp142,
	addl	$1, %r12d	#, i
	mulsd	16(%rsp), %xmm0	# %sfp, tmp121
	call	sincos	#
	movsd	32(%rsp), %xmm0	#,
	movsd	40(%rsp), %xmm1	#,
	cvtpd2ps	%xmm0, %xmm0	#,
	cvtpd2ps	%xmm1, %xmm1	#,
	movss	%xmm0, 264(%r13)	#, MEM[base: D.6054_96, offset: 264B]
	movss	%xmm1, 268(%r13)	#, MEM[base: D.6054_96, offset: 268B]
	addq	$8, %r13	#, ivtmp.311
	cmpl	%ebx, %r12d	# nfft, i
# SUCC: 9 [91.0%]  (dfs_back,can_fallthru) 10 [9.0%]  (fallthru,can_fallthru,loop_exit)
	jne	.L58	#,
# BLOCK 10 freq:451 seq:8
# PRED: 9 [9.0%]  (fallthru,can_fallthru,loop_exit) 7 [9.0%]  (can_fallthru) 16 [100.0%] 
.L56:
	movsd	.LC7(%rip), %xmm0	#, tmp133
	sqrtsd	24(%rsp), %xmm1	# %sfp, D.6025
	leaq	8(%rbp), %rsi	#, facbuf
	movsd	.LC6(%rip), %xmm2	#, tmp131
	andpd	%xmm1, %xmm0	# D.6025, tmp133
	ucomisd	%xmm0, %xmm2	# tmp133, tmp131
# SUCC: 11 [50.0%]  (fallthru,can_fallthru) 24 [50.0%]  (can_fallthru)
	ja	.L82	#,
# BLOCK 11 freq:452 seq:9
# PRED: 10 [50.0%]  (fallthru,can_fallthru) 24 [100.0%] 
.L61:
	movsd	.LC2(%rip), %xmm3	#, prephitmp.299
	movl	$4, %ecx	#, nfft
# SUCC: 12 [100.0%]  (fallthru,can_fallthru)
	movsd	.LC1(%rip), %xmm2	#, prephitmp.299
# BLOCK 12 freq:10000 seq:10
# PRED: 13 [91.0%]  (dfs_back,can_fallthru) 11 [100.0%]  (fallthru,can_fallthru) 20 [50.0%]  (dfs_back,can_fallthru) 21 [100.0%] 
	.p2align 4,,10
	.p2align 3
.L77:
	movl	%ebx, %edx	# tmp139, tmp138
	movl	%ebx, %eax	# nfft, tmp139
	sarl	$31, %edx	#, tmp138
	idivl	%ecx	# nfft
	testl	%edx, %edx	# tmp138
# SUCC: 17 [50.0%]  (can_fallthru) 13 [50.0%]  (fallthru,can_fallthru)
	jne	.L67	#,
# BLOCK 13 freq:5000 seq:11
# PRED: 12 [50.0%]  (fallthru,can_fallthru)
	movl	%ecx, (%rsi)	# nfft, *facbuf_55
	movl	%eax, 4(%rsi)	# nfft, MEM[(int *)facbuf_55 + 4B]
	addq	$8, %rsi	#, facbuf
	cmpl	$1, %eax	#, nfft
	movl	%eax, %ebx	# tmp139, nfft
# SUCC: 12 [91.0%]  (dfs_back,can_fallthru) 14 [9.0%]  (fallthru,can_fallthru,loop_exit)
	jg	.L77	#,
# BLOCK 14 freq:1002 seq:12
# PRED: 13 [9.0%]  (fallthru,can_fallthru,loop_exit) 6 [10.1%]  (can_fallthru)
.L78:
	addq	$56, %rsp	#,
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
# BLOCK 15 freq:2278 seq:13
# PRED: 15 [91.0%]  (dfs_back,can_fallthru) 8 [50.0%]  (can_fallthru)
	.p2align 4,,10
	.p2align 3
.L60:
	.cfi_restore_state
	cvtsi2sd	%r12d, %xmm0	# i, tmp127
	movq	%r14, %rsi	# tmp145,
	movq	%r15, %rdi	# tmp142,
	addl	$1, %r12d	#, i
	mulsd	16(%rsp), %xmm0	# %sfp, tmp127
	xorpd	.LC5(%rip), %xmm0	#, tmp127
	call	sincos	#
	movsd	32(%rsp), %xmm0	#,
	movsd	40(%rsp), %xmm1	#,
	cvtpd2ps	%xmm0, %xmm0	#,
	cvtpd2ps	%xmm1, %xmm1	#,
	movss	%xmm0, 264(%r13)	#, MEM[base: D.6063_100, offset: 264B]
	movss	%xmm1, 268(%r13)	#, MEM[base: D.6063_100, offset: 268B]
	addq	$8, %r13	#, ivtmp.318
	cmpl	%ebx, %r12d	# nfft, i
# SUCC: 15 [91.0%]  (dfs_back,can_fallthru) 16 [9.0%]  (fallthru)
	jne	.L60	#,
# BLOCK 16 freq:205 seq:14
# PRED: 15 [9.0%]  (fallthru)
# SUCC: 10 [100.0%] 
	jmp	.L56	#
# BLOCK 17 freq:5000 seq:15
# PRED: 12 [50.0%]  (can_fallthru)
	.p2align 4,,10
	.p2align 3
.L67:
	cmpl	$2, %ecx	#, nfft
# SUCC: 22 [29.0%]  (can_fallthru) 18 [71.0%]  (fallthru,can_fallthru)
	je	.L71	#,
# BLOCK 18 freq:3550 seq:16
# PRED: 17 [71.0%]  (fallthru,can_fallthru)
	cmpl	$4, %ecx	#, nfft
	.p2align 4,,5
# SUCC: 23 [29.0%]  (can_fallthru) 19 [71.0%]  (fallthru,can_fallthru)
	je	.L83	#,
# BLOCK 19 freq:1666 seq:17
# PRED: 18 [71.0%]  (fallthru,can_fallthru)
	addl	$2, %ecx	#, nfft
# SUCC: 20 [100.0%]  (fallthru,can_fallthru)
	cvtsi2sd	%ecx, %xmm0	# nfft, prephitmp.299
# BLOCK 20 freq:4999 seq:18
# PRED: 22 [100.0%]  19 [100.0%]  (fallthru,can_fallthru) 23 [100.0%] 
.L64:
	comisd	%xmm1, %xmm0	# D.6025, prephitmp.299
# SUCC: 21 [50.0%]  (fallthru,can_fallthru) 12 [50.0%]  (dfs_back,can_fallthru)
	jbe	.L77	#,
# BLOCK 21 freq:2500 seq:19
# PRED: 20 [50.0%]  (fallthru,can_fallthru)
	movl	%ebx, %ecx	# nfft, nfft
# SUCC: 12 [100.0%] 
	jmp	.L77	#
# BLOCK 22 freq:1667 seq:20
# PRED: 17 [29.0%]  (can_fallthru)
	.p2align 4,,10
	.p2align 3
.L71:
	movapd	%xmm3, %xmm0	# prephitmp.299, prephitmp.299
	movl	$3, %ecx	#, nfft
# SUCC: 20 [100.0%] 
	jmp	.L64	#
# BLOCK 23 freq:1667 seq:21
# PRED: 18 [29.0%]  (can_fallthru)
	.p2align 4,,10
	.p2align 3
.L83:
	movapd	%xmm2, %xmm0	# prephitmp.299, prephitmp.299
	movb	$2, %cl	#,
# SUCC: 20 [100.0%] 
	jmp	.L64	#
# BLOCK 24 freq:226 seq:22
# PRED: 10 [50.0%]  (can_fallthru)
	.p2align 4,,10
	.p2align 3
.L82:
	cvttsd2siq	%xmm1, %rax	# D.6025, tmp136
	cvtsi2sdq	%rax, %xmm1	# tmp136, D.6025
# SUCC: 11 [100.0%] 
	jmp	.L61	#
# BLOCK 25 freq:34 seq:23
# PRED: 2 [6.7%]  (can_fallthru)
.L81:
	movl	%esi, 8(%rsp)	#,
	call	malloc	#
	movl	8(%rsp), %esi	#,
	movq	%rax, %rbp	#, st
# SUCC: 6 [100.0%] 
	jmp	.L52	#
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
	salq	$3, %rdi	#, tmp74
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
	salq	$3, %rdx	#, tmp79
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
	salq	$3, %rdi	#, tmp73
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
	salq	$3, %rdx	#, tmp78
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
	.long	1071644672
	.align 8
.LC1:
	.long	0
	.long	1073741824
	.align 8
.LC2:
	.long	0
	.long	1074266112
	.align 8
.LC3:
	.long	0
	.long	1072693248
	.align 8
.LC4:
	.long	1413754136
	.long	-1072094725
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC5:
	.long	0
	.long	-2147483648
	.long	0
	.long	0
	.section	.rodata.cst8
	.align 8
.LC6:
	.long	0
	.long	1127219200
	.section	.rodata.cst16
	.align 16
.LC7:
	.long	4294967295
	.long	2147483647
	.long	0
	.long	0
	.ident	"GCC: (Ubuntu/Linaro 4.7.2-2ubuntu1) 4.7.2"
	.section	.note.GNU-stack,"",@progbits
