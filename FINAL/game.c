#include "main.h"
#include "myLib.h"
#include "game.h"
#include "splash.h"
#include "luigi.h"
#include "bg1.h"
#include "widgets.h"
#include "jump.h"
#include "goodnight.h"
#include "win.h"
#include <stdlib.h>

#define ROWMASK 0xFF
#define COLMASK 0x1FF

int update;
int scale;
PLAYER luigi;
GHOST boo;
GHOST loo;
GHOST hoo;
int numberOfGhosts;
BATTERY battery[5];
int batteryLife;
int batteryCounter;
int level;
int volatile counter1;
int volatile counter2;
int volatile counter3;
int volatile counter4;
int volatile counter5;
int volatile counter6;
int timer1;
int timer2;

int numberOfBatteries;

enum {BOO = 0, LIGHT = 5, LUIGI = 6, BATTERIES = 7, BATTERY_BARS = 12, DOOR = 44, TENS = 45, ONES = 46};
enum {RIGHT, LEFT, DOWNR, DOWNL, JUMPR, JUMPL, PEACE, OUCH, IDLE};
enum {L, R};

void initLevel1() {
    REG_BG0CNT = CBB(1) | SBB(29) | BG_SIZE0;
    REG_BG1CNT = CBB(0) | SBB(30) | BG_SIZE1;
	REG_DISPCTL = MODE0  | BG0_ENABLE | BG1_ENABLE | SPRITE_ENABLE;

	loadPalette(bg1Pal);

    DMANow(3, bg1Tiles, &CHARBLOCKBASE[0], bg1TilesLen/2);
    DMANow(3, bg1Map, &SCREENBLOCKBASE[30], bg1MapLen/2);

    DMANow(3, widgetsTiles, &CHARBLOCKBASE[1], widgetsTilesLen/2);
    DMANow(3, widgetsMap, &SCREENBLOCKBASE[29], widgetsMapLen/2);

	DMANow(3, luigiTiles, &CHARBLOCKBASE[4], luigiTilesLen/2);
	DMANow(3, luigiPal, SPRITE_PALETTE, luigiPalLen/2);

	vOff = 0;
	hOff = 0;

    level = 1;

	luigi.height = 23;
	luigi.width = 12;
	luigi.worldRow = SHIFTUP(80);
	luigi.worldCol = SHIFTUP(5);
	luigi.rdel = 0;
	luigi.cdel = 0;
	luigi.racc = 70;
    luigi.cacc = 15;
    luigi.stopRange = 5;
    luigi.maxHSpeed = SHIFTUP(2) - SHIFTUP(2)/4;
    luigi.maxVSpeed = SHIFTUP(5) + SHIFTUP(1)/2;
	luigi.aniCounter = 0;
	luigi.currFrame = 0;
	luigi.aniState = LEFT;
    luigi.flash = 0;
    luigi.direction = 1;
    luigi.active = 1;
    luigi.cheat = 0;

    boo.height = 25;
    boo.width = 30;
    boo.worldRow = SHIFTUP(SCREENHEIGHT - 40 - boo.width);
    boo.worldCol = SHIFTUP(200);
    boo.rdel = 0;
    boo.cdel = 0;
    boo.racc = 5;
    boo.cacc = 5;
    boo.maxHSpeed = SHIFTUP(1)/2;
    boo.maxVSpeed = SHIFTUP(1)/2;
    boo.aniCounter = 0;
    boo.aniState = LEFT;
    boo.currFrame = 0;
    boo.active = 1;
    boo.spawn = 0;

    loo.active = 0;
    loo.attr0 = ATTR0_HIDE;
    hoo.active = 0;
    hoo.attr0 = ATTR0_HIDE;

    batteryLife = 100;
    batteryCounter = 0;

    for(int i = 0; i < 5; i++) {
        battery[i].height = 16;
        battery[i].width = 8;
        battery[i].worldRow = SCREENHEIGHT - 40 - battery[i].height;
        battery[i].worldCol = rand() % 512;
        battery[i].active = 1;
    }
    numberOfBatteries = (sizeof battery) / (sizeof battery[0]);
    timer1 = 0;
    timer2 = 10;
}

void initLevel2() {
    level = 2;

    timer1 = 0;
    timer2 = 10;

    vOff = 0;
    hOff = 0;

    luigi.height = 23;
    luigi.width = 12;
    luigi.worldRow = SHIFTUP(80);
    luigi.worldCol = SHIFTUP(5);
    luigi.rdel = 0;
    luigi.cdel = 0;
    luigi.racc = 70;
    luigi.cacc = 15;
    luigi.stopRange = 5;
    luigi.maxHSpeed = SHIFTUP(2) - SHIFTUP(2)/4;
    luigi.maxVSpeed = SHIFTUP(5) + SHIFTUP(1)/2;
    luigi.aniCounter = 0;
    luigi.currFrame = 0;
    luigi.aniState = LEFT;
    luigi.flash = 0;
    luigi.direction = 1;
    luigi.active = 1;
    luigi.cheat = 0;

    boo.height = 25;
    boo.width = 30;
    boo.worldRow = SHIFTUP(SCREENHEIGHT - 40 - boo.width);
    boo.worldCol = SHIFTUP(200);
    boo.rdel = 0;
    boo.cdel = 0;
    boo.racc = 5;
    boo.cacc = 5;
    boo.maxHSpeed = SHIFTUP(1)/3;
    boo.maxVSpeed = SHIFTUP(1)/3;
    boo.aniCounter = 0;
    boo.aniState = LEFT;
    boo.currFrame = 0;
    boo.active = 1;
    boo.spawn = 0;

    loo.height = 25;
    loo.width = 30;
    loo.worldRow = SHIFTUP(40 - boo.width);
    loo.worldCol = SHIFTUP(250);
    loo.rdel = 0;
    loo.cdel = 0;
    loo.racc = 6;
    loo.cacc = 6;
    loo.maxHSpeed = SHIFTUP(1)/3;
    loo.maxVSpeed = SHIFTUP(1)/3;
    loo.aniCounter = 0;
    loo.aniState = LEFT;
    loo.currFrame = 0;
    loo.active = 1;
    loo.spawn = 0;

    hoo.height = 25;
    hoo.width = 30;
    hoo.worldRow = SHIFTUP(40 - boo.width);
    hoo.worldCol = SHIFTUP(100);
    hoo.rdel = 0;
    hoo.cdel = 0;
    hoo.racc = 6;
    hoo.cacc = 6;
    hoo.maxHSpeed = SHIFTUP(1)/3;
    hoo.maxVSpeed = SHIFTUP(1)/3;
    hoo.aniCounter = 0;
    hoo.aniState = LEFT;
    hoo.currFrame = 0;
    hoo.active = 1;
    hoo.spawn = 0;

    batteryLife = 100;
    batteryCounter = 0;
}

void updatePosition() {
    if(luigi.active) {
        luigi.rdel += luigi.racc;

        luigi.worldRow += luigi.rdel;
        luigi.worldCol += luigi.cdel;

        int normal = 1;

        if(hOff < MAPWIDTH - SCREENWIDTH && luigi.cdel > 10) {
        	if(luigi.screenCol >= 200) scale = 2;
        	else if(luigi.screenCol >= 90) scale = 1;
        	else scale = 0;

        	switch(scale) {
        		case 0:
        			hOff = hOff;
        			break;
        		case 1:
        			hOff += 2;
        			break;
        		case 2:
        			hOff += 3;
        			break;
        	}
        }
        if(hOff > 0 && luigi.cdel < -10) {
        	if(luigi.screenCol <= 40) scale = 2;
        	else if(luigi.screenCol <= 150) scale = 1;
        	else scale = 0;

        	switch(scale) {
        		case 0:
        			hOff = hOff;
        			break;
        		case 1:
        			hOff -= 2;
        			break;
        		case 2:
        			hOff -= 3;
        			break;
        	}
        }

        if(SHIFTDOWN(luigi.worldRow) >= SCREENHEIGHT - 40 - 31 - 1)
        {
            luigi.worldRow = SHIFTUP(SCREENHEIGHT - 40 - 31 - 1);
            luigi.rdel = 0;
        }
        if(SHIFTDOWN(luigi.worldRow) <= 0)
        {
            luigi.worldRow = 0;
            luigi.rdel = -luigi.rdel;
        }

        if(SHIFTDOWN(luigi.worldCol) < 0)
        {
            luigi.worldCol = 0;
            luigi.cdel = -luigi.cdel;
        }

        if(SHIFTDOWN(luigi.worldCol) >= MAPWIDTH - 2 - luigi.width)
        {
            luigi.worldCol = SHIFTUP(MAPWIDTH - 2 - luigi.width);
            luigi.cdel = -luigi.cdel;
        }

        if(BUTTON_HELD(BUTTON_DOWN))
        {
        	if (luigi.rdel < -(luigi.stopRange) || luigi.rdel > luigi.stopRange) normal = 50;
        	if(luigi.cdel < 0)
            {
                luigi.cdel += luigi.cacc/normal;
            }
            else if(luigi.cdel > 0)
            {
                luigi.cdel -= luigi.cacc/normal;
            }
            if(luigi.cdel < luigi.stopRange && luigi.cdel > -luigi.stopRange)
            {
                luigi.cdel = 0;
            }
        }
        else if(BUTTON_PRESSED(BUTTON_A) && luigi.rdel > -luigi.stopRange && luigi.rdel < luigi.stopRange)
        {
            luigi.rdel = -luigi.maxVSpeed;
            playSoundB(jump, JUMPLEN - 100, JUMPFREQ, 0);
        }
        else if(BUTTON_HELD(BUTTON_LEFT))
        {
            luigi.direction = L;
            if(luigi.cdel > -luigi.maxHSpeed)
            {
                luigi.cdel -= luigi.cacc;
            }
        }
        else if(BUTTON_HELD(BUTTON_RIGHT))
        {
            luigi.direction = R;
            if(luigi.cdel < luigi.maxHSpeed)
            {
                luigi.cdel += luigi.cacc;
            }
        }
        else
        {
        	if (luigi.rdel < -(luigi.stopRange) || luigi.rdel > luigi.stopRange) normal = 50;
        	if(luigi.cdel < 0)
            {
                luigi.cdel += luigi.cacc/normal;
            }
            else if(luigi.cdel > 0)
            {
                luigi.cdel -= luigi.cacc/normal;
            }
            if(luigi.cdel < luigi.stopRange && luigi.cdel > -luigi.stopRange)
            {
                luigi.cdel = 0;
            }
        }
    }
}

void updateGhost() {
    if(luigi.flash && batteryLife > 0 && SHIFTDOWN(luigi.worldCol) + luigi.width + 100 >= SHIFTDOWN(boo.worldCol) 
        && SHIFTDOWN(boo.worldCol) > SHIFTDOWN(luigi.worldCol) && luigi.direction == R) {
        boo.active = 0;
        counter1 = 0;
        counter2 = 0;
    } else if(luigi.flash && batteryLife > 0 && SHIFTDOWN(luigi.worldCol) - 100 <= SHIFTDOWN(boo.worldCol) + boo.width 
        && SHIFTDOWN(boo.worldCol) < SHIFTDOWN(luigi.worldCol) && luigi.direction == L) {
        boo.active = 0;
        counter1 = 0;
        counter2 = 0;
    } else if(luigi.cheat) {
        boo.active = 0;
    } else {
        if(counter1 % 500 == 0) {
            counter2++;
            counter1 = 0;
            if(counter2 % 30 == 0) {
                counter2 = 0;
                boo.active = 1;
            }
        } else {
            counter1++;
        }
        if(boo.active) {

            boo.worldRow += boo.rdel;
            boo.worldCol += boo.cdel;

            if(SHIFTDOWN(luigi.worldRow) > SHIFTDOWN(boo.worldRow) + 14 && boo.rdel <= 0) {
                if(boo.rdel < boo.maxVSpeed) {
                    boo.rdel += boo.racc;
                }
            } else if(SHIFTDOWN(luigi.worldRow) + luigi.height - 8 < SHIFTDOWN(boo.worldRow) && boo.rdel >= 0) {
                if(boo.rdel > -(boo.maxVSpeed)) {
                    boo.rdel -= boo.racc;
                }
            } else if(SHIFTDOWN(luigi.worldRow) > SHIFTDOWN(boo.worldRow) + 18 && boo.rdel >= 0) {
                if(boo.rdel < boo.maxVSpeed) {
                    boo.rdel += boo.racc;
                }
            } else if(SHIFTDOWN(luigi.worldRow) + luigi.height - 8 < SHIFTDOWN(boo.worldRow) && boo.rdel <= 0) {
                if(boo.rdel > -(boo.maxVSpeed)) {
                    boo.rdel -= boo.racc;
                }
            }
            if(SHIFTDOWN(luigi.worldCol) + luigi.width < SHIFTDOWN(boo.worldCol) && boo.cdel > 0) {
                if(boo.cdel > -(boo.maxHSpeed)) {
                    boo.cdel -= boo.cacc;
                }
            } else if(SHIFTDOWN(luigi.worldCol) > SHIFTDOWN(boo.worldCol) + boo.width && boo.cdel < 0){
                if(boo.cdel < boo.maxHSpeed) {
                    boo.cdel += boo.cacc;
                }
            } else if(SHIFTDOWN(luigi.worldCol) + luigi.width < SHIFTDOWN(boo.worldCol) && boo.cdel <= 0) {
                if(boo.cdel > -(boo.maxHSpeed)) {
                    boo.cdel -= boo.cacc;
                }
            } else if(SHIFTDOWN(luigi.worldCol) > SHIFTDOWN(boo.worldCol) + boo.width && boo.cdel >= 0) {
                if(boo.cdel < boo.maxHSpeed) {
                    boo.cdel += boo.cacc;
                }
            }

            boo.worldRow += boo.rdel;
            boo.worldCol += boo.cdel;
        }
    }
}

void updateGhost1() {
    if(luigi.flash && batteryLife > 0 && SHIFTDOWN(luigi.worldCol) + luigi.width + 100 >= SHIFTDOWN(loo.worldCol) 
        && SHIFTDOWN(loo.worldCol) > SHIFTDOWN(luigi.worldCol) && luigi.direction == R) {
        loo.active = 0;
        counter3 = 0;
        counter4 = 0;
    } else if(luigi.flash && batteryLife > 0 && SHIFTDOWN(luigi.worldCol) - 100 <= SHIFTDOWN(loo.worldCol) + loo.width 
        && SHIFTDOWN(loo.worldCol) < SHIFTDOWN(luigi.worldCol) && luigi.direction == L) {
        loo.active = 0;
        counter3 = 0;
        counter4 = 0;
    } else if(luigi.cheat) {
        loo.active = 0;
    } else {
        if(counter3 % 500 == 0) {
            counter4++;
            counter3 = 0;
            if(counter4 % 30 == 0) {
                counter4 = 0;
                loo.active = 1;
            }
        } else {
            counter3++;
        }
        if(loo.active) {

            loo.worldRow += loo.rdel;
            loo.worldCol += loo.cdel;

            if(SHIFTDOWN(luigi.worldRow) > SHIFTDOWN(loo.worldRow) + 10 && loo.rdel <= 0) {
                if(loo.rdel < loo.maxVSpeed) {
                    loo.rdel += loo.racc;
                }
            } else if(SHIFTDOWN(luigi.worldRow) + luigi.height - 4 < SHIFTDOWN(loo.worldRow) && loo.rdel >= 0) {
                if(loo.rdel > -(loo.maxVSpeed)) {
                    loo.rdel -= loo.racc;
                }
            } else if(SHIFTDOWN(luigi.worldRow) > SHIFTDOWN(loo.worldRow) + 14 && loo.rdel >= 0) {
                if(loo.rdel < loo.maxVSpeed) {
                    loo.rdel += loo.racc;
                }
            } else if(SHIFTDOWN(luigi.worldRow) + luigi.height - 4 < SHIFTDOWN(loo.worldRow) && loo.rdel <= 0) {
                if(loo.rdel > -(loo.maxVSpeed)) {
                    loo.rdel -= loo.racc;
                }
            }
            if(SHIFTDOWN(luigi.worldCol) + luigi.width < SHIFTDOWN(loo.worldCol) && loo.cdel > 0) {
                if(loo.cdel > -(loo.maxHSpeed)) {
                    loo.cdel -= loo.cacc;
                }
            } else if(SHIFTDOWN(luigi.worldCol) > SHIFTDOWN(loo.worldCol) + loo.width && loo.cdel < 0){
                if(loo.cdel < loo.maxHSpeed) {
                    loo.cdel += loo.cacc;
                }
            } else if(SHIFTDOWN(luigi.worldCol) + luigi.width < SHIFTDOWN(loo.worldCol) && loo.cdel <= 0) {
                if(loo.cdel > -(loo.maxHSpeed)) {
                    loo.cdel -= loo.cacc;
                }
            } else if(SHIFTDOWN(luigi.worldCol) > SHIFTDOWN(loo.worldCol) + loo.width && loo.cdel >= 0) {
                if(loo.cdel < loo.maxHSpeed) {
                    loo.cdel += loo.cacc;
                }
            }

            loo.worldRow += loo.rdel;
            loo.worldCol += loo.cdel;
        }
    }
}

void updateGhost2() {
    if(luigi.flash && batteryLife > 0 && SHIFTDOWN(luigi.worldCol) + luigi.width + 100 >= SHIFTDOWN(hoo.worldCol) 
        && SHIFTDOWN(hoo.worldCol) > SHIFTDOWN(luigi.worldCol) && luigi.direction == R) {
        hoo.active = 0;
        counter5 = 0;
        counter6 = 0;
    } else if(luigi.flash && batteryLife > 0 && SHIFTDOWN(luigi.worldCol) - 100 <= SHIFTDOWN(hoo.worldCol) + hoo.width 
        && SHIFTDOWN(hoo.worldCol) < SHIFTDOWN(luigi.worldCol) && luigi.direction == L) {
        hoo.active = 0;
        counter5 = 0;
        counter6 = 0;
    } else if(luigi.cheat) {
        hoo.active = 0;
    } else {
        if(counter5 % 500 == 0) {
            counter6++;
            counter5 = 0;
            if(counter6 % 30 == 0) {
                counter6 = 0;
                hoo.active = 1;
            }
        } else {
            counter5++;
        }
        if(hoo.active) {

            hoo.worldRow += hoo.rdel;
            hoo.worldCol += hoo.cdel;

            if(SHIFTDOWN(luigi.worldRow) > SHIFTDOWN(hoo.worldRow) + 10 && hoo.rdel <= 0) {
                if(hoo.rdel < hoo.maxVSpeed) {
                    hoo.rdel += hoo.racc;
                }
            } else if(SHIFTDOWN(luigi.worldRow) + luigi.height - 4 < SHIFTDOWN(hoo.worldRow) && hoo.rdel >= 0) {
                if(hoo.rdel > -(hoo.maxVSpeed)) {
                    hoo.rdel -= hoo.racc;
                }
            } else if(SHIFTDOWN(luigi.worldRow) > SHIFTDOWN(hoo.worldRow) + 14 && hoo.rdel >= 0) {
                if(hoo.rdel < hoo.maxVSpeed) {
                    hoo.rdel += hoo.racc;
                }
            } else if(SHIFTDOWN(luigi.worldRow) + luigi.height - 4 < SHIFTDOWN(hoo.worldRow) && hoo.rdel <= 0) {
                if(hoo.rdel > -(hoo.maxVSpeed)) {
                    hoo.rdel -= hoo.racc;
                }
            }
            if(SHIFTDOWN(hoo.worldCol) + hoo.width > SHIFTDOWN(luigi.worldCol) + 70 && hoo.cdel >= 0) {
                if(hoo.cdel > -(hoo.maxHSpeed)) {
                    hoo.cdel -= hoo.cacc;
                }
            } else if(SHIFTDOWN(hoo.worldCol) <  SHIFTDOWN(luigi.worldCol) - 70 && hoo.cdel <= 0) {
                if(hoo.cdel < hoo.maxHSpeed) {
                    hoo.cdel += hoo.cacc;
                }
            } else if(SHIFTDOWN(hoo.worldCol) + hoo.width < 475 && hoo.cdel >= 0) {
                if(hoo.cdel < hoo.maxHSpeed) {
                    hoo.cdel += hoo.cacc;
                }
            } else if(SHIFTDOWN(hoo.worldCol) > 30 && hoo.cdel <= 0) {
                if(hoo.cdel > -(hoo.maxHSpeed)) {
                    hoo.cdel -= hoo.cacc;
                }
            }


            hoo.worldRow += hoo.rdel;
            hoo.worldCol += hoo.cdel;
        }
    }
}

void updateFlashLight() {
    if(BUTTON_PRESSED(BUTTON_B) && luigi.flash == 0) {
        luigi.flash = 3;
    } else if(BUTTON_PRESSED(BUTTON_B) && luigi.flash == 3) {
        luigi.flash = 0;
    }
}

void updateBattery() {
    if(batteryLife > 0 && luigi.flash == 3) {
        batteryCounter++;
        if(batteryCounter % 2 == 0) {
            batteryCounter = 0;
            batteryLife--;
        }
    }

}

void collision () {
    if(SHIFTDOWN(luigi.worldRow) + 8 <= SHIFTDOWN(boo.worldRow) + 28 
        && SHIFTDOWN(luigi.worldRow) + 32 >= SHIFTDOWN(boo.worldRow) + 12 
        && SHIFTDOWN(luigi.worldCol) <= SHIFTDOWN(boo.worldCol) + 20
        && SHIFTDOWN(luigi.worldCol) + luigi.width >= SHIFTDOWN(boo.worldCol + 12)
        && boo.active) {
        luigi.active = 0;
        goToLose();
    }
    if(SHIFTDOWN(luigi.worldRow) + 8 <= SHIFTDOWN(loo.worldRow) + 28 
        && SHIFTDOWN(luigi.worldRow) + 32 >= SHIFTDOWN(loo.worldRow) + 12 
        && SHIFTDOWN(luigi.worldCol) <= SHIFTDOWN(loo.worldCol) + 20
        && SHIFTDOWN(luigi.worldCol) + luigi.width >= SHIFTDOWN(loo.worldCol + 12)
        && loo.active) {
        luigi.active = 0;
        goToLose();
    }
    if(SHIFTDOWN(luigi.worldRow) + 8 <= SHIFTDOWN(hoo.worldRow) + 28 
        && SHIFTDOWN(luigi.worldRow) + 32 >= SHIFTDOWN(hoo.worldRow) + 12 
        && SHIFTDOWN(luigi.worldCol) <= SHIFTDOWN(hoo.worldCol) + 20
        && SHIFTDOWN(luigi.worldCol) + luigi.width >= SHIFTDOWN(hoo.worldCol + 12)
        && hoo.active) {
        luigi.active = 0;
        goToLose();
    }
    for(int j = 0; j < numberOfBatteries; j++) {
        if(SHIFTDOWN(luigi.worldRow) + 8 <= battery[j].worldRow + battery[j].height 
            && SHIFTDOWN(luigi.worldRow) + 32 >= battery[j].worldRow
            && SHIFTDOWN(luigi.worldCol) <= battery[j].worldCol + battery[j].width 
            && SHIFTDOWN(luigi.worldCol) + luigi.width >= battery[j].worldCol
            && battery[j].active) {
            battery[j].active = 0;
            batteryLife += 50;
            if(batteryLife > 100) batteryLife = 100;
        }
    }
    if (BUTTON_HELD(BUTTON_UP) && SHIFTDOWN(luigi.worldCol) >= 480 && SHIFTDOWN(luigi.worldCol) <= 482 && level == 1) {
        goToLevel2();
    } else if (BUTTON_HELD(BUTTON_UP) && SHIFTDOWN(luigi.worldCol) >= 480 && SHIFTDOWN(luigi.worldCol) <= 482 && level == 2) {
        goToWin();
    }
 }

void updateScreenLocations() {
	luigi.screenRow = SHIFTDOWN(luigi.worldRow) - vOff;
	luigi.screenCol = SHIFTDOWN(luigi.worldCol) - hOff;
    if(boo.active) {
        boo.screenRow = SHIFTDOWN(boo.worldRow) - vOff;
        boo.screenCol = SHIFTDOWN(boo.worldCol) - hOff;
    }
    if(loo.active) {
        loo.screenRow = SHIFTDOWN(loo.worldRow) - vOff;
        loo.screenCol = SHIFTDOWN(loo.worldCol) - hOff;
    }
    if(hoo.active) {
        hoo.screenRow = SHIFTDOWN(hoo.worldRow) - vOff;
        hoo.screenCol = SHIFTDOWN(hoo.worldCol) - hOff;
    }
    for(int i = 0; i < 5; i++) {
        if(battery[i].active) {
            battery[i].screenRow = battery[i].worldRow - vOff;
            battery[i].screenCol = battery[i].worldCol - hOff;
        }
    }
}

void animateLuigi() {
    if(luigi.active) {
        if(luigi.aniCounter % 5 == 0) 
        {
    		luigi.aniCounter = 0; //MAKE SURE IT DOESNT GO PAST 5!!!
    		if (luigi.currFrame == 2 || luigi.currFrame == 5) luigi.currFrame = luigi.flash;
    		else luigi.currFrame++; 
        }
        if(BUTTON_HELD(BUTTON_DOWN)) {
        	if(luigi.prevAniState == RIGHT) luigi.aniState = DOWNR;
        	else if(luigi.prevAniState == LEFT) luigi.aniState = DOWNL;
    	}
    	else if(luigi.rdel != 0) {
    		if(BUTTON_HELD(BUTTON_A)) {
    			if(luigi.rdel != 0) {
    				if(luigi.prevAniState == RIGHT) {
    					luigi.aniState = JUMPR;
    				}  	else if(luigi.prevAniState == LEFT) {
    					luigi.aniState = JUMPL;
    				}
    			}
    		}
    		else if(BUTTON_HELD(BUTTON_LEFT)) {
    			luigi.aniState = LEFT;
    			luigi.prevAniState = LEFT;
    		} 
    		else if(BUTTON_HELD(BUTTON_RIGHT)) {
    			luigi.aniState = RIGHT;
    			luigi.prevAniState = RIGHT;
    		}
    	    else {
    	    	luigi.currFrame = luigi.flash;
                luigi.aniState = luigi.prevAniState;
    		}
    	}
    	else if(luigi.rdel == 0) {
    	    if(BUTTON_HELD(BUTTON_LEFT)) {
    			luigi.aniState = LEFT;
    			luigi.prevAniState = LEFT;
    		} 
    		else if(BUTTON_HELD(BUTTON_RIGHT)) {
    			luigi.aniState = RIGHT;
    			luigi.prevAniState = RIGHT;
    		}
    	    else {
    	    	luigi.currFrame = luigi.flash;
                luigi.aniState = luigi.prevAniState;
    		}
    	}
    	luigi.aniCounter++;
    }
}

void animateBoo() {
    if(boo.active) {
        if(boo.spawn == 0) {
            boo.attr0 = ATTR0_REGULAR;
            if(boo.aniCounter % 2 == 0) {
                boo.aniCounter = 0;
                if(boo.currFrame == 0) {
                    boo.spawn = 1;
                    boo.currFrame = 0;
                } else {
                    boo.currFrame--;
                }
            }
            boo.aniCounter++; 
        }
        if(boo.cdel < 0) {
            boo.flip = 0;
        } else if(boo.cdel > 0) {
            boo.flip = ATTR1_HFLIP;
        }
    } else {
        boo.spawn = 0;
        if(boo.aniCounter % 2 == 0 && boo.attr0 == ATTR0_REGULAR) 
        {
            boo.aniCounter = 0;
            if(boo.currFrame == 7) {
                boo.attr0 = ATTR0_HIDE;
                boo.currFrame = 7;
            } else {
                boo.currFrame++;
            }
        }
        boo.aniCounter++;
    }
}

void animateLoo() {
    if(loo.active) {
        if(loo.spawn == 0) {
            loo.attr0 = ATTR0_REGULAR;
            if(loo.aniCounter % 2 == 0) {
                loo.aniCounter = 0;
                if(loo.currFrame == 0) {
                    loo.spawn = 1;
                    loo.currFrame = 0;
                } else {
                    loo.currFrame--;
                }
            }
            loo.aniCounter++; 
        }
        if(loo.cdel < 0) {
            loo.flip = 0;
        } else if(loo.cdel > 0) {
            loo.flip = ATTR1_HFLIP;
        }
    } else {
        loo.spawn = 0;
        if(loo.aniCounter % 2 == 0 && loo.attr0 == ATTR0_REGULAR) 
        {
            loo.aniCounter = 0;
            if(loo.currFrame == 7) {
                loo.attr0 = ATTR0_HIDE;
                loo.currFrame = 7;
            } else {
                loo.currFrame++;
            }
        }
        loo.aniCounter++;
    }
}

void animateHoo() {
    if(hoo.active) {
        if(hoo.spawn == 0) {
            hoo.attr0 = ATTR0_REGULAR;
            if(hoo.aniCounter % 2 == 0) {
                hoo.aniCounter = 0;
                if(hoo.currFrame == 0) {
                    hoo.spawn = 1;
                    hoo.currFrame = 0;
                } else {
                    hoo.currFrame--;
                }
            }
            hoo.aniCounter++; 
        }
        if(hoo.cdel < 0) {
            hoo.flip = 0;
        } else if(hoo.cdel > 0) {
            hoo.flip = ATTR1_HFLIP;
        }
    } else {
        hoo.spawn = 0;
        if(hoo.aniCounter % 2 == 0 && hoo.attr0 == ATTR0_REGULAR) 
        {
            hoo.aniCounter = 0;
            if(hoo.currFrame == 7) {
                hoo.attr0 = ATTR0_HIDE;
                hoo.currFrame = 7;
            } else {
                hoo.currFrame++;
            }
        }
        hoo.aniCounter++;
    }
}

void cheat() {
    if(BUTTON_PRESSED(BUTTON_R) && BUTTON_PRESSED(BUTTON_L) && luigi.cheat == 0) {
        luigi.cheat = 1;
    } else if(BUTTON_PRESSED(BUTTON_R) && BUTTON_PRESSED(BUTTON_L) && luigi.cheat) {
        luigi.cheat = 0;
    }
}

void timer() {
    if (timer2 == 0) {
        goToLose();
    } else if (timer1 % 150 == 0) {
        timer1 = 0;
        timer2--;
    } 
    timer1++;
}

void updateOAM() {
    // BOO
    shadowOAM[0].attr0 = (ROWMASK & boo.screenRow) | boo.attr0;
    shadowOAM[0].attr1 = (COLMASK & boo.screenCol) | ATTR1_SIZE32 | boo.flip;
    shadowOAM[0].attr2 = (SPRITEOFFSET16(4 * 6, 4 * boo.currFrame)) | ATTR2_PALBANK(2);

    shadowOAM[1].attr0 = (ROWMASK & loo.screenRow) | loo.attr0;
    shadowOAM[1].attr1 = (COLMASK & loo.screenCol) | ATTR1_SIZE32 | loo.flip;
    shadowOAM[1].attr2 = (SPRITEOFFSET16(4 * 6, 4 * loo.currFrame)) | ATTR2_PALBANK(2);

    shadowOAM[2].attr0 = (ROWMASK & hoo.screenRow) | hoo.attr0;
    shadowOAM[2].attr1 = (COLMASK & hoo.screenCol) | ATTR1_SIZE32 | hoo.flip;
    shadowOAM[2].attr2 = (SPRITEOFFSET16(4 * 6, 4 * hoo.currFrame)) | ATTR2_PALBANK(2);

    if (luigi.cheat) {
        shadowOAM[LUIGI].attr0 = (ROWMASK & luigi.screenRow) | ATTR0_TALL;
        shadowOAM[LUIGI].attr1 = (COLMASK & luigi.screenCol) | ATTR1_SIZE32;
        shadowOAM[LUIGI].attr2 = (SPRITEOFFSET16(4, 12)) | ATTR2_PALBANK(1);
    }
    // LUIGI
    else if(luigi.active) {
    	shadowOAM[LUIGI].attr0 = (ROWMASK & luigi.screenRow) | ATTR0_TALL;
    	shadowOAM[LUIGI].attr1 = (COLMASK & luigi.screenCol) | ATTR1_SIZE32;
    	shadowOAM[LUIGI].attr2 = SPRITEOFFSET16(4 * luigi.aniState, 2 * luigi.currFrame);
    } else {
        shadowOAM[LUIGI].attr0 = (ROWMASK & luigi.screenRow) | ATTR0_TALL;
        shadowOAM[LUIGI].attr1 = (COLMASK & luigi.screenCol) | ATTR1_SIZE32;
        shadowOAM[LUIGI].attr2 = SPRITEOFFSET16(0, 12);
    }
    // LIGHT
    if(luigi.flash && batteryLife > 0 && luigi.prevAniState == RIGHT) {
        shadowOAM[LIGHT].attr0 = (ROWMASK & (luigi.screenRow + 10));
        shadowOAM[LIGHT].attr1 = (COLMASK & (luigi.screenCol + 13)) | ATTR1_SIZE32;
        shadowOAM[LIGHT].attr2 = (SPRITEOFFSET16(0, 12)) | ATTR2_PALBANK(1);
    } else if(luigi.flash && batteryLife > 0 && luigi.prevAniState == LEFT) {
        shadowOAM[LIGHT].attr0 = (ROWMASK & (luigi.screenRow + 9));
        shadowOAM[LIGHT].attr1 = (COLMASK & (luigi.screenCol - 33)) | ATTR1_SIZE32 | ATTR1_HFLIP;
        shadowOAM[LIGHT].attr2 = (SPRITEOFFSET16(0, 12)) | ATTR2_PALBANK(1);
    } else {
        shadowOAM[LIGHT].attr0 = (ATTR0_HIDE);
    }
    //BATTERIES
    for(int i = 0; i < numberOfBatteries; i++) {
        if(battery[i].active) {
            shadowOAM[BATTERIES + i].attr0 = (ROWMASK & battery[i].screenRow) | ATTR0_TALL;
            shadowOAM[BATTERIES + i].attr1 = (COLMASK & battery[i].screenCol) | ATTR1_SIZE32;
            shadowOAM[BATTERIES + i].attr2 = (SPRITEOFFSET16(0, 17)) | ATTR2_PALBANK(1);
        } else {
            shadowOAM[BATTERIES + i].attr0 = ATTR0_HIDE;
        }
    }

    // BATTERY_BARS
    for(int i = 0; i < 32; i++) {
        if(i * 3 < batteryLife) {
            shadowOAM[BATTERY_BARS + i].attr0 = (ROWMASK & 9);
            shadowOAM[BATTERY_BARS + i].attr1 = (COLMASK & (9 + 3 * i));
            shadowOAM[BATTERY_BARS + i].attr2 = (SPRITEOFFSET16(0, 24)) | ATTR2_PALBANK(1);
        } else {
            shadowOAM[BATTERY_BARS + i].attr0 = ATTR0_HIDE;
        }
    }
    // DOOR
    shadowOAM[DOOR].attr0 = (ROWMASK & (SCREENHEIGHT - 72)) | ATTR0_TALL;
    shadowOAM[DOOR].attr1 = (COLMASK & (480 - hOff)) | ATTR1_SIZE32;
    shadowOAM[DOOR].attr2 = (SPRITEOFFSET16(4, 14));
    //  TIMER
    shadowOAM[TENS].attr0 = (ROWMASK & (10));
    shadowOAM[TENS].attr1 = (COLMASK & (215));
    shadowOAM[TENS].attr2 = (SPRITEOFFSET16(28, (timer2 / 10))) | ATTR2_PALBANK(2);;

    shadowOAM[ONES].attr0 = (ROWMASK & (10));
    shadowOAM[ONES].attr1 = (COLMASK & (221));
    shadowOAM[ONES].attr2 = (SPRITEOFFSET16(28, (timer2 % 10))) | ATTR2_PALBANK(2);;

}



