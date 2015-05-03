
//{{BLOCK(lvl3)

//======================================================================
//
//	lvl3, 512x512@8, 
//	+ palette 256 entries, not compressed
//	+ 290 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x64 
//	Total size: 512 + 18560 + 8192 = 27264
//
//	Time-stamp: 2014-11-30, 12:55:46
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_LVL3_H
#define GRIT_LVL3_H

#define lvl3TilesLen 18560
extern const unsigned short lvl3Tiles[9280];

#define lvl3MapLen 8192
extern const unsigned short lvl3Map[4096];

#define lvl3PalLen 512
extern const unsigned short lvl3Pal[256];

#endif // GRIT_LVL3_H

//}}BLOCK(lvl3)
