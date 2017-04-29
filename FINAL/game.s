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
	.file	"game.c"
	.text
	.align	2
	.global	initLevel1
	.type	initLevel1, %function
initLevel1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r2, #24064
	mov	r3, #67108864
	mov	r0, #4864
	ldr	r1, .L6
	strh	r0, [r3]	@ movhi
	strh	r1, [r3, #8]	@ movhi
	ldr	r0, .L6+4
	strh	r2, [r3, #10]	@ movhi
	ldr	r3, .L6+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L6+12
	mov	r3, #304
	mov	r2, #100663296
	ldr	r1, .L6+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	ldr	r2, .L6+20
	ldr	r1, .L6+24
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	ldr	r2, .L6+28
	ldr	r1, .L6+32
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L6+36
	ldr	r1, .L6+40
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	ldr	r2, .L6+44
	ldr	r1, .L6+48
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #256
	ldr	r2, .L6+52
	ldr	r1, .L6+56
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r1, #1
	mov	ip, #15
	mov	r9, #20480
	ldr	r3, .L6+60
	str	r1, [r3]
	ldr	r3, .L6+64
	str	ip, [r3, #36]
	mov	ip, #384
	str	r9, [r3, #16]
	mov	r9, #1280
	str	ip, [r3, #40]
	mov	ip, #1408
	mov	r2, #0
	mov	r0, #5
	str	r9, [r3, #20]
	mov	r10, #12
	mov	r9, #70
	mov	fp, #23
	str	ip, [r3, #44]
	ldr	ip, .L6+68
	str	r10, [r3, #4]
	str	r9, [r3, #32]
	str	r2, [r3, #24]
	str	r2, [r3, #28]
	str	r2, [ip]
	str	r0, [r3, #48]
	str	r1, [r3, #56]
	str	r1, [r3, #76]
	str	r1, [r3, #72]
	str	fp, [r3]
	str	r2, [r3, #52]
	str	r2, [r3, #64]
	str	r2, [r3, #68]
	str	r2, [r3, #80]
	ldr	ip, .L6+72
	ldr	r3, .L6+76
	str	r2, [ip]
	str	r0, [r3, #32]
	str	r0, [r3, #36]
	mov	ip, #30
	mov	r0, #25
	stmia	r3, {r0, ip}
	mov	r0, #23040
	mov	r8, #128
	str	r0, [r3, #16]
	mov	r0, #51200
	mov	lr, #512
	str	r2, [r3, #24]
	str	r2, [r3, #28]
	str	r2, [r3, #48]
	str	r8, [r3, #40]
	str	r8, [r3, #44]
	str	r0, [r3, #20]
	str	r1, [r3, #52]
	str	r1, [r3, #64]
	str	r2, [r3, #60]
	str	r2, [r3, #68]
	ldr	r3, .L6+80
	str	r2, [r3]
	ldr	r3, .L6+84
	str	r2, [r3, #64]
	strh	lr, [r3, #58]	@ movhi
	mov	r3, #100
	mov	r6, #16
	mov	r5, #8
	mov	r4, #104
	mov	r7, r1
	ldr	r1, .L6+88
	str	r2, [r1, #64]
	ldr	r2, .L6+92
	ldr	r10, .L6+96
	strh	lr, [r1, #58]	@ movhi
	str	r3, [r2]
	ldr	r9, .L6+100
	add	r8, r10, #140
.L2:
	str	r6, [r10]
	str	r5, [r10, #4]
	str	r4, [r10, #16]
	mov	lr, pc
	bx	r9
	mov	r3, r0, asr #31
	mov	r3, r3, lsr #23
	add	r0, r0, r3
	mov	r0, r0, asl #23
	rsb	r3, r3, r0, lsr #23
	str	r7, [r10, #24]
	str	r3, [r10, #20]
	add	r10, r10, #28
	cmp	r10, r8
	bne	.L2
	mov	lr, #5
	mov	r0, #0
	mov	r2, #10
	ldr	r3, .L6+104
	ldr	ip, .L6+108
	ldr	r1, .L6+112
	str	lr, [ip]
	str	r2, [r3]
	str	r0, [r1]
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L7:
	.align	2
.L6:
	.word	7428
	.word	bg1Pal
	.word	loadPalette
	.word	DMANow
	.word	bg1Tiles
	.word	100724736
	.word	bg1Map
	.word	100679680
	.word	widgetsTiles
	.word	100722688
	.word	widgetsMap
	.word	100728832
	.word	luigiTiles
	.word	83886592
	.word	luigiPal
	.word	level
	.word	luigi
	.word	vOff
	.word	hOff
	.word	boo
	.word	batteryCounter
	.word	hoo
	.word	loo
	.word	batteryLife
	.word	battery
	.word	rand
	.word	timer2
	.word	numberOfBatteries
	.word	timer1
	.size	initLevel1, .-initLevel1
	.align	2
	.global	initLevel2
	.type	initLevel2, %function
initLevel2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	fp, #2
	mov	r3, #0
	mov	r6, #1280
	ldr	r10, .L10
	str	fp, [r10]
	ldr	r10, .L10+4
	str	r3, [r10]
	ldr	r10, .L10+8
	str	r3, [r10]
	ldr	r10, .L10+12
	str	r3, [r10]
	ldr	r10, .L10+16
	str	r6, [r10, #20]
	mov	r6, #70
	str	r6, [r10, #32]
	mov	r6, #15
	str	r6, [r10, #36]
	mov	r6, #384
	str	r6, [r10, #40]
	mov	r6, #1408
	mov	r4, #5
	str	r6, [r10, #44]
	ldr	r6, .L10+20
	str	r4, [r10, #48]
	str	r4, [r6, #32]
	str	r4, [r6, #36]
	mov	r4, #23040
	mov	r7, #20480
	str	r4, [r6, #16]
	mov	r4, #51200
	mov	r2, #1
	mov	r1, #85
	mov	lr, #25
	mov	ip, #30
	str	r7, [r10, #16]
	mov	r9, #23
	mov	r8, #12
	mov	r7, #10
	str	r4, [r6, #20]
	ldr	r4, .L10+24
	str	r3, [r10, #24]
	str	r3, [r10, #28]
	str	r3, [r10, #52]
	str	r3, [r10, #64]
	str	r3, [r10, #68]
	str	r3, [r10, #80]
	str	r3, [r6, #24]
	str	r3, [r6, #28]
	str	lr, [r6]
	str	ip, [r6, #4]
	str	r1, [r6, #40]
	str	r9, [r10]
	str	r8, [r10, #4]
	str	r2, [r10, #56]
	str	r2, [r10, #76]
	str	r2, [r10, #72]
	str	r7, [r4]
	mov	r4, #64000
	str	r1, [r6, #44]
	str	r3, [r6, #48]
	str	r3, [r6, #60]
	str	r3, [r6, #68]
	str	r2, [r6, #52]
	str	r2, [r6, #64]
	ldr	r6, .L10+28
	str	r4, [r6, #20]
	ldr	r4, .L10+32
	mov	r0, #6
	mov	r5, #2560
	str	r1, [r6, #40]
	str	r1, [r6, #44]
	str	r1, [r4, #40]
	str	r1, [r4, #44]
	mov	r1, #25600
	str	ip, [r6, #4]
	str	ip, [r4, #4]
	ldr	ip, .L10+36
	str	r3, [r6, #24]
	str	r3, [r6, #28]
	str	r3, [r6, #48]
	str	r3, [r6, #60]
	str	r3, [r6, #68]
	str	r3, [r4, #24]
	str	r3, [r4, #28]
	str	r3, [r4, #48]
	str	r1, [r4, #20]
	str	lr, [r6]
	str	r2, [r6, #52]
	str	r2, [r6, #64]
	str	r5, [r6, #16]
	str	lr, [r4]
	str	r2, [r4, #52]
	str	r5, [r4, #16]
	str	r0, [r6, #32]
	str	r0, [r6, #36]
	str	r0, [r4, #32]
	str	r0, [r4, #36]
	str	r3, [r4, #60]
	str	r3, [r4, #68]
	str	r3, [ip]
	mov	r3, #100
	ldr	r1, .L10+40
	str	r2, [r4, #64]
	str	r3, [r1]
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L11:
	.align	2
.L10:
	.word	level
	.word	timer1
	.word	vOff
	.word	hOff
	.word	luigi
	.word	boo
	.word	timer2
	.word	loo
	.word	hoo
	.word	batteryCounter
	.word	batteryLife
	.size	initLevel2, .-initLevel2
	.global	__aeabi_idiv
	.align	2
	.global	updatePosition
	.type	updatePosition, %function
updatePosition:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	ldr	r4, .L62
	ldr	r3, [r4, #72]
	cmp	r3, #0
	beq	.L12
	ldr	r6, .L62+4
	ldr	r5, [r6]
	ldr	lr, [r4, #28]
	cmp	r5, #272
	movge	r0, #0
	movlt	r0, #1
	cmp	lr, #10
	movle	r0, #0
	ldr	r1, [r4, #24]
	ldr	r3, [r4, #32]
	ldr	r2, [r4, #16]
	add	ip, r1, r3
	ldr	r3, [r4, #20]
	add	r2, ip, r2
	add	r3, lr, r3
	cmp	r0, #0
	str	ip, [r4, #24]
	str	r2, [r4, #16]
	str	r3, [r4, #20]
	beq	.L15
	ldr	r1, [r4, #12]
	cmp	r1, #199
	ble	.L16
	mov	r0, #2
	ldr	r1, .L62+8
	add	r5, r5, #3
	str	r5, [r6]
	str	r0, [r1]
.L15:
	cmp	r5, #0
	movle	r0, #0
	movgt	r0, #1
	cmn	lr, #10
	movge	r0, #0
	cmp	r0, #0
	beq	.L18
	ldr	r1, [r4, #12]
	cmp	r1, #40
	bgt	.L19
	mov	r0, #2
	sub	r1, r5, #3
	str	r1, [r6]
	ldr	r1, .L62+8
	str	r0, [r1]
.L18:
	mov	r2, r2, asr #8
	cmp	r2, #87
	bgt	.L59
.L21:
	cmp	r2, #0
	movle	r2, #0
	rsble	r1, ip, #0
	strle	r1, [r4, #24]
	strle	r2, [r4, #16]
.L22:
	movs	r3, r3, asr #8
	movmi	r1, #0
	movmi	r3, r1
	rsbmi	r2, lr, #0
	strmi	r2, [r4, #28]
	ldr	r2, [r4, #4]
	rsb	r2, r2, #508
	add	r2, r2, #2
	strmi	r1, [r4, #20]
	cmp	r3, r2
	ldr	r3, .L62
	ldrge	r1, [r3, #28]
	movge	r2, r2, asl #8
	rsbge	r1, r1, #0
	strge	r2, [r3, #20]
	strge	r1, [r3, #28]
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #128
	beq	.L32
	ldr	r3, .L62+12
	ldr	r3, [r3]
	tst	r3, #1
	beq	.L30
	ldr	r3, .L62+16
	ldr	r3, [r3]
	ands	r3, r3, #1
	bne	.L30
	ldr	r1, [r4, #48]
	ldr	r0, [r4, #24]
	rsb	r2, r1, #0
	cmp	r0, r2
	movle	r2, #0
	movgt	r2, #1
	cmp	r0, r1
	movge	r2, #0
	cmp	r2, #0
	ldr	ip, .L62
	bne	.L60
.L30:
	mov	r3, #67108864
	ldr	r2, [r3, #304]
	tst	r2, #32
	bne	.L31
	mov	r1, #0
	ldr	r3, [r4, #40]
	ldr	r2, [r4, #28]
	rsb	r3, r3, #0
	cmp	r2, r3
	str	r1, [r4, #76]
	ldr	r3, .L62
	ldrgt	r1, [r3, #36]
	rsbgt	r2, r1, r2
	strgt	r2, [r3, #28]
.L12:
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	bx	lr
.L59:
	mov	r1, #22528
	mov	r2, #0
	str	r1, [r4, #16]
	str	r2, [r4, #24]
	b	.L22
.L32:
	ldr	r1, [r4, #24]
	ldr	r6, [r4, #48]
	cmp	r1, r6
	movle	r3, #0
	movgt	r3, #1
	rsb	r7, r6, #0
	cmp	r1, r7
	movge	r1, r3
	orrlt	r1, r3, #1
	ldr	r5, [r4, #28]
	cmp	r1, #0
	moveq	r1, #1
	movne	r1, #50
	cmp	r5, #0
	ldr	r8, .L62
	blt	.L61
	beq	.L28
	ldr	r3, .L62+20
	ldr	r0, [r8, #36]
	mov	lr, pc
	bx	r3
	rsb	r5, r0, r5
	str	r5, [r8, #28]
.L28:
	cmp	r5, r6
	movge	r6, #0
	movlt	r6, #1
	cmp	r5, r7
	movle	r6, #0
	cmp	r6, #0
	movne	r3, #0
	strne	r3, [r4, #28]
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	bx	lr
.L31:
	ldr	r3, [r3, #304]
	tst	r3, #16
	bne	.L32
	mov	r2, #1
	ldr	r3, [r4, #28]
	ldr	r1, [r4, #40]
	cmp	r3, r1
	str	r2, [r4, #76]
	ldr	r2, .L62
	ldrlt	r1, [r2, #36]
	addlt	r3, r1, r3
	strlt	r3, [r2, #28]
	b	.L12
.L19:
	cmp	r1, #150
	movle	r0, #1
	movgt	r0, #0
	suble	r1, r5, #2
	strle	r1, [r6]
	mov	r2, r2, asr #8
	ldr	r1, .L62+8
	cmp	r2, #87
	str	r0, [r1]
	ble	.L21
	b	.L59
.L61:
	ldr	r3, .L62+20
	ldr	r0, [r8, #36]
	mov	lr, pc
	bx	r3
	add	r5, r5, r0
	str	r5, [r8, #28]
	b	.L28
.L16:
	cmp	r1, #89
	movgt	r0, #1
	movle	r0, #0
	ldrgt	r1, .L62+8
	ldrle	r1, .L62+8
	addgt	r5, r5, #2
	strgt	r5, [r6]
	str	r0, [r1]
	b	.L15
.L60:
	ldr	lr, [ip, #44]
	ldr	r2, .L62+24
	rsb	lr, lr, #0
	ldr	r1, .L62+28
	ldr	r0, .L62+32
	ldr	r4, .L62+36
	str	lr, [ip, #24]
	mov	lr, pc
	bx	r4
	b	.L12
.L63:
	.align	2
.L62:
	.word	luigi
	.word	hOff
	.word	scale
	.word	oldButtons
	.word	buttons
	.word	__aeabi_idiv
	.word	11025
	.word	6406
	.word	jump
	.word	playSoundB
	.size	updatePosition, .-updatePosition
	.align	2
	.global	updateGhost
	.type	updateGhost, %function
updateGhost:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L113
	ldr	r3, [r0, #68]
	cmp	r3, #0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, lr}
	beq	.L99
	ldr	r3, .L113+4
	ldr	r3, [r3]
	cmp	r3, #0
	ble	.L99
	ldr	ip, [r0, #20]
	ldr	r3, .L113+8
	ldr	r2, [r0, #4]
	mov	ip, ip, asr #8
	ldr	r1, [r3, #20]
	add	r2, ip, r2
	add	r2, r2, #100
	mov	r1, r1, asr #8
	cmp	r2, r1
	movge	r2, #1
	movlt	r2, #0
	cmp	ip, r1
	movge	r2, #0
	cmp	r2, #0
	beq	.L66
	ldr	r2, [r0, #76]
	cmp	r2, #1
	beq	.L109
.L66:
	ldr	r2, [r3, #4]
	sub	lr, ip, #100
	add	r2, r1, r2
	cmp	lr, r2
	movle	r2, #1
	movgt	r2, #0
	cmp	ip, r1
	movle	r2, #0
	cmp	r2, #0
	ldr	r2, .L113+8
	beq	.L65
	ldr	r1, [r0, #76]
	cmp	r1, #0
	bne	.L65
	ldr	r0, .L113+12
	ldr	r3, .L113+16
	str	r1, [r0]
	str	r1, [r2, #64]
	str	r1, [r3]
.L64:
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L99:
	ldr	r3, .L113+8
.L65:
	ldr	r2, [r0, #80]
	cmp	r2, #0
	movne	r2, #0
	strne	r2, [r3, #64]
	bne	.L64
	ldr	lr, .L113+12
	ldr	r2, .L113+20
	ldr	ip, [lr]
	smull	r1, r2, ip, r2
	mov	r1, ip, asr #31
	rsb	r2, r1, r2, asr #5
	rsb	r1, r2, r2, lsl #5
	add	r2, r2, r1, lsl #2
	subs	r2, ip, r2, asl #2
	beq	.L110
	ldr	r2, [lr]
	add	r2, r2, #1
	str	r2, [lr]
.L70:
	ldr	r2, [r3, #64]
	cmp	r2, #0
	beq	.L64
.L71:
	ldr	r4, [r3, #24]
	cmp	r4, #0
	movgt	r8, #0
	movle	r8, #1
	ldr	r1, [r3, #16]
	ldr	r5, [r0, #16]
	add	r1, r4, r1
	mov	r6, r1, asr #8
	add	ip, r6, #14
	mov	r5, r5, asr #8
	cmp	r5, ip
	movle	ip, #0
	andgt	ip, r8, #1
	ldr	r2, [r3, #20]
	ldr	lr, [r3, #28]
	cmp	ip, #0
	add	r2, lr, r2
	str	r1, [r3, #16]
	str	r2, [r3, #20]
	ldr	r7, .L113+8
	ldr	ip, .L113
	bne	.L104
	ldr	ip, [ip]
	add	ip, r5, ip
	sub	ip, ip, #7
	cmp	r6, ip
	mvn	r9, r4
	movlt	ip, #0
	movge	ip, #1
	mov	r9, r9, lsr #31
	tst	r9, ip
	beq	.L111
.L106:
	ldr	ip, [r7, #44]
	rsb	ip, ip, #0
	cmp	r4, ip
	ldrgt	ip, [r7, #32]
	rsbgt	r4, ip, r4
	strgt	r4, [r7, #24]
.L73:
	ldr	ip, [r0, #20]
	ldr	r0, [r0, #4]
	mov	ip, ip, asr #8
	add	r0, ip, r0
	mov	r5, r2, asr #8
	cmp	r0, r5
	movge	r0, #0
	movlt	r0, #1
	cmp	lr, #0
	movle	r6, #0
	andgt	r6, r0, #1
	cmp	r6, #0
	beq	.L76
	ldr	r0, [r3, #40]
	rsb	r0, r0, #0
	cmp	lr, r0
	ldr	r0, .L113+8
	ldrgt	ip, [r0, #36]
	rsbgt	lr, ip, lr
	strgt	lr, [r0, #28]
.L77:
	add	r1, r1, r4
	add	r2, r2, lr
	str	r1, [r3, #16]
	str	r2, [r3, #20]
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L110:
	ldr	r4, .L113+16
	ldr	r1, [r4]
	add	r1, r1, #1
	str	r1, [r4]
	str	r2, [lr]
	ldr	r2, .L113+24
	ldr	ip, [r4]
	smull	r1, r2, ip, r2
	mov	r1, ip, asr #31
	add	r2, r2, ip
	rsb	r2, r1, r2, asr #4
	rsb	r2, r2, r2, lsl #4
	subs	r2, ip, r2, asl #1
	bne	.L70
	mov	r1, #1
	str	r2, [r4]
	str	r1, [r3, #64]
	b	.L71
.L76:
	ldr	r6, [r3, #4]
	add	r5, r5, r6
	cmp	ip, r5
	movle	ip, #0
	movgt	ip, #1
	ands	r5, ip, lr, lsr #31
	ldr	r5, .L113+8
	bne	.L108
	cmp	lr, #0
	movgt	r0, #0
	andle	r0, r0, #1
	cmp	r0, #0
	bne	.L112
	cmp	lr, #0
	movlt	ip, #0
	andge	ip, ip, #1
	cmp	ip, #0
	beq	.L77
.L108:
	ldr	r0, [r5, #40]
	cmp	lr, r0
	ldrlt	r0, [r5, #36]
	addlt	lr, lr, r0
	strlt	lr, [r5, #28]
	b	.L77
.L111:
	add	r6, r6, #18
	cmp	r5, r6
	movle	r6, #0
	andgt	r6, r9, #1
	cmp	r6, #0
	beq	.L75
.L104:
	ldr	ip, [r7, #44]
	cmp	r4, ip
	ldrlt	ip, [r7, #32]
	addlt	r4, r4, ip
	strlt	r4, [r7, #24]
	b	.L73
.L75:
	tst	r8, ip
	beq	.L73
	b	.L106
.L109:
	mov	r2, #0
	ldr	r0, .L113+12
	ldr	r1, .L113+16
	str	r2, [r0]
	str	r2, [r3, #64]
	str	r2, [r1]
	b	.L64
.L112:
	ldr	r0, [r5, #40]
	rsb	r0, r0, #0
	cmp	lr, r0
	ldrgt	r0, [r5, #36]
	rsbgt	lr, r0, lr
	strgt	lr, [r5, #28]
	b	.L77
.L114:
	.align	2
.L113:
	.word	luigi
	.word	batteryLife
	.word	boo
	.word	counter1
	.word	counter2
	.word	274877907
	.word	-2004318071
	.size	updateGhost, .-updateGhost
	.align	2
	.global	updateGhost1
	.type	updateGhost1, %function
updateGhost1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L164
	ldr	r3, [r0, #68]
	cmp	r3, #0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, lr}
	beq	.L150
	ldr	r3, .L164+4
	ldr	r3, [r3]
	cmp	r3, #0
	ble	.L150
	ldr	ip, [r0, #20]
	ldr	r3, .L164+8
	ldr	r2, [r0, #4]
	mov	ip, ip, asr #8
	ldr	r1, [r3, #20]
	add	r2, ip, r2
	add	r2, r2, #100
	mov	r1, r1, asr #8
	cmp	r2, r1
	movge	r2, #1
	movlt	r2, #0
	cmp	ip, r1
	movge	r2, #0
	cmp	r2, #0
	beq	.L117
	ldr	r2, [r0, #76]
	cmp	r2, #1
	beq	.L160
.L117:
	ldr	r2, [r3, #4]
	sub	lr, ip, #100
	add	r2, r1, r2
	cmp	lr, r2
	movle	r2, #1
	movgt	r2, #0
	cmp	ip, r1
	movle	r2, #0
	cmp	r2, #0
	ldr	r2, .L164+8
	beq	.L116
	ldr	r1, [r0, #76]
	cmp	r1, #0
	bne	.L116
	ldr	r0, .L164+12
	ldr	r3, .L164+16
	str	r1, [r0]
	str	r1, [r2, #64]
	str	r1, [r3]
.L115:
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L150:
	ldr	r3, .L164+8
.L116:
	ldr	r2, [r0, #80]
	cmp	r2, #0
	movne	r2, #0
	strne	r2, [r3, #64]
	bne	.L115
	ldr	lr, .L164+12
	ldr	r2, .L164+20
	ldr	ip, [lr]
	smull	r1, r2, ip, r2
	mov	r1, ip, asr #31
	rsb	r2, r1, r2, asr #5
	rsb	r1, r2, r2, lsl #5
	add	r2, r2, r1, lsl #2
	subs	r2, ip, r2, asl #2
	beq	.L161
	ldr	r2, [lr]
	add	r2, r2, #1
	str	r2, [lr]
.L121:
	ldr	r2, [r3, #64]
	cmp	r2, #0
	beq	.L115
.L122:
	ldr	r4, [r3, #24]
	cmp	r4, #0
	movgt	r8, #0
	movle	r8, #1
	ldr	r1, [r3, #16]
	ldr	r5, [r0, #16]
	add	r1, r4, r1
	mov	r6, r1, asr #8
	add	ip, r6, #10
	mov	r5, r5, asr #8
	cmp	r5, ip
	movle	ip, #0
	andgt	ip, r8, #1
	ldr	r2, [r3, #20]
	ldr	lr, [r3, #28]
	cmp	ip, #0
	add	r2, lr, r2
	str	r1, [r3, #16]
	str	r2, [r3, #20]
	ldr	r7, .L164+8
	ldr	ip, .L164
	bne	.L155
	ldr	ip, [ip]
	add	ip, r5, ip
	sub	ip, ip, #3
	cmp	r6, ip
	mvn	r9, r4
	movlt	ip, #0
	movge	ip, #1
	mov	r9, r9, lsr #31
	tst	r9, ip
	beq	.L162
.L157:
	ldr	ip, [r7, #44]
	rsb	ip, ip, #0
	cmp	r4, ip
	ldrgt	ip, [r7, #32]
	rsbgt	r4, ip, r4
	strgt	r4, [r7, #24]
.L124:
	ldr	ip, [r0, #20]
	ldr	r0, [r0, #4]
	mov	ip, ip, asr #8
	add	r0, ip, r0
	mov	r5, r2, asr #8
	cmp	r0, r5
	movge	r0, #0
	movlt	r0, #1
	cmp	lr, #0
	movle	r6, #0
	andgt	r6, r0, #1
	cmp	r6, #0
	beq	.L127
	ldr	r0, [r3, #40]
	rsb	r0, r0, #0
	cmp	lr, r0
	ldr	r0, .L164+8
	ldrgt	ip, [r0, #36]
	rsbgt	lr, ip, lr
	strgt	lr, [r0, #28]
.L128:
	add	r1, r1, r4
	add	r2, r2, lr
	str	r1, [r3, #16]
	str	r2, [r3, #20]
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L161:
	ldr	r4, .L164+16
	ldr	r1, [r4]
	add	r1, r1, #1
	str	r1, [r4]
	str	r2, [lr]
	ldr	r2, .L164+24
	ldr	ip, [r4]
	smull	r1, r2, ip, r2
	mov	r1, ip, asr #31
	add	r2, r2, ip
	rsb	r2, r1, r2, asr #4
	rsb	r2, r2, r2, lsl #4
	subs	r2, ip, r2, asl #1
	bne	.L121
	mov	r1, #1
	str	r2, [r4]
	str	r1, [r3, #64]
	b	.L122
.L127:
	ldr	r6, [r3, #4]
	add	r5, r5, r6
	cmp	ip, r5
	movle	ip, #0
	movgt	ip, #1
	ands	r5, ip, lr, lsr #31
	ldr	r5, .L164+8
	bne	.L159
	cmp	lr, #0
	movgt	r0, #0
	andle	r0, r0, #1
	cmp	r0, #0
	bne	.L163
	cmp	lr, #0
	movlt	ip, #0
	andge	ip, ip, #1
	cmp	ip, #0
	beq	.L128
.L159:
	ldr	r0, [r5, #40]
	cmp	lr, r0
	ldrlt	r0, [r5, #36]
	addlt	lr, lr, r0
	strlt	lr, [r5, #28]
	b	.L128
.L162:
	add	r6, r6, #14
	cmp	r5, r6
	movle	r6, #0
	andgt	r6, r9, #1
	cmp	r6, #0
	beq	.L126
.L155:
	ldr	ip, [r7, #44]
	cmp	r4, ip
	ldrlt	ip, [r7, #32]
	addlt	r4, r4, ip
	strlt	r4, [r7, #24]
	b	.L124
.L126:
	tst	r8, ip
	beq	.L124
	b	.L157
.L160:
	mov	r2, #0
	ldr	r0, .L164+12
	ldr	r1, .L164+16
	str	r2, [r0]
	str	r2, [r3, #64]
	str	r2, [r1]
	b	.L115
.L163:
	ldr	r0, [r5, #40]
	rsb	r0, r0, #0
	cmp	lr, r0
	ldrgt	r0, [r5, #36]
	rsbgt	lr, r0, lr
	strgt	lr, [r5, #28]
	b	.L128
.L165:
	.align	2
.L164:
	.word	luigi
	.word	batteryLife
	.word	loo
	.word	counter3
	.word	counter4
	.word	274877907
	.word	-2004318071
	.size	updateGhost1, .-updateGhost1
	.align	2
	.global	updateGhost2
	.type	updateGhost2, %function
updateGhost2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L218
	ldr	r3, [r0, #68]
	cmp	r3, #0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, lr}
	beq	.L201
	ldr	r3, .L218+4
	ldr	r3, [r3]
	cmp	r3, #0
	ble	.L201
	ldr	ip, [r0, #20]
	ldr	r3, .L218+8
	ldr	r2, [r0, #4]
	mov	ip, ip, asr #8
	ldr	r1, [r3, #20]
	add	r2, ip, r2
	add	r2, r2, #100
	mov	r1, r1, asr #8
	cmp	r2, r1
	movge	r2, #1
	movlt	r2, #0
	cmp	ip, r1
	movge	r2, #0
	cmp	r2, #0
	beq	.L168
	ldr	r2, [r0, #76]
	cmp	r2, #1
	beq	.L214
.L168:
	ldr	r2, [r3, #4]
	sub	lr, ip, #100
	add	r2, r1, r2
	cmp	lr, r2
	movle	r2, #1
	movgt	r2, #0
	cmp	ip, r1
	movle	r2, #0
	cmp	r2, #0
	ldr	r2, .L218+8
	beq	.L167
	ldr	r1, [r0, #76]
	cmp	r1, #0
	bne	.L167
	ldr	r0, .L218+12
	ldr	r3, .L218+16
	str	r1, [r0]
	str	r1, [r2, #64]
	str	r1, [r3]
.L166:
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L201:
	ldr	r3, .L218+8
.L167:
	ldr	r2, [r0, #80]
	cmp	r2, #0
	movne	r2, #0
	strne	r2, [r3, #64]
	bne	.L166
	ldr	lr, .L218+12
	ldr	r2, .L218+20
	ldr	ip, [lr]
	smull	r1, r2, ip, r2
	mov	r1, ip, asr #31
	rsb	r2, r1, r2, asr #5
	rsb	r1, r2, r2, lsl #5
	add	r2, r2, r1, lsl #2
	subs	r2, ip, r2, asl #2
	beq	.L215
	ldr	r2, [lr]
	add	r2, r2, #1
	str	r2, [lr]
.L172:
	ldr	r2, [r3, #64]
	cmp	r2, #0
	beq	.L166
.L173:
	ldr	r4, [r3, #24]
	cmp	r4, #0
	movgt	r8, #0
	movle	r8, #1
	ldr	r1, [r3, #16]
	ldr	r5, [r0, #16]
	add	r1, r4, r1
	mov	r6, r1, asr #8
	add	ip, r6, #10
	mov	r5, r5, asr #8
	cmp	r5, ip
	movle	ip, #0
	andgt	ip, r8, #1
	ldr	r2, [r3, #20]
	ldr	lr, [r3, #28]
	cmp	ip, #0
	add	r2, lr, r2
	str	r1, [r3, #16]
	str	r2, [r3, #20]
	ldr	r7, .L218+8
	ldr	ip, .L218
	bne	.L207
	ldr	ip, [ip]
	add	ip, r5, ip
	sub	ip, ip, #3
	cmp	r6, ip
	mvn	r9, r4
	movlt	ip, #0
	movge	ip, #1
	mov	r9, r9, lsr #31
	tst	r9, ip
	beq	.L216
.L209:
	ldr	ip, [r7, #44]
	rsb	ip, ip, #0
	cmp	r4, ip
	ldrgt	ip, [r7, #32]
	rsbgt	r4, ip, r4
	strgt	r4, [r7, #24]
.L175:
	ldr	r0, [r0, #20]
	ldr	ip, [r3, #4]
	mov	r0, r0, asr #8
	mov	r5, r2, asr #8
	add	r6, r0, #70
	add	ip, r5, ip
	mvn	r7, lr
	cmp	lr, #0
	cmpge	ip, r6
	mov	r7, r7, lsr #31
	ldr	r6, .L218+8
	ble	.L217
.L213:
	ldr	r0, [r6, #40]
	rsb	r0, r0, #0
	cmp	lr, r0
	ldrgt	r0, [r6, #36]
	rsbgt	lr, r0, lr
	strgt	lr, [r6, #28]
.L179:
	add	r1, r1, r4
	add	r2, r2, lr
	str	r1, [r3, #16]
	str	r2, [r3, #20]
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L215:
	ldr	r4, .L218+16
	ldr	r1, [r4]
	add	r1, r1, #1
	str	r1, [r4]
	str	r2, [lr]
	ldr	r2, .L218+24
	ldr	ip, [r4]
	smull	r1, r2, ip, r2
	mov	r1, ip, asr #31
	add	r2, r2, ip
	rsb	r2, r1, r2, asr #4
	rsb	r2, r2, r2, lsl #4
	subs	r2, ip, r2, asl #1
	bne	.L172
	mov	r1, #1
	str	r2, [r4]
	str	r1, [r3, #64]
	b	.L173
.L217:
	cmp	lr, #0
	sub	r0, r0, #70
	movgt	r8, #0
	movle	r8, #1
	cmp	lr, #0
	cmple	r5, r0
	blt	.L211
	ldr	r0, .L218+28
	cmp	ip, r0
	movgt	ip, #0
	andle	ip, r7, #1
	cmp	ip, #0
	beq	.L181
.L211:
	ldr	r0, [r6, #40]
	cmp	lr, r0
	ldrlt	r0, [r6, #36]
	addlt	lr, lr, r0
	strlt	lr, [r6, #28]
	b	.L179
.L216:
	add	r6, r6, #14
	cmp	r5, r6
	movle	r6, #0
	andgt	r6, r9, #1
	cmp	r6, #0
	beq	.L177
.L207:
	ldr	ip, [r7, #44]
	cmp	r4, ip
	ldrlt	ip, [r7, #32]
	addlt	r4, r4, ip
	strlt	r4, [r7, #24]
	b	.L175
.L181:
	cmp	r5, #30
	movle	r5, #0
	andgt	r5, r8, #1
	cmp	r5, #0
	beq	.L179
	b	.L213
.L177:
	tst	r8, ip
	beq	.L175
	b	.L209
.L214:
	mov	r2, #0
	ldr	r0, .L218+12
	ldr	r1, .L218+16
	str	r2, [r0]
	str	r2, [r3, #64]
	str	r2, [r1]
	b	.L166
.L219:
	.align	2
.L218:
	.word	luigi
	.word	batteryLife
	.word	hoo
	.word	counter5
	.word	counter6
	.word	274877907
	.word	-2004318071
	.word	474
	.size	updateGhost2, .-updateGhost2
	.align	2
	.global	updateFlashLight
	.type	updateFlashLight, %function
updateFlashLight:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L228
	ldr	r3, [r3]
	tst	r3, #2
	bxeq	lr
	ldr	r3, .L228+4
	ldr	r3, [r3]
	ands	r3, r3, #2
	bxne	lr
	ldr	r1, .L228+8
	ldr	r2, [r1, #68]
	cmp	r2, #0
	beq	.L227
	cmp	r2, #3
	beq	.L223
	bx	lr
.L227:
	mov	r3, #3
	str	r3, [r1, #68]
	bx	lr
.L223:
	str	r3, [r1, #68]
	bx	lr
.L229:
	.align	2
.L228:
	.word	oldButtons
	.word	buttons
	.word	luigi
	.size	updateFlashLight, .-updateFlashLight
	.align	2
	.global	updateBattery
	.type	updateBattery, %function
updateBattery:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L235
	ldr	r3, [r2]
	cmp	r3, #0
	bxle	lr
	ldr	r1, .L235+4
	ldr	r1, [r1, #68]
	cmp	r1, #3
	bxne	lr
	ldr	r0, .L235+8
	ldr	r1, [r0]
	add	r1, r1, #1
	ands	ip, r1, #1
	subeq	r3, r3, #1
	strne	r1, [r0]
	streq	r3, [r2]
	streq	ip, [r0]
	bx	lr
.L236:
	.align	2
.L235:
	.word	batteryLife
	.word	luigi
	.word	batteryCounter
	.size	updateBattery, .-updateBattery
	.align	2
	.global	collision
	.type	collision, %function
collision:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r1, .L282
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r4, .L282+4
	ldr	r2, [r1, #16]
	ldr	r3, [r4, #16]
	mov	r2, r2, asr #8
	add	r0, r2, #20
	mov	r3, r3, asr #8
	cmp	r3, r0
	bgt	.L238
	add	r0, r3, #20
	cmp	r2, r0
	ble	.L277
.L238:
	ldr	r1, .L282+8
	ldr	r2, [r1, #16]
	mov	r2, r2, asr #8
	add	r0, r2, #20
	cmp	r0, r3
	blt	.L239
	add	r0, r3, #20
	cmp	r2, r0
	ble	.L278
.L239:
	ldr	r1, .L282+12
	ldr	r2, [r1, #16]
	mov	r2, r2, asr #8
	add	r0, r2, #20
	cmp	r0, r3
	blt	.L240
	add	r3, r3, #20
	cmp	r2, r3
	ble	.L279
.L240:
	ldr	r3, .L282+16
	ldr	r0, [r3]
	cmp	r0, #0
	ble	.L249
	mov	r7, #0
	mov	r10, r7
	ldr	ip, [r4, #16]
	ldr	r5, [r4, #20]
	ldr	r8, .L282+20
	ldr	r6, [r4, #4]
	ldr	r3, .L282+24
	mov	ip, ip, asr #8
	rsb	r0, r0, r0, lsl #3
	mov	r5, r5, asr #8
	ldr	r9, [r8]
	add	lr, ip, #7
	add	r6, r5, r6
	add	ip, ip, #32
	add	r0, r3, r0, lsl #2
.L247:
	ldr	r1, [r3, #16]
	ldr	r2, [r3]
	add	r2, r1, r2
	cmp	r2, lr
	ble	.L245
	cmp	r1, ip
	bgt	.L245
	ldr	r1, [r3, #20]
	ldr	r2, [r3, #4]
	add	r2, r1, r2
	cmp	r5, r2
	bgt	.L245
	cmp	r1, r6
	bgt	.L245
	ldr	r2, [r3, #24]
	cmp	r2, #0
	beq	.L245
	add	r9, r9, #50
	cmp	r9, #100
	mov	r7, #1
	movgt	r9, #100
	str	r10, [r3, #24]
.L245:
	add	r3, r3, #28
	cmp	r3, r0
	bne	.L247
	cmp	r7, #0
	strne	r9, [r8]
.L249:
	mov	r2, #67108864
	ldr	r3, [r2, #304]
	tst	r3, #64
	bne	.L280
	ldr	r3, [r4, #20]
	mov	r3, r3, asr #8
	sub	r3, r3, #480
	cmp	r3, #2
	bhi	.L250
	ldr	r3, .L282+28
	ldr	r3, [r3]
	cmp	r3, #1
	beq	.L281
	ldr	r2, [r2, #304]
	tst	r2, #64
	beq	.L253
.L237:
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L280:
	ldr	r3, [r2, #304]
	tst	r3, #64
	bne	.L237
	ldr	r3, [r4, #20]
	mov	r3, r3, asr #8
	sub	r3, r3, #480
	cmp	r3, #2
	bhi	.L237
	ldr	r3, .L282+28
	ldr	r3, [r3]
.L253:
	cmp	r3, #2
	bne	.L237
	ldr	r3, .L282+32
	mov	lr, pc
	bx	r3
	b	.L237
.L279:
	ldr	r0, [r1, #20]
	ldr	r3, [r4, #20]
	mov	r2, r0, asr #8
	add	r2, r2, #20
	mov	r3, r3, asr #8
	cmp	r3, r2
	ldr	r2, .L282+4
	bgt	.L240
	ldr	ip, [r2, #4]
	add	r0, r0, #12
	add	r3, r3, ip
	cmp	r3, r0, asr #8
	blt	.L240
	ldr	r3, [r1, #64]
	cmp	r3, #0
	beq	.L240
	mov	r1, #0
	ldr	r3, .L282+36
	str	r1, [r2, #72]
	mov	lr, pc
	bx	r3
	b	.L240
.L250:
	ldr	r3, [r2, #304]
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L278:
	ldr	ip, [r1, #20]
	ldr	r2, [r4, #20]
	mov	r0, ip, asr #8
	add	r0, r0, #20
	mov	r2, r2, asr #8
	cmp	r2, r0
	ldr	r5, .L282+4
	bgt	.L239
	ldr	r0, [r5, #4]
	add	ip, ip, #12
	add	r2, r2, r0
	cmp	r2, ip, asr #8
	blt	.L239
	ldr	r2, [r1, #64]
	cmp	r2, #0
	beq	.L239
	mov	r2, #0
	ldr	r3, .L282+36
	str	r2, [r5, #72]
	mov	lr, pc
	bx	r3
	ldr	r3, [r5, #16]
	mov	r3, r3, asr #8
	b	.L239
.L277:
	ldr	ip, [r1, #20]
	ldr	r2, [r4, #20]
	mov	r0, ip, asr #8
	add	r0, r0, #20
	mov	r2, r2, asr #8
	cmp	r2, r0
	bgt	.L238
	ldr	r0, [r4, #4]
	add	ip, ip, #12
	add	r2, r2, r0
	cmp	r2, ip, asr #8
	blt	.L238
	ldr	r2, [r1, #64]
	cmp	r2, #0
	beq	.L238
	mov	r2, #0
	ldr	r3, .L282+36
	str	r2, [r4, #72]
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #16]
	mov	r3, r3, asr #8
	b	.L238
.L281:
	ldr	r3, .L282+40
	mov	lr, pc
	bx	r3
	b	.L237
.L283:
	.align	2
.L282:
	.word	boo
	.word	luigi
	.word	loo
	.word	hoo
	.word	numberOfBatteries
	.word	batteryLife
	.word	battery
	.word	level
	.word	goToWin
	.word	goToLose
	.word	goToLevel2
	.size	collision, .-collision
	.align	2
	.global	updateScreenLocations
	.type	updateScreenLocations, %function
updateScreenLocations:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L304
	stmfd	sp!, {r4, lr}
	ldr	r1, .L304+4
	ldr	lr, .L304+8
	ldr	r2, .L304+12
	add	r0, r3, #16
	ldr	ip, [r1]
	ldr	lr, [lr]
	ldmia	r0, {r0, r1}
	ldr	r4, [r2, #64]
	rsb	r0, ip, r0, asr #8
	rsb	r1, lr, r1, asr #8
	cmp	r4, #0
	str	r0, [r3, #8]
	str	r1, [r3, #12]
	beq	.L285
	add	r1, r2, #16
	ldmia	r1, {r1, r3}
	rsb	r1, ip, r1, asr #8
	rsb	r3, lr, r3, asr #8
	str	r1, [r2, #8]
	str	r3, [r2, #12]
.L285:
	ldr	r3, .L304+16
	ldr	r2, [r3, #64]
	cmp	r2, #0
	beq	.L286
	add	r1, r3, #16
	ldmia	r1, {r1, r2}
	rsb	r1, ip, r1, asr #8
	rsb	r2, lr, r2, asr #8
	str	r1, [r3, #8]
	str	r2, [r3, #12]
.L286:
	ldr	r3, .L304+20
	ldr	r2, [r3, #64]
	cmp	r2, #0
	beq	.L287
	add	r1, r3, #16
	ldmia	r1, {r1, r2}
	rsb	r1, ip, r1, asr #8
	rsb	r2, lr, r2, asr #8
	str	r1, [r3, #8]
	str	r2, [r3, #12]
.L287:
	ldr	r3, .L304+24
	add	r0, r3, #140
.L289:
	ldr	r2, [r3, #24]
	cmp	r2, #0
	beq	.L288
	add	r1, r3, #16
	ldmia	r1, {r1, r2}
	rsb	r1, ip, r1
	rsb	r2, lr, r2
	str	r1, [r3, #8]
	str	r2, [r3, #12]
.L288:
	add	r3, r3, #28
	cmp	r3, r0
	bne	.L289
	ldmfd	sp!, {r4, lr}
	bx	lr
.L305:
	.align	2
.L304:
	.word	luigi
	.word	vOff
	.word	hOff
	.word	boo
	.word	loo
	.word	hoo
	.word	battery
	.size	updateScreenLocations, .-updateScreenLocations
	.align	2
	.global	animateLuigi
	.type	animateLuigi, %function
animateLuigi:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, .L338
	ldr	r3, [r1, #72]
	cmp	r3, #0
	bxeq	lr
	ldr	r0, [r1, #52]
	ldr	r3, .L338+4
	smull	r2, r3, r0, r3
	mov	r2, r0, asr #31
	rsb	r3, r2, r3, asr #1
	add	r3, r3, r3, lsl #2
	subs	r3, r0, r3
	addne	r0, r0, #1
	beq	.L335
	mov	r3, #67108864
	ldr	r2, [r3, #304]
	tst	r2, #128
	bne	.L311
.L336:
	ldr	r3, [r1, #60]
	cmp	r3, #0
	moveq	r3, #2
	ldr	r2, .L338
	streq	r3, [r2, #56]
	beq	.L313
	cmp	r3, #1
	moveq	r3, #3
	streq	r3, [r2, #56]
.L313:
	str	r0, [r1, #52]
	bx	lr
.L311:
	ldr	r2, [r1, #24]
	cmp	r2, #0
	ldr	r2, .L338
	beq	.L329
	ldr	ip, [r3, #304]
	tst	ip, #1
	bne	.L329
	ldr	r3, [r2, #60]
	cmp	r3, #0
	moveq	r3, #4
	streq	r3, [r2, #56]
	beq	.L313
	cmp	r3, #1
	moveq	r3, #5
	streq	r3, [r2, #56]
	b	.L313
.L335:
	ldr	r2, [r1, #64]
	cmp	r2, #5
	cmpne	r2, #2
	movne	r0, #1
	str	r3, [r1, #52]
	ldreq	r3, [r1, #68]
	streq	r3, [r1, #64]
	mov	r3, #67108864
	addne	r2, r2, r0
	strne	r2, [r1, #64]
	ldr	r2, [r3, #304]
	moveq	r0, #1
	tst	r2, #128
	bne	.L311
	b	.L336
.L329:
	ldr	r2, [r3, #304]
	tst	r2, #32
	moveq	r3, #1
	streq	r3, [r1, #56]
	streq	r3, [r1, #60]
	beq	.L313
.L337:
	ldr	r3, [r3, #304]
	tst	r3, #16
	moveq	r3, #0
	ldrne	r2, [r1, #68]
	ldrne	r3, [r1, #60]
	streq	r3, [r1, #56]
	streq	r3, [r1, #60]
	strne	r2, [r1, #64]
	strne	r3, [r1, #56]
	b	.L313
.L339:
	.align	2
.L338:
	.word	luigi
	.word	1717986919
	.size	animateLuigi, .-animateLuigi
	.align	2
	.global	animateBoo
	.type	animateBoo, %function
animateBoo:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L356
	ldr	r2, [r3, #64]
	cmp	r2, #0
	beq	.L341
	ldr	r1, [r3, #68]
	cmp	r1, #0
	bne	.L342
	ldr	r2, [r3, #48]
	tst	r2, #1
	strh	r1, [r3, #58]	@ movhi
	addne	r2, r2, #1
	beq	.L353
	str	r2, [r3, #48]
.L342:
	ldr	r3, [r3, #28]
	cmp	r3, #0
	ldr	r3, .L356
	blt	.L354
	movne	r2, #4096
	strneh	r2, [r3, #56]	@ movhi
	bx	lr
.L341:
	ldr	r1, [r3, #48]
	tst	r1, #1
	str	r2, [r3, #68]
	beq	.L355
.L352:
	add	r1, r1, #1
	str	r1, [r3, #48]
	bx	lr
.L355:
	ldrh	r2, [r3, #58]
	cmp	r2, #0
	bne	.L352
	ldr	r2, [r3, #60]
	cmp	r2, #7
	moveq	r1, #512
	movne	r1, #1
	streqh	r1, [r3, #58]	@ movhi
	moveq	r1, #1
	addne	r2, r2, r1
	strne	r2, [r3, #60]
	str	r1, [r3, #48]
	bx	lr
.L353:
	mov	r2, #1
	ldr	r1, [r3, #60]
	cmp	r1, #0
	subne	r1, r1, #1
	streq	r2, [r3, #68]
	strne	r1, [r3, #60]
	str	r2, [r3, #48]
	b	.L342
.L354:
	mov	r2, #0
	strh	r2, [r3, #56]	@ movhi
	bx	lr
.L357:
	.align	2
.L356:
	.word	boo
	.size	animateBoo, .-animateBoo
	.align	2
	.global	animateLoo
	.type	animateLoo, %function
animateLoo:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L374
	ldr	r2, [r3, #64]
	cmp	r2, #0
	beq	.L359
	ldr	r1, [r3, #68]
	cmp	r1, #0
	bne	.L360
	ldr	r2, [r3, #48]
	tst	r2, #1
	strh	r1, [r3, #58]	@ movhi
	addne	r2, r2, #1
	beq	.L371
	str	r2, [r3, #48]
.L360:
	ldr	r3, [r3, #28]
	cmp	r3, #0
	ldr	r3, .L374
	blt	.L372
	movne	r2, #4096
	strneh	r2, [r3, #56]	@ movhi
	bx	lr
.L359:
	ldr	r1, [r3, #48]
	tst	r1, #1
	str	r2, [r3, #68]
	beq	.L373
.L370:
	add	r1, r1, #1
	str	r1, [r3, #48]
	bx	lr
.L373:
	ldrh	r2, [r3, #58]
	cmp	r2, #0
	bne	.L370
	ldr	r2, [r3, #60]
	cmp	r2, #7
	moveq	r1, #512
	movne	r1, #1
	streqh	r1, [r3, #58]	@ movhi
	moveq	r1, #1
	addne	r2, r2, r1
	strne	r2, [r3, #60]
	str	r1, [r3, #48]
	bx	lr
.L371:
	mov	r2, #1
	ldr	r1, [r3, #60]
	cmp	r1, #0
	subne	r1, r1, #1
	streq	r2, [r3, #68]
	strne	r1, [r3, #60]
	str	r2, [r3, #48]
	b	.L360
.L372:
	mov	r2, #0
	strh	r2, [r3, #56]	@ movhi
	bx	lr
.L375:
	.align	2
.L374:
	.word	loo
	.size	animateLoo, .-animateLoo
	.align	2
	.global	animateHoo
	.type	animateHoo, %function
animateHoo:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L392
	ldr	r2, [r3, #64]
	cmp	r2, #0
	beq	.L377
	ldr	r1, [r3, #68]
	cmp	r1, #0
	bne	.L378
	ldr	r2, [r3, #48]
	tst	r2, #1
	strh	r1, [r3, #58]	@ movhi
	addne	r2, r2, #1
	beq	.L389
	str	r2, [r3, #48]
.L378:
	ldr	r3, [r3, #28]
	cmp	r3, #0
	ldr	r3, .L392
	blt	.L390
	movne	r2, #4096
	strneh	r2, [r3, #56]	@ movhi
	bx	lr
.L377:
	ldr	r1, [r3, #48]
	tst	r1, #1
	str	r2, [r3, #68]
	beq	.L391
.L388:
	add	r1, r1, #1
	str	r1, [r3, #48]
	bx	lr
.L391:
	ldrh	r2, [r3, #58]
	cmp	r2, #0
	bne	.L388
	ldr	r2, [r3, #60]
	cmp	r2, #7
	moveq	r1, #512
	movne	r1, #1
	streqh	r1, [r3, #58]	@ movhi
	moveq	r1, #1
	addne	r2, r2, r1
	strne	r2, [r3, #60]
	str	r1, [r3, #48]
	bx	lr
.L389:
	mov	r2, #1
	ldr	r1, [r3, #60]
	cmp	r1, #0
	subne	r1, r1, #1
	streq	r2, [r3, #68]
	strne	r1, [r3, #60]
	str	r2, [r3, #48]
	b	.L378
.L390:
	mov	r2, #0
	strh	r2, [r3, #56]	@ movhi
	bx	lr
.L393:
	.align	2
.L392:
	.word	hoo
	.size	animateHoo, .-animateHoo
	.align	2
	.global	cheat
	.type	cheat, %function
cheat:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L407
	ldr	r3, [r3]
	tst	r3, #256
	bxeq	lr
	ldr	r2, .L407+4
	ldr	r2, [r2]
	tst	r2, #256
	bxne	lr
	tst	r3, #512
	bxeq	lr
	ands	r2, r2, #512
	bne	.L396
	ldr	r3, .L407+8
	ldr	r1, [r3, #80]
	cmp	r1, #0
	beq	.L406
.L396:
	cmp	r2, #0
	bxne	lr
	ldr	r3, .L407+8
	ldr	r1, [r3, #80]
	cmp	r1, #0
	strne	r2, [r3, #80]
	bx	lr
.L406:
	mov	r2, #1
	str	r2, [r3, #80]
	bx	lr
.L408:
	.align	2
.L407:
	.word	oldButtons
	.word	buttons
	.word	luigi
	.size	cheat, .-cheat
	.align	2
	.global	timer
	.type	timer, %function
timer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	lr, .L415
	ldr	r0, [lr]
	cmp	r0, #0
	beq	.L414
	ldr	ip, .L415+4
	ldr	r3, .L415+8
	ldr	r1, [ip]
	smull	r2, r3, r1, r3
	mov	r2, r1, asr #31
	rsb	r3, r2, r3, asr #4
	add	r3, r3, r3, lsl #2
	rsb	r3, r3, r3, lsl #4
	cmp	r1, r3, asl #1
	moveq	r1, #1
	addne	r1, r1, #1
	subeq	r0, r0, #1
	streq	r0, [lr]
	str	r1, [ip]
	ldmfd	sp!, {r4, lr}
	bx	lr
.L414:
	ldr	r3, .L415+12
	mov	lr, pc
	bx	r3
	ldr	ip, .L415+4
	ldr	r1, [ip]
	add	r1, r1, #1
	str	r1, [ip]
	ldmfd	sp!, {r4, lr}
	bx	lr
.L416:
	.align	2
.L415:
	.word	timer2
	.word	timer1
	.word	458129845
	.word	goToLose
	.size	timer, .-timer
	.align	2
	.global	updateOAM
	.type	updateOAM, %function
updateOAM:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, lr}
	ldr	r6, .L442
	ldrh	r0, [r6, #56]
	mvn	r0, r0, asl #17
	ldr	r5, .L442+4
	ldr	r8, .L442+8
	ldrh	ip, [r5, #56]
	ldrh	r1, [r8, #56]
	mvn	ip, ip, asl #17
	mvn	r1, r1, asl #17
	mvn	r3, r0, lsr #17
	mvn	r7, r1, lsr #17
	mvn	ip, ip, lsr #17
	ldr	r0, [r6, #12]
	mov	r0, r0, asl #23
	orr	r0, r3, r0, lsr #23
	ldr	r3, .L442+12
	ldr	r1, [r6, #60]
	ldrb	r9, [r6, #8]	@ zero_extendqisi2
	strh	r0, [r3, #2]	@ movhi
	ldrh	r0, [r6, #58]
	add	r1, r1, #192
	orr	r0, r9, r0
	mov	r1, r1, asl #2
	strh	r0, [r3]	@ movhi
	ldrb	r6, [r8, #8]	@ zero_extendqisi2
	ldrh	r0, [r8, #58]
	orr	r1, r1, #8192
	orr	r6, r6, r0
	strh	r1, [r3, #4]	@ movhi
	ldr	r0, [r5, #12]
	ldr	r1, [r8, #12]
	ldr	r2, [r5, #60]
	ldr	lr, [r8, #60]
	ldr	r4, .L442+16
	mov	r1, r1, asl #23
	mov	r0, r0, asl #23
	orr	r1, r7, r1, lsr #23
	orr	r0, ip, r0, lsr #23
	ldrb	r7, [r5, #8]	@ zero_extendqisi2
	ldrh	ip, [r5, #58]
	add	lr, lr, #192
	add	r2, r2, #192
	ldr	r5, [r4, #80]
	mov	lr, lr, asl #2
	mov	r2, r2, asl #2
	orr	lr, lr, #8192
	orr	r2, r2, #8192
	orr	ip, r7, ip
	cmp	r5, #0
	strh	r6, [r3, #8]	@ movhi
	strh	r1, [r3, #10]	@ movhi
	strh	lr, [r3, #12]	@ movhi
	strh	ip, [r3, #16]	@ movhi
	strh	r0, [r3, #18]	@ movhi
	strh	r2, [r3, #20]	@ movhi
	beq	.L418
	ldr	r2, [r4, #12]
	ldrb	r1, [r4, #8]	@ zero_extendqisi2
	mov	r2, r2, asl #23
	mvn	r2, r2, lsr #6
	mvn	r1, r1, asl #17
	mvn	r2, r2, lsr #17
	mvn	r1, r1, lsr #17
	ldr	r0, .L442+20
	strh	r2, [r3, #50]	@ movhi
	strh	r1, [r3, #48]	@ movhi
	strh	r0, [r3, #52]	@ movhi
.L419:
	ldr	r2, [r4, #68]
	cmp	r2, #0
	ldr	r5, .L442+24
	ldr	r2, .L442+16
	beq	.L421
	ldr	r1, [r5]
	cmp	r1, #0
	ble	.L421
	ldr	r1, [r2, #60]
	cmp	r1, #0
	bne	.L422
	ldr	r1, [r2, #12]
	add	r1, r1, #13
	mov	r1, r1, asl #23
	mvn	r1, r1, lsr #6
	mvn	r1, r1, lsr #17
	ldr	r2, [r2, #8]
	ldr	r0, .L442+28
	add	r2, r2, #10
	and	r2, r2, #255
	strh	r1, [r3, #42]	@ movhi
	strh	r2, [r3, #40]	@ movhi
	strh	r0, [r3, #44]	@ movhi
	ldr	r3, .L442+32
	ldr	lr, [r3]
	cmp	lr, #0
	bgt	.L423
.L429:
	mov	r3, #0
	mov	r4, #512
	mov	lr, #9
	ldr	r0, [r5]
	ldr	r2, .L442+12
	ldr	ip, .L442+36
.L424:
	cmp	r0, r3
	add	r1, r3, #9
	add	r3, r3, #3
	strgth	lr, [r2, #96]	@ movhi
	strgth	r1, [r2, #98]	@ movhi
	strgth	ip, [r2, #100]	@ movhi
	strleh	r4, [r2, #96]	@ movhi
	cmp	r3, #96
	add	r2, r2, #8
	bne	.L424
	ldr	r3, .L442+40
	ldr	r3, [r3]
	rsb	r3, r3, #480
	mov	r3, r3, asl #23
	mvn	r3, r3, lsr #6
	ldr	r0, .L442+44
	mov	r7, #10
	mov	lr, r0
	mov	ip, r0
	mov	r6, #142
	mov	r5, #215
	mov	r4, #221
	mvn	r3, r3, lsr #17
	ldr	r1, .L442+48
	ldr	r2, .L442+52
	ldr	r1, [r1]
	smull	r9, r8, r2, r1
	mov	r2, r1, asr #31
	rsb	r2, r2, r8, asr #2
	add	r8, r2, r2, lsl #2
	add	r2, r2, #896
	sub	r1, r1, r8, asl #1
	orr	r2, r2, #8192
	strh	r7, [lr, #8]!	@ movhi
	strh	r7, [ip, #16]!	@ movhi
	add	r1, r1, #896
	strh	r2, [r0, #12]	@ movhi
	ldr	r2, .L442+56
	orr	r1, r1, #8192
	strh	r6, [r0, #4]	@ movhi
	strh	r5, [lr, #2]	@ movhi
	strh	r4, [ip, #2]	@ movhi
	strh	r1, [r0, #20]	@ movhi
	strh	r3, [r0, #2]	@ movhi
	strh	r2, [r0]	@ movhi
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L422:
	cmp	r1, #1
	beq	.L441
.L421:
	mov	r2, #512
	strh	r2, [r3, #40]	@ movhi
.L425:
	ldr	r3, .L442+32
	ldr	lr, [r3]
	cmp	lr, #0
	ble	.L429
.L423:
	mov	r0, #0
	mov	r6, #512
	ldr	r3, .L442+60
	ldr	r2, .L442+12
	ldr	r4, .L442+64
.L428:
	ldr	r1, [r3, #24]
	cmp	r1, #0
	streqh	r6, [r2, #56]	@ movhi
	beq	.L427
	ldr	r1, [r3, #12]
	ldrb	ip, [r3, #8]	@ zero_extendqisi2
	mov	r1, r1, asl #23
	mvn	r1, r1, lsr #6
	mvn	ip, ip, asl #17
	mvn	r1, r1, lsr #17
	mvn	ip, ip, lsr #17
	strh	r4, [r2, #60]	@ movhi
	strh	r1, [r2, #58]	@ movhi
	strh	ip, [r2, #56]	@ movhi
.L427:
	add	r0, r0, #1
	cmp	lr, r0
	add	r3, r3, #28
	add	r2, r2, #8
	bgt	.L428
	b	.L429
.L418:
	ldr	r2, [r4, #72]
	cmp	r2, #0
	ldr	r2, [r4, #12]
	beq	.L420
	ldrb	r0, [r4, #8]	@ zero_extendqisi2
	mov	r2, r2, asl #23
	mvn	r2, r2, lsr #6
	mvn	r0, r0, asl #17
	mvn	r2, r2, lsr #17
	mvn	r0, r0, lsr #17
	ldr	ip, [r4, #56]
	ldr	r1, [r4, #64]
	add	r1, r1, ip, lsl #6
	mov	r1, r1, asl #1
	strh	r2, [r3, #50]	@ movhi
	strh	r0, [r3, #48]	@ movhi
	strh	r1, [r3, #52]	@ movhi
	b	.L419
.L420:
	ldrb	r1, [r4, #8]	@ zero_extendqisi2
	mov	r2, r2, asl #23
	mvn	r2, r2, lsr #6
	mvn	r1, r1, asl #17
	mvn	r2, r2, lsr #17
	mvn	r1, r1, lsr #17
	mov	r0, #12
	strh	r2, [r3, #50]	@ movhi
	strh	r1, [r3, #48]	@ movhi
	strh	r0, [r3, #52]	@ movhi
	b	.L419
.L441:
	add	r0, r2, #8
	ldmia	r0, {r0, r1}
	sub	r2, r1, #33
	mov	r2, r2, asl #23
	ldr	ip, .L442+68
	add	r1, r0, #9
	mov	r2, r2, lsr #23
	ldr	r0, .L442+28
	and	r1, r1, #255
	orr	ip, r2, ip
	strh	r1, [r3, #40]	@ movhi
	strh	ip, [r3, #42]	@ movhi
	strh	r0, [r3, #44]	@ movhi
	b	.L425
.L443:
	.align	2
.L442:
	.word	boo
	.word	hoo
	.word	loo
	.word	shadowOAM
	.word	luigi
	.word	4236
	.word	batteryLife
	.word	4108
	.word	numberOfBatteries
	.word	4120
	.word	hOff
	.word	shadowOAM+352
	.word	timer2
	.word	1717986919
	.word	-32680
	.word	battery
	.word	4113
	.word	-28672
	.size	updateOAM, .-updateOAM
	.comm	numberOfBatteries,4,4
	.comm	timer2,4,4
	.comm	timer1,4,4
	.comm	counter6,4,4
	.comm	counter5,4,4
	.comm	counter4,4,4
	.comm	counter3,4,4
	.comm	counter2,4,4
	.comm	counter1,4,4
	.comm	level,4,4
	.comm	batteryCounter,4,4
	.comm	batteryLife,4,4
	.comm	battery,140,4
	.comm	numberOfGhosts,4,4
	.comm	hoo,72,4
	.comm	loo,72,4
	.comm	boo,72,4
	.comm	luigi,84,4
	.comm	scale,4,4
	.comm	update,4,4
	.ident	"GCC: (devkitARM release 45) 5.3.0"
