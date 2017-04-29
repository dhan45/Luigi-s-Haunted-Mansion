# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
# 1 "mylib.h" 1



typedef unsigned short u16;
# 42 "mylib.h"
extern unsigned short *videoBuffer;

extern unsigned short *frontBuffer;
extern unsigned short *backBuffer;



void loadPalette(const unsigned short* palette);

void waitForVblank();
void initialize();




void setPixel3(int row, int col, unsigned short color);
void drawRect3(int row, int col, int height, int width, unsigned short color);
void fillScreen3(unsigned short color);
void drawImage3(const unsigned short* image, int row, int col, int height, int width);


void setPixel4(int row, int col, unsigned char colorIndex);
void drawRect4(int row, int col, int height, int width, unsigned char colorIndex);
void fillScreen4(unsigned char color);

void drawBackgroundImage4(const unsigned short* image);
void drawImage4(const unsigned short* image, int row, int col, int height, int width);
void drawSubImage4(const unsigned short* sourceImage, int sourceRow, int sourceCol, int sourceWidth,
       int row, int col, int height, int width);

void loadPalette(const unsigned short* palette);

void flipPage();
# 95 "mylib.h"
extern unsigned int oldButtons;
extern unsigned int buttons;
# 105 "mylib.h"
void DMANow(int channel, volatile const void* source, volatile const void* destination, unsigned int control);






typedef volatile struct
{
        volatile const void *src;
        volatile const void *dst;
        volatile unsigned int cnt;
} DMA;

extern DMA *dma;
# 234 "mylib.h"
typedef struct { u16 tileimg[8192]; } charblock;
typedef struct { u16 tilemap[1024]; } screenblock;
# 322 "mylib.h"
typedef struct{
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
    unsigned short fill;
}OBJ_ATTR;
# 2 "main.c" 2
# 1 "main.h" 1

# 1 "game.h" 1
void initLevel1();
void initLevel2();
void updatePosition();
void updateScreenLocations();
void animateLuigi();
void updateOAM();
void animateBoo();
void animateLoo();
void animateHoo();
void updateGhost();
void updateGhost1();
void updateGhost2();
void updateFlashLight();
void updateBattery();
void collision();
void cheat();
void timer();

extern int numberOfGhosts;
# 3 "main.h" 2
# 1 "opening.h" 1
# 20 "opening.h"
extern const unsigned char opening[970105];
# 4 "main.h" 2

void goToSplash();
void updateSplash();
void goToInstruction();
void updateInstruction();
void goToLevel1();
void updateLevel1();
void goToLevel2();
void updateLevel2();
void goToPause();
void updatePause();
void goToLose();
void updateLose();
void goToWin();
void updateWin();

void hideSprites();

void setupSounds();
void playSoundA(const unsigned char* sound, int length, int frequency, int loops);
void playSoundB(const unsigned char* sound, int length, int frequency, int loops);
void pauseSound();
void unpauseSound();
void stopSound();

void setupInterrupts();
void interruptHandler();

typedef struct {
 int height;
 int width;
 int screenRow;
 int screenCol;
 int worldRow;
 int worldCol;
 int rdel;
 int cdel;
 int racc;
 int cacc;
 int maxHSpeed;
 int maxVSpeed;
 int stopRange;
 int aniCounter;
 int aniState;
 int prevAniState;
    int currFrame;
    int flash;
    int active;
    int direction;
    int cheat;
} PLAYER;

typedef struct {
 int height;
 int width;
 int screenRow;
 int screenCol;
 int worldRow;
 int worldCol;
 int rdel;
 int cdel;
 int racc;
 int cacc;
 int maxHSpeed;
 int maxVSpeed;
 int aniCounter;
 int aniState;
 unsigned short flip;
 unsigned short attr0;
    int currFrame;
    int active;
    int spawn;
} GHOST;

typedef struct {
 int height;
 int width;
 int screenRow;
 int screenCol;
 int worldRow;
 int worldCol;
 int active;
} BATTERY;


typedef struct{
    const unsigned char* data;
    int length;
    int frequency;
    int isPlaying;
    int loops;
    int duration;
    int priority;
    int vbCount;
} SOUND;

extern OBJ_ATTR shadowOAM[128];
extern int vOff;
extern int hOff;
extern PLAYER luigi;
extern SOUND soundA;
extern SOUND soundB;
# 3 "main.c" 2
# 1 "splash.h" 1
# 22 "splash.h"
extern const unsigned short splashTiles[32768];


extern const unsigned short splashMap[1024];


extern const unsigned short splashPal[256];
# 4 "main.c" 2
# 1 "game.h" 1
void initLevel1();
void initLevel2();
void updatePosition();
void updateScreenLocations();
void animateLuigi();
void updateOAM();
void animateBoo();
void animateLoo();
void animateHoo();
void updateGhost();
void updateGhost1();
void updateGhost2();
void updateFlashLight();
void updateBattery();
void collision();
void cheat();
void timer();

extern int numberOfGhosts;
# 5 "main.c" 2
# 1 "instructions.h" 1
# 22 "instructions.h"
extern const unsigned short instructionsTiles[16384];


extern const unsigned short instructionsMap[1024];


extern const unsigned short instructionsPal[256];
# 6 "main.c" 2
# 1 "gameOver.h" 1
# 22 "gameOver.h"
extern const unsigned short gameOverTiles[1520];


extern const unsigned short gameOverMap[1024];


extern const unsigned short gameOverPal[256];
# 7 "main.c" 2
# 1 "pause.h" 1
# 22 "pause.h"
extern const unsigned short pauseTiles[736];


extern const unsigned short pauseMap[1024];


extern const unsigned short pausePal[256];
# 8 "main.c" 2
# 1 "widgets.h" 1
# 22 "widgets.h"
extern const unsigned short widgetsTiles[16384];


extern const unsigned short widgetsMap[1024];


extern const unsigned short widgetsPal[256];
# 9 "main.c" 2
# 1 "goodnight.h" 1
# 22 "goodnight.h"
extern const unsigned short goodnightTiles[15008];


extern const unsigned short goodnightMap[1024];


extern const unsigned short goodnightPal[256];
# 10 "main.c" 2
# 1 "win.h" 1
# 22 "win.h"
extern const unsigned short winTiles[10496];


extern const unsigned short winMap[1024];


extern const unsigned short winPal[256];
# 11 "main.c" 2
# 1 "luigi.h" 1
# 21 "luigi.h"
extern const unsigned short luigiTiles[16384];


extern const unsigned short luigiPal[256];
# 12 "main.c" 2
# 1 "ghostHouse.h" 1
# 20 "ghostHouse.h"
extern const unsigned char ghostHouse[1311552];
# 13 "main.c" 2




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
    *(volatile unsigned short*)0x400000A = 0 << 2 | 30 << 8 | 1<<14;
    *(volatile unsigned short*)0x4000008 = 1 << 2 | 29 << 8 | 0<<14;

    hideSprites();
    goToSplash();

    setupSounds();
 setupInterrupts();

 while(1)
 {
  oldButtons = buttons;
  buttons = *(volatile unsigned int *)0x04000130;

  state();

  *(volatile unsigned short *)0x04000014 = hOff;
     *(volatile unsigned short *)0x04000016 = vOff;

  DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 4 * 128);
  waitForVblank();
 }
}

void goToSplash() {
    hOff = 0;
    vOff = 0;

    *(volatile unsigned short*)0x4000008 = 1 << 2 | 29 << 8 | 0<<14 | 1 << 7;
    *(unsigned short *)0x4000000 = 0 | (1<<8) | (1 << 12);

    loadPalette(splashPal);
 DMANow(3, splashTiles, &((charblock *)0x6000000)[1], 65536/2);
 DMANow(3, splashMap, &((screenblock *)0x6000000)[29], 2048/2);

 hideSprites();

 DMANow(3, luigiTiles, &((charblock *)0x6000000)[4], 32768/2);
 DMANow(3, luigiPal, ((unsigned short*)(0x5000200)), 512/2);

 shadowOAM[0].attr0 = (0xFF & (124)) | (1 << 14);
    shadowOAM[0].attr1 = (0x1FF & (80)) | (1 << 14);
    shadowOAM[0].attr2 = ((12)*32+(12));

 playSoundA(opening, 970105 - 500, 11025, 1);

 state = updateSplash;
}

void updateSplash() {
 if ((!(~(oldButtons)&((1<<7))) && (~buttons & ((1<<7))))) {
  shadowOAM[0].attr0 = (0xFF & (142)) | (1 << 14);
     shadowOAM[0].attr1 = (0x1FF & (60)) | (1 << 14);
     shadowOAM[0].attr2 = ((12)*32+(12));
 } else if ((!(~(oldButtons)&((1<<6))) && (~buttons & ((1<<6))))) {
  shadowOAM[0].attr0 = (0xFF & (124)) | (1 << 14);
     shadowOAM[0].attr1 = (0x1FF & (80)) | (1 << 14);
     shadowOAM[0].attr2 = ((12)*32+(12));
 }
 if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3)))) && shadowOAM[0].attr0 == ((0xFF & (142)) | (1 << 14))) {
  goToInstruction();
 } else if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3)))) && shadowOAM[0].attr0 == ((0xFF & (124)) | (1 << 14))) {
  stopSound();
  goToLevel1();
 }
}

void goToInstruction() {
 *(volatile unsigned short*)0x4000008 = 1 << 2 | 29 << 8 | 0<<14;
 DMANow(3, instructionsTiles, &((charblock *)0x6000000)[1], 32768/2);
 DMANow(3, instructionsMap, &((screenblock *)0x6000000)[29], 2048/2);
 hideSprites();

 state = updateInstruction;
}

void updateInstruction() {
 if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
  stopSound();
  goToLevel1();
 }
}

void goToLevel1() {
 playSoundA(ghostHouse, 1311552 - 500, 11025, 1);
    initLevel1();

 state = updateLevel1;
}

void updateLevel1() {



 if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
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
 playSoundA(ghostHouse, 1311552 - 500, 11025, 1);
 initLevel2();

 state = updateLevel2;
}

void updateLevel2() {
 if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
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
 DMANow(3, pauseTiles, &((charblock *)0x6000000)[1], 1472/2);
 DMANow(3, pauseMap, &((screenblock *)0x6000000)[29], 2048/2);
 hideSprites();
 *(unsigned short *)0x4000000 = 0 | (1<<8);
 state = updatePause;
}

void updatePause() {
 if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
  state = updateLevel1;
  unpauseSound();
  DMANow(3, widgetsTiles, &((charblock *)0x6000000)[1], 32768/2);
  DMANow(3, widgetsMap, &((screenblock *)0x6000000)[29], 2048/2);
  *(unsigned short *)0x4000000 = 0 | (1<<8) | (1<<9) | (1 << 12);
 }
 if ((!(~(oldButtons)&((1<<2))) && (~buttons & ((1<<2))))) {
  goToSplash();
 }
}

void goToLose() {
 *(unsigned short *)0x4000000 = 0 | (1<<8);
 *(volatile unsigned short*)0x4000008 = 1 << 2 | 29 << 8 | 0<<14 | 1 << 7;
 loadPalette(goodnightPal);
 DMANow(3, goodnightTiles, &((charblock *)0x6000000)[1], 30016/2);
 DMANow(3, goodnightMap, &((screenblock *)0x6000000)[29], 2048/2);

 hideSprites();

 state = updateLose;
}

void updateLose() {
 if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
  goToSplash();
 }
}

void goToWin() {
 *(unsigned short *)0x4000000 = 0 | (1<<8);
 *(volatile unsigned short*)0x4000008 = 1 << 2 | 29 << 8 | 0<<14 | 1 << 7;
 loadPalette(winPal);
 DMANow(3, winTiles, &((charblock *)0x6000000)[1], 20992/2);
 DMANow(3, winMap, &((screenblock *)0x6000000)[29], 2048/2);

 hideSprites();

 state = updateWin;
}

void updateWin() {
 if((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0))))) {
  goToLevel1();
 }
 if((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
  goToSplash();
 }
}

void hideSprites()
{
 for(int i = 0; i < 128; i++) {
  shadowOAM[i].attr0 = (2 << 8);
 }
 DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 4 * 128);
}





void setupSounds()
{
    *(volatile u16 *)0x04000084 = (1<<7);

 *(volatile u16*)0x04000082 = (1<<1) |
                     (1<<2) |
                     (3<<8) |
                     0 |
                     (1<<11) |
                     (1<<3) |
                     (3<<12) |
                     (1<<14) |
                     (1<<15);

 *(u16*)0x04000080 = 0;
}

void playSoundA( const unsigned char* sound, int length, int frequency, int loops) {
        dma[1].cnt = 0;

        int ticks = (16777216)/frequency;

        DMANow(1, sound, (u16*) 0x040000A0, (2 << 21) | (3 << 28) | (1 << 25) | (1 << 26));

        *(volatile unsigned short*)0x4000102 = 0;

        *(volatile unsigned short*)0x4000100 = -ticks;
        *(volatile unsigned short*)0x4000102 = (1<<7);

        soundA.data = sound;
        soundA.length = length;
        soundA.frequency = frequency;
        soundA.isPlaying = 1;
        soundA.loops = loops;
        soundA.duration = (((59.727)*length)/frequency);
        soundA.vbCount = 0;
}


void playSoundB( const unsigned char* sound, int length, int frequency, int loops) {

        dma[2].cnt = 0;

        int ticks = (16777216)/frequency;

        DMANow(2, sound, (u16*) 0x040000A4, (2 << 21) | (3 << 28) | (1 << 25) | (1 << 26));

        *(volatile unsigned short*)0x4000106 = 0;

        *(volatile unsigned short*)0x4000104 = -ticks;
        *(volatile unsigned short*)0x4000106 = (1<<7);

  soundB.data = sound;
  soundB.length = length;
  soundB.frequency = frequency;
  soundB.isPlaying = 1;
  soundB.loops = loops;
  soundB.duration = (((59.727)*length)/frequency);
  soundB.vbCount = 0;
}

void pauseSound()
{
 *(volatile unsigned short*)0x4000102 = 0;
 *(volatile unsigned short*)0x4000106 = 0;
 soundA.isPlaying = 0;
}

void unpauseSound()
{
 *(volatile unsigned short*)0x4000102 = (1<<7);
 *(volatile unsigned short*)0x4000106 = (1<<7);
 soundA.isPlaying = 1;
}

void stopSound()
{
 dma[1].cnt = 0;
 dma[2].cnt = 0;
 soundA.isPlaying = 0;
 soundB.isPlaying = 0;
 *(volatile unsigned short*)0x4000102 = 0;
 *(volatile unsigned short*)0x4000106 = 0;
}

void setupInterrupts()
{
 *(unsigned short*)0x4000208 = 0;
 *(unsigned int*)0x3007FFC = (unsigned int)interruptHandler;
 *(unsigned short*)0x4000200 |= 1 << 0;
 *(unsigned short*)0x4000004 |= 1 << 3;
 *(unsigned short*)0x4000208 = 1;
}

void interruptHandler()
{
 *(unsigned short*)0x4000208 = 0;
 if(*(volatile unsigned short*)0x4000202 & 1 << 0) {
  if (soundA.isPlaying) {
   soundA.vbCount++;
   if (soundA.vbCount > soundA.duration) {
    if (soundA.loops) {
     playSoundA(soundA.data, soundA.length, soundA.frequency, soundA.loops);
    } else {
     dma[1].cnt = 0;
     soundA.isPlaying = 0;
     *(volatile unsigned short*)0x4000102 = 0;
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
     *(volatile unsigned short*)0x4000106 = 0;
    }
   }
  }

  *(volatile unsigned short*)0x4000202 = 1 << 0;
 }

 *(unsigned short*)0x4000208 = 1;
}
