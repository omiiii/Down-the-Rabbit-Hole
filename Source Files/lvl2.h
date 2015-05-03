
//{{BLOCK(lvl2)

//======================================================================
//
//	lvl2, 512x512@8, 
//	+ palette 256 entries, not compressed
//	+ 176 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x64 
//	Total size: 512 + 11264 + 8192 = 19968
//
//	Time-stamp: 2014-11-29, 17:12:43
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_LVL2_H
#define GRIT_LVL2_H

#define lvl2TilesLen 11264
extern const unsigned short lvl2Tiles[5632];

#define lvl2MapLen 8192
extern const unsigned short lvl2Map[4096];

#define lvl2PalLen 512
extern const unsigned short lvl2Pal[256];

#endif // GRIT_LVL2_H

//}}BLOCK(lvl2)
