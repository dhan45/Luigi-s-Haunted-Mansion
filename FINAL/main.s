	.cpu arm7tdmi
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.arm
	.syntax divided
	.file	"main.c"
	.text
	.align	2
	.global	hideSprites
	.type	hideSprites, %function
hideSprites:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	mov	r1, #512
	ldr	r2, .L6
.L2:
	strh	r1, [r2, r3]	@ movhi
	add	r3, r3, #8
	cmp	r3, #1024
	bne	.L2
	stmfd	sp!, {r4, lr}
	mov	r3, #512
	ldr	r4, .L6+4
	mov	r2, #117440512
	ldr	r1, .L6
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldmfd	sp!, {r4, lr}
	bx	lr
.L7:
	.align	2
.L6:
	.word	shadowOAM
	.word	DMANow
	.size	hideSprites, .-hideSprites
	.align	2
	.global	goToInstruction
	.type	goToInstruction, %function
goToInstruction:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	ldr	r1, .L10
	stmfd	sp!, {r4, lr}
	mov	r3, #16384
	strh	r1, [r2, #8]	@ movhi
	ldr	r4, .L10+4
	ldr	r2, .L10+8
	ldr	r1, .L10+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L10+16
	ldr	r1, .L10+20
	mov	r0, #3
	mov	lr, pc
	bx	r4
	bl	hideSprites
	ldr	r3, .L10+24
	ldr	r2, .L10+28
	ldmfd	sp!, {r4, lr}
	str	r2, [r3]
	bx	lr
.L11:
	.align	2
.L10:
	.word	7428
	.word	DMANow
	.word	100679680
	.word	instructionsTiles
	.word	100722688
	.word	instructionsMap
	.word	state
	.word	updateInstruction
	.size	goToInstruction, .-goToInstruction
	.align	2
	.global	goToLose
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r1, #256
	ldr	r2, .L14
	stmfd	sp!, {r4, lr}
	ldr	r0, .L14+4
	strh	r1, [r3]	@ movhi
	strh	r2, [r3, #8]	@ movhi
	ldr	r3, .L14+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L14+12
	ldr	r3, .L14+16
	ldr	r2, .L14+20
	ldr	r1, .L14+24
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L14+28
	ldr	r1, .L14+32
	mov	r0, #3
	mov	lr, pc
	bx	r4
	bl	hideSprites
	ldr	r3, .L14+36
	ldr	r2, .L14+40
	ldmfd	sp!, {r4, lr}
	str	r2, [r3]
	bx	lr
.L15:
	.align	2
.L14:
	.word	7556
	.word	goodnightPal
	.word	loadPalette
	.word	DMANow
	.word	15008
	.word	100679680
	.word	goodnightTiles
	.word	100722688
	.word	goodnightMap
	.word	state
	.word	updateLose
	.size	goToLose, .-goToLose
	.align	2
	.global	goToWin
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r1, #256
	ldr	r2, .L18
	stmfd	sp!, {r4, lr}
	ldr	r0, .L18+4
	strh	r1, [r3]	@ movhi
	strh	r2, [r3, #8]	@ movhi
	ldr	r3, .L18+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L18+12
	mov	r3, #10496
	ldr	r2, .L18+16
	ldr	r1, .L18+20
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L18+24
	ldr	r1, .L18+28
	mov	r0, #3
	mov	lr, pc
	bx	r4
	bl	hideSprites
	ldr	r3, .L18+32
	ldr	r2, .L18+36
	ldmfd	sp!, {r4, lr}
	str	r2, [r3]
	bx	lr
.L19:
	.align	2
.L18:
	.word	7556
	.word	winPal
	.word	loadPalette
	.word	DMANow
	.word	100679680
	.word	winTiles
	.word	100722688
	.word	winMap
	.word	state
	.word	updateWin
	.size	goToWin, .-goToWin
	.align	2
	.global	goToPause
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #0
	ldr	r2, .L22
	stmfd	sp!, {r4, lr}
	ldr	lr, .L22+4
	strh	ip, [r2, #2]	@ movhi
	ldr	r4, .L22+8
	strh	ip, [r2, #6]	@ movhi
	mov	r3, #736
	ldr	r2, .L22+12
	ldr	r1, .L22+16
	mov	r0, #3
	str	ip, [lr, #12]
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L22+20
	ldr	r1, .L22+24
	mov	r0, #3
	mov	lr, pc
	bx	r4
	bl	hideSprites
	mov	r1, #67108864
	mov	r0, #256
	ldr	r3, .L22+28
	ldr	r2, .L22+32
	strh	r0, [r1]	@ movhi
	ldmfd	sp!, {r4, lr}
	str	r2, [r3]
	bx	lr
.L23:
	.align	2
.L22:
	.word	67109120
	.word	soundA
	.word	DMANow
	.word	100679680
	.word	pauseTiles
	.word	100722688
	.word	pauseMap
	.word	state
	.word	updatePause
	.size	goToPause, .-goToPause
	.align	2
	.global	updateLevel1
	.type	updateLevel1, %function
updateLevel1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L31
	ldr	r3, [r3]
	tst	r3, #8
	stmfd	sp!, {r4, lr}
	beq	.L25
	ldr	r3, .L31+4
	ldr	r3, [r3]
	tst	r3, #8
	beq	.L30
.L25:
	ldr	r3, .L31+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L31+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L31+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L31+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L31+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L31+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L31+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L31+36
	mov	lr, pc
	bx	r3
	ldr	r3, .L31+40
	mov	lr, pc
	bx	r3
	ldr	r3, .L31+44
	mov	lr, pc
	bx	r3
	ldr	r3, .L31+48
	mov	lr, pc
	bx	r3
	ldmfd	sp!, {r4, lr}
	bx	lr
.L30:
	bl	goToPause
	b	.L25
.L32:
	.align	2
.L31:
	.word	oldButtons
	.word	buttons
	.word	cheat
	.word	updatePosition
	.word	updateGhost
	.word	updateFlashLight
	.word	updateBattery
	.word	collision
	.word	updateScreenLocations
	.word	animateLuigi
	.word	animateBoo
	.word	timer
	.word	updateOAM
	.size	updateLevel1, .-updateLevel1
	.align	2
	.global	updateLevel2
	.type	updateLevel2, %function
updateLevel2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L40
	ldr	r3, [r3]
	tst	r3, #8
	stmfd	sp!, {r4, lr}
	beq	.L34
	ldr	r3, .L40+4
	ldr	r3, [r3]
	tst	r3, #8
	beq	.L39
.L34:
	ldr	r3, .L40+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L40+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L40+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L40+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L40+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L40+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L40+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L40+36
	mov	lr, pc
	bx	r3
	ldr	r3, .L40+40
	mov	lr, pc
	bx	r3
	ldr	r3, .L40+44
	mov	lr, pc
	bx	r3
	ldr	r3, .L40+48
	mov	lr, pc
	bx	r3
	ldr	r3, .L40+52
	mov	lr, pc
	bx	r3
	ldr	r3, .L40+56
	mov	lr, pc
	bx	r3
	ldr	r3, .L40+60
	mov	lr, pc
	bx	r3
	ldr	r3, .L40+64
	mov	lr, pc
	bx	r3
	ldmfd	sp!, {r4, lr}
	bx	lr
.L39:
	bl	goToPause
	b	.L34
.L41:
	.align	2
.L40:
	.word	oldButtons
	.word	buttons
	.word	cheat
	.word	updatePosition
	.word	updateGhost
	.word	updateGhost1
	.word	updateGhost2
	.word	updateFlashLight
	.word	updateBattery
	.word	collision
	.word	updateScreenLocations
	.word	animateLuigi
	.word	animateBoo
	.word	animateLoo
	.word	animateHoo
	.word	timer
	.word	updateOAM
	.size	updateLevel2, .-updateLevel2
	.align	2
	.global	setupSounds
	.type	setupSounds, %function
setupSounds:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	mov	r0, #128
	mov	r1, #0
	ldr	r2, .L43
	strh	r0, [r3, #132]	@ movhi
	strh	r1, [r3, #128]	@ movhi
	strh	r2, [r3, #130]	@ movhi
	bx	lr
.L44:
	.align	2
.L43:
	.word	-1266
	.size	setupSounds, .-setupSounds
	.global	__aeabi_idiv
	.global	__aeabi_i2d
	.global	__aeabi_dmul
	.global	__aeabi_ddiv
	.global	__aeabi_d2iz
	.align	2
	.global	playSoundA
	.type	playSoundA, %function
playSoundA:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r5, #0
	mov	r6, r2
	ldr	r2, .L47+8
	ldr	r2, [r2]
	ldr	r7, .L47+12
	mov	r9, r1
	mov	r8, r0
	mov	r10, r3
	str	r5, [r2, #20]
	mov	r1, r0
	ldr	r2, .L47+16
	mov	r3, #910163968
	mov	r0, #1
	ldr	r4, .L47+20
	mov	lr, pc
	bx	r4
	strh	r5, [r7, #2]	@ movhi
	mov	r1, r6
	ldr	r3, .L47+24
	mov	r0, #16777216
	mov	lr, pc
	bx	r3
	mov	r2, #128
	mov	r3, #1
	rsb	r0, r0, #0
	ldr	r4, .L47+28
	mov	r0, r0, asl #16
	mov	r0, r0, lsr #16
	strh	r0, [r7]	@ movhi
	strh	r2, [r7, #2]	@ movhi
	mov	r0, r9
	ldr	r7, .L47+32
	str	r9, [r4, #4]
	str	r6, [r4, #8]
	str	r8, [r4]
	str	r3, [r4, #12]
	str	r10, [r4, #16]
	mov	lr, pc
	bx	r7
	ldr	r8, .L47+36
	adr	r3, .L47
	ldmia	r3, {r2-r3}
	mov	lr, pc
	bx	r8
	mov	r8, r0
	mov	r0, r6
	mov	r9, r1
	mov	lr, pc
	bx	r7
	ldr	r6, .L47+40
	mov	r2, r0
	mov	r3, r1
	mov	r0, r8
	mov	r1, r9
	mov	lr, pc
	bx	r6
	ldr	r3, .L47+44
	mov	lr, pc
	bx	r3
	str	r5, [r4, #28]
	str	r0, [r4, #20]
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L48:
	.align	3
.L47:
	.word	1443109011
	.word	1078844686
	.word	dma
	.word	67109120
	.word	67109024
	.word	DMANow
	.word	__aeabi_idiv
	.word	soundA
	.word	__aeabi_i2d
	.word	__aeabi_dmul
	.word	__aeabi_ddiv
	.word	__aeabi_d2iz
	.size	playSoundA, .-playSoundA
	.align	2
	.global	goToSplash
	.type	goToSplash, %function
goToSplash:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #4352
	mov	r2, #0
	mov	r1, #67108864
	stmfd	sp!, {r4, r5, r6, lr}
	mov	r5, #396
	ldr	lr, .L51
	ldr	r3, .L51+4
	ldr	r0, .L51+8
	str	r2, [r3]
	strh	lr, [r1, #8]	@ movhi
	strh	ip, [r1]	@ movhi
	ldr	r1, .L51+12
	ldr	r4, .L51+16
	str	r2, [r3, #4]
	mov	lr, pc
	bx	r1
	mov	r3, #32768
	ldr	r2, .L51+20
	ldr	r1, .L51+24
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L51+28
	ldr	r1, .L51+32
	mov	r0, #3
	mov	lr, pc
	bx	r4
	bl	hideSprites
	mov	r3, #16384
	ldr	r2, .L51+36
	ldr	r1, .L51+40
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #256
	ldr	r2, .L51+44
	ldr	r1, .L51+48
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	ip, .L51+52
	ldr	lr, .L51+56
	ldr	r4, .L51+60
	mov	r3, #1
	ldr	r2, .L51+64
	strh	r5, [ip, #4]	@ movhi
	strh	r4, [ip]	@ movhi
	strh	lr, [ip, #2]	@ movhi
	ldr	r1, .L51+68
	ldr	r0, .L51+72
	bl	playSoundA
	ldr	r3, .L51+76
	ldr	r2, .L51+80
	ldmfd	sp!, {r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L52:
	.align	2
.L51:
	.word	7556
	.word	.LANCHOR0
	.word	splashPal
	.word	loadPalette
	.word	DMANow
	.word	100679680
	.word	splashTiles
	.word	100722688
	.word	splashMap
	.word	100728832
	.word	luigiTiles
	.word	83886592
	.word	luigiPal
	.word	shadowOAM
	.word	16464
	.word	16508
	.word	11025
	.word	969605
	.word	opening
	.word	state
	.word	updateSplash
	.size	goToSplash, .-goToSplash
	.align	2
	.global	updatePause
	.type	updatePause, %function
updatePause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r4, .L65
	ldr	r3, [r4]
	tst	r3, #8
	beq	.L54
	ldr	r2, .L65+4
	ldr	r2, [r2]
	tst	r2, #8
	beq	.L63
.L54:
	tst	r3, #4
	beq	.L53
	ldr	r3, .L65+4
	ldr	r3, [r3]
	tst	r3, #4
	beq	.L64
.L53:
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L64:
	ldmfd	sp!, {r4, r5, r6, lr}
	b	goToSplash
.L63:
	mov	r0, #128
	mov	lr, #1
	ldr	r1, .L65+8
	ldr	r3, .L65+12
	ldr	r2, .L65+16
	ldr	ip, .L65+20
	str	r2, [r3]
	ldr	r5, .L65+24
	strh	r0, [r1, #2]	@ movhi
	mov	r3, #16384
	strh	r0, [r1, #6]	@ movhi
	ldr	r2, .L65+28
	ldr	r1, .L65+32
	mov	r0, #3
	str	lr, [ip, #12]
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	ldr	r2, .L65+36
	ldr	r1, .L65+40
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #67108864
	mov	r2, #4864
	strh	r2, [r3]	@ movhi
	ldr	r3, [r4]
	b	.L54
.L66:
	.align	2
.L65:
	.word	oldButtons
	.word	buttons
	.word	67109120
	.word	state
	.word	updateLevel1
	.word	soundA
	.word	DMANow
	.word	100679680
	.word	widgetsTiles
	.word	100722688
	.word	widgetsMap
	.size	updatePause, .-updatePause
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r5, #67108864
	mov	r3, #24064
	ldr	r2, .L70
	stmfd	sp!, {r7, lr}
	strh	r3, [r5, #10]	@ movhi
	strh	r2, [r5, #8]	@ movhi
	ldr	r3, .L70+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L70+8
	mov	lr, pc
	bx	r3
	mov	ip, #128
	mov	r0, #0
	mov	lr, #1
	ldr	r3, .L70+12
	ldrh	r2, [r3]
	strh	ip, [r5, #132]	@ movhi
	ldr	ip, .L70+16
	ldrh	r1, [r5, #4]
	strh	r0, [r5, #128]	@ movhi
	strh	ip, [r5, #130]	@ movhi
	ldr	r0, .L70+20
	ldr	ip, .L70+24
	orr	r1, r1, #8
	orr	r2, r2, lr
	strh	r1, [r5, #4]	@ movhi
	mov	r4, r5
	strh	r2, [r3]	@ movhi
	strh	lr, [r3, #8]	@ movhi
	ldr	r10, .L70+28
	str	ip, [r0, #4092]
	ldr	r6, .L70+32
	ldr	r9, .L70+36
	ldr	r5, .L70+40
	ldr	r8, .L70+44
	ldr	r7, .L70+48
.L68:
	ldr	r3, [r6]
	str	r3, [r10]
	ldr	r3, [r4, #304]
	str	r3, [r6]
	ldr	ip, [r9]
	mov	lr, pc
	bx	ip
	ldrh	r3, [r5]
	ldrh	r2, [r5, #4]
	ldr	r1, .L70+52
	strh	r3, [r4, #20]	@ movhi
	mov	r0, #3
	mov	r3, #512
	strh	r2, [r4, #22]	@ movhi
	mov	r2, #117440512
	mov	lr, pc
	bx	r8
	mov	lr, pc
	bx	r7
	b	.L68
.L71:
	.align	2
.L70:
	.word	7428
	.word	hideSprites
	.word	goToSplash
	.word	67109376
	.word	-1266
	.word	50360320
	.word	interruptHandler
	.word	oldButtons
	.word	buttons
	.word	state
	.word	.LANCHOR0
	.word	DMANow
	.word	waitForVblank
	.word	shadowOAM
	.size	main, .-main
	.text
	.align	2
	.global	updateLose
	.type	updateLose, %function
updateLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L77
	ldr	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L77+4
	ldr	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	goToSplash
.L78:
	.align	2
.L77:
	.word	oldButtons
	.word	buttons
	.size	updateLose, .-updateLose
	.align	2
	.global	goToLevel1
	.type	goToLevel1, %function
goToLevel1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r2, .L81
	mov	r3, #1
	ldr	r1, .L81+4
	ldr	r0, .L81+8
	bl	playSoundA
	ldr	r3, .L81+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L81+16
	ldr	r2, .L81+20
	ldmfd	sp!, {r4, lr}
	str	r2, [r3]
	bx	lr
.L82:
	.align	2
.L81:
	.word	11025
	.word	1311052
	.word	ghostHouse
	.word	initLevel1
	.word	state
	.word	updateLevel1
	.size	goToLevel1, .-goToLevel1
	.align	2
	.global	updateWin
	.type	updateWin, %function
updateWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r4, .L95
	ldr	r3, [r4]
	tst	r3, #1
	beq	.L84
	ldr	r2, .L95+4
	ldr	r2, [r2]
	tst	r2, #1
	beq	.L85
.L84:
	tst	r3, #8
	beq	.L83
	ldr	r3, .L95+4
	ldr	r3, [r3]
	tst	r3, #8
	beq	.L94
.L83:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L85:
	bl	goToLevel1
	ldr	r3, [r4]
	b	.L84
.L94:
	ldmfd	sp!, {r4, lr}
	b	goToSplash
.L96:
	.align	2
.L95:
	.word	oldButtons
	.word	buttons
	.size	updateWin, .-updateWin
	.align	2
	.global	updateSplash
	.type	updateSplash, %function
updateSplash:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L114
	ldr	r3, [r3]
	tst	r3, #128
	beq	.L98
	ldr	r2, .L114+4
	ldr	r2, [r2]
	tst	r2, #128
	bne	.L98
	mov	ip, #396
	ldr	r2, .L114+8
	ldr	r0, .L114+12
	ldr	r1, .L114+16
	strh	ip, [r2, #4]	@ movhi
	strh	r0, [r2]	@ movhi
	strh	r1, [r2, #2]	@ movhi
.L99:
	tst	r3, #8
	bxeq	lr
.L113:
	ldr	r3, .L114+4
	ldr	r3, [r3]
	ands	r3, r3, #8
	bxne	lr
	ldr	r2, .L114+8
	ldr	r1, .L114+12
	ldrh	r2, [r2]
	cmp	r2, r1
	beq	.L112
	ldr	r1, .L114+20
	cmp	r2, r1
	beq	.L102
	bx	lr
.L98:
	tst	r3, #64
	beq	.L99
	ldr	r2, .L114+4
	ldr	r2, [r2]
	tst	r2, #64
	bne	.L99
	mov	ip, #396
	ldr	r2, .L114+8
	ldr	r0, .L114+20
	ldr	r1, .L114+24
	tst	r3, #8
	strh	ip, [r2, #4]	@ movhi
	strh	r0, [r2]	@ movhi
	strh	r1, [r2, #2]	@ movhi
	bxeq	lr
	b	.L113
.L102:
	ldr	r1, .L114+28
	ldr	r2, .L114+32
	ldr	r1, [r1]
	ldr	ip, .L114+36
	ldr	r0, .L114+40
	str	r3, [r1, #20]
	str	r3, [r1, #32]
	strh	r3, [r2, #2]	@ movhi
	strh	r3, [r2, #6]	@ movhi
	str	r3, [ip, #12]
	str	r3, [r0, #12]
	b	goToLevel1
.L112:
	b	goToInstruction
.L115:
	.align	2
.L114:
	.word	oldButtons
	.word	buttons
	.word	shadowOAM
	.word	16526
	.word	16444
	.word	16508
	.word	16464
	.word	dma
	.word	67109120
	.word	soundA
	.word	soundB
	.size	updateSplash, .-updateSplash
	.align	2
	.global	updateInstruction
	.type	updateInstruction, %function
updateInstruction:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L121
	ldr	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L121+4
	ldr	r3, [r3]
	ands	r3, r3, #8
	bxne	lr
	ldr	r1, .L121+8
	ldr	r2, .L121+12
	ldr	r1, [r1]
	ldr	ip, .L121+16
	ldr	r0, .L121+20
	str	r3, [r1, #20]
	str	r3, [r1, #32]
	strh	r3, [r2, #2]	@ movhi
	strh	r3, [r2, #6]	@ movhi
	str	r3, [ip, #12]
	str	r3, [r0, #12]
	b	goToLevel1
.L122:
	.align	2
.L121:
	.word	oldButtons
	.word	buttons
	.word	dma
	.word	67109120
	.word	soundA
	.word	soundB
	.size	updateInstruction, .-updateInstruction
	.align	2
	.global	goToLevel2
	.type	goToLevel2, %function
goToLevel2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r2, .L125
	mov	r3, #1
	ldr	r1, .L125+4
	ldr	r0, .L125+8
	bl	playSoundA
	ldr	r3, .L125+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L125+16
	ldr	r2, .L125+20
	ldmfd	sp!, {r4, lr}
	str	r2, [r3]
	bx	lr
.L126:
	.align	2
.L125:
	.word	11025
	.word	1311052
	.word	ghostHouse
	.word	initLevel2
	.word	state
	.word	updateLevel2
	.size	goToLevel2, .-goToLevel2
	.align	2
	.global	playSoundB
	.type	playSoundB, %function
playSoundB:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r5, #0
	mov	r6, r2
	ldr	r2, .L129+8
	ldr	r2, [r2]
	ldr	r7, .L129+12
	mov	r9, r1
	mov	r8, r0
	mov	r10, r3
	str	r5, [r2, #32]
	mov	r1, r0
	ldr	r2, .L129+16
	mov	r3, #910163968
	mov	r0, #2
	ldr	r4, .L129+20
	mov	lr, pc
	bx	r4
	strh	r5, [r7, #6]	@ movhi
	mov	r1, r6
	ldr	r3, .L129+24
	mov	r0, #16777216
	mov	lr, pc
	bx	r3
	mov	r2, #128
	mov	r3, #1
	rsb	r0, r0, #0
	ldr	r4, .L129+28
	mov	r0, r0, asl #16
	mov	r0, r0, lsr #16
	strh	r0, [r7, #4]	@ movhi
	strh	r2, [r7, #6]	@ movhi
	mov	r0, r9
	ldr	r7, .L129+32
	str	r9, [r4, #4]
	str	r6, [r4, #8]
	str	r8, [r4]
	str	r3, [r4, #12]
	str	r10, [r4, #16]
	mov	lr, pc
	bx	r7
	ldr	r8, .L129+36
	adr	r3, .L129
	ldmia	r3, {r2-r3}
	mov	lr, pc
	bx	r8
	mov	r8, r0
	mov	r0, r6
	mov	r9, r1
	mov	lr, pc
	bx	r7
	ldr	r6, .L129+40
	mov	r2, r0
	mov	r3, r1
	mov	r0, r8
	mov	r1, r9
	mov	lr, pc
	bx	r6
	ldr	r3, .L129+44
	mov	lr, pc
	bx	r3
	str	r5, [r4, #28]
	str	r0, [r4, #20]
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L130:
	.align	3
.L129:
	.word	1443109011
	.word	1078844686
	.word	dma
	.word	67109120
	.word	67109028
	.word	DMANow
	.word	__aeabi_idiv
	.word	soundB
	.word	__aeabi_i2d
	.word	__aeabi_dmul
	.word	__aeabi_ddiv
	.word	__aeabi_d2iz
	.size	playSoundB, .-playSoundB
	.align	2
	.global	interruptHandler
	.type	interruptHandler, %function
interruptHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	ldr	r3, .L148
	ldrh	r1, [r3, #2]
	tst	r1, #1
	strh	r2, [r3, #8]	@ movhi
	beq	.L145
	ldr	r0, .L148+4
	ldr	r3, [r0, #12]
	cmp	r3, r2
	stmfd	sp!, {r4, lr}
	beq	.L134
	ldr	r3, [r0, #28]
	ldr	r2, [r0, #20]
	add	r3, r3, #1
	cmp	r3, r2
	str	r3, [r0, #28]
	ble	.L134
	ldr	r3, [r0, #16]
	cmp	r3, #0
	bne	.L146
	ldr	r1, .L148+8
	ldr	r2, .L148+12
	ldr	r1, [r1]
	str	r3, [r0, #12]
	str	r3, [r1, #20]
	strh	r3, [r2, #2]	@ movhi
.L134:
	ldr	r0, .L148+16
	ldr	r3, [r0, #12]
	cmp	r3, #0
	beq	.L138
	ldr	r3, [r0, #28]
	ldr	r2, [r0, #20]
	add	r3, r3, #1
	cmp	r3, r2
	str	r3, [r0, #28]
	ble	.L138
	ldr	r3, [r0, #16]
	cmp	r3, #0
	bne	.L147
	ldr	r1, .L148+8
	ldr	r2, .L148+12
	ldr	r1, [r1]
	str	r3, [r0, #12]
	str	r3, [r1, #32]
	strh	r3, [r2, #6]	@ movhi
.L138:
	mov	r2, #1
	ldr	r3, .L148
	strh	r2, [r3, #2]	@ movhi
	mov	r2, #1
	ldr	r3, .L148
	ldmfd	sp!, {r4, lr}
	strh	r2, [r3, #8]	@ movhi
	bx	lr
.L145:
	mov	r2, #1
	ldr	r3, .L148
	strh	r2, [r3, #8]	@ movhi
	bx	lr
.L146:
	ldmia	r0, {r0, r1, r2}
	bl	playSoundA
	b	.L134
.L147:
	ldmia	r0, {r0, r1, r2}
	bl	playSoundB
	b	.L138
.L149:
	.align	2
.L148:
	.word	67109376
	.word	soundA
	.word	dma
	.word	67109120
	.word	soundB
	.size	interruptHandler, .-interruptHandler
	.align	2
	.global	pauseSound
	.type	pauseSound, %function
pauseSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	ldr	r2, .L151
	ldr	r1, .L151+4
	str	r3, [r1, #12]
	strh	r3, [r2, #2]	@ movhi
	strh	r3, [r2, #6]	@ movhi
	bx	lr
.L152:
	.align	2
.L151:
	.word	67109120
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
	mov	r2, #128
	mov	r0, #1
	ldr	r3, .L154
	ldr	r1, .L154+4
	strh	r2, [r3, #2]	@ movhi
	str	r0, [r1, #12]
	strh	r2, [r3, #6]	@ movhi
	bx	lr
.L155:
	.align	2
.L154:
	.word	67109120
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
	mov	r3, #0
	ldr	r2, .L157
	ldr	ip, .L157+4
	ldr	r1, [r2]
	ldr	r0, .L157+8
	ldr	r2, .L157+12
	str	r3, [r1, #20]
	str	r3, [ip, #12]
	str	r3, [r1, #32]
	str	r3, [r0, #12]
	strh	r3, [r2, #2]	@ movhi
	strh	r3, [r2, #6]	@ movhi
	bx	lr
.L158:
	.align	2
.L157:
	.word	dma
	.word	soundA
	.word	soundB
	.word	67109120
	.size	stopSound, .-stopSound
	.align	2
	.global	setupInterrupts
	.type	setupInterrupts, %function
setupInterrupts:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #67108864
	stmfd	sp!, {r4, lr}
	mov	r4, #1
	ldr	r3, .L161
	ldrh	r1, [r0, #4]
	ldrh	r2, [r3]
	ldr	lr, .L161+4
	ldr	ip, .L161+8
	orr	r2, r2, r4
	orr	r1, r1, #8
	strh	r1, [r0, #4]	@ movhi
	strh	r4, [r3, #8]	@ movhi
	strh	r2, [r3]	@ movhi
	str	lr, [ip, #4092]
	ldmfd	sp!, {r4, lr}
	bx	lr
.L162:
	.align	2
.L161:
	.word	67109376
	.word	interruptHandler
	.word	50360320
	.size	setupInterrupts, .-setupInterrupts
	.comm	shadowOAM,1024,4
	.comm	oldButtons,4,4
	.comm	buttons,4,4
	.global	signal
	.global	vOff
	.global	hOff
	.comm	soundB,32,4
	.comm	soundA,32,4
	.comm	state,4,4
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	hOff, %object
	.size	hOff, 4
hOff:
	.space	4
	.type	vOff, %object
	.size	vOff, 4
vOff:
	.space	4
	.type	signal, %object
	.size	signal, 4
signal:
	.space	4
	.ident	"GCC: (devkitARM release 45) 5.3.0"
