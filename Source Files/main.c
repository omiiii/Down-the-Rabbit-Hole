#include <stdlib.h>
#include "myLib.h"
#include "text.h"
#include "bg0.h"
#include "bg0_alt.h"
#include "bg1.h"
#include "lvl1.h"
#include "lvl2.h"
#include "lvl3.h"
#include "collisionMap_1.h"
#include "collisionMap_2.h"
#include "collisionMap_3.h"
#include "sound.h"
#include "splash.h"
#include "instructions.h"
#include "pausescreen.h"
#include "finishscreen.h"
#include "splashSong.h"
#include "gameSong.h"
#include "gameSong_2.h"
#include "select.h"
#include "jump.h"
#include "cheat.h"
#include "pickup.h"
#include "whoosh.h"
#include "finishSong.h"
#include "endlevel.h"
#include "flutter.h"
#include "Alice.h"

//Masking
#define ROWMASK 0xFF
#define COLMASK 0x1FF

//Screen Areas
#define SCREENTOP 128
#define SCREENBOTTOM 95
#define SCREENVMIDDLE 50
#define SCREENVMIDDLE2 256
#define SCREENHMIDDLE 100
#define SCREENRIGHT 400
#define SCREENLEFT 16
#define SCREENBOTTOM2 352

// STATES (define the additional states)
#define STARTSCREEN 0
#define INSTRUCTIONS 1
#define GAMESCREEN 2
#define FINISHSCREEN 3
#define PAUSESCREEN 4

// Color Palette
#define REDINDEX 1
#define GREENINDEX 2
#define BLUEINDEX 3
#define WHITEINDEX 4
#define BLACKINDEX 5

#define NUMOBTLS 5 // Number of Bottles


unsigned int buttons;
unsigned int oldButtons;

int hOff=0; // Only for BG2 and the Big Row and Big Col
int hOff2 = 0; // Only for BG0 and BG1
int vOff = 95;
int heightofScreen = 256;
int bottlesTotal;
int gravity = 1;
int state;
int level;

int lev1col[] = {70, 215, 360, 0, 0};
int lev1row[] = {175, 175, 60, 0, 0};
int lev2col[] = {81, 182, 370, 0, 0};
int lev2row[] = {73, 173, 190, 0, 0};
int lev3col[] = {98, 238, 320, 92, 237};
int lev3row[] = {420, 420, 250, 50, 50};

OBJ_ATTR shadowOAM[128];


typedef struct  
{
	int row;
	int col;
	int bigRow;
	int bigCol;
	int rdel;
    int cdel;
    int racc;
    int cacc;
	int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int currFrame;
    int maxC;
    int maxR;
    int butterflies;
    int isGrounded; // Is Alice on the ground?
    int isFalling; // Is she in the air?
    int isGliding; // Has she passed through the screen?
    int isDead; // Did she died?
    int isJumping; //Jumping?
    int blueSmoke; // ALice disapears in a puff of blue smoke
    int redSmoke; // Cheat mode!
    int isCheating; // Oooooooh. You cheater!
} PLAYER;

typedef struct  
{
	int row;
	int col;
	int bigRow;
	int bigCol;
	int width;
    int height;
    int isActive;
    int isOnScreen;
} BOTTLE;

PLAYER alice;
PLAYER* aliceptr = &alice;

BOTTLE bottles[NUMOBTLS];

enum {LEV1,LEV2,LEV3};

enum {ALICERUNRIGHT=0, ALICERUNLEFT=2, ALICEIDLERIGHT=4, ALICEIDLELEFT=6, ALICEAIRRIGHT=8, ALICEAIRLEFT=10, ALICEBUTTERFLYRIGHT=12,ALICEBUTTERFLYLEFT=14}; //States for Alice


int main()
{
       
    initialize();
    setupInterrupts();
    setupSounds();
    
    state = STARTSCREEN;
        
	while(1)
	{    
		oldButtons = buttons;
        buttons = BUTTONS;

        level = 0;
        vOff = 95;
        initializeSprites();		

		 switch(state)
		{
			case STARTSCREEN:
				splash();
				state = INSTRUCTIONS;
				break;

			case INSTRUCTIONS:
				instructions();
				stopSound();
				playSoundB(select,SELECTLEN,SELECTFREQ);
				hideSprites(); 
    			initializeSprites();
				initializeGame();
				stopSound();
				state = GAMESCREEN;
				break;
			case GAMESCREEN:
				game();
				initialize();
				break;
			case FINISHSCREEN:
				stopSound();
				finish();
				stopSound();
				state = STARTSCREEN;
				break;
			case PAUSESCREEN:
				playSoundB(select,SELECTLEN,SELECTFREQ);	
				pauseSound();
				pause();
				break;
		}          
	}

	return 0;
}

void initialize() {
	//enable sprites in the REG_DISPCTL
	REG_DISPCTL = MODE4 | BG2_ENABLE;

	PALETTE[REDINDEX] = COLOR(31,0,0);
	PALETTE[GREENINDEX] = COLOR(0,31,0);
	PALETTE[BLUEINDEX] = COLOR(0,0,31);
	PALETTE[WHITEINDEX] = COLOR(31,31,31);
	PALETTE[BLACKINDEX] = COLOR(0,0,0);
}

void initializeGame() {
	REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE | BG2_ENABLE | SPRITE_ENABLE;

	REG_BG0CNT = BG_SIZE0 | CBB(0) | SBB(2) | COLOR256 | 2;
	REG_BG1CNT = BG_SIZE0 | CBB(1) | SBB(15) | COLOR256 | 1;
	REG_BG2CNT = BG_SIZE3 | CBB(2) | SBB(25) | COLOR256;

	drawLevel();

    DMANow(3,AlicePal,SPRITE_PALETTE,AlicePalLen/2);
    DMANow(3,AliceTiles,&CHARBLOCKBASE[4],AliceTilesLen/2);
        
}


void splash() {
	playSoundA(splashSong,SPLASHSONGLEN,44100);
	loadPalette(splashPal);
	drawBackgroundImage4(splashBitmap);
	while(!BUTTON_HELD(BUTTON_START)) {
    }

    while (BUTTON_HELD(BUTTON_START)) {
    }

}

void instructions() {
	loadPalette(instructionsPal);
	drawBackgroundImage4(instructionsBitmap);

    while(!BUTTON_HELD(BUTTON_START)){ 
    }

    while (BUTTON_HELD(BUTTON_START)) {

    }
}

void game() {

	playLevelMusic();
	while(1 && state == GAMESCREEN) {

		oldButtons = buttons;
	    buttons = BUTTONS;
	   	
	   	updatePlayer();
	    checkPlayerScreen();
	    checkItemCollide();
	    scrollVert();
	    scorllHoriz();
	    checkAliceCollision();
	    checkForBottles();

	    alice.bigRow = alice.row + vOff;
		alice.bigCol = alice.col + hOff/2;

		checkGravity();

		updateOAM();

		REG_BG0HOFS = hOff2/30;
		REG_BG1HOFS = hOff2/25;
		REG_BG2HOFS = hOff/2;
		REG_BG2VOFS = vOff;

		for (int i = 0; i < NUMOBTLS; i++) {
			if (bottles[i].col >= 0 && bottles[i].row >= 0 && bottles[i].col <= 240 && bottles[i].row <= 160) {
				bottles[i].isOnScreen = 1;
			} else {
				bottles[i].isOnScreen = 0;
			}
		}

		if (hOff <= 0) hOff = 1;
		else if (hOff >= 540) hOff = 540;
		else {	
			for (int i = 0; i < NUMOBTLS; i++) {
				bottles[i].col = bottles[i].bigCol - hOff/2;
				bottles[i].row = bottles[i].bigRow - vOff;
			}
		}


		if (BUTTON_PRESSED(BUTTON_START)) {
			state = PAUSESCREEN;
			return;
		}



		waitForVblank();
	}

	return;
}

void finish() {
	playSoundA(finishSong,FINISHSONGLEN,FINISHSONGFREQ);
	loadPalette(finishscreenPal);
	drawBackgroundImage4(finishscreenBitmap);
   
    while(!BUTTON_HELD(BUTTON_START)){ 
    }

    while (BUTTON_HELD(BUTTON_START)) {

    }
}

void pause() {
	loadPalette(pausescreenPal);
	drawBackgroundImage4(pausescreenBitmap);
    while (1) {
    	oldButtons = buttons;
        buttons = BUTTONS;
		
    	if (BUTTON_PRESSED(BUTTON_START)) {
    		state = GAMESCREEN;
    		unpauseSound();
    		initializeGame();
    		return;
    	}

    	if (BUTTON_PRESSED(BUTTON_SELECT)) {
    		state = STARTSCREEN;
    		stopSound();
    		return;
    	}
    }
}

void drawLevel() {
	switch (level) {
		case LEV1:
			loadPalette(bg0Pal);
			DMANow(3,bg0Tiles, &CHARBLOCKBASE[0], bg0TilesLen/2);
			DMANow(3,bg0Map,&SCREENBLOCKBASE[2],bg0MapLen/2);
			DMANow(3,bg1Tiles, &CHARBLOCKBASE[1], bg1TilesLen/2);
			DMANow(3,bg1Map,&SCREENBLOCKBASE[15],bg1MapLen/2);
	   		DMANow(3,lvl1Tiles, &CHARBLOCKBASE[2],lvl1TilesLen/2);
	    	DMANow(3,lvl1Map,&SCREENBLOCKBASE[25],lvl1MapLen/2);
	    	REG_BG2VOFS = vOff;
	    	break;
		case LEV2:
			loadPalette(bg0Pal_2);
			DMANow(3,bg0Tiles, &CHARBLOCKBASE[0], bg0TilesLen/2);
	   		DMANow(3,bg0Map,&SCREENBLOCKBASE[2],bg0MapLen/2);
	 		DMANow(3,bg1Tiles, &CHARBLOCKBASE[1], bg1TilesLen/2);
	    	DMANow(3,bg1Map,&SCREENBLOCKBASE[15],bg1MapLen/2);
	   		DMANow(3,lvl2Tiles, &CHARBLOCKBASE[2],lvl2TilesLen/2);
	    	DMANow(3,lvl2Map,&SCREENBLOCKBASE[25],lvl2MapLen/2);
	    	REG_BG2VOFS = vOff;
			break;
		case LEV3:
			loadPalette(bg0_altPal);
			DMANow(3,bg0_altTiles, &CHARBLOCKBASE[0], bg0_altTilesLen/2);
   			DMANow(3,bg0_altMap,&SCREENBLOCKBASE[2],bg0_altMapLen/2);
	 		DMANow(3,bg1Tiles, &CHARBLOCKBASE[1], bg1TilesLen/2);
	    	DMANow(3,bg1Map,&SCREENBLOCKBASE[15],bg1MapLen/2);
	   		DMANow(3,lvl3Tiles, &CHARBLOCKBASE[2],lvl3TilesLen/2);
	    	DMANow(3,lvl3Map,&SCREENBLOCKBASE[25],lvl3MapLen/2);
	    	vOff = 186;
	    	REG_BG2VOFS = vOff;
			break;
	}
}

void hideSprites() {
    int i;
    for (i = 0; i < 128; i++) {
    	shadowOAM[i].attr0 = ATTR0_HIDE;
    }
}

void initializeSprites() {
	alice.width = 32;
    alice.height = 64;
    alice.rdel = 0;
    alice.cdel = 0;
    if (level == 2)	alice.row = 40;
    else alice.row = 20;
	alice.col = 10;
	alice.racc = 3;
	alice.cacc = 1;
	alice.maxC = 10;
	alice.maxR = 5;
	alice.isGrounded = 0;
	alice.isFalling = 0;
	alice.isGliding = 0;
	alice.isJumping = 0;
	alice.blueSmoke = 0;
	alice.redSmoke = 0;
	alice.isCheating = 0;

	alice.aniCounter = 0;
    alice.currFrame = 0;

    for(int i = 0; i < NUMOBTLS; i++) //for each object
	{
		bottles[i].width = 32;
		bottles[i].height = 32;
		if (level == 0) {
			bottles[i].bigRow = lev1row[i];
			bottles[i].bigCol = lev1col[i];
		} else if (level == 1) {
			bottles[i].bigRow = lev2row[i];
			bottles[i].bigCol = lev2col[i];
		} else if (level == 2) {
			bottles[i].bigRow = lev3row[i];
			bottles[i].bigCol = lev3col[i];
		}
		if (bottles[i].bigRow != 0 && bottles[i].bigCol != 0) bottles[i].isActive = 1;
		else bottles[i].isActive = 0;
		bottles[i].row = bottles[i].bigRow - vOff;
		bottles[i].col = bottles[i].bigCol - hOff/2;
	}   
	    buttons = BUTTONS;
}

void updateOAM() {

     // Alice Stuff
    if (aliceptr->isDead) {
        shadowOAM[0].attr0 = (alice.row & ROWMASK) | ATTR0_SQUARE | ATTR0_4BPP;
		shadowOAM[0].attr1 = ((alice.col-16) & COLMASK) | ATTR1_SIZE64;
		shadowOAM[0].attr2 = (SPRITEOFFSET16(2*alice.currFrame,2*alice.aniState)) | (ATTR2_PALBANK(aliceptr->isCheating));
	} else if (!aliceptr->isDead && !aliceptr->blueSmoke  && !aliceptr->redSmoke) {
		shadowOAM[0].attr0 = (alice.row & ROWMASK) | ATTR0_TALL | ATTR0_4BPP;
		shadowOAM[0].attr1 = (alice.col & COLMASK) | ATTR1_SIZE64;
		shadowOAM[0].attr2 = (SPRITEOFFSET16(2*alice.currFrame,2*alice.aniState)) | (ATTR2_PALBANK(aliceptr->isCheating));
	} else if (!aliceptr->isDead && aliceptr->blueSmoke) {
		shadowOAM[0].attr0 = (alice.row & ROWMASK) | ATTR0_SQUARE | ATTR0_4BPP;
		shadowOAM[0].attr1 = ((alice.col-16) & COLMASK) | ATTR1_SIZE64;
		shadowOAM[0].attr2 = SPRITEOFFSET16(2*8,2*12);
	} else if (!aliceptr->isDead && aliceptr->redSmoke) {
		shadowOAM[0].attr0 = (alice.row & ROWMASK) | ATTR0_SQUARE | ATTR0_4BPP;
		shadowOAM[0].attr1 = ((alice.col-16) & COLMASK) | ATTR1_SIZE64;
		shadowOAM[0].attr2 = (SPRITEOFFSET16(2*12,2*12)) | (ATTR2_PALBANK(aliceptr->isCheating));
	}

	//Bottles
	for (int i = 0; i < NUMOBTLS; i++) {
		if (bottles[i].isActive && bottles[i].isOnScreen) {
			shadowOAM[i+1].attr0 = (bottles[i].row & ROWMASK) | ATTR0_SQUARE | ATTR0_4BPP;
			shadowOAM[i+1].attr1 = (bottles[i].col & COLMASK) | ATTR1_SIZE32;
			shadowOAM[i+1].attr2 = SPRITEOFFSET16(2*4,2*4);
		} else {
			shadowOAM[i+1].attr0 = ATTR0_HIDE;
		}
	}

	//Bottle Count

	// "Bottles:"
		shadowOAM[7].attr0 = ((0) & ROWMASK) | ATTR0_WIDE | ATTR0_4BPP;
		shadowOAM[7].attr1 = ((0) & COLMASK) | ATTR1_SIZE64;
		shadowOAM[7].attr2 = SPRITEOFFSET16(2*6,2*4);

	//Number of Bottles: 
		if(bottlesTotal == 0) {
			shadowOAM[8].attr0 = ((0) & ROWMASK) | ATTR0_SQUARE | ATTR0_4BPP;
			shadowOAM[8].attr1 = ((53) & COLMASK) | ATTR1_SIZE32;
			shadowOAM[8].attr2 = SPRITEOFFSET16(2*8,2*4);
		} else if (bottlesTotal == 1) {
			shadowOAM[8].attr0 = ((0) & ROWMASK) | ATTR0_SQUARE | ATTR0_4BPP;
			shadowOAM[8].attr1 = ((53) & COLMASK) | ATTR1_SIZE32;
			shadowOAM[8].attr2 = SPRITEOFFSET16(2*8,2*6);
		} else if (bottlesTotal == 2) {
			shadowOAM[8].attr0 = ((0) & ROWMASK) | ATTR0_SQUARE | ATTR0_4BPP;
			shadowOAM[8].attr1 = ((53) & COLMASK) | ATTR1_SIZE32;
			shadowOAM[8].attr2 = SPRITEOFFSET16(2*10,2*4);
		} else if (bottlesTotal == 3) {
			shadowOAM[8].attr0 = ((0) & ROWMASK) | ATTR0_SQUARE | ATTR0_4BPP;
			shadowOAM[8].attr1 = ((53) & COLMASK) | ATTR1_SIZE32;
			shadowOAM[8].attr2 = SPRITEOFFSET16(2*10,2*6);
		} else if (bottlesTotal == 4) {
			shadowOAM[8].attr0 = ((0) & ROWMASK) | ATTR0_SQUARE | ATTR0_4BPP;
			shadowOAM[8].attr1 = ((53) & COLMASK) | ATTR1_SIZE32;
			shadowOAM[8].attr2 = SPRITEOFFSET16(2*12,2*4);
		} else if (bottlesTotal == 5) {
			shadowOAM[8].attr0 = ((0) & ROWMASK) | ATTR0_SQUARE | ATTR0_4BPP;
			shadowOAM[8].attr1 = ((53) & COLMASK) | ATTR1_SIZE32;
			shadowOAM[8].attr2 = SPRITEOFFSET16(2*12,2*6);
		}

	// "/"
		shadowOAM[9].attr0 = ((0) & ROWMASK) | ATTR0_SQUARE | ATTR0_4BPP;
		shadowOAM[9].attr1 = ((66) & COLMASK) | ATTR1_SIZE32;
		shadowOAM[9].attr2 = SPRITEOFFSET16(2*14,2*4);

	// Totals 
		if (level < 2) { // This should be 3.
			shadowOAM[10].attr0 = ((0) & ROWMASK) | ATTR0_SQUARE | ATTR0_4BPP;
			shadowOAM[10].attr1 = ((75) & COLMASK) | ATTR1_SIZE32;
			shadowOAM[10].attr2 = SPRITEOFFSET16(2*10,2*6);
		} else if (level == 2) { // This should be 5.
			shadowOAM[10].attr0 = ((0) & ROWMASK) | ATTR0_SQUARE | ATTR0_4BPP;
			shadowOAM[10].attr1 = ((75) & COLMASK) | ATTR1_SIZE32;
			shadowOAM[10].attr2 = SPRITEOFFSET16(2*12,2*6);
		}
         
    DMANow(3,shadowOAM,OAM,512);
}


void updatePlayer() {

	if (aliceptr->aniState == 0 || aliceptr->aniState == 2)
	{
		aliceptr->prevAniState = aliceptr->aniState;
	}

	aliceIdle();

	if (BUTTON_PRESSED(BUTTON_A))
    {
    	aliceJump();
    }

    if (BUTTON_PRESSED(BUTTON_B)) 
    {
    	aliceButterflies();
    }

    if (BUTTON_PRESSED(BUTTON_SELECT)) {
    	cheatMode();
    }

    if (checkButterflies() && aliceptr->cdel == 0 && (aliceptr->isGliding || aliceptr->isCheating)) { //Switches back to falling
    	if (aliceptr->aniState == ALICEBUTTERFLYRIGHT) {
				aliceptr->aniState = ALICEAIRRIGHT;
			} else if (aliceptr->aniState == ALICEBUTTERFLYLEFT) {
				aliceptr->aniState = ALICEAIRLEFT;
		}		
    }

    aliceWalk();
}

void scrollVert() {
	if (level < 2) {
	    if (vOff <= 1 && alice.row < SCREENVMIDDLE) // At top of Screen
	    {
	        alice.row+=alice.rdel/4;
	    } else if (vOff >= SCREENBOTTOM && alice.row + 64 > SCREENVMIDDLE) { // Standing at the bottom of level 1 and 2
	    	alice.row+=alice.rdel/4;
	   	} else if (vOff <= 1 && alice.row > SCREENVMIDDLE) { // After falling through
	    	alice.row+=alice.rdel/4;
	   	} else {
	   		vOff+=alice.rdel/4;
	   	}
	} else if (level == 2) {
		if (vOff <= 7 && alice.row < SCREENVMIDDLE) // At top of Screen
	    {
	        alice.row+=alice.rdel/4;
	    } else if (vOff >= 352 && alice.isFalling) { // Moves Alice to the Bottom of The Screen
	    	alice.row+=alice.rdel/4;
	   	} else if (vOff >= 352 && alice.row + 64 > 160) { // Moves Alice through the bottom of the Screen
	    	alice.row+=alice.rdel/4;
	   	} else if (vOff <= 7 && alice.row > SCREENVMIDDLE) { // After falling through
	    	alice.row+=alice.rdel/4;
	   	} else {
	   		vOff+=alice.rdel/4;
	   	}
	}
}

void scorllHoriz() {
	if (BUTTON_HELD(BUTTON_RIGHT) || checkButterflies()) {
            if ((hOff > 538 || hOff < 2) && alice.col < SCREENHMIDDLE)
            {
                alice.col += alice.cdel/4;
            } else if (hOff > 538 && alice.col + 42 > SCREENHMIDDLE) {
            	alice.col += alice.cdel/4;
            } else {
	       		hOff+=alice.cdel/3;
	       		hOff2++;
            }
        }


        if (BUTTON_HELD(BUTTON_LEFT) || checkButterflies()) {
            if ((hOff > 538 || hOff < 2) && alice.col >= SCREENHMIDDLE)
            {
                alice.col += alice.cdel/4;
            } else if (hOff < 2 && alice.col - 10 < SCREENHMIDDLE) {
            	alice.col += alice.cdel/4;
            } else {
	       		hOff+=alice.cdel/3;
	       		hOff2--;
            }
        }

}


void checkPlayerScreen() {
		if (aliceptr->row == 256) aliceptr->row = 0; //Falling through the screen!
		if (aliceptr->rdel < 0 && aliceptr->row <= 0) aliceptr->row = 0; // Can't jump back up through screen.

		if (aliceptr->isGliding && aliceptr->row <= 512 && aliceptr->row >= 160 && level < 2) {
			if (vOff >= 0) {
				vOff-=7;
			}
		}

		if (aliceptr->isGliding && aliceptr->row >= 160 && level == 2) {
			if (vOff > 7) {
				vOff-=7;
			}
		}

		if (aliceptr->row == 160) {
			if (level == 2) aliceptr->row = 170;
			aliceptr->isGliding = 1;	    
			if (aliceptr->prevAniState == ALICERUNRIGHT) {
				aliceptr->aniState = ALICEAIRRIGHT;
			} else if (aliceptr->prevAniState == ALICERUNLEFT) {
				aliceptr->aniState = ALICEAIRLEFT;
			}		
		    aliceptr->currFrame = 0;
		}


		if (aliceptr->col < 0)
		{
		    aliceptr->col = 0;
		    aliceptr->cdel = 0;
		}

		if(aliceptr->col >= (240-aliceptr->width)) {
		    aliceptr->col = (239-aliceptr->width);
		    aliceptr->cdel = 0;
		}
}

void aliceMoveLeft() {
	aliceptr->aniCounter++;
	if (aliceptr->cdel >= -(aliceptr->maxC))
    {
        aliceptr->cdel -= aliceptr->cacc;
    }

    if (aliceptr->isGrounded && aliceptr->isFalling == 0) {
		aliceptr->aniState = ALICERUNLEFT;

		if(aliceptr->aniCounter%12==0) 
		{
			if (aliceptr->currFrame == 12) {
				aliceptr->currFrame = 4;
			}
			else {
				aliceptr->currFrame+=4;
			}
		}
	} else if (aliceptr->isGrounded == 0 && aliceptr->isFalling && aliceptr->isGliding) {
		aliceptr->aniState = ALICEAIRLEFT;
		aliceptr->currFrame = 0;

	}
}

void aliceMoveRight() {
	aliceptr->aniCounter++;
	if (aliceptr->cdel <= aliceptr->maxC)
	{
		aliceptr->cdel += aliceptr->cacc;
	}  
    if (aliceptr->isGrounded && aliceptr->isFalling == 0)
    {
    	aliceptr->aniState = ALICERUNRIGHT;

        if(aliceptr->aniCounter%12==0)
		{
			if (aliceptr->currFrame == 12) {
				aliceptr->currFrame = 4;
			}
			else {
				aliceptr->currFrame+=4;
			}
		}
	} else if (aliceptr->isGrounded == 0 && aliceptr->isFalling && aliceptr->isGliding) {
		aliceptr->aniState = ALICEAIRRIGHT;
		aliceptr->currFrame = 0;

	}      
}

void aliceWalk() {
	if (BUTTON_HELD(BUTTON_LEFT) && !checkButterflies())
    {
    	aliceMoveLeft();
	}

    else if (BUTTON_HELD(BUTTON_RIGHT) && !checkButterflies())
    {
   		aliceMoveRight();
    }

    else
    {
        if (aliceptr->cdel > 0)
        {
            aliceptr->cdel--;
        }
        else if (aliceptr->cdel < 0)
        {
            aliceptr->cdel++;
        } 
        else if (aliceptr->cdel == 0) {
        	aliceptr->cdel = 0;
        }
    }
}

void checkGravity() {
	if (level == 0) {
		gravityLvl1();
	} 

	if (level == 1) {
		gravityLvl2();
	}

	if (level == 2) {
		gravityLvl3();
	}
}

void gravityLvl1() {
	if (collisionMap_1Bitmap[OFFSET(aliceptr->bigRow + aliceptr->height-2,aliceptr->bigCol+16,512)] == COLOR(31,31,31)) {
        if (aliceptr->rdel <= aliceptr->maxR) {
       		aliceptr->rdel += gravity;
        	aliceptr->isGrounded = 0;
        }

        if (aliceptr->rdel >= 2) {
			aliceptr->isFalling = 1;
		}
    } else if (collisionMap_1Bitmap[OFFSET(aliceptr->bigRow + aliceptr->height-2,aliceptr->bigCol+16,512)] == COLOR(0,0,0)) {
    	if (aliceptr->row >= 0 && aliceptr->row + 64 <= 160) {	
			aliceptr->isFalling = 0;
			if (aliceptr->isGrounded == 0) {
				aliceptr->isJumping = 0;
				aliceptr->rdel = 0;
				aliceptr->isGrounded = 1;
				aliceptr->isGliding = 0;
			}
		}
	}
}

void gravityLvl2() {
	if (collisionMap_2Bitmap[OFFSET(aliceptr->bigRow + aliceptr->height-1,aliceptr->bigCol+16,512)] == COLOR(31,31,31)) {
        if (aliceptr->rdel <= aliceptr->maxR) {
       		aliceptr->rdel += gravity;
        	aliceptr->isGrounded = 0;
        }

        if (aliceptr->rdel >= 2) {
			aliceptr->isFalling = 1;
		}
    } else if (collisionMap_2Bitmap[OFFSET(aliceptr->bigRow + aliceptr->height-1,aliceptr->bigCol+16,512)] == COLOR(0,0,0)) {
    	if (aliceptr->row >= 0 && aliceptr->row + 64 <= 160) {	
			aliceptr->isFalling = 0;
			if (aliceptr->isGrounded == 0) {
				aliceptr->isJumping = 0;
				aliceptr->rdel = 0;
				aliceptr->isGrounded = 1;
				aliceptr->isGliding = 0;
			}
		}
	} else if (collisionMap_2Bitmap[OFFSET(aliceptr->bigRow + aliceptr->height-1,aliceptr->bigCol+16,512)] == COLOR(31,0,0)) {
		if (aliceptr->row >= 0 && aliceptr->row + 64 <= 160 && !aliceptr->isCheating) {	
			aliceptr->rdel = 0;
			aliceptr->isDead = 1;
			aliceDie();
		}
	}
}

void gravityLvl3() {
	if (collisionMap_3Bitmap[OFFSET(aliceptr->bigRow + aliceptr->height-2,aliceptr->bigCol+16,512)] == COLOR(31,31,31)) {
        if (aliceptr->rdel <= aliceptr->maxR) {
       		aliceptr->rdel += gravity;
        	aliceptr->isGrounded = 0;
        }

        if (aliceptr->rdel >= 2) {
			aliceptr->isFalling = 1;
		}
    } else if (collisionMap_3Bitmap[OFFSET(aliceptr->bigRow + aliceptr->height-2,aliceptr->bigCol+16,512)] == COLOR(0,0,0)) {
		if (aliceptr->row >= 0 && aliceptr->row + 64 <= 160) {	
			aliceptr->isFalling = 0;
			if (aliceptr->isGrounded == 0) {
				aliceptr->isJumping = 0;
				aliceptr->rdel = 0;
				aliceptr->isGrounded = 1;
				aliceptr->isGliding = 0;
			}
		}
	} else if (collisionMap_3Bitmap[OFFSET(aliceptr->bigRow + aliceptr->height-2,aliceptr->bigCol+16,512)] == COLOR(31,0,0)) {
		if (aliceptr->row >= 0 && aliceptr->row + 64 <= 160 && !aliceptr->isCheating) {	
			aliceptr->rdel = 0;
			aliceptr->isDead = 1;
			aliceDie();
		}

	}
}

void checkAliceCollision() {
	if (aliceptr->isFalling && !aliceptr->isGliding) {

		if (level == 0) {	
			aliceCollisionLvl1();
		}

		if (level == 1) {
			aliceCollisionLvl2();
		}

		if (level == 2) {
			aliceCollisionLvl3();
		}
	}
}

void aliceCollisionLvl1() {
	if (collisionMap_1Bitmap[OFFSET(aliceptr->bigRow - 1,aliceptr->bigCol,512)] == 0x0000) 
	{
		aliceptr->cdel = 0; 
		aliceptr->col++;
	}
	else if (collisionMap_1Bitmap[OFFSET(aliceptr->bigRow + 32 - 1,aliceptr->bigCol,512)] == 0x0000) 
	{
		aliceptr->cdel = 0;
		aliceptr->col++;
	}
	else if (collisionMap_1Bitmap[OFFSET(aliceptr->bigRow + 64 - 1,aliceptr->bigCol,512)] == 0x0000)
	{
		aliceptr->cdel = 0;
		aliceptr->col++;
	}
	else if (collisionMap_1Bitmap[OFFSET(aliceptr->bigRow - 1,aliceptr->bigCol + 16,512)] == 0x0000)
	{
		aliceptr->cdel = 0;
		aliceptr->row--;
		aliceptr->col++;
	}
	else if (collisionMap_1Bitmap[OFFSET(aliceptr->bigRow - 1,aliceptr->bigCol + 32,512)] == 0x0000) 
	{
		aliceptr->cdel = 0;
		aliceptr->col--;
	}
	else if (collisionMap_1Bitmap[OFFSET(aliceptr->bigRow + 32 - 1,aliceptr->bigCol + 32,512)] == 0x0000)
	{
		aliceptr->cdel = 0;
		aliceptr->col--;
	}
	else if (collisionMap_1Bitmap[OFFSET(aliceptr->bigRow + 64 - 1,aliceptr->bigCol + 32,512)] == 0x0000) 
	{	
		aliceptr->cdel = 0;
		aliceptr->col--;
	}
}

void aliceCollisionLvl2() {
	if (collisionMap_2Bitmap[OFFSET(aliceptr->bigRow - 1,aliceptr->bigCol,512)] == 0x0000) 
	{
		aliceptr->cdel = 0; 
		aliceptr->col++;
	}
	else if (collisionMap_2Bitmap[OFFSET(aliceptr->bigRow + 32 - 1,aliceptr->bigCol,512)] == 0x0000) 
	{
		aliceptr->cdel = 0;
		aliceptr->col++;
	}
	else if (collisionMap_2Bitmap[OFFSET(aliceptr->bigRow + 64 - 1,aliceptr->bigCol,512)] == 0x0000)
	{
		aliceptr->cdel = 0;
		aliceptr->col++;
	}
	else if (collisionMap_2Bitmap[OFFSET(aliceptr->bigRow - 1,aliceptr->bigCol + 16,512)] == 0x0000)
	{
		aliceptr->cdel = 0;
		aliceptr->row--;
		aliceptr->col++;
	}
	else if (collisionMap_2Bitmap[OFFSET(aliceptr->bigRow - 1,aliceptr->bigCol + 32,512)] == 0x0000) 
	{
		aliceptr->cdel = 0;
		aliceptr->col--;
	}
	else if (collisionMap_2Bitmap[OFFSET(aliceptr->bigRow + 32 - 1,aliceptr->bigCol + 32,512)] == 0x0000)
	{
		aliceptr->cdel = 0;
		aliceptr->col--;
	}
	else if (collisionMap_2Bitmap[OFFSET(aliceptr->bigRow + 64 - 1,aliceptr->bigCol + 32,512)] == 0x0000) 
	{	
		aliceptr->cdel = 0;
		aliceptr->col--;
	}
}

void aliceCollisionLvl3() {
	if (collisionMap_3Bitmap[OFFSET(aliceptr->bigRow - 1,aliceptr->bigCol,512)] == 0x0000) 
	{
		aliceptr->cdel = 0; 
		aliceptr->col++;
	}
	else if (collisionMap_3Bitmap[OFFSET(aliceptr->bigRow + 32 - 1,aliceptr->bigCol,512)] == 0x0000) 
	{
		aliceptr->cdel = 0;
		aliceptr->col++;
	}
	else if (collisionMap_3Bitmap[OFFSET(aliceptr->bigRow + 64 - 1,aliceptr->bigCol,512)] == 0x0000)
	{
		aliceptr->cdel = 0;
		aliceptr->col++;
	}
	else if (collisionMap_3Bitmap[OFFSET(aliceptr->bigRow - 1,aliceptr->bigCol + 16,512)] == 0x0000)
	{
		aliceptr->cdel = 0;
		aliceptr->row--;
		aliceptr->col++;
	}
	else if (collisionMap_3Bitmap[OFFSET(aliceptr->bigRow - 1,aliceptr->bigCol + 32,512)] == 0x0000) 
	{
		aliceptr->cdel = 0;
		aliceptr->col--;
	}
	else if (collisionMap_3Bitmap[OFFSET(aliceptr->bigRow + 32 - 1,aliceptr->bigCol + 32,512)] == 0x0000)
	{
		aliceptr->cdel = 0;
		aliceptr->col--;
	}
	else if (collisionMap_3Bitmap[OFFSET(aliceptr->bigRow + 64 - 1,aliceptr->bigCol + 32,512)] == 0x0000) 
	{	
		aliceptr->cdel = 0;
		aliceptr->col--;
	}
}


void aliceJump() {
	if (aliceptr->isGrounded && aliceptr->isFalling == 0) {
		playSoundB(jump,JUMPLEN,JUMPFREQ);
		aliceptr->isJumping = 1;
		aliceptr->rdel = -15;
	}
}

int checkButterflies() {
	if ((aliceptr->aniState == 12 || aliceptr->aniState == 14)) {
		gravity = 0;
		aliceptr->rdel = 0;
		return 1;
	}
	gravity = 1;
	return 0;
}

void aliceButterflies() {
	if((aliceptr->isCheating || aliceptr->isGliding) && aliceptr->rdel != 0) {
		playSoundB(flutter,FLUTTERLEN,FLUTTERFREQ);
		if (aliceptr->aniState == ALICEAIRRIGHT || aliceptr->aniState == ALICERUNRIGHT || aliceptr->aniState == ALICEIDLERIGHT) {
	    	aliceptr->aniState = ALICEBUTTERFLYRIGHT;
	    	aliceptr->currFrame = 0;
			aliceptr->cdel = 28;
		} else if (aliceptr->aniState == ALICEAIRLEFT || aliceptr->aniState == ALICERUNLEFT || aliceptr->aniState == ALICEIDLELEFT) {
			aliceptr->aniState = ALICEBUTTERFLYLEFT;
			aliceptr->cdel = -28;
			aliceptr->currFrame = 0;
		}
	}
}

void aliceIdle() {
	if (aliceptr->cdel == 0 && aliceptr->isFalling == 0 && aliceptr->isGrounded && !aliceptr->isDead) {
		if (aliceptr->prevAniState == ALICERUNRIGHT && !BUTTON_HELD(BUTTON_RIGHT)) {
			aliceptr->aniState = ALICEIDLERIGHT;
			aliceptr->currFrame = 0;
		} else if (aliceptr->prevAniState == ALICERUNLEFT && !BUTTON_HELD(BUTTON_LEFT)) {
			aliceptr->aniState = ALICEIDLELEFT;
			aliceptr->currFrame = 0;
		}		
	}
}

void checkItemCollide() { // Make more exact
	for (int i = 0; i < NUMOBTLS; i++) {
		//Top Left (Extends Diagonally)
		if (aliceptr->row - 5 > bottles[i].row && aliceptr->row - 5 < bottles[i].row + 32 && aliceptr->col - 5 < bottles[i].col + 32 && aliceptr->col - 5 > bottles[i].col) {
			if(bottles[i].isActive)	playSoundB(pickup,PICKUPLEN,PICKUPFREQ);
			bottles[i].isActive = 0;
		}
		// Bottom Right (Extends Diagonally)
		else if (aliceptr->row + 64 + 5 > bottles[i].row && aliceptr->row + 64 + 5 < bottles[i].row + 32 && aliceptr->col + 32 + 5 < bottles[i].col + 32 && aliceptr->col + 32 + 5 > bottles[i].col) {
			if(bottles[i].isActive)	playSoundB(pickup,PICKUPLEN,PICKUPFREQ);
			bottles[i].isActive = 0;
		}
		//Right Side (Extends right)
		else if (aliceptr->row + 32 > bottles[i].row && aliceptr->row + 32 < bottles[i].row + 32 && aliceptr->col + 5 < bottles[i].col + 32 && aliceptr->col + 5 > bottles[i].col) {
			if(bottles[i].isActive)	playSoundB(pickup,PICKUPLEN,PICKUPFREQ);
			bottles[i].isActive = 0;
		}
		//Top (Extends Up)
		else if (aliceptr->row - 5 > bottles[i].row && aliceptr->row - 5 < bottles[i].row + 32 && aliceptr->col + 16< bottles[i].col + 32 && aliceptr->col + 16 > bottles[i].col) {
			if(bottles[i].isActive)	playSoundB(pickup,PICKUPLEN,PICKUPFREQ);
			bottles[i].isActive = 0;
		}
		//Top Right (Extends Diagonally)
		else if (aliceptr->row - 5 > bottles[i].row && aliceptr->row - 5 < bottles[i].row + 32 && aliceptr->col + 32 + 5 < bottles[i].col + 32 && aliceptr->col + 32 + 5> bottles[i].col) {
			if(bottles[i].isActive)	playSoundB(pickup,PICKUPLEN,PICKUPFREQ);
			bottles[i].isActive = 0;
		} 
		//Bottom (Extends Down)
		else if (aliceptr->row + 64 + 5 > bottles[i].row && aliceptr->row + 64 + 5 < bottles[i].row + 32 && aliceptr->col + 16 < bottles[i].col + 32 && aliceptr->col + 16 > bottles[i].col) {
			if(bottles[i].isActive)	playSoundB(pickup,PICKUPLEN,PICKUPFREQ);
			bottles[i].isActive = 0;
		}
		// Left Side (Extends left)
		else if (aliceptr->row + 32 > bottles[i].row && aliceptr->row + 32 < bottles[i].row + 32 && aliceptr->col - 5 < bottles[i].col + 32 && aliceptr->col - 5 > bottles[i].col) {
			if(bottles[i].isActive)	playSoundB(pickup,PICKUPLEN,PICKUPFREQ);
			bottles[i].isActive = 0;
		}
		//Bottom Left (Extends Diagonally)
		else if (aliceptr->row + 64 + 5 > bottles[i].row && aliceptr->row + 64 + 5 < bottles[i].row + 32 && aliceptr->col - 5 < bottles[i].col + 32 && aliceptr->col - 5 > bottles[i].col) {
			if(bottles[i].isActive)	playSoundB(pickup,PICKUPLEN,PICKUPFREQ);
			bottles[i].isActive = 0;
		}
	}
}

void aliceDie() {
	stopSound();
	playSoundB(whoosh,WHOOSHLEN,WHOOSHFREQ);
	aliceptr->rdel = 0;
	aliceptr->cdel = 0;
	aliceptr->currFrame = 4;
	aliceptr->aniState = 8;
	updateOAM();
	delay();
	aliceptr->currFrame = 4;
	aliceptr->aniState = 12;
	updateOAM();
	delay();
	delay();
	aliceRestart();
}

void aliceRestart() {
	delay();
	aliceptr->isDead = 0;
	hideSprites();
	if (level < 2) {
		while (vOff < 95) vOff += 2;
	} else {
		vOff = 180;
	}
	while (hOff > 0) hOff -= 2;
	aliceptr->currFrame = 0;
	aliceptr->aniState = ALICEIDLERIGHT;
	initializeSprites();
	playLevelMusic();
}

void checkForBottles() {
	int total = 0;
	for (int i = 0; i < NUMOBTLS; i++ ) {
		if (!bottles[i].isActive) total++;
	}
	if (level == 2) bottlesTotal = total;
	else bottlesTotal = (total - 2);

	if (total == NUMOBTLS && (aliceptr->bigCol + 100) >= 538 && aliceptr->rdel == 0 && aliceptr->cdel == 0) finishLevel();

}

void finishLevel() {
	stopSound();
	playSoundB(endlevel,ENDLEVELLEN,ENDLEVELFREQ);
	if (aliceptr->isCheating) aliceptr->redSmoke = 1;
	else aliceptr->blueSmoke = 1;
	updateOAM();
	delay();
	delay();
	level++;
	if (level == 2) heightofScreen = 512;
	hOff = 0;
	initializeGame();
	hideSprites();
	initializeSprites();
	playLevelMusic();

	if (level == 3) {
		state = FINISHSCREEN;
	}

}

void playLevelMusic() {
	if (aliceptr->isCheating) {
	    if (level == 0) playSoundA(gameSong,GAMESONGLEN,20000);
	    else if (level == 1) playSoundA(gameSong_2,GAMESONG_2LEN,20000);
	    else if (level == 2) playSoundA(gameSong_2,GAMESONG_2LEN,GAMESONG_2FREQ/4);
	} else {
		if (level == 0) playSoundA(gameSong,GAMESONGLEN,44000);
	    else if (level == 1) playSoundA(gameSong_2,GAMESONG_2LEN,44000);
	    else if (level == 2) playSoundA(gameSong_2,GAMESONG_2LEN,GAMESONG_2FREQ/3);
	}
}

void cheatMode() {
	stopSound();
	playSoundB(cheat,CHEATLEN,CHEATFREQ);
	aliceptr->isCheating = 1;
	aliceptr->redSmoke = 1;
	updateOAM();
	delay();
	delay();
	aliceptr->redSmoke = 0;
	playLevelMusic();
}

void delay() {
  int i;
  volatile int b;
  for(i=0;i<200000;i++) {
     b++;
  }
}