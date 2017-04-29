#include "mylib.h"
#include "main.h"
#include "splash.h"
#include "game.h"
#include "instructions.h"
#include "gameOver.h"
#include "pause.h"
#include "widgets.h"
#include "goodnight.h"
#include "win.h"
#include "luigi.h"
#include "ghostHouse.h"

#define ROWMASK 0xFF
#define COLMASK 0x1FF

void (*state)();

SOUND soundA;
SOUND soundB;

int hOff = 0;
int vOff = 0;

int signal = 0;

unsigned int buttons;
unsigned int oldButtons;

OBJ_ATTR shadowOAM[128];


int main() 
{
    REG_BG1CNT = CBB(0) | SBB(30) | BG_SIZE1;
    REG_BG0CNT = CBB(1) | SBB(29) | BG_SIZE0;

   	hideSprites();
    goToSplash();

    setupSounds();
	setupInterrupts();

	while(1) 
	{
		oldButtons = buttons;
		buttons = BUTTONS;

		state();

		REG_BG1HOFS = hOff;
	    REG_BG1VOFS = vOff;

		DMANow(3, shadowOAM, OAM, 4 * 128);
		waitForVblank();
	}
}

void goToSplash() {
    hOff = 0;
    vOff = 0;

    REG_BG0CNT = CBB(1) | SBB(29) | BG_SIZE0 | COLOR256;
    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;

    loadPalette(splashPal);
	DMANow(3, splashTiles, &CHARBLOCKBASE[1], splashTilesLen/2);
	DMANow(3, splashMap, &SCREENBLOCKBASE[29], splashMapLen/2);

	hideSprites();

	DMANow(3, luigiTiles, &CHARBLOCKBASE[4], luigiTilesLen/2);
	DMANow(3, luigiPal, SPRITE_PALETTE, luigiPalLen/2);

	shadowOAM[0].attr0 = (ROWMASK & (124)) | ATTR0_WIDE;
    shadowOAM[0].attr1 = (COLMASK & (80)) | ATTR1_SIZE16;
    shadowOAM[0].attr2 = (SPRITEOFFSET16(12, 12));

	playSoundA(opening, OPENINGLEN - 500, OPENINGFREQ, 1);
	
	state = updateSplash; 
}

void updateSplash() {
	if (BUTTON_PRESSED(BUTTON_DOWN)) {
		shadowOAM[0].attr0 = (ROWMASK & (142)) | ATTR0_WIDE;
	    shadowOAM[0].attr1 = (COLMASK & (60)) | ATTR1_SIZE16;
	    shadowOAM[0].attr2 = (SPRITEOFFSET16(12, 12));
	} else if (BUTTON_PRESSED(BUTTON_UP)) {
		shadowOAM[0].attr0 = (ROWMASK & (124)) | ATTR0_WIDE;
	    shadowOAM[0].attr1 = (COLMASK & (80)) | ATTR1_SIZE16;
	    shadowOAM[0].attr2 = (SPRITEOFFSET16(12, 12));
	}
	if (BUTTON_PRESSED(BUTTON_START) && shadowOAM[0].attr0 == ((ROWMASK & (142)) | ATTR0_WIDE)) {
		goToInstruction();
	} else if (BUTTON_PRESSED(BUTTON_START) && shadowOAM[0].attr0 == ((ROWMASK & (124)) | ATTR0_WIDE)) {
		stopSound();
		goToLevel1();
	}
}

void goToInstruction() {
	REG_BG0CNT = CBB(1) | SBB(29) | BG_SIZE0;
	DMANow(3, instructionsTiles, &CHARBLOCKBASE[1], instructionsTilesLen/2);
	DMANow(3, instructionsMap, &SCREENBLOCKBASE[29], instructionsMapLen/2);
	hideSprites();

	state = updateInstruction;
}

void updateInstruction() {
	if (BUTTON_PRESSED(BUTTON_START)) {
		stopSound();
		goToLevel1();
	}
}

void goToLevel1() {
	playSoundA(ghostHouse, GHOSTHOUSELEN - 500, GHOSTHOUSEFREQ, 1);
    initLevel1();

	state = updateLevel1;
}

void updateLevel1() {
	// if (BUTTON_PRESSED(BUTTON_L)) {
	// 	goToLose();
	// }
	if (BUTTON_PRESSED(BUTTON_START)) {
		goToPause();
	}
	cheat();
	updatePosition();
	updateGhost();
	updateFlashLight();
	updateBattery();
	collision();
	updateScreenLocations();
	animateLuigi();
	animateBoo();
	timer();
	updateOAM();
}

void goToLevel2() {
	playSoundA(ghostHouse, GHOSTHOUSELEN - 500, GHOSTHOUSEFREQ, 1);
	initLevel2();

	state = updateLevel2;
}

void updateLevel2() {
	if (BUTTON_PRESSED(BUTTON_START)) {
		goToPause();
	}
	cheat();
	updatePosition();
	updateGhost();
	updateGhost1();
	updateGhost2();
	updateFlashLight();
	updateBattery();
	collision();
	updateScreenLocations();
	animateLuigi();
	animateBoo();
	animateLoo();
	animateHoo();
	timer();
	updateOAM();
}

void goToPause() {
	pauseSound();
	DMANow(3, pauseTiles, &CHARBLOCKBASE[1], pauseTilesLen/2);
	DMANow(3, pauseMap, &SCREENBLOCKBASE[29], pauseMapLen/2);
	hideSprites();
	REG_DISPCTL = MODE0 | BG0_ENABLE;
	state = updatePause;
}

void updatePause() {
	if (BUTTON_PRESSED(BUTTON_START)) {
		state = updateLevel1;
		unpauseSound();
		DMANow(3, widgetsTiles, &CHARBLOCKBASE[1], widgetsTilesLen/2);
		DMANow(3, widgetsMap, &SCREENBLOCKBASE[29], widgetsMapLen/2);
		REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE | SPRITE_ENABLE;
	}
	if (BUTTON_PRESSED(BUTTON_SELECT)) {
		goToSplash();
	}
}

void goToLose() {
	REG_DISPCTL = MODE0 | BG0_ENABLE;
	REG_BG0CNT = CBB(1) | SBB(29) | BG_SIZE0 | COLOR256;
	loadPalette(goodnightPal);
	DMANow(3, goodnightTiles, &CHARBLOCKBASE[1], goodnightTilesLen/2);
	DMANow(3, goodnightMap, &SCREENBLOCKBASE[29], goodnightMapLen/2);
	
	hideSprites();

	state = updateLose;
}

void updateLose() {
	if (BUTTON_PRESSED(BUTTON_START)) {
		goToSplash();
	}
}

void goToWin() {
	REG_DISPCTL = MODE0 | BG0_ENABLE;
	REG_BG0CNT = CBB(1) | SBB(29) | BG_SIZE0 | COLOR256;
	loadPalette(winPal);
	DMANow(3, winTiles, &CHARBLOCKBASE[1], winTilesLen/2);
	DMANow(3, winMap, &SCREENBLOCKBASE[29], winMapLen/2);
	
	hideSprites();

	state = updateWin;
}

void updateWin() {
	if(BUTTON_PRESSED(BUTTON_A)) {
		goToLevel1();
	}
	if(BUTTON_PRESSED(BUTTON_START)) {
		goToSplash();
	}
}

void hideSprites()
{
	for(int i = 0; i < 128; i++) {
		shadowOAM[i].attr0 = ATTR0_HIDE;
	}
	DMANow(3, shadowOAM, OAM, 4 * 128);
}
//==============================================================================================================================


// SOUND //

void setupSounds()
{
    REG_SOUNDCNT_X = SND_ENABLED;

	REG_SOUNDCNT_H = SND_OUTPUT_RATIO_100 | 
                     DSA_OUTPUT_RATIO_100 | 
                     DSA_OUTPUT_TO_BOTH | 
                     DSA_TIMER0 | 
                     DSA_FIFO_RESET |
                     DSB_OUTPUT_RATIO_100 | 
                     DSB_OUTPUT_TO_BOTH | 
                     DSB_TIMER1 | 
                     DSB_FIFO_RESET;

	REG_SOUNDCNT_L = 0;
}

void playSoundA( const unsigned char* sound, int length, int frequency, int loops) {
        dma[1].cnt = 0;
	
        int ticks = PROCESSOR_CYCLES_PER_SECOND/frequency;
	
        DMANow(1, sound, REG_FIFO_A, DMA_DESTINATION_FIXED | DMA_AT_REFRESH | DMA_REPEAT | DMA_32);
	
        REG_TM0CNT = 0;
	
        REG_TM0D = -ticks;
        REG_TM0CNT = TIMER_ON;

        soundA.data = sound;
        soundA.length = length;
        soundA.frequency = frequency;
        soundA.isPlaying = 1;
        soundA.loops = loops;
        soundA.duration = ((VBLANK_FREQ*length)/frequency);
        soundA.vbCount = 0;       
}


void playSoundB( const unsigned char* sound, int length, int frequency, int loops) {

        dma[2].cnt = 0;

        int ticks = PROCESSOR_CYCLES_PER_SECOND/frequency;

        DMANow(2, sound, REG_FIFO_B, DMA_DESTINATION_FIXED | DMA_AT_REFRESH | DMA_REPEAT | DMA_32);

        REG_TM1CNT = 0;
	
        REG_TM1D = -ticks;
        REG_TM1CNT = TIMER_ON;
	
		soundB.data = sound;
		soundB.length = length;
		soundB.frequency = frequency;
		soundB.isPlaying = 1;
		soundB.loops = loops;
		soundB.duration = ((VBLANK_FREQ*length)/frequency);
		soundB.vbCount = 0;
}

void pauseSound()
{
	REG_TM0CNT = 0;
	REG_TM1CNT = 0;
	soundA.isPlaying = 0;
}

void unpauseSound()
{
	REG_TM0CNT = TIMER_ON;
	REG_TM1CNT = TIMER_ON;
	soundA.isPlaying = 1;
}

void stopSound()
{
	dma[1].cnt = 0;
	dma[2].cnt = 0;
	soundA.isPlaying = 0;
	soundB.isPlaying = 0;
	REG_TM0CNT = 0;
	REG_TM1CNT = 0;
}

void setupInterrupts()
{
	REG_IME = 0;
	REG_INTERRUPT = (unsigned int)interruptHandler;
	REG_IE |= INT_VBLANK;
	REG_DISPSTAT |= INT_VBLANK_ENABLE;
	REG_IME = 1;
}

void interruptHandler()
{
	REG_IME = 0;
	if(REG_IF & INT_VBLANK) {
		if (soundA.isPlaying) {
			soundA.vbCount++;
			if (soundA.vbCount > soundA.duration) {
				if (soundA.loops) {
					playSoundA(soundA.data, soundA.length, soundA.frequency, soundA.loops);
				} else {
					dma[1].cnt = 0;
					soundA.isPlaying = 0;
					REG_TM0CNT = 0;
				}
			}
		}
		if (soundB.isPlaying) {
			soundB.vbCount++;
			if (soundB.vbCount > soundB.duration) {
				if (soundB.loops) {
					playSoundB(soundB.data, soundB.length, soundB.frequency, soundB.loops);
				} else {
					dma[2].cnt = 0;
					soundB.isPlaying = 0;
					REG_TM1CNT = 0;
				}
			}
		}
		
		REG_IF = INT_VBLANK; 
	}

	REG_IME = 1;
}




