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
	.file	"main.c"
	.text
	.align	2
	.global	initialize
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #1024
	add	r2, r2, #4
	mov	r1, #67108864
	strh	r2, [r1, #0]	@ movhi
	mov	r3, #83886080
	mvn	r2, #32768
	strh	r2, [r3, #8]	@ movhi
	mov	r2, #31	@ movhi
	strh	r2, [r3, #2]	@ movhi
	mov	r2, #992	@ movhi
	strh	r2, [r3, #4]	@ movhi
	mov	r2, #31744	@ movhi
	strh	r2, [r3, #6]	@ movhi
	mov	r2, #0	@ movhi
	strh	r2, [r3, #10]	@ movhi
	bx	lr
	.size	initialize, .-initialize
	.align	2
	.global	splash
	.type	splash, %function
splash:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #4521984
	add	r1, r1, #34048
	mov	r2, #44032
	stmfd	sp!, {r3, lr}
	add	r2, r2, #68
	add	r1, r1, #128
	ldr	r0, .L9
	ldr	r3, .L9+4
	mov	lr, pc
	bx	r3
	ldr	r0, .L9+8
	ldr	r3, .L9+12
	mov	lr, pc
	bx	r3
	ldr	r0, .L9+16
	ldr	r3, .L9+20
	mov	lr, pc
	bx	r3
	mov	r2, #67108864
.L3:
	ldr	r3, [r2, #304]
	tst	r3, #8
	bne	.L3
	mov	r2, #67108864
.L5:
	ldr	r3, [r2, #304]
	tst	r3, #8
	beq	.L5
	ldmfd	sp!, {r3, lr}
	bx	lr
.L10:
	.align	2
.L9:
	.word	splashSong
	.word	playSoundA
	.word	splashPal
	.word	loadPalette
	.word	splashBitmap
	.word	drawBackgroundImage4
	.size	splash, .-splash
	.align	2
	.global	instructions
	.type	instructions, %function
instructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	ldr	r0, .L17
	ldr	r3, .L17+4
	mov	lr, pc
	bx	r3
	ldr	r0, .L17+8
	ldr	r3, .L17+12
	mov	lr, pc
	bx	r3
	mov	r2, #67108864
.L12:
	ldr	r3, [r2, #304]
	tst	r3, #8
	bne	.L12
	mov	r2, #67108864
.L14:
	ldr	r3, [r2, #304]
	tst	r3, #8
	beq	.L14
	ldmfd	sp!, {r3, lr}
	bx	lr
.L18:
	.align	2
.L17:
	.word	instructionsPal
	.word	loadPalette
	.word	instructionsBitmap
	.word	drawBackgroundImage4
	.size	instructions, .-instructions
	.align	2
	.global	finish
	.type	finish, %function
finish:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #1425408
	add	r1, r1, #6400
	mov	r2, #44032
	stmfd	sp!, {r3, lr}
	add	r2, r2, #68
	add	r1, r1, #33
	ldr	r0, .L25
	ldr	r3, .L25+4
	mov	lr, pc
	bx	r3
	ldr	r0, .L25+8
	ldr	r3, .L25+12
	mov	lr, pc
	bx	r3
	ldr	r0, .L25+16
	ldr	r3, .L25+20
	mov	lr, pc
	bx	r3
	mov	r2, #67108864
.L20:
	ldr	r3, [r2, #304]
	tst	r3, #8
	bne	.L20
	mov	r2, #67108864
.L22:
	ldr	r3, [r2, #304]
	tst	r3, #8
	beq	.L22
	ldmfd	sp!, {r3, lr}
	bx	lr
.L26:
	.align	2
.L25:
	.word	finishSong
	.word	playSoundA
	.word	finishscreenPal
	.word	loadPalette
	.word	finishscreenBitmap
	.word	drawBackgroundImage4
	.size	finish, .-finish
	.align	2
	.global	drawLevel
	.type	drawLevel, %function
drawLevel:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L33
	stmfd	sp!, {r4, lr}
	ldr	r3, [r3, #0]
	cmp	r3, #1
	beq	.L30
	cmp	r3, #2
	beq	.L31
	cmp	r3, #0
	bne	.L27
	ldr	r0, .L33+4
	ldr	r3, .L33+8
	ldr	r4, .L33+12
	mov	lr, pc
	bx	r3
	mov	r0, #3
	ldr	r1, .L33+16
	mov	r2, #100663296
	mov	r3, #1792
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L33+20
	add	r2, r2, #4096
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L33+24
	add	r2, r2, #16384
	mov	r3, #6592
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L33+28
	add	r2, r2, #30720
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L33+32
	add	r2, r2, #32768
	mov	r3, #4480
	mov	lr, pc
	bx	r4
	ldr	r1, .L33+36
	mov	r2, #100663296
	mov	r0, #3
.L32:
	add	r2, r2, #51200
	mov	r3, #4096
	mov	lr, pc
	bx	r4
	ldr	r3, .L33+40
	ldrh	r2, [r3, #0]
	mov	r3, #67108864
	strh	r2, [r3, #26]	@ movhi
.L27:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L31:
	ldr	r0, .L33+44
	ldr	r3, .L33+8
	ldr	r4, .L33+12
	mov	lr, pc
	bx	r3
	mov	r0, #3
	ldr	r1, .L33+48
	mov	r2, #100663296
	mov	r3, #1952
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L33+52
	add	r2, r2, #4096
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L33+24
	add	r2, r2, #16384
	mov	r3, #6592
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L33+28
	add	r2, r2, #30720
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L33+56
	add	r2, r2, #32768
	mov	r3, #9280
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	add	r2, r2, #51200
	mov	r3, #4096
	mov	r0, #3
	ldr	r1, .L33+60
	mov	lr, pc
	bx	r4
	ldr	r2, .L33+40
	mov	r3, #186
	str	r3, [r2, #0]
	mov	r2, #67108864
	strh	r3, [r2, #26]	@ movhi
	b	.L27
.L30:
	ldr	r0, .L33+64
	ldr	r3, .L33+8
	ldr	r4, .L33+12
	mov	lr, pc
	bx	r3
	mov	r0, #3
	ldr	r1, .L33+16
	mov	r2, #100663296
	mov	r3, #1792
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L33+20
	add	r2, r2, #4096
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L33+24
	add	r2, r2, #16384
	mov	r3, #6592
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L33+28
	add	r2, r2, #30720
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L33+68
	add	r2, r2, #32768
	mov	r3, #5632
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L33+72
	b	.L32
.L34:
	.align	2
.L33:
	.word	level
	.word	bg0Pal
	.word	loadPalette
	.word	DMANow
	.word	bg0Tiles
	.word	bg0Map
	.word	bg1Tiles
	.word	bg1Map
	.word	lvl1Tiles
	.word	lvl1Map
	.word	.LANCHOR0
	.word	bg0_altPal
	.word	bg0_altTiles
	.word	bg0_altMap
	.word	lvl3Tiles
	.word	lvl3Map
	.word	bg0Pal_2
	.word	lvl2Tiles
	.word	lvl2Map
	.size	drawLevel, .-drawLevel
	.align	2
	.global	initializeGame
	.type	initializeGame, %function
initializeGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #640
	mov	r3, #67108864
	add	r0, r0, #2
	mov	r1, #3968
	mvn	r2, #9792
	stmfd	sp!, {r4, lr}
	add	r1, r1, #5
	strh	r0, [r3, #8]	@ movhi
	sub	r2, r2, #55
	mov	r0, #5888	@ movhi
	strh	r1, [r3, #10]	@ movhi
	strh	r0, [r3, #0]	@ movhi
	strh	r2, [r3, #12]	@ movhi
	bl	drawLevel
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L36
	add	r2, r2, #512
	mov	r3, #256
	ldr	r4, .L36+4
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L36+8
	add	r2, r2, #65536
	mov	r3, #16384
	mov	lr, pc
	bx	r4
	ldmfd	sp!, {r4, lr}
	bx	lr
.L37:
	.align	2
.L36:
	.word	AlicePal
	.word	DMANow
	.word	AliceTiles
	.size	initializeGame, .-initializeGame
	.align	2
	.global	pause
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r0, .L44
	ldr	r3, .L44+4
	mov	lr, pc
	bx	r3
	ldr	r0, .L44+8
	ldr	r3, .L44+12
	mov	lr, pc
	bx	r3
	ldr	r1, .L44+16
	ldr	ip, .L44+20
	ldr	r2, [r1, #0]
	mov	r0, #67108864
.L39:
	ldr	r3, [r0, #304]
	tst	r2, #8
	str	r2, [ip, #0]
	str	r3, [r1, #0]
	beq	.L40
	tst	r3, #8
	beq	.L42
.L40:
	tst	r2, #4
	beq	.L41
	ands	r2, r3, #4
	beq	.L43
.L41:
	mov	r2, r3
	b	.L39
.L42:
	ldr	r3, .L44+24
	mov	r2, #2
	str	r2, [r3, #0]
	ldr	r3, .L44+28
	mov	lr, pc
	bx	r3
	ldmfd	sp!, {r4, lr}
	b	initializeGame
.L43:
	ldr	r3, .L44+24
	str	r2, [r3, #0]
	ldr	r3, .L44+32
	mov	lr, pc
	bx	r3
	ldmfd	sp!, {r4, lr}
	bx	lr
.L45:
	.align	2
.L44:
	.word	pausescreenPal
	.word	loadPalette
	.word	pausescreenBitmap
	.word	drawBackgroundImage4
	.word	buttons
	.word	oldButtons
	.word	state
	.word	unpauseSound
	.word	stopSound
	.size	pause, .-pause
	.align	2
	.global	hideSprites
	.type	hideSprites, %function
hideSprites:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L49
	mov	r3, #0
.L47:
	mov	r1, #512	@ movhi
	strh	r1, [r2, r3]	@ movhi
	add	r3, r3, #8
	cmp	r3, #1024
	bne	.L47
	bx	lr
.L50:
	.align	2
.L49:
	.word	shadowOAM
	.size	hideSprites, .-hideSprites
	.align	2
	.global	initializeSprites
	.type	initializeSprites, %function
initializeSprites:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	ip, .L67
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
	ldr	r1, [ip, #0]
	ldr	r3, .L67+4
	mov	r2, #0
	cmp	r1, #2
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	moveq	r2, #40
	movne	r2, #20
	streq	r2, [r3, #0]
	strne	r2, [r3, #0]
	ldr	r2, .L67+8
	ldr	r4, [r2, #0]
	mov	fp, #1
	add	r4, r4, r4, lsr #31
	mov	r4, r4, asr fp
	mov	r0, #32
	mov	r5, #10
	str	r0, [r3, #32]
	mov	r0, #64
	ldr	r8, .L67+12
	str	r5, [r3, #4]
	str	r0, [r3, #36]
	mov	r6, #3
	mov	r0, #0
	str	r5, [r3, #56]
	mov	r5, #5
	str	r6, [r3, #24]
	str	r5, [r3, #60]
	str	fp, [r3, #28]
	str	r0, [r3, #68]
	str	r0, [r3, #72]
	str	r0, [r3, #76]
	str	r0, [r3, #84]
	str	r0, [r3, #88]
	str	r0, [r3, #92]
	str	r0, [r3, #96]
	str	r0, [r3, #40]
	str	r0, [r3, #52]
	ldr	r3, .L67+16
	mov	sl, r8
	ldr	r6, [ip, #0]
	cmp	r1, #0
	mov	ip, #32
	add	r9, r8, #44
	mov	r2, r0
	ldr	r5, [sl], #84
	rsb	r4, r4, #0
	add	r8, r8, #4
	mov	r7, r0
	str	ip, [r3, #0]
	str	ip, [r3, #4]
	bne	.L54
.L64:
	ldr	r1, .L67+20
	ldr	r0, [r8, r2]
	ldr	r1, [r1, r2]
	stmdb	r3, {r0, r1}	@ phole stm
.L55:
	ldr	r1, [r3, #-8]
	cmp	r1, #0
	ldreq	r0, [r3, #-4]
	beq	.L57
.L66:
	ldr	r0, [r3, #-4]
	cmp	r0, #0
	strne	fp, [r3, #8]
	beq	.L57
	add	r2, r2, #4
	rsb	r1, r5, r1
	add	r0, r4, r0
	cmp	r2, #20
	str	r1, [r3, #-16]
	str	r0, [r3, #-12]
	add	r3, r3, #32
	beq	.L63
.L60:
	mov	r1, r6
	cmp	r1, #0
	str	ip, [r3, #0]
	str	ip, [r3, #4]
	beq	.L64
.L54:
	cmp	r1, #1
	beq	.L65
	cmp	r1, #2
	ldreq	r0, [sl, r2]
	ldreq	r1, .L67+24
	ldreq	r1, [r1, r2]
	streq	r0, [r3, #-8]
	streq	r1, [r3, #-4]
	ldr	r1, [r3, #-8]
	cmp	r1, #0
	ldreq	r0, [r3, #-4]
	bne	.L66
.L57:
	add	r2, r2, #4
	rsb	r1, r5, r1
	add	r0, r4, r0
	cmp	r2, #20
	str	r7, [r3, #8]
	str	r1, [r3, #-16]
	str	r0, [r3, #-12]
	add	r3, r3, #32
	bne	.L60
.L63:
	mov	r3, #67108864
	ldr	r2, [r3, #304]
	ldr	r3, .L67+28
	str	r2, [r3, #0]
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
	bx	lr
.L65:
	ldr	r1, .L67+32
	ldr	r0, [r9, r2]
	ldr	r1, [r1, r2]
	stmdb	r3, {r0, r1}	@ phole stm
	b	.L55
.L68:
	.align	2
.L67:
	.word	level
	.word	alice
	.word	.LANCHOR1
	.word	.LANCHOR0
	.word	bottles+16
	.word	.LANCHOR0+24
	.word	.LANCHOR0+104
	.word	buttons
	.word	.LANCHOR0+64
	.size	initializeSprites, .-initializeSprites
	.align	2
	.global	updateOAM
	.type	updateOAM, %function
updateOAM:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L92
	stmfd	sp!, {r4, lr}
	ldr	r3, [r3, #124]
	ldr	r2, [r3, #80]
	cmp	r2, #0
	bne	.L86
	ldr	r2, [r3, #88]
	cmp	r2, #0
	bne	.L72
	ldr	r2, [r3, #92]
	cmp	r2, #0
	bne	.L73
	ldr	r2, .L92+4
	ldr	ip, [r2, #4]
	ldrb	r1, [r2, #0]	@ zero_extendqisi2
	ldr	lr, [r2, #52]
	ldr	r0, [r2, #44]
	ldr	r3, [r3, #96]
	mov	r2, ip, asl #23
	mvn	r1, r1, asl #17
	ldr	ip, .L92+8
	mvn	r2, r2, lsr #5
	add	r0, r0, lr, asl #5
	mov	r3, r3, asl #12
	mvn	r1, r1, lsr #17
	mvn	r2, r2, lsr #18
	orr	r3, r3, r0, asl #1
	strh	r1, [ip, #0]	@ movhi
	strh	r2, [ip, #2]	@ movhi
	strh	r3, [ip, #4]	@ movhi
	b	.L74
.L86:
	ldr	r2, .L92+4
	ldr	r1, [r2, #4]
	ldr	r4, [r2, #52]
	sub	r1, r1, #16
	ldr	lr, [r2, #44]
	ldr	r0, [r3, #96]
	mov	r3, r1, asl #23
	ldr	ip, .L92+8
	ldrb	r1, [r2, #0]	@ zero_extendqisi2
	mov	r0, r0, asl #12
	mvn	r2, r3, lsr #5
	add	r3, lr, r4, asl #5
	mvn	r2, r2, lsr #18
	orr	r3, r0, r3, asl #1
	strh	r1, [ip, #0]	@ movhi
	strh	r2, [ip, #2]	@ movhi
	strh	r3, [ip, #4]	@ movhi
.L74:
	ldr	r3, .L92+12
	ldr	r2, .L92+8
	mov	r1, #1
.L71:
	ldr	r0, [r3, #0]
	cmp	r0, #0
	beq	.L75
	ldr	r0, [r3, #4]
	cmp	r0, #0
	beq	.L75
	ldr	r0, [r3, #-20]
	mov	r0, r0, asl #23
	mvn	r0, r0, lsr #6
	mvn	r0, r0, lsr #17
	ldrb	lr, [r3, #-24]	@ zero_extendqisi2
	strh	r0, [r2, #10]	@ movhi
	mov	r0, #264	@ movhi
	strh	lr, [r2, #8]	@ movhi
	strh	r0, [r2, #12]	@ movhi
.L76:
	add	r1, r1, #1
	cmp	r1, #6
	add	r3, r3, #32
	add	r2, r2, #8
	bne	.L71
	ldr	r3, .L92+16
	ldr	r3, [r3, #0]
	mov	r1, #16384	@ movhi
	strh	r1, [ip, #56]	@ movhi
	mov	r0, #392	@ movhi
	mov	r1, #49152
	cmp	r3, #0
	ldr	r2, .L92+8
	strh	r1, [ip, #58]	@ movhi
	strh	r0, [ip, #60]	@ movhi
	bne	.L77
	mvn	r1, #32512
	sub	r1, r1, #202
	strh	r1, [r2, #66]	@ movhi
	mov	r1, #520	@ movhi
	strh	r3, [r2, #64]	@ movhi
	strh	r1, [r2, #68]	@ movhi
.L78:
	ldr	r3, .L92+20
	ldr	r2, [r3, #0]
	mvn	r3, #32512
	sub	r3, r3, #189
	mov	r0, #0	@ movhi
	strh	r3, [ip, #74]	@ movhi
	cmp	r2, #1
	mov	r3, #904	@ movhi
	ldr	r1, .L92+8
	strh	r0, [ip, #72]	@ movhi
	strh	r3, [ip, #76]	@ movhi
	ble	.L87
	cmp	r2, #2
	bne	.L84
	mvn	r3, #32512
	sub	r3, r3, #180
	strh	r3, [r1, #82]	@ movhi
	mov	r2, #0	@ movhi
	mov	r3, #780	@ movhi
	strh	r2, [r1, #80]	@ movhi
	strh	r3, [r1, #84]	@ movhi
.L84:
	mov	r0, #3
	ldr	r1, .L92+8
	mov	r2, #117440512
	mov	r3, #512
	ldr	ip, .L92+24
	mov	lr, pc
	bx	ip
	ldmfd	sp!, {r4, lr}
	bx	lr
.L75:
	mov	r0, #512	@ movhi
	strh	r0, [r2, #8]	@ movhi
	b	.L76
.L77:
	cmp	r3, #1
	beq	.L88
	cmp	r3, #2
	beq	.L89
	cmp	r3, #3
	beq	.L90
	cmp	r3, #4
	beq	.L91
	cmp	r3, #5
	bne	.L78
	mvn	r3, #32512
	sub	r3, r3, #202
	strh	r3, [r2, #66]	@ movhi
	mov	r0, #780	@ movhi
	mov	r3, #0	@ movhi
	strh	r3, [r2, #64]	@ movhi
	strh	r0, [r2, #68]	@ movhi
	b	.L78
.L88:
	mvn	r3, #32512
	sub	r3, r3, #202
	mov	r0, #0	@ movhi
	mov	r1, #524	@ movhi
	strh	r0, [r2, #64]	@ movhi
	strh	r3, [r2, #66]	@ movhi
	strh	r1, [r2, #68]	@ movhi
	b	.L78
.L72:
	ldr	r3, .L92+4
	ldr	r1, [r3, #4]
	sub	r1, r1, #16
	mov	r1, r1, asl #23
	ldr	ip, .L92+8
	ldrb	r2, [r3, #0]	@ zero_extendqisi2
	mvn	r3, r1, lsr #5
	mvn	r3, r3, lsr #18
	mov	r0, #536	@ movhi
	strh	r2, [ip, #0]	@ movhi
	strh	r3, [ip, #2]	@ movhi
	strh	r0, [ip, #4]	@ movhi
	b	.L74
.L90:
	mvn	r3, #32512
	sub	r3, r3, #202
	mov	r0, #0	@ movhi
	mov	r1, #652	@ movhi
	strh	r0, [r2, #64]	@ movhi
	strh	r3, [r2, #66]	@ movhi
	strh	r1, [r2, #68]	@ movhi
	b	.L78
.L87:
	mvn	r3, #32512
	sub	r3, r3, #180
	strh	r0, [r1, #80]	@ movhi
	mov	r0, #652	@ movhi
	strh	r3, [r1, #82]	@ movhi
	strh	r0, [r1, #84]	@ movhi
	b	.L84
.L89:
	mvn	r3, #32512
	sub	r3, r3, #202
	mov	r0, #0	@ movhi
	mov	r1, #648	@ movhi
	strh	r0, [r2, #64]	@ movhi
	strh	r3, [r2, #66]	@ movhi
	strh	r1, [r2, #68]	@ movhi
	b	.L78
.L73:
	ldr	r2, .L92+4
	ldr	r0, [r2, #4]
	ldr	r3, [r3, #96]
	sub	r0, r0, #16
	mov	r0, r0, asl #23
	ldr	ip, .L92+8
	ldrb	r1, [r2, #0]	@ zero_extendqisi2
	mov	r3, r3, asl #12
	mvn	r2, r0, lsr #5
	mvn	r2, r2, lsr #18
	orr	r3, r3, #792
	strh	r1, [ip, #0]	@ movhi
	strh	r2, [ip, #2]	@ movhi
	strh	r3, [ip, #4]	@ movhi
	b	.L74
.L91:
	mvn	r3, #32512
	sub	r3, r3, #202
	mov	r0, #0	@ movhi
	mov	r1, #776	@ movhi
	strh	r0, [r2, #64]	@ movhi
	strh	r3, [r2, #66]	@ movhi
	strh	r1, [r2, #68]	@ movhi
	b	.L78
.L93:
	.align	2
.L92:
	.word	.LANCHOR0
	.word	alice
	.word	shadowOAM
	.word	bottles+24
	.word	bottlesTotal
	.word	level
	.word	DMANow
	.size	updateOAM, .-updateOAM
	.align	2
	.global	scrollVert
	.type	scrollVert, %function
scrollVert:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L115
	ldr	r3, [r3, #0]
	cmp	r3, #1
	ble	.L113
	cmp	r3, #2
	bxne	lr
	ldr	r2, .L115+4
	ldr	r1, [r2, #0]
	cmp	r1, #7
	ble	.L112
	cmp	r1, #352
	blt	.L110
	ldr	r3, .L115+8
	ldr	r0, [r3, #72]
	cmp	r0, #0
	bne	.L114
	ldr	r0, [r3, #0]
	cmp	r0, #96
	ble	.L102
.L108:
	ldr	r2, [r3, #16]
	add	r1, r2, #3
	cmp	r2, #0
	movlt	r2, r1
	add	r0, r0, r2, asr #2
	str	r0, [r3, #0]
	bx	lr
.L113:
	ldr	r2, .L115+4
	ldr	r1, [r2, #0]
	cmp	r1, #1
	bgt	.L96
.L112:
	ldr	r3, .L115+8
	ldr	r0, [r3, #0]
	cmp	r0, #49
	ble	.L108
	cmp	r0, #50
	beq	.L102
	b	.L108
.L96:
	cmp	r1, #94
	ble	.L110
	ldr	r3, .L115+8
	ldr	r0, [r3, #0]
	cmn	r0, #13
	bge	.L108
.L102:
	ldr	r3, [r3, #16]
	add	r0, r3, #3
	cmp	r3, #0
	movlt	r3, r0
	add	r1, r1, r3, asr #2
	str	r1, [r2, #0]
	bx	lr
.L110:
	ldr	r3, .L115+8
	b	.L102
.L114:
	ldr	r2, [r3, #16]
	ldr	r1, [r3, #0]
	add	r0, r2, #3
	cmp	r2, #0
	movlt	r2, r0
	add	r2, r1, r2, asr #2
	str	r2, [r3, #0]
	bx	lr
.L116:
	.align	2
.L115:
	.word	level
	.word	.LANCHOR0
	.word	alice
	.size	scrollVert, .-scrollVert
	.align	2
	.global	checkPlayerScreen
	.type	checkPlayerScreen, %function
checkPlayerScreen:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, .L135
	str	r4, [sp, #-4]!
	ldr	r3, [r1, #124]
	ldr	r2, [r3, #0]
	ldr	r0, [r3, #16]
	cmp	r2, #256
	moveq	r2, #0
	streq	r2, [r3, #0]
	cmp	r0, #0
	blt	.L131
.L119:
	ldr	r0, [r3, #76]
	cmp	r0, #0
	beq	.L120
	cmp	r2, #512
	ldrgt	r0, .L135+4
	ble	.L132
.L121:
	ldr	r0, [r0, #0]
	cmp	r0, #2
	beq	.L133
.L120:
	cmp	r2, #160
	beq	.L134
.L122:
	ldr	r2, [r3, #4]
	ldr	r1, [r3, #32]
	cmp	r2, #0
	movlt	r2, #0
	rsb	r0, r1, #240
	strlt	r2, [r3, #4]
	strlt	r2, [r3, #20]
	cmp	r0, r2
	rsble	r1, r1, #239
	movle	r2, #0
	strle	r1, [r3, #4]
	strle	r2, [r3, #20]
	ldmfd	sp!, {r4}
	bx	lr
.L134:
	ldr	r2, .L135+4
	ldr	r2, [r2, #0]
	cmp	r2, #2
	moveq	r2, #170
	streq	r2, [r3, #0]
	ldr	r2, [r3, #48]
	cmp	r2, #0
	mov	r1, #1
	moveq	r2, #8
	str	r1, [r3, #76]
	streq	r2, [r3, #44]
	beq	.L126
	cmp	r2, #2
	moveq	r2, #10
	streq	r2, [r3, #44]
.L126:
	mov	r2, #0
	str	r2, [r3, #52]
	b	.L122
.L132:
	cmp	r2, #159
	ble	.L122
	ldr	r0, .L135+4
	ldr	ip, [r0, #0]
	cmp	ip, #1
	bgt	.L121
	ldr	ip, [r1, #0]
	cmp	ip, #0
	subge	r4, ip, #7
	ldrge	ip, .L135
	strge	r4, [ip, #0]
	b	.L121
.L131:
	cmp	r2, #0
	movle	r2, #0
	strle	r2, [r3, #0]
	b	.L119
.L133:
	ldr	r1, [r1, #0]
	cmp	r1, #7
	ldrgt	r0, .L135
	subgt	r1, r1, #7
	strgt	r1, [r0, #0]
	b	.L120
.L136:
	.align	2
.L135:
	.word	.LANCHOR0
	.word	level
	.size	checkPlayerScreen, .-checkPlayerScreen
	.align	2
	.global	aliceMoveLeft
	.type	aliceMoveLeft, %function
aliceMoveLeft:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L142
	ldr	r3, [r3, #124]
	ldr	r0, [r3, #56]
	ldr	r1, [r3, #20]
	rsb	r0, r0, #0
	cmp	r1, r0
	ldrge	r0, [r3, #28]
	rsbge	r1, r0, r1
	ldr	r2, [r3, #40]
	strge	r1, [r3, #20]
	ldr	r1, [r3, #68]
	add	r2, r2, #1
	cmp	r1, #0
	str	r2, [r3, #40]
	beq	.L139
	ldr	r1, [r3, #72]
	cmp	r1, #0
	bxne	lr
	ldr	r1, .L142+4
	smull	r0, r1, r2, r1
	mov	r0, r2, asr #31
	rsb	r1, r0, r1, asr #1
	add	r1, r1, r1, asl #1
	cmp	r2, r1, asl #2
	mov	r2, #2
	str	r2, [r3, #44]
	bxne	lr
	ldr	r2, [r3, #52]
	cmp	r2, #12
	moveq	r2, #4
	addne	r2, r2, #4
	streq	r2, [r3, #52]
	strne	r2, [r3, #52]
	bx	lr
.L139:
	ldr	r2, [r3, #72]
	cmp	r2, #0
	bxeq	lr
	ldr	r2, [r3, #76]
	cmp	r2, #0
	movne	r2, #10
	strne	r2, [r3, #44]
	strne	r1, [r3, #52]
	bx	lr
.L143:
	.align	2
.L142:
	.word	.LANCHOR0
	.word	715827883
	.size	aliceMoveLeft, .-aliceMoveLeft
	.align	2
	.global	aliceMoveRight
	.type	aliceMoveRight, %function
aliceMoveRight:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L149
	ldr	r3, [r3, #124]
	ldr	r1, [r3, #20]
	ldr	r0, [r3, #56]
	cmp	r1, r0
	ldrle	r0, [r3, #28]
	addle	r1, r0, r1
	ldr	r2, [r3, #40]
	strle	r1, [r3, #20]
	ldr	r1, [r3, #68]
	add	r2, r2, #1
	cmp	r1, #0
	str	r2, [r3, #40]
	beq	.L146
	ldr	r1, [r3, #72]
	cmp	r1, #0
	bxne	lr
	ldr	r0, .L149+4
	smull	ip, r0, r2, r0
	mov	ip, r2, asr #31
	rsb	r0, ip, r0, asr #1
	add	r0, r0, r0, asl #1
	cmp	r2, r0, asl #2
	str	r1, [r3, #44]
	bxne	lr
	ldr	r2, [r3, #52]
	cmp	r2, #12
	moveq	r2, #4
	addne	r2, r2, #4
	streq	r2, [r3, #52]
	strne	r2, [r3, #52]
	bx	lr
.L146:
	ldr	r2, [r3, #72]
	cmp	r2, #0
	bxeq	lr
	ldr	r2, [r3, #76]
	cmp	r2, #0
	movne	r2, #8
	strne	r2, [r3, #44]
	strne	r1, [r3, #52]
	bx	lr
.L150:
	.align	2
.L149:
	.word	.LANCHOR0
	.word	715827883
	.size	aliceMoveRight, .-aliceMoveRight
	.align	2
	.global	gravityLvl1
	.type	gravityLvl1, %function
gravityLvl1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, .L156
	ldr	r3, [r0, #124]
	ldr	ip, [r3, #8]
	ldr	r2, [r3, #36]
	ldr	r1, [r3, #12]
	add	r2, ip, r2
	sub	r2, r2, #2
	add	r2, r1, r2, asl #9
	ldr	r1, .L156+4
	add	r2, r1, r2, asl #1
	ldrh	r1, [r2, #32]
	mov	r2, #32512
	add	r2, r2, #255
	cmp	r1, r2
	beq	.L155
	cmp	r1, #0
	bxne	lr
	ldr	r2, [r3, #0]
	cmp	r2, #96
	bxhi	lr
	ldr	r2, [r3, #68]
	cmp	r2, #0
	str	r1, [r3, #72]
	moveq	r1, #1
	streq	r2, [r3, #84]
	streq	r2, [r3, #16]
	streq	r1, [r3, #68]
	streq	r2, [r3, #76]
	bx	lr
.L155:
	ldr	r2, [r3, #16]
	ldr	r1, [r3, #60]
	cmp	r2, r1
	ldrle	r1, [r0, #128]
	addle	r2, r2, r1
	movle	r1, #0
	strle	r2, [r3, #16]
	strle	r1, [r3, #68]
	cmp	r2, #1
	movgt	r2, #1
	strgt	r2, [r3, #72]
	bx	lr
.L157:
	.align	2
.L156:
	.word	.LANCHOR0
	.word	collisionMap_1Bitmap
	.size	gravityLvl1, .-gravityLvl1
	.align	2
	.global	aliceCollisionLvl1
	.type	aliceCollisionLvl1, %function
aliceCollisionLvl1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L170
	stmfd	sp!, {r4, r5, r6}
	ldr	r3, [r3, #124]
	add	r0, r3, #8
	ldmia	r0, {r0, r1}	@ phole ldm
	sub	r5, r0, #1
	mov	r5, r5, asl #9
	ldr	r2, .L170+4
	add	r4, r5, r1
	mov	ip, r4, asl #1
	ldrh	ip, [r2, ip]
	cmp	ip, #0
	beq	.L167
	add	r6, r0, #31
	mov	r6, r6, asl #9
	add	ip, r6, r1
	mov	ip, ip, asl #1
	ldrh	ip, [r2, ip]
	cmp	ip, #0
	beq	.L167
	add	r0, r0, #63
	mov	r0, r0, asl #9
	add	ip, r0, r1
	mov	ip, ip, asl #1
	ldrh	ip, [r2, ip]
	cmp	ip, #0
	beq	.L167
	add	r4, r2, r4, asl #1
	ldrh	ip, [r4, #32]
	cmp	ip, #0
	beq	.L169
	add	r1, r1, #32
	add	r5, r5, r1
	mov	r5, r5, asl #1
	ldrh	ip, [r2, r5]
	cmp	ip, #0
	beq	.L168
	add	r6, r6, r1
	mov	r6, r6, asl #1
	ldrh	ip, [r2, r6]
	cmp	ip, #0
	beq	.L168
	add	r1, r0, r1
	mov	r1, r1, asl #1
	ldrh	r2, [r2, r1]
	cmp	r2, #0
	ldreq	r1, [r3, #4]
	subeq	r1, r1, #1
	streq	r2, [r3, #20]
	streq	r1, [r3, #4]
	b	.L158
.L167:
	ldr	r2, [r3, #4]
	add	r2, r2, #1
	str	ip, [r3, #20]
	str	r2, [r3, #4]
.L158:
	ldmfd	sp!, {r4, r5, r6}
	bx	lr
.L169:
	ldmia	r3, {r1, r2}	@ phole ldm
	sub	r1, r1, #1
	add	r2, r2, #1
	str	ip, [r3, #20]
	stmia	r3, {r1, r2}	@ phole stm
	b	.L158
.L168:
	ldr	r2, [r3, #4]
	sub	r2, r2, #1
	str	ip, [r3, #20]
	str	r2, [r3, #4]
	b	.L158
.L171:
	.align	2
.L170:
	.word	.LANCHOR0
	.word	collisionMap_1Bitmap
	.size	aliceCollisionLvl1, .-aliceCollisionLvl1
	.align	2
	.global	aliceCollisionLvl2
	.type	aliceCollisionLvl2, %function
aliceCollisionLvl2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L184
	stmfd	sp!, {r4, r5, r6}
	ldr	r3, [r3, #124]
	add	r0, r3, #8
	ldmia	r0, {r0, r1}	@ phole ldm
	sub	r5, r0, #1
	mov	r5, r5, asl #9
	ldr	r2, .L184+4
	add	r4, r5, r1
	mov	ip, r4, asl #1
	ldrh	ip, [r2, ip]
	cmp	ip, #0
	beq	.L181
	add	r6, r0, #31
	mov	r6, r6, asl #9
	add	ip, r6, r1
	mov	ip, ip, asl #1
	ldrh	ip, [r2, ip]
	cmp	ip, #0
	beq	.L181
	add	r0, r0, #63
	mov	r0, r0, asl #9
	add	ip, r0, r1
	mov	ip, ip, asl #1
	ldrh	ip, [r2, ip]
	cmp	ip, #0
	beq	.L181
	add	r4, r2, r4, asl #1
	ldrh	ip, [r4, #32]
	cmp	ip, #0
	beq	.L183
	add	r1, r1, #32
	add	r5, r5, r1
	mov	r5, r5, asl #1
	ldrh	ip, [r2, r5]
	cmp	ip, #0
	beq	.L182
	add	r6, r6, r1
	mov	r6, r6, asl #1
	ldrh	ip, [r2, r6]
	cmp	ip, #0
	beq	.L182
	add	r1, r0, r1
	mov	r1, r1, asl #1
	ldrh	r2, [r2, r1]
	cmp	r2, #0
	ldreq	r1, [r3, #4]
	subeq	r1, r1, #1
	streq	r2, [r3, #20]
	streq	r1, [r3, #4]
	b	.L172
.L181:
	ldr	r2, [r3, #4]
	add	r2, r2, #1
	str	ip, [r3, #20]
	str	r2, [r3, #4]
.L172:
	ldmfd	sp!, {r4, r5, r6}
	bx	lr
.L183:
	ldmia	r3, {r1, r2}	@ phole ldm
	sub	r1, r1, #1
	add	r2, r2, #1
	str	ip, [r3, #20]
	stmia	r3, {r1, r2}	@ phole stm
	b	.L172
.L182:
	ldr	r2, [r3, #4]
	sub	r2, r2, #1
	str	ip, [r3, #20]
	str	r2, [r3, #4]
	b	.L172
.L185:
	.align	2
.L184:
	.word	.LANCHOR0
	.word	collisionMap_2Bitmap
	.size	aliceCollisionLvl2, .-aliceCollisionLvl2
	.align	2
	.global	aliceCollisionLvl3
	.type	aliceCollisionLvl3, %function
aliceCollisionLvl3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L198
	stmfd	sp!, {r4, r5, r6}
	ldr	r3, [r3, #124]
	add	r0, r3, #8
	ldmia	r0, {r0, r1}	@ phole ldm
	sub	r5, r0, #1
	mov	r5, r5, asl #9
	ldr	r2, .L198+4
	add	r4, r5, r1
	mov	ip, r4, asl #1
	ldrh	ip, [r2, ip]
	cmp	ip, #0
	beq	.L195
	add	r6, r0, #31
	mov	r6, r6, asl #9
	add	ip, r6, r1
	mov	ip, ip, asl #1
	ldrh	ip, [r2, ip]
	cmp	ip, #0
	beq	.L195
	add	r0, r0, #63
	mov	r0, r0, asl #9
	add	ip, r0, r1
	mov	ip, ip, asl #1
	ldrh	ip, [r2, ip]
	cmp	ip, #0
	beq	.L195
	add	r4, r2, r4, asl #1
	ldrh	ip, [r4, #32]
	cmp	ip, #0
	beq	.L197
	add	r1, r1, #32
	add	r5, r5, r1
	mov	r5, r5, asl #1
	ldrh	ip, [r2, r5]
	cmp	ip, #0
	beq	.L196
	add	r6, r6, r1
	mov	r6, r6, asl #1
	ldrh	ip, [r2, r6]
	cmp	ip, #0
	beq	.L196
	add	r1, r0, r1
	mov	r1, r1, asl #1
	ldrh	r2, [r2, r1]
	cmp	r2, #0
	ldreq	r1, [r3, #4]
	subeq	r1, r1, #1
	streq	r2, [r3, #20]
	streq	r1, [r3, #4]
	b	.L186
.L195:
	ldr	r2, [r3, #4]
	add	r2, r2, #1
	str	ip, [r3, #20]
	str	r2, [r3, #4]
.L186:
	ldmfd	sp!, {r4, r5, r6}
	bx	lr
.L197:
	ldmia	r3, {r1, r2}	@ phole ldm
	sub	r1, r1, #1
	add	r2, r2, #1
	str	ip, [r3, #20]
	stmia	r3, {r1, r2}	@ phole stm
	b	.L186
.L196:
	ldr	r2, [r3, #4]
	sub	r2, r2, #1
	str	ip, [r3, #20]
	str	r2, [r3, #4]
	b	.L186
.L199:
	.align	2
.L198:
	.word	.LANCHOR0
	.word	collisionMap_3Bitmap
	.size	aliceCollisionLvl3, .-aliceCollisionLvl3
	.align	2
	.global	checkAliceCollision
	.type	checkAliceCollision, %function
checkAliceCollision:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L207
	stmfd	sp!, {r4, lr}
	ldr	r3, [r3, #124]
	ldr	r2, [r3, #72]
	cmp	r2, #0
	beq	.L200
	ldr	r3, [r3, #76]
	cmp	r3, #0
	bne	.L200
	ldr	r4, .L207+4
	ldr	r3, [r4, #0]
	cmp	r3, #0
	beq	.L204
.L202:
	cmp	r3, #1
	beq	.L205
.L203:
	cmp	r3, #2
	beq	.L206
.L200:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L206:
	ldmfd	sp!, {r4, lr}
	b	aliceCollisionLvl3
.L204:
	bl	aliceCollisionLvl1
	ldr	r3, [r4, #0]
	b	.L202
.L205:
	bl	aliceCollisionLvl2
	ldr	r3, [r4, #0]
	b	.L203
.L208:
	.align	2
.L207:
	.word	.LANCHOR0
	.word	level
	.size	checkAliceCollision, .-checkAliceCollision
	.align	2
	.global	aliceJump
	.type	aliceJump, %function
aliceJump:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r4, .L212
	ldr	r3, [r4, #124]
	ldr	r2, [r3, #68]
	cmp	r2, #0
	beq	.L209
	ldr	r3, [r3, #72]
	cmp	r3, #0
	beq	.L211
.L209:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L211:
	mov	r1, #1728
	mov	r2, #11008
	add	r2, r2, #17
	ldr	r3, .L212+4
	ldr	r0, .L212+8
	add	r1, r1, #5
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #124]
	mov	r2, #1
	str	r2, [r3, #84]
	mvn	r2, #14
	str	r2, [r3, #16]
	b	.L209
.L213:
	.align	2
.L212:
	.word	.LANCHOR0
	.word	playSoundB
	.word	jump
	.size	aliceJump, .-aliceJump
	.align	2
	.global	checkButterflies
	.type	checkButterflies, %function
checkButterflies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L217
	ldr	r2, [r3, #124]
	ldr	r0, [r2, #44]
	cmp	r0, #12
	cmpne	r0, #14
	moveq	r1, #0
	movne	r2, #1
	movne	r0, #0
	moveq	r0, #1
	streq	r1, [r3, #128]
	streq	r1, [r2, #16]
	moveq	r0, #1
	strne	r2, [r3, #128]
	bx	lr
.L218:
	.align	2
.L217:
	.word	.LANCHOR0
	.size	checkButterflies, .-checkButterflies
	.align	2
	.global	aliceWalk
	.type	aliceWalk, %function
aliceWalk:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	stmfd	sp!, {r4, lr}
	ldr	r3, [r3, #304]
	tst	r3, #32
	beq	.L225
.L220:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #16
	beq	.L226
.L221:
	ldr	r3, .L227
	ldr	r3, [r3, #124]
	ldr	r2, [r3, #20]
	cmp	r2, #0
	subgt	r2, r2, #1
	strgt	r2, [r3, #20]
	bgt	.L219
	addne	r2, r2, #1
	strne	r2, [r3, #20]
	streq	r2, [r3, #20]
.L219:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L225:
	bl	checkButterflies
	cmp	r0, #0
	bne	.L220
	ldmfd	sp!, {r4, lr}
	b	aliceMoveLeft
.L226:
	bl	checkButterflies
	cmp	r0, #0
	bne	.L221
	ldmfd	sp!, {r4, lr}
	b	aliceMoveRight
.L228:
	.align	2
.L227:
	.word	.LANCHOR0
	.size	aliceWalk, .-aliceWalk
	.align	2
	.global	scorllHoriz
	.type	scorllHoriz, %function
scorllHoriz:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #16
	bne	.L244
.L230:
	ldr	r3, .L248
	ldr	r1, [r3, #0]
	sub	r2, r1, #2
	cmp	r2, #536
	ldrls	r2, .L248+4
	bhi	.L245
.L232:
	ldr	r2, [r2, #20]
	ldr	ip, .L248+8
	smull	r0, ip, r2, ip
	ldr	r0, [r3, #4]
	sub	r2, ip, r2, asr #31
	add	r1, r2, r1
	add	r0, r0, #1
	str	r1, [r3, #0]
	str	r0, [r3, #4]
.L231:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #32
	bne	.L246
.L234:
	ldr	r3, .L248
	ldr	r1, [r3, #0]
	sub	r2, r1, #2
	cmp	r2, #536
	ldrls	r2, .L248+4
	bls	.L236
.L247:
	ldr	r2, .L248+4
	ldr	r0, [r2, #4]
	cmp	r0, #99
	bgt	.L243
	cmp	r1, #1
	bgt	.L236
.L243:
	ldr	r3, [r2, #20]
	add	r1, r3, #3
	cmp	r3, #0
	movlt	r3, r1
	add	r0, r0, r3, asr #2
	str	r0, [r2, #4]
.L229:
	ldmfd	sp!, {r3, lr}
	bx	lr
.L245:
	ldr	r2, .L248+4
	ldr	r0, [r2, #4]
	cmp	r0, #99
	ble	.L242
	mov	ip, #536
	add	ip, ip, #2
	cmp	r1, ip
	ble	.L232
.L242:
	ldr	r3, [r2, #20]
	cmp	r3, #0
	add	r1, r3, #3
	movlt	r3, r1
	add	r0, r0, r3, asr #2
	str	r0, [r2, #4]
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #32
	beq	.L234
.L246:
	bl	checkButterflies
	cmp	r0, #0
	beq	.L229
	ldr	r3, .L248
	ldr	r1, [r3, #0]
	sub	r2, r1, #2
	cmp	r2, #536
	ldrls	r2, .L248+4
	bhi	.L247
.L236:
	ldr	r2, [r2, #20]
	ldr	ip, .L248+8
	smull	r0, ip, r2, ip
	ldr	r0, [r3, #4]
	sub	r2, ip, r2, asr #31
	add	r1, r2, r1
	sub	r0, r0, #1
	str	r1, [r3, #0]
	str	r0, [r3, #4]
	b	.L229
.L244:
	bl	checkButterflies
	cmp	r0, #0
	beq	.L231
	b	.L230
.L249:
	.align	2
.L248:
	.word	.LANCHOR1
	.word	alice
	.word	1431655766
	.size	scorllHoriz, .-scorllHoriz
	.align	2
	.global	aliceButterflies
	.type	aliceButterflies, %function
aliceButterflies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r4, .L257
	ldr	r3, [r4, #124]
	ldr	r2, [r3, #96]
	cmp	r2, #0
	bne	.L251
	ldr	r2, [r3, #76]
	cmp	r2, #0
	beq	.L250
.L251:
	ldr	r3, [r3, #16]
	cmp	r3, #0
	bne	.L256
.L250:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L256:
	mov	r1, #24832
	mov	r2, #44032
	add	r2, r2, #68
	ldr	r3, .L257+4
	ldr	r0, .L257+8
	add	r1, r1, #116
	mov	lr, pc
	bx	r3
	ldr	r2, [r4, #124]
	ldr	r3, [r2, #44]
	cmp	r3, #8
	cmpne	r3, #0
	beq	.L253
	cmp	r3, #4
	beq	.L253
	cmp	r3, #10
	cmpne	r3, #2
	beq	.L255
	cmp	r3, #6
	bne	.L250
.L255:
	mov	r3, #14
	str	r3, [r2, #44]
	mvn	r3, #27
	str	r3, [r2, #20]
	mov	r3, #0
	str	r3, [r2, #52]
	b	.L250
.L253:
	mov	r3, #12
	str	r3, [r2, #44]
	mov	r3, #0
	str	r3, [r2, #52]
	mov	r3, #28
	str	r3, [r2, #20]
	b	.L250
.L258:
	.align	2
.L257:
	.word	.LANCHOR0
	.word	playSoundB
	.word	flutter
	.size	aliceButterflies, .-aliceButterflies
	.align	2
	.global	aliceIdle
	.type	aliceIdle, %function
aliceIdle:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L262
	ldr	r3, [r3, #124]
	ldr	r2, [r3, #20]
	cmp	r2, #0
	bxne	lr
	ldr	r2, [r3, #72]
	cmp	r2, #0
	bxne	lr
	ldr	r2, [r3, #68]
	cmp	r2, #0
	bxeq	lr
	ldr	r2, [r3, #80]
	cmp	r2, #0
	bxne	lr
	ldr	r2, [r3, #48]
	cmp	r2, #0
	bne	.L261
	mov	r2, #67108864
	ldr	r2, [r2, #304]
	mvn	r2, r2
	ands	r2, r2, #16
	moveq	r1, #4
	streq	r1, [r3, #44]
	streq	r2, [r3, #52]
	bx	lr
.L261:
	cmp	r2, #2
	bxne	lr
	mov	r2, #67108864
	ldr	r2, [r2, #304]
	mvn	r2, r2
	ands	r2, r2, #32
	moveq	r1, #6
	streq	r1, [r3, #44]
	streq	r2, [r3, #52]
	bx	lr
.L263:
	.align	2
.L262:
	.word	.LANCHOR0
	.size	aliceIdle, .-aliceIdle
	.align	2
	.global	checkItemCollide
	.type	checkItemCollide, %function
checkItemCollide:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	r5, .L296
	ldr	r7, .L296+4
	add	r4, r5, #24
	add	r6, r5, #160
.L281:
	ldr	r1, [r7, #124]
	ldr	r2, [r1, #0]
	ldr	r3, [r4, #-24]
	sub	ip, r2, #5
	cmp	ip, r3
	ble	.L265
	sub	r8, r2, #4
	add	r0, r3, #32
	cmp	r8, r0
	bgt	.L265
	ldr	r8, [r1, #4]
	ldr	r0, [r4, #-20]
	sub	r9, r8, #4
	add	sl, r0, #32
	cmp	r9, sl
	bgt	.L265
	sub	r8, r8, #5
	cmp	r0, r8
	blt	.L285
.L265:
	add	r0, r2, #68
	cmp	r3, r0
	bgt	.L268
	sub	r8, r3, #37
	cmp	r2, r8
	bge	.L268
	ldr	r8, [r4, #-20]
	ldr	sl, [r1, #4]
	sub	r9, r8, #5
	cmp	sl, r9
	bge	.L268
	add	sl, sl, #36
	cmp	r8, sl
	ble	.L285
.L268:
	add	r8, r2, #31
	cmp	r3, r8
	bgt	.L270
	cmp	r2, r3
	bge	.L270
	ldr	fp, [r4, #-20]
	ldr	sl, [r1, #4]
	add	r9, fp, #26
	cmp	r9, sl
	blt	.L270
	add	sl, sl, #4
	cmp	fp, sl
	ble	.L285
.L270:
	cmp	ip, r3
	ble	.L272
	sub	sl, r2, #4
	add	ip, r3, #32
	cmp	sl, ip
	bgt	.L272
	ldr	ip, [r4, #-20]
	ldr	sl, [r1, #4]
	add	r9, ip, #15
	cmp	r9, sl
	blt	.L273
	add	r9, sl, #15
	cmp	ip, r9
	bgt	.L273
.L285:
	ldr	r3, [r5, #24]
	cmp	r3, #0
	bne	.L292
.L280:
	mov	r3, #0
	str	r3, [r5, #24]
.L267:
	add	r5, r5, #32
	cmp	r5, r6
	add	r4, r4, #32
	bne	.L281
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L273:
	sub	r9, ip, #5
	cmp	sl, r9
	blt	.L293
.L272:
	cmp	r3, r0
	bgt	.L276
	sub	ip, r3, #37
	cmp	r2, ip
	bge	.L276
	ldr	ip, [r4, #-20]
	ldr	sl, [r1, #4]
	add	r9, ip, #15
	cmp	r9, sl
	bge	.L294
.L276:
	cmp	r3, r8
	bgt	.L278
	cmp	r2, r3
	bge	.L278
	ldr	r8, [r1, #4]
	ldr	ip, [r4, #-20]
	sub	r9, r8, #4
	add	sl, ip, #32
	cmp	r9, sl
	ble	.L295
.L278:
	cmp	r3, r0
	bgt	.L267
	sub	r3, r3, #37
	cmp	r2, r3
	bge	.L267
	ldr	r2, [r1, #4]
	ldr	r3, [r4, #-20]
	sub	r0, r2, #4
	add	r1, r3, #32
	cmp	r0, r1
	bgt	.L267
	sub	r2, r2, #5
	cmp	r3, r2
	bge	.L267
	ldr	r3, [r5, #24]
	cmp	r3, #0
	beq	.L280
.L292:
	mov	r1, #4160
	mov	r2, #11008
	ldr	r0, .L296+8
	add	r1, r1, #47
	add	r2, r2, #17
	ldr	r3, .L296+12
	mov	lr, pc
	bx	r3
	b	.L280
.L294:
	add	sl, sl, #15
	cmp	ip, sl
	bgt	.L276
	b	.L285
.L295:
	sub	r8, r8, #5
	cmp	ip, r8
	bge	.L278
	b	.L285
.L293:
	add	sl, sl, #36
	cmp	ip, sl
	bgt	.L272
	b	.L285
.L297:
	.align	2
.L296:
	.word	bottles
	.word	.LANCHOR0
	.word	pickup
	.word	playSoundB
	.size	checkItemCollide, .-checkItemCollide
	.align	2
	.global	playLevelMusic
	.type	playLevelMusic, %function
playLevelMusic:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	ldr	r3, .L310
	ldr	r3, [r3, #124]
	ldr	r3, [r3, #96]
	cmp	r3, #0
	beq	.L299
	ldr	r3, .L310+4
	ldr	r3, [r3, #0]
	cmp	r3, #0
	beq	.L305
	cmp	r3, #1
	beq	.L306
	cmp	r3, #2
	bne	.L298
	mov	r1, #4718592
	mov	r2, #11008
	ldr	r0, .L310+8
	add	r1, r1, #11904
	add	r2, r2, #17
	ldr	r3, .L310+12
	mov	lr, pc
	bx	r3
	b	.L298
.L299:
	ldr	r3, .L310+4
	ldr	r3, [r3, #0]
	cmp	r3, #0
	beq	.L307
	cmp	r3, #1
	beq	.L308
	cmp	r3, #2
	beq	.L309
.L298:
	ldmfd	sp!, {r3, lr}
	bx	lr
.L307:
	mov	r1, #3031040
	mov	r2, #43776
	ldr	r0, .L310+16
	add	r1, r1, #6400
	add	r2, r2, #224
	ldr	r3, .L310+12
	mov	lr, pc
	bx	r3
	b	.L298
.L305:
	mov	r1, #3031040
	mov	r2, #19968
	ldr	r0, .L310+16
	add	r1, r1, #6400
	add	r2, r2, #32
	ldr	r3, .L310+12
	mov	lr, pc
	bx	r3
	b	.L298
.L309:
	mov	r1, #4718592
	mov	r2, #14656
	ldr	r0, .L310+8
	add	r1, r1, #11904
	add	r2, r2, #44
	ldr	r3, .L310+12
	mov	lr, pc
	bx	r3
	b	.L298
.L306:
	mov	r1, #4718592
	mov	r2, #19968
	ldr	r0, .L310+8
	add	r1, r1, #11904
	add	r2, r2, #32
	ldr	r3, .L310+12
	mov	lr, pc
	bx	r3
	b	.L298
.L308:
	mov	r1, #4718592
	mov	r2, #43776
	ldr	r0, .L310+8
	add	r1, r1, #11904
	add	r2, r2, #224
	ldr	r3, .L310+12
	mov	lr, pc
	bx	r3
	b	.L298
.L311:
	.align	2
.L310:
	.word	.LANCHOR0
	.word	level
	.word	gameSong_2
	.word	playSoundA
	.word	gameSong
	.size	playLevelMusic, .-playLevelMusic
	.align	2
	.global	finishLevel
	.type	finishLevel, %function
finishLevel:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	ldr	r3, .L323
	sub	sp, sp, #12
	mov	lr, pc
	bx	r3
	ldr	r4, .L323+4
	mov	r1, #65536
	mov	r2, #44032
	ldr	r0, .L323+8
	add	r1, r1, #616
	add	r2, r2, #68
	ldr	r3, .L323+12
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #124]
	ldr	r2, [r3, #96]
	cmp	r2, #0
	movne	r2, #1
	moveq	r2, #1
	strne	r2, [r3, #92]
	streq	r2, [r3, #88]
	bl	updateOAM
	mov	r3, #199680
	add	r3, r3, #320
.L315:
	ldr	r2, [sp, #4]
	subs	r3, r3, #1
	add	r2, r2, #1
	str	r2, [sp, #4]
	bne	.L315
	mov	r3, #199680
	add	r3, r3, #320
.L316:
	ldr	r2, [sp, #4]
	subs	r3, r3, #1
	add	r2, r2, #1
	str	r2, [sp, #4]
	bne	.L316
	ldr	r5, .L323+16
	ldr	r3, [r5, #0]
	add	r3, r3, #1
	cmp	r3, #2
	str	r3, [r5, #0]
	moveq	r3, #512
	streq	r3, [r4, #132]
	ldr	r3, .L323+20
	mov	r4, #0
	str	r4, [r3, #0]
	bl	initializeGame
	ldr	r3, .L323+24
.L318:
	mov	r2, #512	@ movhi
	strh	r2, [r3, r4]	@ movhi
	add	r4, r4, #8
	cmp	r4, #1024
	bne	.L318
	bl	initializeSprites
	bl	playLevelMusic
	ldr	r3, [r5, #0]
	cmp	r3, #3
	ldreq	r2, .L323+28
	streq	r3, [r2, #0]
	add	sp, sp, #12
	ldmfd	sp!, {r4, r5, lr}
	bx	lr
.L324:
	.align	2
.L323:
	.word	stopSound
	.word	.LANCHOR0
	.word	endlevel
	.word	playSoundB
	.word	level
	.word	.LANCHOR1
	.word	shadowOAM
	.word	state
	.size	finishLevel, .-finishLevel
	.align	2
	.global	checkForBottles
	.type	checkForBottles, %function
checkForBottles:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L332
	mov	r1, #0
	add	r0, r3, #160
.L327:
	ldr	r2, [r3, #24]
	add	r3, r3, #32
	cmp	r2, #0
	addeq	r1, r1, #1
	cmp	r3, r0
	bne	.L327
	ldr	r3, .L332+4
	ldr	r3, [r3, #0]
	cmp	r3, #2
	ldreq	r3, .L332+8
	ldrne	r3, .L332+8
	subne	r2, r1, #2
	streq	r1, [r3, #0]
	strne	r2, [r3, #0]
	cmp	r1, #5
	bxne	lr
	ldr	r3, .L332+12
	ldr	r2, [r3, #124]
	mov	r3, #436
	ldr	r1, [r2, #12]
	add	r3, r3, #1
	cmp	r1, r3
	bxle	lr
	ldr	r3, [r2, #16]
	cmp	r3, #0
	bxne	lr
	ldr	r3, [r2, #20]
	cmp	r3, #0
	bxne	lr
	b	finishLevel
.L333:
	.align	2
.L332:
	.word	bottles
	.word	level
	.word	bottlesTotal
	.word	.LANCHOR0
	.size	checkForBottles, .-checkForBottles
	.align	2
	.global	aliceRestart
	.type	aliceRestart, %function
aliceRestart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	r1, #199680
	sub	sp, sp, #12
	mov	r3, #0
	add	r1, r1, #320
.L335:
	ldr	r2, [sp, #4]
	add	r3, r3, #1
	add	r2, r2, #1
	cmp	r3, r1
	str	r2, [sp, #4]
	bne	.L335
	ldr	r1, .L343
	ldr	r2, [r1, #124]
	mov	r3, #0
	str	r3, [r2, #80]
	ldr	r2, .L343+4
.L336:
	mov	r0, #512	@ movhi
	strh	r0, [r2, r3]	@ movhi
	add	r3, r3, #8
	cmp	r3, #1024
	bne	.L336
	ldr	r3, .L343+8
	ldr	r3, [r3, #0]
	cmp	r3, #1
	movgt	r3, #180
	strgt	r3, [r1, #0]
	ble	.L342
.L338:
	ldr	r2, .L343+12
	ldr	r3, [r2, #0]
	cmp	r3, #0
	subgt	r0, r3, #1
	bicgt	r0, r0, #1
	subgt	r3, r3, #2
	rsbgt	r3, r0, r3
	strgt	r3, [r2, #0]
	ldr	r3, [r1, #124]
	mov	r2, #0
	str	r2, [r3, #52]
	mov	r2, #4
	str	r2, [r3, #44]
	bl	initializeSprites
	add	sp, sp, #12
	ldr	lr, [sp], #4
	b	playLevelMusic
.L342:
	ldr	r3, [r1, #0]
	cmp	r3, #94
	bgt	.L338
	rsb	r2, r3, #94
	bic	r2, r2, #1
	add	r3, r3, #2
	add	r2, r3, r2
	ldr	r3, .L343
	str	r2, [r3, #0]
	b	.L338
.L344:
	.align	2
.L343:
	.word	.LANCHOR0
	.word	shadowOAM
	.word	level
	.word	.LANCHOR1
	.size	aliceRestart, .-aliceRestart
	.align	2
	.global	aliceDie
	.type	aliceDie, %function
aliceDie:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r3, .L352
	sub	sp, sp, #8
	mov	lr, pc
	bx	r3
	ldr	r4, .L352+4
	mov	r2, #23808
	ldr	r0, .L352+8
	mov	r1, #23040
	add	r2, r2, #192
	ldr	r3, .L352+12
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #124]
	mov	r2, #0
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	mov	r2, #4
	str	r2, [r3, #52]
	mov	r2, #8
	str	r2, [r3, #44]
	bl	updateOAM
	mov	r3, #199680
	add	r3, r3, #320
.L346:
	ldr	r2, [sp, #4]
	subs	r3, r3, #1
	add	r2, r2, #1
	str	r2, [sp, #4]
	bne	.L346
	ldr	r3, [r4, #124]
	mov	r2, #4
	str	r2, [r3, #52]
	mov	r2, #12
	str	r2, [r3, #44]
	bl	updateOAM
	mov	r3, #199680
	add	r3, r3, #320
.L347:
	ldr	r2, [sp, #4]
	subs	r3, r3, #1
	add	r2, r2, #1
	str	r2, [sp, #4]
	bne	.L347
	mov	r3, #199680
	add	r3, r3, #320
.L348:
	ldr	r2, [sp, #4]
	subs	r3, r3, #1
	add	r2, r2, #1
	str	r2, [sp, #4]
	bne	.L348
	add	sp, sp, #8
	ldmfd	sp!, {r4, lr}
	b	aliceRestart
.L353:
	.align	2
.L352:
	.word	stopSound
	.word	.LANCHOR0
	.word	whoosh
	.word	playSoundB
	.size	aliceDie, .-aliceDie
	.align	2
	.global	gravityLvl3
	.type	gravityLvl3, %function
gravityLvl3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, .L360
	ldr	r3, [r0, #124]
	ldr	ip, [r3, #8]
	ldr	r2, [r3, #36]
	ldr	r1, [r3, #12]
	add	r2, ip, r2
	sub	r2, r2, #2
	add	r2, r1, r2, asl #9
	ldr	r1, .L360+4
	add	r2, r1, r2, asl #1
	ldrh	r1, [r2, #32]
	mov	r2, #32512
	add	r2, r2, #255
	cmp	r1, r2
	beq	.L359
	cmp	r1, #0
	bne	.L358
	ldr	r2, [r3, #0]
	cmp	r2, #96
	bxhi	lr
	ldr	r2, [r3, #68]
	cmp	r2, #0
	str	r1, [r3, #72]
	bxne	lr
	mov	r1, #1
	str	r2, [r3, #84]
	str	r2, [r3, #16]
	str	r1, [r3, #68]
	str	r2, [r3, #76]
	bx	lr
.L358:
	cmp	r1, #31
	bxne	lr
	ldr	r2, [r3, #0]
	cmp	r2, #96
	bxhi	lr
	ldr	r2, [r3, #96]
	cmp	r2, #0
	bxne	lr
	str	r2, [r3, #16]
	mov	r2, #1
	str	r2, [r3, #80]
	b	aliceDie
.L359:
	ldr	r2, [r3, #16]
	ldr	r1, [r3, #60]
	cmp	r2, r1
	ldrle	r1, [r0, #128]
	addle	r2, r2, r1
	movle	r1, #0
	strle	r2, [r3, #16]
	strle	r1, [r3, #68]
	cmp	r2, #1
	movgt	r2, #1
	strgt	r2, [r3, #72]
	bx	lr
.L361:
	.align	2
.L360:
	.word	.LANCHOR0
	.word	collisionMap_3Bitmap
	.size	gravityLvl3, .-gravityLvl3
	.align	2
	.global	gravityLvl2
	.type	gravityLvl2, %function
gravityLvl2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, .L368
	ldr	r3, [r0, #124]
	ldr	ip, [r3, #8]
	ldr	r2, [r3, #36]
	ldr	r1, [r3, #12]
	add	r2, ip, r2
	sub	r2, r2, #1
	add	r2, r1, r2, asl #9
	ldr	r1, .L368+4
	add	r2, r1, r2, asl #1
	ldrh	r1, [r2, #32]
	mov	r2, #32512
	add	r2, r2, #255
	cmp	r1, r2
	beq	.L367
	cmp	r1, #0
	bne	.L366
	ldr	r2, [r3, #0]
	cmp	r2, #96
	bxhi	lr
	ldr	r2, [r3, #68]
	cmp	r2, #0
	str	r1, [r3, #72]
	bxne	lr
	mov	r1, #1
	str	r2, [r3, #84]
	str	r2, [r3, #16]
	str	r1, [r3, #68]
	str	r2, [r3, #76]
	bx	lr
.L366:
	cmp	r1, #31
	bxne	lr
	ldr	r2, [r3, #0]
	cmp	r2, #96
	bxhi	lr
	ldr	r2, [r3, #96]
	cmp	r2, #0
	bxne	lr
	str	r2, [r3, #16]
	mov	r2, #1
	str	r2, [r3, #80]
	b	aliceDie
.L367:
	ldr	r2, [r3, #16]
	ldr	r1, [r3, #60]
	cmp	r2, r1
	ldrle	r1, [r0, #128]
	addle	r2, r2, r1
	movle	r1, #0
	strle	r2, [r3, #16]
	strle	r1, [r3, #68]
	cmp	r2, #1
	movgt	r2, #1
	strgt	r2, [r3, #72]
	bx	lr
.L369:
	.align	2
.L368:
	.word	.LANCHOR0
	.word	collisionMap_2Bitmap
	.size	gravityLvl2, .-gravityLvl2
	.align	2
	.global	checkGravity
	.type	checkGravity, %function
checkGravity:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r4, .L377
	ldr	r3, [r4, #0]
	cmp	r3, #0
	beq	.L374
	cmp	r3, #1
	beq	.L375
.L372:
	cmp	r3, #2
	beq	.L376
.L370:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L374:
	bl	gravityLvl1
	ldr	r3, [r4, #0]
	cmp	r3, #1
	bne	.L372
.L375:
	bl	gravityLvl2
	ldr	r3, [r4, #0]
	cmp	r3, #2
	bne	.L370
.L376:
	ldmfd	sp!, {r4, lr}
	b	gravityLvl3
.L378:
	.align	2
.L377:
	.word	level
	.size	checkGravity, .-checkGravity
	.align	2
	.global	cheatMode
	.type	cheatMode, %function
cheatMode:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r3, .L384
	sub	sp, sp, #8
	mov	lr, pc
	bx	r3
	ldr	r4, .L384+4
	mov	r1, #42496
	mov	r2, #44032
	ldr	r0, .L384+8
	add	r1, r1, #128
	add	r2, r2, #68
	ldr	r3, .L384+12
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #124]
	mov	r2, #1
	str	r2, [r3, #96]
	str	r2, [r3, #92]
	bl	updateOAM
	mov	r3, #199680
	add	r3, r3, #320
.L380:
	ldr	r2, [sp, #4]
	subs	r3, r3, #1
	add	r2, r2, #1
	str	r2, [sp, #4]
	bne	.L380
	mov	r3, #199680
	add	r3, r3, #320
.L381:
	ldr	r2, [sp, #4]
	subs	r3, r3, #1
	add	r2, r2, #1
	str	r2, [sp, #4]
	bne	.L381
	ldr	r2, [r4, #124]
	str	r3, [r2, #92]
	add	sp, sp, #8
	ldmfd	sp!, {r4, lr}
	b	playLevelMusic
.L385:
	.align	2
.L384:
	.word	stopSound
	.word	.LANCHOR0
	.word	cheat
	.word	playSoundB
	.size	cheatMode, .-cheatMode
	.align	2
	.global	updatePlayer
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r4, .L398
	ldr	r2, [r4, #124]
	ldr	r3, [r2, #44]
	ldr	r5, .L398+4
	cmp	r3, #0
	cmpne	r3, #2
	streq	r3, [r2, #48]
	bl	aliceIdle
	ldr	r3, [r5, #0]
	tst	r3, #1
	beq	.L388
	ldr	r2, .L398+8
	ldr	r2, [r2, #0]
	tst	r2, #1
	beq	.L394
.L388:
	tst	r3, #2
	beq	.L389
	ldr	r2, .L398+8
	ldr	r2, [r2, #0]
	tst	r2, #2
	beq	.L395
.L389:
	tst	r3, #4
	beq	.L390
	ldr	r3, .L398+8
	ldr	r3, [r3, #0]
	tst	r3, #4
	beq	.L396
.L390:
	bl	checkButterflies
	cmp	r0, #0
	beq	.L391
	ldr	r3, [r4, #124]
	ldr	r2, [r3, #20]
	cmp	r2, #0
	bne	.L391
	ldr	r2, [r3, #76]
	cmp	r2, #0
	beq	.L397
.L392:
	ldr	r2, [r3, #44]
	cmp	r2, #12
	moveq	r2, #8
	streq	r2, [r3, #44]
	beq	.L391
	cmp	r2, #14
	moveq	r2, #10
	streq	r2, [r3, #44]
.L391:
	ldmfd	sp!, {r4, r5, r6, lr}
	b	aliceWalk
.L394:
	bl	aliceJump
	ldr	r3, [r5, #0]
	b	.L388
.L397:
	ldr	r2, [r3, #96]
	cmp	r2, #0
	bne	.L392
	b	.L391
.L395:
	bl	aliceButterflies
	ldr	r3, [r5, #0]
	b	.L389
.L396:
	bl	cheatMode
	b	.L390
.L399:
	.align	2
.L398:
	.word	.LANCHOR0
	.word	oldButtons
	.word	buttons
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	game
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	sub	sp, sp, #12
	bl	playLevelMusic
	ldr	r0, .L415
	ldr	r3, [r0, #0]
	cmp	r3, #2
	bne	.L400
	ldr	r5, .L415+4
	ldr	r9, .L415+8
	ldr	sl, .L415+12
	ldr	r7, .L415+16
	ldr	r8, .L415+20
	mov	r6, #0
.L410:
	mov	r4, #67108864
	ldr	r2, [sl, #0]
	ldr	r3, [r4, #304]
	str	r2, [r9, #0]
	str	r3, [sl, #0]
	bl	updatePlayer
	bl	checkPlayerScreen
	bl	checkItemCollide
	bl	scrollVert
	bl	scorllHoriz
	bl	checkAliceCollision
	bl	checkForBottles
	ldr	r1, .L415+24
	ldr	r3, [r8, #0]
	ldr	r0, [r1, #0]
	ldr	r2, [r7, #0]
	ldr	r1, [r7, #4]
	add	r3, r3, r3, lsr #31
	add	r2, r0, r2
	add	r3, r1, r3, asr #1
	str	r2, [r7, #8]
	str	r3, [r7, #12]
	bl	checkGravity
	bl	updateOAM
	ldr	r2, [r8, #4]
	ldr	r3, .L415+28
	ldr	r0, .L415+32
	smull	fp, r1, r3, r2
	smull	r3, ip, r0, r2
	ldr	r3, [r8, #0]
	mov	fp, r3, lsr #31
	str	fp, [sp, #4]
	ldr	fp, .L415+24
	mov	r0, r2, asr #31
	add	r1, r1, r2
	ldr	r2, [fp, #0]
	ldr	fp, [sp, #4]
	rsb	r1, r0, r1, asr #4
	rsb	ip, r0, ip, asr #3
	add	r0, fp, r3
	mov	r1, r1, asl #16
	mov	ip, ip, asl #16
	mov	r0, r0, asl #15
	mov	fp, r2, asl #16
	mov	r1, r1, lsr #16
	mov	ip, ip, lsr #16
	mov	r0, r0, lsr #16
	mov	fp, fp, lsr #16
	strh	r1, [r4, #16]	@ movhi
	strh	ip, [r4, #20]	@ movhi
	ldr	r1, .L415+36
	strh	r0, [r4, #24]	@ movhi
	strh	fp, [r4, #26]	@ movhi
.L404:
	ldr	r0, [r1, #0]
	cmp	r0, #0
	blt	.L402
	ldr	ip, [r1, #-4]
	cmp	ip, #0
	blt	.L402
	cmp	r0, #240
	bgt	.L402
	cmp	ip, #160
	movle	r0, #1
	strle	r0, [r1, #24]
	ble	.L403
.L402:
	str	r6, [r1, #24]
.L403:
	add	r1, r1, #32
	cmp	r1, r5
	bne	.L404
	cmp	r3, #0
	movle	r1, #1
	strle	r1, [r8, #0]
	ble	.L406
	cmp	r3, #540
	movge	r3, #540
	strge	r3, [r8, #0]
	bge	.L406
	ldr	fp, [sp, #4]
	add	ip, fp, r3
	mov	ip, ip, asr #1
	ldr	r1, .L415+40
	rsb	ip, ip, #0
.L408:
	ldr	r0, [r1, #0]
	ldr	r3, [r1, #-4]
	add	r0, ip, r0
	str	r0, [r1, #-8]
	rsb	r3, r2, r3
	ldr	r0, .L415+44
	str	r3, [r1, #-12]
	add	r1, r1, #32
	cmp	r1, r0
	bne	.L408
.L406:
	ldr	r3, [r9, #0]
	tst	r3, #8
	beq	.L409
	ldr	r3, [sl, #0]
	tst	r3, #8
	beq	.L414
.L409:
	ldr	r3, .L415+48
	mov	lr, pc
	bx	r3
	ldr	r2, .L415
	ldr	r3, [r2, #0]
	cmp	r3, #2
	beq	.L410
.L400:
	add	sp, sp, #12
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L414:
	ldr	r1, .L415
	mov	r3, #4
	str	r3, [r1, #0]
	b	.L400
.L416:
	.align	2
.L415:
	.word	state
	.word	bottles+164
	.word	oldButtons
	.word	buttons
	.word	alice
	.word	.LANCHOR1
	.word	.LANCHOR0
	.word	-2004318071
	.word	1374389535
	.word	bottles+4
	.word	bottles+12
	.word	bottles+172
	.word	waitForVblank
	.size	game, .-game
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	mov	r2, #1024
	mov	r3, #83886080
	add	r2, r2, #4
	mov	r0, #31	@ movhi
	mov	r8, #67108864
	sub	sp, sp, #20
	strh	r2, [r8, #0]	@ movhi
	strh	r0, [r3, #2]	@ movhi
	mov	r0, #992	@ movhi
	strh	r0, [r3, #4]	@ movhi
	mvn	r1, #32768
	mov	r7, #0
	mov	r0, #31744	@ movhi
	strh	r0, [r3, #6]	@ movhi
	strh	r1, [r3, #8]	@ movhi
	strh	r7, [r3, #10]	@ movhi
	ldr	r0, .L432
	str	r1, [sp, #4]
	str	r2, [sp, #12]
	str	r3, [sp, #8]
	ldr	r6, .L432+4
	mov	lr, pc
	bx	r0
	ldr	r0, .L432+8
	mov	lr, pc
	bx	r0
	ldr	sl, .L432+12
	str	r7, [r6, #0]
	ldr	r5, .L432+16
	ldr	r9, .L432+20
	ldr	fp, .L432+24
	ldr	r4, .L432+28
.L431:
	ldr	r2, [r5, #0]
	ldr	r3, [r8, #304]
	str	r2, [sl, #0]
	mov	r2, #95
	str	r2, [fp, #0]
	str	r3, [r5, #0]
	str	r7, [r9, #0]
	bl	initializeSprites
	ldr	r3, [r6, #0]
	cmp	r3, #4
	ldrls	pc, [pc, r3, asl #2]
	b	.L431
.L425:
	.word	.L420
	.word	.L421
	.word	.L422
	.word	.L423
	.word	.L424
.L424:
	mov	r1, #15104
	mov	r2, #44032
	add	r1, r1, #28
	add	r2, r2, #68
	ldr	r3, .L432+32
	ldr	r0, .L432+36
	mov	lr, pc
	bx	r3
	ldr	r0, .L432+40
	mov	lr, pc
	bx	r0
	bl	pause
	b	.L431
.L423:
	ldr	r3, .L432+44
	mov	lr, pc
	bx	r3
	bl	finish
	ldr	r0, .L432+44
	mov	lr, pc
	bx	r0
	str	r7, [r6, #0]
	b	.L431
.L422:
	bl	game
	mov	r0, #1024
	add	r0, r0, #4
	strh	r0, [r8, #0]	@ movhi
	mov	r3, #83886080
	mov	r2, #31	@ movhi
	mov	r0, #992	@ movhi
	strh	r2, [r3, #2]	@ movhi
	strh	r0, [r3, #4]	@ movhi
	mov	r2, #31744	@ movhi
	mov	r0, #32512
	strh	r2, [r3, #6]	@ movhi
	add	r0, r0, #255
	mov	r2, #0	@ movhi
	strh	r0, [r3, #8]	@ movhi
	strh	r2, [r3, #10]	@ movhi
	b	.L431
.L421:
	bl	instructions
	ldr	r0, .L432+44
	mov	lr, pc
	bx	r0
	mov	r1, #15104
	mov	r2, #44032
	ldr	r3, .L432+32
	ldr	r0, .L432+36
	add	r1, r1, #28
	add	r2, r2, #68
	mov	lr, pc
	bx	r3
	mov	r3, #0
.L427:
	mov	r0, #512	@ movhi
	strh	r0, [r4, r3]	@ movhi
	add	r3, r3, #8
	cmp	r3, #1024
	bne	.L427
	bl	initializeSprites
	bl	initializeGame
	ldr	r2, .L432+44
	mov	lr, pc
	bx	r2
	mov	r3, #2
	str	r3, [r6, #0]
	b	.L431
.L420:
	bl	splash
	mov	r3, #1
	str	r3, [r6, #0]
	b	.L431
.L433:
	.align	2
.L432:
	.word	setupInterrupts
	.word	state
	.word	setupSounds
	.word	oldButtons
	.word	buttons
	.word	level
	.word	.LANCHOR0
	.word	shadowOAM
	.word	playSoundB
	.word	select
	.word	pauseSound
	.word	stopSound
	.size	main, .-main
	.align	2
	.global	delay
	.type	delay, %function
delay:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #199680
	sub	sp, sp, #8
	add	r3, r3, #320
.L435:
	ldr	r2, [sp, #4]
	subs	r3, r3, #1
	add	r2, r2, #1
	str	r2, [sp, #4]
	bne	.L435
	add	sp, sp, #8
	bx	lr
	.size	delay, .-delay
	.global	hOff
	.global	hOff2
	.global	vOff
	.global	heightofScreen
	.global	gravity
	.global	lev1col
	.global	lev1row
	.global	lev2col
	.global	lev2row
	.global	lev3col
	.global	lev3row
	.global	aliceptr
	.comm	oldButtons,4,4
	.comm	buttons,4,4
	.comm	soundA,28,4
	.comm	soundB,28,4
	.comm	vbCountA,4,4
	.comm	vbCountB,4,4
	.comm	bottlesTotal,4,4
	.comm	state,4,4
	.comm	level,4,4
	.comm	shadowOAM,1024,4
	.comm	alice,100,4
	.comm	bottles,160,4
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	vOff, %object
	.size	vOff, 4
vOff:
	.word	95
	.type	lev1row, %object
	.size	lev1row, 20
lev1row:
	.word	175
	.word	175
	.word	60
	.word	0
	.word	0
	.type	lev1col, %object
	.size	lev1col, 20
lev1col:
	.word	70
	.word	215
	.word	360
	.word	0
	.word	0
	.type	lev2row, %object
	.size	lev2row, 20
lev2row:
	.word	73
	.word	173
	.word	190
	.word	0
	.word	0
	.type	lev2col, %object
	.size	lev2col, 20
lev2col:
	.word	81
	.word	182
	.word	370
	.word	0
	.word	0
	.type	lev3row, %object
	.size	lev3row, 20
lev3row:
	.word	420
	.word	420
	.word	250
	.word	50
	.word	50
	.type	lev3col, %object
	.size	lev3col, 20
lev3col:
	.word	98
	.word	238
	.word	320
	.word	92
	.word	237
	.type	aliceptr, %object
	.size	aliceptr, 4
aliceptr:
	.word	alice
	.type	gravity, %object
	.size	gravity, 4
gravity:
	.word	1
	.type	heightofScreen, %object
	.size	heightofScreen, 4
heightofScreen:
	.word	256
	.bss
	.align	2
	.set	.LANCHOR1,. + 0
	.type	hOff, %object
	.size	hOff, 4
hOff:
	.space	4
	.type	hOff2, %object
	.size	hOff2, 4
hOff2:
	.space	4
	.ident	"GCC: (devkitARM release 31) 4.5.0"
