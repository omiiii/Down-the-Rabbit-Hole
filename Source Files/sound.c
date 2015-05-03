#include <stdio.h>
#include <stdlib.h>
#include "myLib.h"
#include "sound.h"

void setupSounds() {
    REG_SOUNDCNT_X = SND_ENABLED;

    REG_SOUNDCNT_H = SND_OUTPUT_RATIO_100 | 
                        DSA_OUTPUT_RATIO_100 | 
                        DSA_OUTPUT_TO_BOTH | 
                        DSA_TIMER0 | 
                        DSA_FIFO_RESET |
                        DSB_OUTPUT_RATIO_100 | 
                        DSB_OUTPUT_TO_BOTH | 
                        DSB_TIMER1 | 
                        DSB_FIFO_RESET;

    REG_SOUNDCNT_L = 0;
}

void setupInterrupts()
{
    REG_IME = 0;
    REG_INTERRUPT = (unsigned int)interruptHandler;
    REG_IE |= INT_VBLANK;
    REG_DISPSTAT |= INT_VBLANK_ENABLE;
    REG_IME = 1;
}

void interruptHandler()
{
    REG_IME = 0;
    if(REG_IF & INT_VBLANK)
    {
        if (soundA.isPlaying) {
            vbCountA++;
        }

        if (soundA.isPlaying && (vbCountA > soundA.duration)) {
                if (soundA.loops) {
                    playSoundA(soundA.data,soundA.length,soundA.frequency);
                } else {
                    REG_TM0CNT = 0;
                    dma[1].cnt = 0;
                    soundA.isPlaying = 0;
                }       

        }

        if (soundB.isPlaying) {
            vbCountB++;
        }

        if (soundB.isPlaying && (vbCountB > soundB.duration)) {
                REG_TM1CNT = 0;
                dma[2].cnt = 0;
                soundB.isPlaying = 0;
        }
      
    }

    REG_IF = INT_VBLANK; 
    REG_IME = 1;
}

void muteSound()
{
        REG_SOUNDCNT_H = 0;

}

void unmuteSound()
{
    REG_SOUNDCNT_H = SND_OUTPUT_RATIO_100 | 
                    DSA_OUTPUT_RATIO_100 | 
                    DSA_OUTPUT_TO_BOTH | 
                    DSA_TIMER0 | 
                    DSA_FIFO_RESET |
                    DSB_OUTPUT_RATIO_100 | 
                    DSB_OUTPUT_TO_BOTH | 
                    DSB_TIMER1 | 
                    DSB_FIFO_RESET;

}

void pauseSound()
{
    REG_TM0CNT = 0;
    soundA.isPlaying = 0;
}

void unpauseSound()
{
    REG_TM0CNT = TIMER_ON;
    soundA.isPlaying = 1;

}

void stopSound()
{
   dma[1].cnt = 0;
   dma[2].cnt = 0;
   soundA.isPlaying = 0;
   soundB.isPlaying = 0;
}

void playSoundA( const unsigned char* sound, int length, int frequency) {

    
        dma[1].cnt = 0;
        vbCountA = 0;
        soundA.data = sound;
        soundA.length = length;
        soundA.frequency = frequency;
        soundA.isPlaying = 1;
        soundA.loops = 1;
        soundA.duration = ((60*length)/frequency) - ((length/frequency)*3)-1;
        soundA.priority = 0;
    
        int interval = 16777216/soundA.frequency;
    
        DMANow(1, soundA.data, REG_FIFO_A, DMA_DESTINATION_FIXED | DMA_AT_REFRESH | DMA_REPEAT | DMA_32);
    
        REG_TM0CNT = 0;
    
        REG_TM0D = -interval;
        REG_TM0CNT = TIMER_ON;
    
        /**
         * MODIFY THIS FUNCTION
         * Store the necessary variables into your SOUND struct here so that we may recall them later.
         */
         
}


void playSoundB( const unsigned char* sound, int length, int frequency) {

        dma[2].cnt = 0;
        vbCountB = 0;
        soundB.data = sound;
        soundB.length = length;
        soundB.frequency = frequency;
        soundB.isPlaying = 1;
        soundB.loops = 0;
        soundB.duration = ((60*length)/frequency) - ((length/frequency)*3)-1;
        soundB.priority = 1;


        int interval = 16777216/soundB.frequency;

        DMANow(2, soundB.data, REG_FIFO_B, DMA_DESTINATION_FIXED | DMA_AT_REFRESH | DMA_REPEAT | DMA_32);

        REG_TM1CNT = 0;
    
        REG_TM1D = -interval;
        REG_TM1CNT = TIMER_ON;
    
        /**
         * MODIFY THIS FUNCTION
         * Store the necessary variables into your SOUND struct here so that we may recall them later.
         */

}