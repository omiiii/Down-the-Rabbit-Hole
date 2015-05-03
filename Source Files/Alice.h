
//{{BLOCK(Alice)

//======================================================================
//
//	Alice, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 1024 tiles not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 32768 + 2048 = 35328
//
//	Time-stamp: 2014-11-30, 23:01:33
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_ALICE_H
#define GRIT_ALICE_H

#define AliceTilesLen 32768
extern const unsigned short AliceTiles[16384];

#define AliceMapLen 2048
extern const unsigned short AliceMap[1024];

#define AlicePalLen 512
extern const unsigned short AlicePal[256];

#endif // GRIT_ALICE_H

//}}BLOCK(Alice)
