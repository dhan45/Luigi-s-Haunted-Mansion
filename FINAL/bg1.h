
//{{BLOCK(bg1)

//======================================================================
//
//	bg1, 512x256@4, 
//	+ palette 256 entries, not compressed
//	+ 19 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x32 
//	Total size: 512 + 608 + 4096 = 5216
//
//	Time-stamp: 2017-04-27, 15:44:11
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_BG1_H
#define GRIT_BG1_H

#define bg1TilesLen 608
extern const unsigned short bg1Tiles[304];

#define bg1MapLen 4096
extern const unsigned short bg1Map[2048];

#define bg1PalLen 512
extern const unsigned short bg1Pal[256];

#endif // GRIT_BG1_H

//}}BLOCK(bg1)
