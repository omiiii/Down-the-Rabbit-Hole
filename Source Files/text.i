# 1 "text.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "text.c"






# 1 "myLib.h" 1



typedef unsigned short u16;
# 40 "myLib.h"
extern unsigned short *videoBuffer;

extern unsigned short *frontBuffer;
extern unsigned short *backBuffer;




void setPixel3(int row, int col, unsigned short color);
void drawRect3(int row, int col, int height, int width, unsigned short color);
void fillScreen3(unsigned short color);
void drawImage3(const unsigned short* image, int row, int col, int height, int width);


void setPixel4(int row, int col, unsigned char colorIndex);
void drawRect4(int row, int col, int height, int width, unsigned char colorIndex);
void fillScreen4(unsigned char color);

void drawBackgroundImage4(const unsigned short* image);
void drawImage4(const unsigned short* image, int row, int col, int height, int width);
void drawSubImage4(const unsigned short* sourceImage, int sourceRow, int sourceCol,
       int row, int col, int height, int width);

void loadPalette(const unsigned short* palette);
void initialize();

void waitForVblank();
void flipPage();
# 88 "myLib.h"
extern unsigned int oldButtons;
extern unsigned int buttons;
# 98 "myLib.h"
void DMANow(int channel, volatile const void* source, volatile void* destination, unsigned int control);






typedef volatile struct
{
        volatile const void *src;
        volatile void *dst;
        volatile unsigned int cnt;
} DMA;

extern DMA *dma;
# 137 "myLib.h"
enum {IDLE, CHASE, FLEE};
# 231 "myLib.h"
typedef struct { u16 tileimg[8192]; } charblock;
typedef struct { u16 tilemap[1024]; } screenblock;
# 288 "myLib.h"
typedef struct{
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
    unsigned short fill;
}OBJ_ATTR;

typedef struct {
    int row;
    int col;
} Sprite;
# 8 "text.c" 2
# 1 "text.h" 1
# 10 "text.h"
void drawChar3(int row, int col, char ch, volatile unsigned short color);
void drawString3(int row, int col, char *str,volatile unsigned short color);


void drawChar4(int row, int col, char ch,volatile unsigned char colorIndex);
void drawString4(int row, int col, char *str,volatile unsigned char colorIndex);

extern const unsigned char fontdata_6x8[12288];
# 9 "text.c" 2

void drawChar3(int row, int col, char ch,volatile unsigned short color)
{
    int r, c;
    for(r=0; r<8; r++)
    {
        for(c=0; c<6; c++)
        {
            if(fontdata_6x8[ch*6*8+r*6+c])
            {
                setPixel3(row+r, col+c, color);
            }
        }
    }
}

void drawString3(int row, int col, char *str,volatile unsigned short color)
{
    while(*str != '\0')
    {
        drawChar3(row, col, *str, color);
        str++;
        col += 6;
    }
}

void drawChar4(int row, int col, char ch, volatile unsigned char colorIndex)
{
int r, c;
    for(r=0; r<8; r++)
    {
        for(c=0; c<6; c++)
        {
            if(fontdata_6x8[ch*6*8+r*6+c])
            {
                setPixel4(row+r, col+c, colorIndex);
            }
        }
    }
}

void drawString4(int row, int col, char *str,volatile unsigned char colorIndex)
{
    while(*str)
    {
        drawChar4(row, col, *str++, colorIndex);
        col += 6;
    }
}

const unsigned char fontdata_6x8[12288] = {

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,1,0,1,1,
0,1,0,0,0,1,
0,1,0,1,0,1,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,1,1,1,1,1,
0,1,0,1,0,1,
0,1,1,1,1,1,
0,1,0,0,0,1,
0,1,1,1,1,1,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,1,0,1,0,
0,1,1,1,1,1,
0,1,1,1,1,1,
0,1,1,1,1,1,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,1,0,1,0,
0,0,1,1,1,0,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
# 114 "text.c"
0,0,0,1,0,0,
0,0,1,1,1,0,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,1,1,1,1,1,
0,1,1,1,1,1,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,1,0,0,
0,0,1,1,1,0,
0,1,1,1,1,1,
0,1,1,1,1,1,
0,0,0,1,0,0,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,1,1,0,0,
0,0,1,1,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,0,0,1,1,
1,1,0,0,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,1,1,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,1,1,1,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

1,1,1,1,1,1,
1,1,1,1,1,1,
1,0,0,0,0,1,
1,0,1,1,0,1,
1,0,1,1,0,1,
1,0,0,0,0,1,
1,1,1,1,1,1,
1,1,1,1,1,1,

0,0,0,0,0,0,
0,0,0,1,1,1,
0,0,0,0,1,1,
0,0,1,1,0,1,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,0,1,1,0,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,0,0,1,0,0,
0,0,0,1,1,0,
0,0,0,1,0,1,
0,0,0,1,0,0,
0,0,1,1,0,0,
0,1,1,1,0,0,
0,1,1,0,0,0,
0,0,0,0,0,0,

0,0,0,0,1,1,
0,0,1,1,0,1,
0,0,1,0,1,1,
0,0,1,1,0,1,
0,0,1,0,1,1,
0,1,1,0,1,1,
0,1,1,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,1,0,1,0,1,
0,0,1,1,1,0,
0,1,1,0,1,1,
0,0,1,1,1,0,
0,1,0,1,0,1,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,1,0,0,0,
0,0,1,1,0,0,
0,0,1,1,1,0,
0,0,1,1,1,1,
0,0,1,1,1,0,
0,0,1,1,0,0,
0,0,1,0,0,0,
0,0,0,0,0,0,

0,0,0,0,1,0,
0,0,0,1,1,0,
0,0,1,1,1,0,
0,1,1,1,1,0,
0,0,1,1,1,0,
0,0,0,1,1,0,
0,0,0,0,1,0,
0,0,0,0,0,0,

0,0,0,1,0,0,
0,0,1,1,1,0,
0,1,1,1,1,1,
0,0,0,1,0,0,
0,1,1,1,1,1,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,0,1,0,1,0,
0,0,1,0,1,0,
0,0,1,0,1,0,
0,0,1,0,1,0,
0,0,1,0,1,0,
0,0,0,0,0,0,
0,0,1,0,1,0,
0,0,0,0,0,0,

0,0,1,1,1,1,
0,1,0,1,0,1,
0,1,0,1,0,1,
0,0,1,1,0,1,
0,0,0,1,0,1,
0,0,0,1,0,1,
0,0,0,1,0,1,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,1,0,0,0,1,
0,0,1,1,0,0,
0,0,1,0,1,0,
0,0,0,1,1,0,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,1,1,1,0,
0,1,1,1,1,0,
0,0,0,0,0,0,

0,0,0,1,0,0,
0,0,1,1,1,0,
0,1,1,1,1,1,
0,0,0,1,0,0,
0,1,1,1,1,1,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,0,1,1,1,0,

0,0,0,1,0,0,
0,0,1,1,1,0,
0,1,1,1,1,1,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,1,1,1,1,1,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,1,0,0,
0,0,0,1,1,0,
0,1,1,1,1,1,
0,0,0,1,1,0,
0,0,0,1,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,1,0,0,
0,0,1,1,0,0,
0,1,1,1,1,1,
0,0,1,1,0,0,
0,0,0,1,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,1,1,1,1,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,1,0,1,0,
0,0,1,0,1,0,
0,1,1,1,1,1,
0,0,1,0,1,0,
0,0,1,0,1,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,1,1,1,0,
0,0,1,1,1,0,
0,1,1,1,1,1,
0,1,1,1,1,1,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,1,1,1,1,1,
0,1,1,1,1,1,
0,0,1,1,1,0,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,1,0,0,
0,0,1,1,1,0,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,0,0,0,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,1,1,0,1,1,
0,1,1,0,1,1,
0,1,0,0,1,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,1,0,1,0,
0,1,1,1,1,1,
0,0,1,0,1,0,
0,0,1,0,1,0,
0,1,1,1,1,1,
0,0,1,0,1,0,
0,0,0,0,0,0,

0,0,1,0,0,0,
0,0,1,1,1,0,
0,1,0,0,0,0,
0,0,1,1,0,0,
0,0,0,0,1,0,
0,1,1,1,0,0,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,1,1,0,0,1,
0,1,1,0,0,1,
0,0,0,0,1,0,
0,0,0,1,0,0,
0,0,1,0,0,0,
0,1,0,0,1,1,
0,1,0,0,1,1,
0,0,0,0,0,0,

0,0,1,0,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,0,1,0,0,0,
0,1,0,1,0,1,
0,1,0,0,1,0,
0,0,1,1,0,1,
0,0,0,0,0,0,

0,0,1,1,0,0,
0,0,1,1,0,0,
0,0,1,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,1,0,0,
0,0,1,0,0,0,
0,0,1,0,0,0,
0,0,1,0,0,0,
0,0,1,0,0,0,
0,0,1,0,0,0,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,0,1,0,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,1,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,1,0,1,0,
0,0,1,1,1,0,
0,1,1,1,1,1,
0,0,1,1,1,0,
0,0,1,0,1,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,1,1,1,1,1,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,1,1,0,0,
0,0,1,1,0,0,
0,0,1,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,1,1,1,1,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,1,1,0,0,
0,0,1,1,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,1,
0,0,0,0,1,0,
0,0,0,1,0,0,
0,0,1,0,0,0,
0,1,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,1,1,
0,1,0,1,0,1,
0,1,1,0,0,1,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,0,1,0,0,
0,0,1,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,1,0,0,0,1,
0,0,0,0,0,1,
0,0,0,1,1,0,
0,0,1,0,0,0,
0,1,0,0,0,0,
0,1,1,1,1,1,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,1,0,0,0,1,
0,0,0,0,0,1,
0,0,1,1,1,0,
0,0,0,0,0,1,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,0,0,1,0,
0,0,0,1,1,0,
0,0,1,0,1,0,
0,1,0,0,1,0,
0,1,1,1,1,1,
0,0,0,0,1,0,
0,0,0,0,1,0,
0,0,0,0,0,0,

0,1,1,1,1,1,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,1,1,1,0,
0,0,0,0,0,1,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,0,1,1,0,
0,0,1,0,0,0,
0,1,0,0,0,0,
0,1,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,1,1,1,1,1,
0,0,0,0,0,1,
0,0,0,0,1,0,
0,0,0,1,0,0,
0,0,1,0,0,0,
0,0,1,0,0,0,
0,0,1,0,0,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,1,1,1,1,
0,0,0,0,0,1,
0,0,0,0,1,0,
0,0,1,1,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,1,1,0,0,
0,0,1,1,0,0,
0,0,0,0,0,0,
0,0,1,1,0,0,
0,0,1,1,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,1,1,0,0,
0,0,1,1,0,0,
0,0,0,0,0,0,
0,0,1,1,0,0,
0,0,1,1,0,0,
0,0,1,0,0,0,

0,0,0,0,1,0,
0,0,0,1,0,0,
0,0,1,0,0,0,
0,1,0,0,0,0,
0,0,1,0,0,0,
0,0,0,1,0,0,
0,0,0,0,1,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,1,1,1,1,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,1,1,1,1,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,1,0,0,0,
0,0,0,1,0,0,
0,0,0,0,1,0,
0,0,0,0,0,1,
0,0,0,0,1,0,
0,0,0,1,0,0,
0,0,1,0,0,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,1,0,0,0,1,
0,0,0,0,0,1,
0,0,0,1,1,0,
0,0,0,1,0,0,
0,0,0,0,0,0,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,0,1,1,1,
0,1,0,1,0,1,
0,1,0,1,1,1,
0,1,0,0,0,0,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,1,1,1,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,0,0,0,0,

0,1,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,1,1,1,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,1,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,1,1,1,0,
0,0,0,0,0,0,

0,1,1,1,1,1,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,1,1,1,0,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,1,1,1,1,
0,0,0,0,0,0,

0,1,1,1,1,1,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,1,1,1,0,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,0,
0,1,0,1,1,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,1,1,1,1,
0,0,0,0,0,0,

0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,1,1,1,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,0,0,0,1,
0,0,0,0,0,1,
0,0,0,0,0,1,
0,0,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,1,0,0,0,1,
0,1,0,0,1,0,
0,1,0,1,0,0,
0,1,1,0,0,0,
0,1,0,1,0,0,
0,1,0,0,1,0,
0,1,0,0,0,1,
0,0,0,0,0,0,

0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,1,1,1,1,
0,0,0,0,0,0,

0,1,0,0,0,1,
0,1,1,0,1,1,
0,1,0,1,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,0,0,0,0,

0,1,0,0,0,1,
0,1,1,0,0,1,
0,1,0,1,0,1,
0,1,0,0,1,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,1,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,1,1,1,0,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,1,0,1,
0,1,0,0,1,0,
0,0,1,1,0,1,
0,0,0,0,0,0,

0,1,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,1,1,1,0,
0,1,0,0,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,0,
0,0,1,1,1,0,
0,0,0,0,0,1,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,1,1,1,1,1,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,1,0,1,0,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,1,0,1,
0,1,0,1,0,1,
0,1,0,1,0,1,
0,1,0,1,0,1,
0,0,1,0,1,0,
0,0,0,0,0,0,

0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,1,0,1,0,
0,0,0,1,0,0,
0,0,1,0,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,0,0,0,0,

0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,1,0,1,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,1,1,1,1,0,
0,0,0,0,1,0,
0,0,0,1,0,0,
0,0,1,0,0,0,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,1,1,1,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,0,1,0,0,0,
0,0,1,0,0,0,
0,0,1,0,0,0,
0,0,1,0,0,0,
0,0,1,0,0,0,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,1,0,0,0,0,
0,0,1,0,0,0,
0,0,0,1,0,0,
0,0,0,0,1,0,
0,0,0,0,0,1,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,0,0,0,1,0,
0,0,0,0,1,0,
0,0,0,0,1,0,
0,0,0,0,1,0,
0,0,0,0,1,0,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,0,1,0,0,
0,0,1,0,1,0,
0,1,0,0,0,1,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
1,1,1,1,1,1,

0,0,1,1,0,0,
0,0,1,1,0,0,
0,0,0,1,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,1,1,1,0,
0,0,0,0,0,1,
0,0,1,1,1,1,
0,1,0,0,0,1,
0,0,1,1,1,1,
0,0,0,0,0,0,

0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,1,1,1,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,0,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,0,0,0,1,
0,0,0,0,0,1,
0,0,1,1,1,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,1,1,1,1,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,1,1,1,0,
0,1,0,0,0,0,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,0,1,1,0,
0,0,1,0,0,0,
0,0,1,0,0,0,
0,1,1,1,1,0,
0,0,1,0,0,0,
0,0,1,0,0,0,
0,0,1,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,1,1,1,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,1,1,1,1,
0,0,0,0,0,1,
0,0,1,1,1,0,

0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,1,1,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,0,0,0,0,0,

0,0,0,1,0,0,
0,0,0,0,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,1,0,
0,0,0,0,0,0,

0,0,0,0,1,0,
0,0,0,0,0,0,
0,0,0,1,1,0,
0,0,0,0,1,0,
0,0,0,0,1,0,
0,0,0,0,1,0,
0,1,0,0,1,0,
0,0,1,1,0,0,

0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,0,0,1,0,
0,1,0,1,0,0,
0,1,1,0,0,0,
0,1,0,1,0,0,
0,1,0,0,1,0,
0,0,0,0,0,0,

0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,1,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,1,0,1,0,
0,1,0,1,0,1,
0,1,0,1,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,1,1,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,1,1,1,0,
0,1,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,1,1,1,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,1,1,1,1,
0,0,0,0,0,1,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,0,1,1,0,
0,0,1,0,0,1,
0,0,1,0,0,0,
0,0,1,0,0,0,
0,1,1,1,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,1,1,1,0,
0,1,0,0,0,0,
0,0,1,1,1,0,
0,0,0,0,0,1,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,1,0,0,0,
0,1,1,1,1,0,
0,0,1,0,0,0,
0,0,1,0,0,0,
0,0,1,0,1,0,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,1,1,0,
0,0,1,0,1,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,1,0,1,0,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,1,0,1,
0,1,1,1,1,1,
0,0,1,0,1,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,0,1,1,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,1,1,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,1,1,1,0,
0,0,0,0,1,0,
0,0,1,1,0,0,
0,1,0,0,0,0,
0,1,1,1,1,0,
0,0,0,0,0,0,

0,0,0,1,1,0,
0,0,1,0,0,0,
0,0,1,0,0,0,
0,1,1,0,0,0,
0,0,1,0,0,0,
0,0,1,0,0,0,
0,0,0,1,1,0,
0,0,0,0,0,0,

0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,

0,0,1,1,0,0,
0,0,0,0,1,0,
0,0,0,0,1,0,
0,0,0,0,1,1,
0,0,0,0,1,0,
0,0,0,0,1,0,
0,0,1,1,0,0,
0,0,0,0,0,0,

0,0,1,0,1,0,
0,1,0,1,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,1,0,0,
0,0,1,1,1,0,
0,1,1,0,1,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,1,1,1,1,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,0,1,1,0,0,

0,1,0,0,1,0,
0,0,0,0,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,1,1,0,
0,0,1,0,1,0,
0,0,0,0,0,0,

0,0,0,0,1,1,
0,0,0,0,0,0,
0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,1,1,1,0,
0,1,0,0,0,0,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,0,0,0,0,0,
0,0,1,1,1,0,
0,0,0,0,0,1,
0,0,1,1,1,1,
0,1,0,0,0,1,
0,0,1,1,1,1,
0,0,0,0,0,0,

0,0,1,0,1,0,
0,0,0,0,0,0,
0,0,1,1,1,0,
0,0,0,0,0,1,
0,0,1,1,1,1,
0,1,0,0,0,1,
0,0,1,1,1,1,
0,0,0,0,0,0,

0,0,1,1,0,0,
0,0,0,0,0,0,
0,0,1,1,1,0,
0,0,0,0,0,1,
0,0,1,1,1,1,
0,1,0,0,0,1,
0,0,1,1,1,1,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,0,1,0,1,0,
0,0,1,1,1,0,
0,0,0,0,0,1,
0,0,1,1,1,1,
0,1,0,0,0,1,
0,0,1,1,1,1,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,0,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,0,1,1,0,0,

0,0,1,1,1,0,
0,0,0,0,0,0,
0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,1,1,1,0,
0,1,0,0,0,0,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,1,0,1,0,
0,0,0,0,0,0,
0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,1,1,1,0,
0,1,0,0,0,0,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,1,1,0,0,
0,0,0,0,0,0,
0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,1,1,1,0,
0,1,0,0,0,0,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,1,0,1,0,
0,0,0,0,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,1,0,
0,0,0,0,0,0,

0,0,0,1,0,0,
0,0,1,0,1,0,
0,0,0,0,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,1,0,
0,0,0,0,0,0,

0,0,1,0,0,0,
0,0,0,0,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,1,0,
0,0,0,0,0,0,

0,0,1,0,1,0,
0,0,0,0,0,0,
0,0,0,1,0,0,
0,0,1,0,1,0,
0,1,0,0,0,1,
0,1,1,1,1,1,
0,1,0,0,0,1,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,0,1,0,1,0,
0,0,1,1,1,0,
0,1,1,0,1,1,
0,1,0,0,0,1,
0,1,1,1,1,1,
0,1,0,0,0,1,
0,0,0,0,0,0,

0,0,0,0,1,1,
0,0,0,0,0,0,
0,1,1,1,1,1,
0,1,0,0,0,0,
0,1,1,1,1,0,
0,1,0,0,0,0,
0,1,1,1,1,1,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,1,1,1,0,
0,0,0,1,0,1,
0,1,1,1,1,1,
0,1,0,1,0,0,
0,0,1,1,1,1,
0,0,0,0,0,0,

0,0,1,1,1,1,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,1,1,1,1,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,1,1,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,0,0,0,0,0,
0,0,1,1,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,0,1,1,0,0,
0,0,0,0,0,0,

0,0,1,0,1,0,
0,0,0,0,0,0,
0,0,1,1,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,0,1,1,0,0,
0,0,0,0,0,0,

0,1,1,0,0,0,
0,0,0,0,0,0,
0,0,1,1,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,0,1,1,0,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,0,0,0,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,1,1,0,
0,0,1,0,1,0,
0,0,0,0,0,0,

0,1,1,0,0,0,
0,0,0,0,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,1,1,0,
0,0,1,0,1,0,
0,0,0,0,0,0,

0,0,1,0,1,0,
0,0,0,0,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,1,1,0,0,0,

0,1,0,0,1,0,
0,0,1,1,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,0,1,1,0,0,
0,0,0,0,0,0,

0,0,1,0,1,0,
0,0,0,0,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,0,1,1,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,1,0,0,
0,0,1,1,1,0,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,0,0,1,1,0,
0,0,1,0,0,1,
0,0,1,0,0,0,
0,1,1,1,1,0,
0,0,1,0,0,0,
0,0,1,0,0,1,
0,1,0,1,1,1,
0,0,0,0,0,0,

0,1,0,0,0,1,
0,0,1,0,1,0,
0,0,0,1,0,0,
0,1,1,1,1,1,
0,0,0,1,0,0,
0,1,1,1,1,1,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,1,1,0,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,1,0,1,0,
0,1,0,1,1,1,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,0,0,0,0,0,

0,0,0,0,1,0,
0,0,0,1,0,1,
0,0,0,1,0,0,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,1,0,1,0,0,
0,0,1,0,0,0,

0,0,0,1,1,0,
0,0,0,0,0,0,
0,0,1,1,1,0,
0,0,0,0,0,1,
0,0,1,1,1,1,
0,1,0,0,0,1,
0,0,1,1,1,1,
0,0,0,0,0,0,

0,0,0,1,1,0,
0,0,0,0,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,1,0,
0,0,0,0,0,0,

0,0,0,1,1,0,
0,0,0,0,0,0,
0,0,1,1,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,0,1,1,0,0,
0,0,0,0,0,0,

0,0,0,1,1,0,
0,0,0,0,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,1,1,0,
0,0,1,0,1,0,
0,0,0,0,0,0,

0,0,1,0,1,0,
0,1,0,1,0,0,
0,0,0,0,0,0,
0,1,1,1,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,0,0,0,0,0,

0,0,1,0,1,0,
0,1,0,1,0,0,
0,0,0,0,0,0,
0,1,0,0,1,0,
0,1,1,0,1,0,
0,1,0,1,1,0,
0,1,0,0,1,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,0,0,0,0,1,
0,0,1,1,1,1,
0,1,0,0,0,1,
0,0,1,1,1,1,
0,0,0,0,0,0,
0,0,1,1,1,1,
0,0,0,0,0,0,

0,0,1,1,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,0,1,1,0,0,
0,0,0,0,0,0,
0,1,1,1,1,0,
0,0,0,0,0,0,

0,0,0,1,0,0,
0,0,0,0,0,0,
0,0,0,1,0,0,
0,0,1,1,0,0,
0,1,0,0,0,0,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,1,1,1,1,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
1,1,1,1,1,1,
0,0,0,0,0,1,
0,0,0,0,0,1,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,1,0,0,0,0,
0,1,0,0,1,0,
0,1,0,1,0,0,
0,0,1,1,1,0,
0,1,0,0,0,1,
0,0,0,0,1,0,
0,0,0,1,1,1,
0,0,0,0,0,0,

0,1,0,0,0,0,
0,1,0,0,1,0,
0,1,0,1,0,0,
0,0,1,0,1,1,
0,1,0,1,0,1,
0,0,0,1,1,1,
0,0,0,0,0,1,
0,0,0,0,0,0,

0,0,0,1,0,0,
0,0,0,0,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,1,1,1,0,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,1,0,0,1,
0,1,0,0,1,0,
0,0,1,0,0,1,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,0,0,1,0,
0,0,1,0,0,1,
0,1,0,0,1,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,1,0,1,0,1,
0,0,0,0,0,0,
1,0,1,0,1,0,
0,0,0,0,0,0,
0,1,0,1,0,1,
0,0,0,0,0,0,
1,0,1,0,1,0,
0,0,0,0,0,0,

0,1,0,1,0,1,
1,0,1,0,1,0,
0,1,0,1,0,1,
1,0,1,0,1,0,
0,1,0,1,0,1,
1,0,1,0,1,0,
0,1,0,1,0,1,
1,0,1,0,1,0,

1,0,1,0,1,0,
1,1,1,1,1,1,
0,1,0,1,0,1,
1,1,1,1,1,1,
1,0,1,0,1,0,
1,1,1,1,1,1,
0,1,0,1,0,1,
1,1,1,1,1,1,

0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,

0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
1,1,1,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,1,1,0,0,
0,1,0,0,0,0,
0,1,0,0,0,0,

0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
1,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
1,1,1,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,

0,0,0,0,0,0,
1,1,1,1,0,0,
0,0,0,1,0,0,
1,1,1,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,

0,1,0,1,0,0,
1,1,0,1,0,0,
0,0,0,1,0,0,
1,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,

0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,

0,0,0,0,0,0,
1,1,1,1,0,0,
0,0,0,1,0,0,
1,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,

0,1,0,1,0,0,
1,1,0,1,0,0,
0,0,0,1,0,0,
1,1,1,1,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
1,1,1,1,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,1,0,0,
1,1,1,1,0,0,
0,0,0,1,0,0,
1,1,1,1,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
1,1,1,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,

0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,1,1,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
1,1,1,1,1,1,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
1,1,1,1,1,1,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,

0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,1,1,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
1,1,1,1,1,1,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
1,1,1,1,1,1,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,

0,0,0,1,0,0,
0,0,0,1,1,1,
0,0,0,1,0,0,
0,0,0,1,1,1,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,

0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,1,1,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,

0,1,0,1,0,0,
0,1,0,1,1,1,
0,1,0,0,0,0,
0,1,1,1,1,1,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,1,1,1,1,1,
0,1,0,0,0,0,
0,1,0,1,1,1,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,

0,1,0,1,0,0,
1,1,0,1,1,1,
0,0,0,0,0,0,
1,1,1,1,1,1,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
1,1,1,1,1,1,
0,0,0,0,0,0,
1,1,0,1,1,1,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,

0,1,0,1,0,0,
0,1,0,1,1,1,
0,1,0,0,0,0,
0,1,0,1,1,1,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,

0,0,0,0,0,0,
1,1,1,1,1,1,
0,0,0,0,0,0,
1,1,1,1,1,1,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,1,0,1,0,0,
1,1,0,1,1,1,
0,0,0,0,0,0,
1,1,0,1,1,1,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,

0,0,0,1,0,0,
1,1,1,1,1,1,
0,0,0,0,0,0,
1,1,1,1,1,1,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
1,1,1,1,1,1,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
1,1,1,1,1,1,
0,0,0,0,0,0,
1,1,1,1,1,1,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
1,1,1,1,1,1,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,

0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,0,1,0,0,
0,1,1,1,1,1,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
1,1,1,1,1,1,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
1,1,1,1,1,1,
1,1,1,1,1,1,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,

0,0,0,0,0,0,
0,0,0,0,0,0,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,

0,0,0,0,0,0,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,

1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,
1,1,1,1,1,1,

1,0,0,0,0,0,
1,0,0,0,0,0,
1,0,0,0,0,0,
1,0,0,0,0,0,
1,0,0,0,0,0,
1,0,0,0,0,0,
1,0,0,0,0,0,
1,0,0,0,0,0,

1,1,0,0,0,0,
1,1,0,0,0,0,
1,1,0,0,0,0,
1,1,0,0,0,0,
1,1,0,0,0,0,
1,1,0,0,0,0,
1,1,0,0,0,0,
1,1,0,0,0,0,

1,1,1,0,0,0,
1,1,1,0,0,0,
1,1,1,0,0,0,
1,1,1,0,0,0,
1,1,1,0,0,0,
1,1,1,0,0,0,
1,1,1,0,0,0,
1,1,1,0,0,0,

1,1,1,1,0,0,
1,1,1,1,0,0,
1,1,1,1,0,0,
1,1,1,1,0,0,
1,1,1,1,0,0,
1,1,1,1,0,0,
1,1,1,1,0,0,
1,1,1,1,0,0,

1,1,1,1,1,0,
1,1,1,1,1,0,
1,1,1,1,1,0,
1,1,1,1,1,0,
1,1,1,1,1,0,
1,1,1,1,1,0,
1,1,1,1,1,0,
1,1,1,1,1,0,

0,0,0,0,0,0,
0,1,1,1,0,0,
0,1,0,0,1,0,
0,1,1,1,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,1,1,0,0,
0,1,0,0,0,0,

0,1,1,1,1,0,
0,1,0,0,1,0,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,1,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,1,1,1,1,1,
0,0,1,0,1,0,
0,0,1,0,1,0,
0,0,1,0,1,0,
0,0,1,0,1,0,
0,0,1,0,1,0,
0,0,0,0,0,0,

0,0,1,0,1,0,
0,0,0,0,0,0,
0,0,1,1,1,0,
0,0,0,0,0,1,
0,0,1,1,1,1,
0,1,0,0,0,1,
0,0,1,1,1,1,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,1,1,1,1,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,0,1,1,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,1,1,0,0,
0,1,0,0,0,0,
0,1,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,1,0,1,0,
0,1,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,0,1,1,1,0,
0,0,0,1,0,0,
0,0,1,1,1,0,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,0,1,1,1,0,
0,0,0,0,0,0,

0,0,1,1,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,1,1,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,0,1,1,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,1,0,1,0,
0,0,1,0,1,0,
0,1,1,0,1,1,
0,0,0,0,0,0,

0,0,1,1,0,0,
0,1,0,0,0,0,
0,0,1,0,0,0,
0,0,0,1,0,0,
0,0,1,1,1,0,
0,1,0,0,1,0,
0,0,1,1,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,1,0,1,0,
0,1,0,1,0,1,
0,1,0,1,0,1,
0,0,1,0,1,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,1,0,0,
0,0,1,1,1,0,
0,1,0,1,0,1,
0,1,0,1,0,1,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,1,1,1,0,
0,1,0,0,0,0,
0,1,1,1,1,0,
0,1,0,0,0,0,
0,0,1,1,1,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,1,1,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,1,1,1,1,0,
0,0,0,0,0,0,
0,1,1,1,1,0,
0,0,0,0,0,0,
0,1,1,1,1,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,1,0,0,
0,0,1,1,1,0,
0,0,0,1,0,0,
0,0,0,0,0,0,
0,0,1,1,1,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,1,0,0,0,0,
0,0,1,1,0,0,
0,0,0,0,1,0,
0,0,1,1,0,0,
0,1,0,0,0,0,
0,0,0,0,0,0,
0,1,1,1,1,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
1,1,1,1,1,1,
1,1,1,0,0,0,
1,0,0,1,1,0,
1,0,0,0,0,1,
1,0,0,0,0,0,
1,1,1,1,1,1,

0,0,0,0,0,0,
0,0,0,0,0,0,
1,1,1,1,1,1,
0,0,0,1,1,1,
0,1,1,0,0,1,
1,0,0,0,0,1,
0,0,0,0,0,1,
1,1,1,1,1,1,

0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,0,0,1,0,0,
0,1,0,1,0,0,
0,0,1,0,0,0,
0,0,0,0,0,0,

0,0,1,0,1,0,
0,0,0,0,0,0,
0,0,1,1,1,0,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,1,0,0,0,1,
0,0,1,1,1,0,
0,0,0,0,0,0,

1,1,1,1,1,0,
1,1,1,1,1,0,
1,1,1,1,1,0,
1,1,1,1,1,0,
1,1,1,1,1,0,
1,1,1,1,1,0,
1,1,1,1,1,0,
1,1,1,1,1,0,

1,1,1,1,0,0,
1,1,1,1,0,0,
1,1,1,1,0,0,
1,1,1,1,0,0,
1,1,1,1,0,0,
1,1,1,1,0,0,
1,1,1,1,0,0,
1,1,1,1,0,0,

1,1,1,0,0,0,
1,1,1,0,0,0,
1,1,1,0,0,0,
1,1,1,0,0,0,
1,1,1,0,0,0,
1,1,1,0,0,0,
1,1,1,0,0,0,
1,1,1,0,0,0,

1,1,0,0,0,0,
1,1,0,0,0,0,
1,1,0,0,0,0,
1,1,0,0,0,0,
1,1,0,0,0,0,
1,1,0,0,0,0,
1,1,0,0,0,0,
1,1,0,0,0,0,

1,0,0,0,0,0,
1,0,0,0,0,0,
1,0,0,0,0,0,
1,0,0,0,0,0,
1,0,0,0,0,0,
1,0,0,0,0,0,
1,0,0,0,0,0,
1,0,0,0,0,0,

0,0,1,0,1,0,
0,0,0,0,0,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,0,1,0,
0,1,0,1,1,0,
0,0,1,0,1,0,
0,0,0,0,0,0,

0,1,1,0,0,0,
0,0,0,1,0,0,
0,0,1,0,0,0,
0,1,1,1,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,

0,0,0,0,0,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
0,1,1,1,1,0,
1,1,0,0,1,0,
1,1,0,0,1,1,
1,1,1,1,1,0,
0,0,1,1,1,1,

0,1,0,0,1,0,
1,1,1,1,1,1,
0,1,0,0,1,0,
0,1,0,0,1,0,
1,1,1,1,1,1,
0,1,0,0,1,0,
0,0,0,0,0,0,
0,0,0,0,0,0,
};
