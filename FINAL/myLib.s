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
	.file	"myLib.c"
	.text
	.align	2
	.global	loadPalette
	.type	loadPalette, %function
loadPalette:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #83886080
	ldr	r3, .L2
	ldr	r2, .L2+4
	ldr	r3, [r3]
	str	r0, [r3, #36]
	str	r1, [r3, #40]
	str	r2, [r3, #44]
	bx	lr
.L3:
	.align	2
.L2:
	.word	.LANCHOR0
	.word	-2147483392
	.size	loadPalette, .-loadPalette
	.align	2
	.global	DMANow
	.type	DMANow, %function
DMANow:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, .L6
	str	lr, [sp, #-4]!
	add	r0, r0, r0, lsl #1
	ldr	lr, [ip]
	mov	r0, r0, asl #2
	add	ip, lr, r0
	orr	r3, r3, #-2147483648
	str	r1, [lr, r0]
	str	r2, [ip, #4]
	ldr	lr, [sp], #4
	str	r3, [ip, #8]
	bx	lr
.L7:
	.align	2
.L6:
	.word	.LANCHOR0
	.size	DMANow, .-DMANow
	.align	2
	.global	waitForVblank
	.type	waitForVblank, %function
waitForVblank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
.L9:
	ldrh	r3, [r2, #6]
	cmp	r3, #160
	bhi	.L9
	mov	r2, #67108864
.L11:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bls	.L11
	bx	lr
	.size	waitForVblank, .-waitForVblank
	.align	2
	.global	setPixel3
	.type	setPixel3, %function
setPixel3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L16
	rsb	r0, r0, r0, lsl #4
	add	r1, r1, r0, lsl #4
	ldr	r3, [r3, #4]
	mov	r1, r1, asl #1
	strh	r2, [r3, r1]	@ movhi
	bx	lr
.L17:
	.align	2
.L16:
	.word	.LANCHOR0
	.size	setPixel3, .-setPixel3
	.align	2
	.global	drawRect3
	.type	drawRect3, %function
drawRect3:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r2, #0
	bxle	lr
	stmfd	sp!, {r4, lr}
	ldr	r4, .L25
	add	r2, r0, r2
	rsb	r2, r2, r2, lsl #4
	rsb	r0, r0, r0, lsl #4
	ldr	ip, [r4, #4]
	add	lr, r1, r2, lsl #4
	sub	sp, sp, #8
	add	r1, r1, r0, lsl #4
	ldr	r2, [r4]
	orr	r3, r3, #-2130706432
	add	lr, ip, lr, lsl #1
	add	r1, ip, r1, lsl #1
	add	r0, sp, #6
.L20:
	str	r0, [r2, #36]
	str	r1, [r2, #40]
	add	r1, r1, #480
	cmp	lr, r1
	str	r3, [r2, #44]
	bne	.L20
	add	sp, sp, #8
	@ sp needed
	ldmfd	sp!, {r4, lr}
	bx	lr
.L26:
	.align	2
.L25:
	.word	.LANCHOR0
	.size	drawRect3, .-drawRect3
	.align	2
	.global	drawImage3
	.type	drawImage3, %function
drawImage3:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	cmp	r3, #0
	ldr	r4, [sp, #12]
	ble	.L27
	ldr	r5, .L33
	add	r3, r1, r3
	ldr	ip, [r5, #4]
	rsb	r3, r3, r3, lsl #4
	rsb	r1, r1, r1, lsl #4
	add	lr, r2, r3, lsl #4
	add	r2, r2, r1, lsl #4
	ldr	r3, [r5]
	add	lr, ip, lr, lsl #1
	add	r2, ip, r2, lsl #1
	mov	r1, r4, asl #1
	orr	ip, r4, #-2147483648
.L29:
	str	r0, [r3, #36]
	str	r2, [r3, #40]
	add	r2, r2, #480
	cmp	lr, r2
	str	ip, [r3, #44]
	add	r0, r0, r1
	bne	.L29
.L27:
	ldmfd	sp!, {r4, r5, lr}
	bx	lr
.L34:
	.align	2
.L33:
	.word	.LANCHOR0
	.size	drawImage3, .-drawImage3
	.align	2
	.global	fillScreen3
	.type	fillScreen3, %function
fillScreen3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, .L37
	sub	sp, sp, #8
	add	r2, sp, #8
	strh	r0, [r2, #-2]!	@ movhi
	ldr	r3, [r1]
	ldr	r0, [r1, #4]
	ldr	r1, .L37+4
	str	r2, [r3, #36]
	str	r0, [r3, #40]
	str	r1, [r3, #44]
	add	sp, sp, #8
	@ sp needed
	bx	lr
.L38:
	.align	2
.L37:
	.word	.LANCHOR0
	.word	-2130668032
	.size	fillScreen3, .-fillScreen3
	.align	2
	.global	setPixel4
	.type	setPixel4, %function
setPixel4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	ip, .L42
	add	r3, r1, r1, lsr #31
	mov	r3, r3, asr #1
	rsb	r0, r0, r0, lsl #4
	ldr	ip, [ip, #4]
	add	r0, r3, r0, lsl #3
	mov	r0, r0, asl #1
	ldrh	r3, [ip, r0]
	tst	r1, #1
	biceq	r3, r3, #255
	andne	r3, r3, #255
	orrne	r2, r3, r2, asl #8
	orreq	r3, r3, r2
	strneh	r2, [ip, r0]	@ movhi
	streqh	r3, [ip, r0]	@ movhi
	bx	lr
.L43:
	.align	2
.L42:
	.word	.LANCHOR0
	.size	setPixel4, .-setPixel4
	.align	2
	.global	drawRect4
	.type	drawRect4, %function
drawRect4:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	sub	sp, sp, #36
	ldrb	ip, [sp, #72]	@ zero_extendqisi2
	mov	fp, ip, asl #8
	subs	r10, r2, #0
	orr	r2, ip, fp
	str	ip, [sp, #12]
	strh	r2, [sp, #30]	@ movhi
	ble	.L44
	add	r7, r1, #1
	rsb	r2, r0, r0, lsl #4
	add	r7, r7, r7, lsr #31
	ldr	r4, .L60
	mov	r2, r2, asl #3
	mov	r7, r7, asr #1
	add	ip, r7, r2
	add	r5, r1, r1, lsr #31
	rsb	r7, r7, r7, lsl #31
	ldr	r9, [r4, #4]
	mov	r5, r5, asr #1
	add	r6, r3, r3, lsr #31
	mov	r7, r7, asl #1
	mov	r6, r6, asr #1
	add	r2, r5, r2
	str	r7, [sp, #4]
	rsb	r7, r5, r5, lsl #31
	add	r8, r3, r1
	add	ip, r9, ip, lsl #1
	add	r2, r9, r2, lsl #1
	mov	r9, r7, asl #1
	sub	r7, r6, #1
	sub	r8, r8, #1
	orr	r7, r7, #-2130706432
	add	r0, r8, r8, lsr #31
	str	r7, [sp, #16]
	and	r7, r8, #1
	str	r9, [sp, #20]
	mov	lr, #0
	ldr	r4, [r4]
	mov	r5, r5, asl #1
	orr	r6, r6, #-2130706432
	and	r1, r1, #1
	and	r3, r3, #1
	bic	r0, r0, #1
	str	r7, [sp, #8]
	add	r9, sp, #30
	str	fp, [sp]
	b	.L51
.L59:
	ldr	r7, [sp, #4]
	add	r8, ip, r7
	ldrb	r7, [r8, r5]	@ zero_extendqisi2
	ldr	fp, [sp]
	cmp	r3, #0
	orr	r7, r7, fp
	strh	r7, [r8, r5]	@ movhi
	beq	.L47
	str	r9, [r4, #36]
	str	ip, [r4, #40]
	str	r6, [r4, #44]
.L48:
	add	lr, lr, #1
	cmp	r10, lr
	add	r2, r2, #240
	add	ip, ip, #240
	beq	.L44
.L51:
	cmp	r1, #0
	bne	.L59
	cmp	r3, #0
	str	r9, [r4, #36]
	str	r2, [r4, #40]
	str	r6, [r4, #44]
	beq	.L48
	ldr	r7, [sp, #8]
	cmp	r7, #0
	ldr	r7, [sp, #20]
	add	r8, r2, r7
	ldrh	r7, [r8, r0]
	beq	.L50
.L58:
	ldr	fp, [sp]
	and	r7, r7, #255
	orr	r7, r7, fp
	strh	r7, [r8, r0]	@ movhi
	b	.L48
.L47:
	ldr	r7, [sp, #8]
	ldr	fp, [sp, #16]
	cmp	r7, #0
	str	r9, [r4, #36]
	ldrh	r7, [r8, r0]
	str	ip, [r4, #40]
	str	fp, [r4, #44]
	bne	.L58
.L50:
	ldr	fp, [sp, #12]
	bic	r7, r7, #255
	orr	r7, r7, fp
	strh	r7, [r8, r0]	@ movhi
	b	.L48
.L44:
	add	sp, sp, #36
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L61:
	.align	2
.L60:
	.word	.LANCHOR0
	.size	drawRect4, .-drawRect4
	.align	2
	.global	fillScreen4
	.type	fillScreen4, %function
fillScreen4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, .L64
	sub	sp, sp, #8
	add	r2, sp, #8
	orr	r0, r0, r0, asl #8
	strh	r0, [r2, #-2]!	@ movhi
	ldr	r3, [r1]
	ldr	r0, [r1, #4]
	ldr	r1, .L64+4
	str	r2, [r3, #36]
	str	r0, [r3, #40]
	str	r1, [r3, #44]
	add	sp, sp, #8
	@ sp needed
	bx	lr
.L65:
	.align	2
.L64:
	.word	.LANCHOR0
	.word	-2130687232
	.size	fillScreen4, .-fillScreen4
	.align	2
	.global	flipPage
	.type	flipPage, %function
flipPage:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
	ldrh	r3, [r2]
	ldr	r1, .L69
	tst	r3, #16
	ldrne	r0, [r1, #8]
	ldreq	r0, [r1, #12]
	bicne	r3, r3, #16
	orreq	r3, r3, #16
	strh	r3, [r2]	@ movhi
	str	r0, [r1, #4]
	bx	lr
.L70:
	.align	2
.L69:
	.word	.LANCHOR0
	.size	flipPage, .-flipPage
	.global	dma
	.global	backBuffer
	.global	frontBuffer
	.global	videoBuffer
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	dma, %object
	.size	dma, 4
dma:
	.word	67109040
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.type	backBuffer, %object
	.size	backBuffer, 4
backBuffer:
	.word	100704256
	.type	frontBuffer, %object
	.size	frontBuffer, 4
frontBuffer:
	.word	100663296
	.ident	"GCC: (devkitARM release 45) 5.3.0"
