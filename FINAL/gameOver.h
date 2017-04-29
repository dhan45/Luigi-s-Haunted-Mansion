
//{{BLOCK(gameOver)

//======================================================================
//
//	gameOver, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 95 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 3040 + 2048 = 5600
//
//	Time-stamp: 2017-04-04, 23:41:42
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_GAMEOVER_H
#define GRIT_GAMEOVER_H

#define gameOverTilesLen 3040
extern const unsigned short gameOverTiles[1520];

#define gameOverMapLen 2048
extern const unsigned short gameOverMap[1024];

#define gameOverPalLen 512
extern const unsigned short gameOverPal[256];

#endif // GRIT_GAMEOVER_H

//}}BLOCK(gameOver)
