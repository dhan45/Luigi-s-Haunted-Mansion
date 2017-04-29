
//{{BLOCK(goodnight)

//======================================================================
//
//	goodnight, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 469 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 30016 + 2048 = 32576
//
//	Time-stamp: 2017-04-28, 21:52:36
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_GOODNIGHT_H
#define GRIT_GOODNIGHT_H

#define goodnightTilesLen 30016
extern const unsigned short goodnightTiles[15008];

#define goodnightMapLen 2048
extern const unsigned short goodnightMap[1024];

#define goodnightPalLen 512
extern const unsigned short goodnightPal[256];

#endif // GRIT_GOODNIGHT_H

//}}BLOCK(goodnight)
