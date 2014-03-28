/*
 * "Hello World" example.
 *
 * This example prints 'Hello from Nios II' to the STDOUT stream. It runs on
 * the Nios II 'standard', 'full_featured', 'fast', and 'low_cost' example
 * designs. It runs with or without the MicroC/OS-II RTOS and requires a STDOUT
 * device in your system's hardware.
 * The memory footprint of this hosted application is ~69 kbytes by default
 * using the standard reference design.
 *
 * For a reduced footprint version of this template, and an explanation of how
 * to reduce the memory footprint for a given application, see the
 * "small_hello_world" template.
 *
 */

#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <math.h>
#include "system.h"
#include "altera_up_avalon_audio.h"
#include "altera_up_avalon_audio_regs.h"
#include "altera_up_avalon_audio_and_video_config.h"
#include "altera_up_avalon_audio_and_video_config_regs.h"
//#include "altera_avalon_pio_regs.h"
#include "altera_up_avalon_ps2.h"
#include "altera_up_ps2_keyboard.h"
//#include "altera_up_ps2_mouse.h"
#include "altera_up_avalon_ps2_regs.h"
#include "sys/alt_stdio.h"
#include "io.h"
#include "tones.h"

/* globals */
#define BUF_SIZE 150000			// about 3 seconds of buffer (@ 48K samples/sec)

void play_note(int keyb_val);

int main(void)
{
		/* Declare volatile pointers to I/O registers (volatile means that IO load
	   and store instructions will be used to access these pointer locations,
	   instead of regular memory loads and stores) */
	volatile int * audio_ptr = (int *) 0x10003040;			// audio port address
  	volatile int * red_LED_ptr = (int *) 0x10000010;		// red LED address
	volatile int * sw_ptr = (int *) 0x10000040;				// slider switches address
	volatile int * PS2_ptr = (int *) 0x10000100; 			// PS/2 port addr

	/* used for audio record/playback */
	int fifospace;
	int PS2_data, RVALID;
	char byte1 = 0, byte2 = 0, byte3 = 0;
	//int leftdata, rightdata;
	//int delay_2_index = -1, delay_1_index = -1;
	int buffer_index = 0;
	int left_buffer[BUF_SIZE];
	int right_buffer[BUF_SIZE];
	int play=0, record=0;
	int i;
	//int tone_freq[24000];

	*(red_LED_ptr) = 0x0;
	/* read and echo audio data */
	while(1)
	{
		PS2_data = *(PS2_ptr);
		RVALID = PS2_data & 0x8000;

		if(RVALID)	//Get last 3 bytes from the keyboard
		{
			byte1 = byte2;
			byte2 = byte3;
			byte3 = PS2_data&0xFF;
			//printf("byte1 = %d\n", byte1);
			//printf("byte2 = %d\n", byte2);
			//printf("byte3 = %d\n", byte3);
		}

		play_note(byte3);
	}
}

void play_note(int keyb_val){
	volatile int * audio_ptr = (int *) 0x10003040;
	volatile int * red_LED_ptr = (int *) 0x10000000;
	int i;

	if(keyb_val == 51) {
		//printf("Sw_ptr = 1\n");
		*(audio_ptr) = 0x8;
		*(audio_ptr) = 0x0;
		for(i = 0;i<=24000;i++){
			*(audio_ptr + 2) = tone_a[i];
			*(audio_ptr + 3) = tone_a[i];
		}
		*(red_LED_ptr) = 0x200;
	}
	else if(keyb_val == 60) {
		//printf("Sw_ptr = 2\n");
		*(audio_ptr) = 0x8;
		*(audio_ptr) = 0x0;
		for(i = 0;i<=24000;i++){
			*(audio_ptr + 2) = tone_a_sharp[i];
			*(audio_ptr + 3) = tone_a_sharp[i];
		}
		*(red_LED_ptr) = 0x400;
	}
	else if(keyb_val == 59) {
		//printf("Sw_ptr = 3\n");
		*(audio_ptr) = 0x8;
		*(audio_ptr) = 0x0;
		for(i = 0;i<=24000;i++){
			*(audio_ptr + 2) = tone_b[i];
			*(audio_ptr + 3) = tone_b[i];
		}
		*(red_LED_ptr) = 0x800;
	}
	else if(keyb_val == 28) {
		//printf("Sw_ptr = 4\n");
		*(audio_ptr) = 0x8;
		*(audio_ptr) = 0x0;
		for(i = 0;i<=24000;i++){
			*(audio_ptr + 2) = tone_c[i];
			*(audio_ptr + 3) = tone_c[i];
		}
		*(red_LED_ptr) = 0x1;
	}
	else if(keyb_val == 29) {
		//printf("Sw_ptr = 5\n");
		*(audio_ptr) = 0x8;
		*(audio_ptr) = 0x0;
		for(i = 0;i<=24000;i++){
			*(audio_ptr + 2) = tone_c_sharp[i];
			*(audio_ptr + 3) = tone_c_sharp[i];
		}
		*(red_LED_ptr) = 0x2;
	}
	else if(keyb_val == 27) {
		//printf("Sw_ptr = 6\n");
		*(audio_ptr) = 0x8;
		*(audio_ptr) = 0x0;
		for(i = 0;i<=24000;i++){
			*(audio_ptr + 2) = tone_d[i];
			*(audio_ptr + 3) = tone_d[i];
		}
		*(red_LED_ptr) = 0x4;
	}
	else if(keyb_val == 36) {
		//printf("Sw_ptr = 7\n");
		*(audio_ptr) = 0x8;
		*(audio_ptr) = 0x0;
		for(i = 0;i<=24000;i++){
			*(audio_ptr + 2) = tone_d_sharp[i];
			*(audio_ptr + 3) = tone_d_sharp[i];
		}
		*(red_LED_ptr) = 0x8;
	}
	else if(keyb_val == 35) {
		//printf("Sw_ptr = 8\n");
		*(audio_ptr) = 0x8;
		*(audio_ptr) = 0x0;
		for(i = 0;i<=24000;i++){
			*(audio_ptr + 2) = tone_e[i];
			*(audio_ptr + 3) = tone_e[i];
		}
		*(red_LED_ptr) = 0x10;
	}
	else if(keyb_val == 43) {
		//printf("Sw_ptr = 9\n");
		*(audio_ptr) = 0x8;
		*(audio_ptr) = 0x0;
		for(i = 0;i<=24000;i++){
			*(audio_ptr + 2) = tone_f[i];
			*(audio_ptr + 3) = tone_f[i];
		}
		*(red_LED_ptr) = 0x20;
	}
	else if(keyb_val == 44) {
		//printf("Sw_ptr = 10\n");
		*(audio_ptr) = 0x8;
		*(audio_ptr) = 0x0;
		for(i = 0;i<=24000;i++){
			*(audio_ptr + 2) = tone_f_sharp[i];
			*(audio_ptr + 3) = tone_f_sharp[i];
		}
		*(red_LED_ptr) = 0x40;
	}
	else if(keyb_val == 52) {
		//printf("Sw_ptr = 11\n");
		*(audio_ptr) = 0x8;
		*(audio_ptr) = 0x0;
		for(i = 0;i<=24000;i++){
			*(audio_ptr + 2) = tone_g[i];
			*(audio_ptr + 3) = tone_g[i];
		}
		*(red_LED_ptr) = 0x80;
	}
	else if(keyb_val == 53) {
		//printf("Sw_ptr = 12\n");
		*(audio_ptr) = 0x8;
		*(audio_ptr) = 0x0;
		for(i = 0;i<=24000;i++){
			*(audio_ptr + 2) = tone_g_sharp[i];
			*(audio_ptr + 3) = tone_g_sharp[i];
		}
		*(red_LED_ptr) = 0x100;
	}
	else
		*(red_LED_ptr) = 0x0;
}
