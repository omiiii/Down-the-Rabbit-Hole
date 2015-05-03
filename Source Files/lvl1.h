
//{{BLOCK(lvl1)

//======================================================================
//
//	lvl1, 512x512@8, 
//	+ palette 256 entries, not compressed
//	+ 140 tiles (t|f reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x64 
//	Total size: 512 + 8960 + 8192 = 17664
//
//	Time-stamp: 2014-11-26, 09:19:53
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_LVL1_H
#define GRIT_LVL1_H

#define lvl1TilesLen 8960
extern const unsigned short lvl1Tiles[4480];

#define lvl1MapLen 8192
extern const unsigned short lvl1Map[4096];

#define lvl1PalLen 512
extern const unsigned short lvl1Pal[256];

#endif // GRIT_LVL1_H

//}}BLOCK(lvl1)
