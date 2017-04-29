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

#define SHIFTUP(i) ((i) << 8)
#define SHIFTDOWN(i) ((i) >> 8)