	.cpu arm7tdmi
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 18, 4
	.file	"sound.c"
	.text
	.align	2
	.global	setupSounds
	.type	setupSounds, %function
setupSounds:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mvn	r2, #1264
	mov	r3, #67108864
	sub	r2, r2, #1
	mov	r1, #128	@ movhi
	strh	r1, [r3, #132]	@ movhi
	strh	r2, [r3, #130]	@ movhi
	mov	r2, #0	@ movhi
	strh	r2, [r3, #128]	@ movhi
	bx	lr
	.size	setupSounds, .-setupSounds
	.align	2
	.global	setupInterrupts
	.type	setupInterrupts, %function
setupInterrupts:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
	add	r3, r2, #512
	str	r4, [sp, #-4]!
	ldrh	r0, [r2, #4]
	ldrh	ip, [r3, #0]
	mov	r1, #50331648
	ldr	r4, .L3
	add	r1, r1, #28672
	orr	ip, ip, #1
	orr	r0, r0, #8
	str	r4, [r1, #4092]
	strh	ip, [r3, #0]	@ movhi
	strh	r0, [r2, #4]	@ movhi
	mov	r2, #1	@ movhi
	strh	r2, [r3, #8]	@ movhi
	ldmfd	sp!, {r4}
	bx	lr
.L4:
	.align	2
.L3:
	.word	interruptHandler
	.size	setupInterrupts, .-setupInterrupts
	.align	2
	.global	muteSound
	.type	muteSound, %function
muteSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	mov	r2, #0	@ movhi
	strh	r2, [r3, #130]	@ movhi
	bx	lr
	.size	muteSound, .-muteSound
	.align	2
	.global	unmuteSound
	.type	unmuteSound, %function
unmuteSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mvn	r3, #1264
	sub	r3, r3, #1
	mov	r2, #67108864
	strh	r3, [r2, #130]	@ movhi
	bx	lr
	.size	unmuteSound, .-unmuteSound
	.align	2
	.global	pauseSound
	.type	pauseSound, %function
pauseSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	mov	r2, #0
	add	r3, r3, #256
	strh	r2, [r3, #2]	@ movhi
	ldr	r3, .L8
	str	r2, [r3, #12]
	bx	lr
.L9:
	.align	2
.L8:
	.word	soundA
	.size	pauseSound, .-pauseSound
	.align	2
	.global	unpauseSound
	.type	unpauseSound, %function
unpauseSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	add	r3, r3, #256
	mov	r2, #128	@ movhi
	strh	r2, [r3, #2]	@ movhi
	ldr	r3, .L11
	mov	r2, #1
	str	r2, [r3, #12]
	bx	lr
.L12:
	.align	2
.L11:
	.word	soundA
	.size	unpauseSound, .-unpauseSound
	.align	2
	.global	stopSound
	.type	stopSound, %function
stopSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L14
	ldr	r2, [r3, #0]
	mov	r3, #0
	add	r1, r2, #12
	add	r2, r2, #24
	str	r3, [r1, #8]
	str	r3, [r2, #8]
	ldr	r2, .L14+4
	str	r3, [r2, #12]
	ldr	r2, .L14+8
	str	r3, [r2, #12]
	bx	lr
.L15:
	.align	2
.L14:
	.word	dma
	.word	soundA
	.word	soundB
	.size	stopSound, .-stopSound
	.global	__aeabi_idiv
	.align	2
	.global	playSoundA
	.type	playSoundA, %function
playSoundA:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	r3, .L17
	ldr	r3, [r3, #0]
	mov	r5, #0
	add	r3, r3, #12
	str	r5, [r3, #8]
	ldr	r3, .L17+4
	ldr	r4, .L17+8
	mov	r6, r2
	rsb	r2, r1, r1, asl #4
	mov	r8, r1
	mov	r9, r0
	mov	sl, #1
	ldr	r7, .L17+12
	mov	r0, r2, asl #2
	str	r5, [r3, #0]
	mov	r1, r6
	str	r8, [r4, #4]
	str	r9, [r4, #0]
	str	r6, [r4, #8]
	str	sl, [r4, #12]
	str	sl, [r4, #16]
	mov	lr, pc
	bx	r7
	mov	r1, r6
	sub	fp, r0, #1
	mov	r0, r8
	mov	lr, pc
	bx	r7
	mov	r8, #67108864
	sub	r0, r0, r0, asl #2
	add	r2, r8, #160
	mov	r3, #910163968
	add	r8, r8, #256
	add	fp, fp, r0
	mov	r1, r9
	mov	r0, sl
	ldr	ip, .L17+16
	str	fp, [r4, #20]
	str	r5, [r4, #24]
	mov	lr, pc
	bx	ip
	mov	r0, #16777216
	mov	r1, r6
	strh	r5, [r8, #2]	@ movhi
	mov	lr, pc
	bx	r7
	rsb	r3, r0, #0
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	strh	r3, [r8, #0]	@ movhi
	mov	r3, #128	@ movhi
	strh	r3, [r8, #2]	@ movhi
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L18:
	.align	2
.L17:
	.word	dma
	.word	vbCountA
	.word	soundA
	.word	__aeabi_idiv
	.word	DMANow
	.size	playSoundA, .-playSoundA
	.align	2
	.global	interruptHandler
	.type	interruptHandler, %function
interruptHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	mov	r3, #67108864
	add	r3, r3, #512
	ldrh	r2, [r3, #2]
	tst	r2, #1
	mov	r2, #0	@ movhi
	strh	r2, [r3, #8]	@ movhi
	beq	.L20
	ldr	r3, .L25
	ldr	r2, [r3, #12]
	cmp	r2, #0
	beq	.L21
	ldr	r2, .L25+4
	ldr	r1, [r2, #0]
	ldr	r0, [r3, #20]
	add	r1, r1, #1
	cmp	r1, r0
	str	r1, [r2, #0]
	ble	.L21
	ldr	r2, [r3, #16]
	cmp	r2, #0
	bne	.L24
	ldr	r1, .L25+8
	ldr	r0, [r1, #0]
	mov	r1, #67108864
	add	r1, r1, #256
	add	r0, r0, #12
	strh	r2, [r1, #2]	@ movhi
	str	r2, [r0, #8]
	str	r2, [r3, #12]
.L21:
	ldr	r3, .L25+12
	ldr	r2, [r3, #12]
	cmp	r2, #0
	beq	.L20
	ldr	r2, .L25+16
	ldr	r1, [r2, #0]
	ldr	r0, [r3, #20]
	add	r1, r1, #1
	cmp	r1, r0
	str	r1, [r2, #0]
	ble	.L20
	ldr	r2, .L25+8
	ldr	r0, [r2, #0]
	mov	r1, #67108864
	mov	r2, #0
	add	r1, r1, #256
	add	r0, r0, #24
	strh	r2, [r1, #6]	@ movhi
	str	r2, [r0, #8]
	str	r2, [r3, #12]
.L20:
	mov	r3, #67108864
	add	r3, r3, #512
	mov	r2, #1	@ movhi
	strh	r2, [r3, #2]	@ movhi
	strh	r2, [r3, #8]	@ movhi
	ldmfd	sp!, {r3, lr}
	bx	lr
.L24:
	ldmia	r3, {r0, r1, r2}	@ phole ldm
	bl	playSoundA
	b	.L21
.L26:
	.align	2
.L25:
	.word	soundA
	.word	vbCountA
	.word	dma
	.word	soundB
	.word	vbCountB
	.size	interruptHandler, .-interruptHandler
	.align	2
	.global	playSoundB
	.type	playSoundB, %function
playSoundB:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	r3, .L28
	ldr	r3, [r3, #0]
	mov	r5, #0
	add	r3, r3, #24
	str	r5, [r3, #8]
	ldr	r3, .L28+4
	ldr	r4, .L28+8
	mov	r6, r2
	rsb	r2, r1, r1, asl #4
	mov	r8, r1
	mov	r9, r0
	ldr	r7, .L28+12
	mov	r0, r2, asl #2
	str	r5, [r3, #0]
	mov	sl, #1
	mov	r1, r6
	str	r8, [r4, #4]
	str	r9, [r4, #0]
	str	r6, [r4, #8]
	str	sl, [r4, #12]
	str	r5, [r4, #16]
	mov	lr, pc
	bx	r7
	mov	r1, r6
	sub	fp, r0, #1
	mov	r0, r8
	mov	lr, pc
	bx	r7
	mov	r8, #67108864
	sub	r0, r0, r0, asl #2
	add	r2, r8, #164
	mov	r3, #910163968
	add	r8, r8, #256
	add	fp, fp, r0
	mov	r1, r9
	mov	r0, #2
	ldr	ip, .L28+16
	str	fp, [r4, #20]
	str	sl, [r4, #24]
	mov	lr, pc
	bx	ip
	mov	r0, #16777216
	mov	r1, r6
	strh	r5, [r8, #6]	@ movhi
	mov	lr, pc
	bx	r7
	rsb	r3, r0, #0
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	strh	r3, [r8, #4]	@ movhi
	mov	r3, #128	@ movhi
	strh	r3, [r8, #6]	@ movhi
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L29:
	.align	2
.L28:
	.word	dma
	.word	vbCountB
	.word	soundB
	.word	__aeabi_idiv
	.word	DMANow
	.size	playSoundB, .-playSoundB
	.comm	soundA,28,4
	.comm	soundB,28,4
	.comm	vbCountA,4,4
	.comm	vbCountB,4,4
	.ident	"GCC: (devkitARM release 31) 4.5.0"
