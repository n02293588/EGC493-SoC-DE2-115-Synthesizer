
//=======================================================
//  This code is generated by Terasic System Builder
//=======================================================

module SYNTH_PROJ(

	//////////// CLOCK //////////
	CLOCK_50,
	CLOCK2_50,
	CLOCK3_50,
	TD_CLK27,

	//////////// LED //////////
	LEDG,
	LEDR,

	//////////// KEY //////////
	KEY,

	//////////// SW //////////
	SW,

	//////////// LCD //////////
	LCD_BLON,
	LCD_DATA,
	LCD_EN,
	LCD_ON,
	LCD_RS,
	LCD_RW,

	//////////// PS2 for Keyboard and Mouse //////////
	PS2_CLK,
	PS2_CLK2,
	PS2_DAT,
	PS2_DAT2,

	//////////// Audio //////////
	AUD_ADCDAT,
	AUD_ADCLRCK,
	AUD_BCLK,
	AUD_DACDAT,
	AUD_DACLRCK,
	AUD_XCK,

	//////////// I2C for Audio  //////////
	I2C_SCLK,
	I2C_SDAT,

	//////////// SDRAM //////////
	DRAM_ADDR,
	DRAM_BA,
	DRAM_CAS_N,
	DRAM_CKE,
	DRAM_CLK,
	DRAM_CS_N,
	DRAM_DQ,
	DRAM_DQM,
	DRAM_RAS_N,
	DRAM_WE_N,

	//////////// SRAM //////////
	SRAM_ADDR,
	SRAM_CE_N,
	SRAM_DQ,
	SRAM_LB_N,
	SRAM_OE_N,
	SRAM_UB_N,
	SRAM_WE_N 
);

//=======================================================
//  PARAMETER declarations
//=======================================================


//=======================================================
//  PORT declarations
//=======================================================

//////////// CLOCK //////////
input 		          		CLOCK_50;
input 		          		CLOCK2_50;
input 		          		CLOCK3_50;
input								TD_CLK27;

//////////// LED //////////
output		     [8:0]		LEDG;
output		    [17:0]		LEDR;

//////////// KEY //////////
input 		     [3:0]		KEY;

//////////// SW //////////
input 		    [17:0]		SW;

//////////// LCD //////////
output		          		LCD_BLON;
inout 		     [7:0]		LCD_DATA;
output		          		LCD_EN;
output		          		LCD_ON;
output		          		LCD_RS;
output		          		LCD_RW;

//////////// PS2 for Keyboard and Mouse //////////
inout 		          		PS2_CLK;
inout 		          		PS2_CLK2;
inout 		          		PS2_DAT;
inout 		          		PS2_DAT2;

//////////// Audio //////////
input 		          		AUD_ADCDAT;
inout 		          		AUD_ADCLRCK;
inout 		          		AUD_BCLK;
output		          		AUD_DACDAT;
inout 		          		AUD_DACLRCK;
output		          		AUD_XCK;

//////////// I2C for Audio  //////////
output		          		I2C_SCLK;
inout 		          		I2C_SDAT;

//////////// SDRAM //////////
output		    [12:0]		DRAM_ADDR;
output		     [1:0]		DRAM_BA;
output		          		DRAM_CAS_N;
output		          		DRAM_CKE;
output		          		DRAM_CLK;
output		          		DRAM_CS_N;
inout 		    [31:0]		DRAM_DQ;
output		     [3:0]		DRAM_DQM;
output		          		DRAM_RAS_N;
output		          		DRAM_WE_N;

//////////// SRAM //////////
output		    [19:0]		SRAM_ADDR;
output		          		SRAM_CE_N;
inout 		    [15:0]		SRAM_DQ;
output		          		SRAM_LB_N;
output		          		SRAM_OE_N;
output		          		SRAM_UB_N;
output		          		SRAM_WE_N;


//=======================================================
//  REG/WIRE declarations
//=======================================================




//=======================================================
//  Structural coding
//=======================================================
   SYNTH_CORE_mc u0 (
        .SRAM_DQ_to_and_from_the_SRAM           (SRAM_DQ),           //            SRAM_external_interface.DQ
        .SRAM_ADDR_from_the_SRAM                (SRAM_ADDR),                //                                   .ADDR
        .SRAM_LB_N_from_the_SRAM                (SRAM_LB_N),                //                                   .LB_N
        .SRAM_UB_N_from_the_SRAM                (SRAM_UB_N),                //                                   .UB_N
        .SRAM_CE_N_from_the_SRAM                (SRAM_CE_N),                //                                   .CE_N
        .SRAM_OE_N_from_the_SRAM                (SRAM_OE_N),                //                                   .OE_N
        .SRAM_WE_N_from_the_SRAM                (SRAM_WE_N),                //                                   .WE_N
		  
        .LCD_DATA_to_and_from_the_Char_LCD_16x2 (LCD_DATA), //   Char_LCD_16x2_external_interface.DATA
        .LCD_ON_from_the_Char_LCD_16x2          (LCD_ON),          //                                   .ON
        .LCD_BLON_from_the_Char_LCD_16x2        (LCD_BLON),        //                                   .BLON
        .LCD_EN_from_the_Char_LCD_16x2          (LCD_EN),          //                                   .EN
        .LCD_RS_from_the_Char_LCD_16x2          (LCD_RS),          //                                   .RS
        .LCD_RW_from_the_Char_LCD_16x2          (LCD_RW),          //                                   .RW
		  
        .sys_clk                                (),                                //                    sys_clk_out_clk.clk
		  
        .AUD_ADCDAT_to_the_Audio                (AUD_ADCDAT),                //           Audio_external_interface.ADCDAT
        .AUD_ADCLRCK_to_the_Audio               (AUD_ADCLRCK),               //                                   .ADCLRCK
        .AUD_BCLK_to_the_Audio                  (AUD_BCLK),                  //                                   .BCLK
        .AUD_DACDAT_from_the_Audio              (AUD_DACDAT),              //                                   .DACDAT
        .AUD_DACLRCK_to_the_Audio               (AUD_DACLRCK),               //                                   .DACLRCK
		  
        .LEDR_from_the_Red_LEDs                 (LEDR),                 //        Red_LEDs_external_interface.export
        .reset_n                                (KEY[0]),                                //             merged_resets_in_reset.reset_n
		  
        .zs_addr_from_the_SDRAM                 (DRAM_ADDR),                 //                         SDRAM_wire.addr
        .zs_ba_from_the_SDRAM                   (DRAM_BA),                   //                                   .ba
        .zs_cas_n_from_the_SDRAM                (DRAM_CAS_N),                //                                   .cas_n
        .zs_cke_from_the_SDRAM                  (DRAM_CKE),                  //                                   .cke
        .zs_cs_n_from_the_SDRAM                 (DRAM_CS_N),                 //                                   .cs_n
        .zs_dq_to_and_from_the_SDRAM            (DRAM_DQ),            //                                   .dq
        .zs_dqm_from_the_SDRAM                  (DRAM_DQM),                  //                                   .dqm
        .zs_ras_n_from_the_SDRAM                (DRAM_RAS_N),                //                                   .ras_n
        .zs_we_n_from_the_SDRAM                 (DRAM_WE_N),                 //                                   .we_n
		  
        .LEDG_from_the_Green_LEDs               (LEDG),               //      Green_LEDs_external_interface.export
		  
        .PS2_CLK_to_and_from_the_PS2_Port_Dual  (PS2_CLK2),  //   PS2_Port_Dual_external_interface.CLK
        .PS2_DAT_to_and_from_the_PS2_Port_Dual  (PS2_DAT2),  //                                   .DAT
		  
        .SW_to_the_Slider_Switches              (SW),              // Slider_Switches_external_interface.export
		  
        .I2C_SDAT_to_and_from_the_AV_Config     (I2C_SDAT),     //       AV_Config_external_interface.SDAT
        .I2C_SCLK_from_the_AV_Config            (I2C_SCLK),            //                                   .SCLK
		  
        .PS2_CLK_to_and_from_the_PS2_Port       (PS2_CLK),       //        PS2_Port_external_interface.CLK
        .PS2_DAT_to_and_from_the_PS2_Port       (PS2_DAT),       //                                   .DAT
		  
        .KEY_to_the_Pushbuttons                 ({KEY[3:1], 1'b1}),                 //     Pushbuttons_external_interface.export
		  
        .clk                                    (CLOCK_50),                                    //                         clk_clk_in.clk
        .clk_27                                 (TD_CLK27),                                 //                      clk_27_clk_in.clk
        .audio_clk                              (AUD_XCK),                              //                              audio.clk
        .sdram_clk                              (DRAM_CLK)                               //                              sdram.clk
    );


endmodule