
//{{BLOCK(widgets)

//======================================================================
//
//	widgets, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 1024 tiles not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 32768 + 2048 = 35328
//
//	Time-stamp: 2017-04-27, 14:36:01
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_WIDGETS_H
#define GRIT_WIDGETS_H

#define widgetsTilesLen 32768
extern const unsigned short widgetsTiles[16384];

#define widgetsMapLen 2048
extern const unsigned short widgetsMap[1024];

#define widgetsPalLen 512
extern const unsigned short widgetsPal[256];

#endif // GRIT_WIDGETS_H

//}}BLOCK(widgets)
