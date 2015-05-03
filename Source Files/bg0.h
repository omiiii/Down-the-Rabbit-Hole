
//{{BLOCK(bg0)

//======================================================================
//
//	bg0, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 56 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 3584 + 2048 = 6144
//
//	Time-stamp: 2014-11-11, 15:44:25
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_BG0_H
#define GRIT_BG0_H

#define bg0TilesLen 3584
extern const unsigned short bg0Tiles[1792];

#define bg0MapLen 2048
extern const unsigned short bg0Map[1024];

#define bg0PalLen 512
extern const unsigned short bg0Pal[256];
extern const unsigned short bg0Pal_2[256];


#endif // GRIT_BG0_H

//}}BLOCK(bg0)
