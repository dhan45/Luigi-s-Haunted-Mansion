#include "mylib.h"
#include "game.h"
#include "opening.h"

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






