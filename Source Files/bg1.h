
//{{BLOCK(bg1)

//======================================================================
//
//	bg1, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 206 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 13184 + 2048 = 15744
//
//	Time-stamp: 2014-11-10, 00:24:47
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_BG1_H
#define GRIT_BG1_H

#define bg1TilesLen 13184
extern const unsigned short bg1Tiles[6592];

#define bg1MapLen 2048
extern const unsigned short bg1Map[1024];

#define bg1PalLen 512
extern const unsigned short bg1Pal[256];

#endif // GRIT_BG1_H

//}}BLOCK(bg1)
