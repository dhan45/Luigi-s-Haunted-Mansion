#include "myLib.h"

unsigned short *videoBuffer = (u16 *)0x6000000;

unsigned short *frontBuffer = (u16 *)0x6000000;
unsigned short *backBuffer =  (u16 *)0x600A000;

DMA *dma = (DMA *)0x40000B0;

void loadPalette(const unsigned short* palette)
{
	DMANow(3, palette, PALETTE, 256);
}

void DMANow(int channel, volatile const void* source, volatile const void* destination, unsigned int control)
{
	dma[channel].src = source;
	dma[channel].dst = destination;
	dma[channel].cnt = DMA_ON | control;
}

void waitForVblank()
{
	while(SCANLINECOUNTER > 160);
	while(SCANLINECOUNTER < 160);
}





// ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
// MODE3 AND MODE 4 FUNCTIONS
void setPixel3(int row, int col, unsigned short color)
{
	videoBuffer[OFFSET(row, col, SCREENWIDTH)] = color;
}

void drawRect3(int row, int col, int height, int width, unsigned short color)
{
	unsigned short c = color;
	
	int i;
	for(i = 0; i < height; i++)
	{
		DMANow(3, &c, &videoBuffer[OFFSET(row+i, col, SCREENWIDTH)], (width) | DMA_SOURCE_FIXED);
	}
}

void drawImage3(const unsigned short* image, int row, int col, int height, int width)
{
	int i;
	for(i = 0; i < height; i++)
	{
		DMANow(3, &image[OFFSET(i,0, width)], &videoBuffer[OFFSET(row+i, col, SCREENWIDTH)], (width));
	}
}

void fillScreen3(unsigned short color)
{
	volatile unsigned short c = color;

	DMANow(3, &c, videoBuffer, (240*160) | DMA_SOURCE_FIXED);
	
}

void setPixel4(int row, int col, unsigned char colorIndex)
{
	unsigned short pixels = videoBuffer[OFFSET(row, col/2, SCREENWIDTH/2)];

	if(col & 1) // odd
	{
		pixels &= 0xFF;
		videoBuffer[OFFSET(row, col/2, SCREENWIDTH/2)] = pixels | colorIndex << 8;
	}
	else // even
	{
		pixels &= 0xFF << 8;
		videoBuffer[OFFSET(row, col/2, SCREENWIDTH/2)] = pixels | colorIndex;
	}
}

void drawRect4(int row, int col, int height, int width, unsigned char colorIndex)
{

	volatile unsigned short pixels = ((colorIndex << 8) | (colorIndex));

	int r;
	for(r = 0; r < height; r++)
	{
		if(col & 1) // odd starting col
		{
			setPixel4(row+r, col, colorIndex);

			if(width & 1) // if width is odd
			{
				DMANow(3, &pixels, &videoBuffer[OFFSET(row + r, (col+1)/2, SCREENWIDTH/2)], ((width/2) | DMA_SOURCE_FIXED));
			}
			else  // width is even
			{
				DMANow(3, &pixels, &videoBuffer[OFFSET(row + r, (col+1)/2, SCREENWIDTH/2)], (((width/2)-1) | DMA_SOURCE_FIXED));
				setPixel4(row+r, col+width - 1, colorIndex);
			}
		}
		else // old starting col
		{
			DMANow(3, &pixels, &videoBuffer[OFFSET(row + r, col/2, SCREENWIDTH/2)], ((width/2) | DMA_SOURCE_FIXED));	
			if(width & 1) // if width is odd
			{
				setPixel4(row+r, col+width - 1, colorIndex);
			}
		}
	}
}

void fillScreen4(unsigned char colorIndex)
{
	volatile unsigned short pixels = colorIndex << 8 | colorIndex;
	DMANow(3, &pixels, videoBuffer, ((240 * 160)/2) | DMA_SOURCE_FIXED);
}

void flipPage()
{
    if(REG_DISPCTL & BACKBUFFER)
    {
        REG_DISPCTL &= ~BACKBUFFER;
        videoBuffer = backBuffer;
    }
    else
    {
        REG_DISPCTL |= BACKBUFFER;
        videoBuffer = frontBuffer;
    }
}