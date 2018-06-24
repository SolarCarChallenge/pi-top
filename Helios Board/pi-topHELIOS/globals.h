#ifndef GLOBALS_H_
#define GLOBALS_H_



//MCU Serial Notes:
//todo

//SERIAL DEBUGS =====================
//#define SERIAL_DEBUG_ADC

//PIN DEFINITIONS ==================
#ifndef OLD_HARDWARE_PINOUT
	//Spare GPIO
	#define GPIO0_PIN         0
	#define GPIO1_PIN         1
	#define GPIO2_PIN         10
	#define GPIO3_PIN         A4
	//User Interaction
	#define BUZZER_PIN        6
	#define BUTT0_PIN         A5
	#define BUTT1_PIN         11
	//RGB Led Pin Definitions
	#define RGB_LED_RED_PIN   A2
	#define RGB_LED_GRN_PIN   13
	#define RGB_LED_BLU_PIN   A1
	//Misc
	#define RELAY_PIN         5
	#define UNUSED_1_PIN	  A3
	//GPS Pin Definitions
	#define GPS_1PPS_PIN	  12
	//OLED Display Pin Definitions
	#define OLED_DC_PIN       A0
	#define OLED_RST_PIN      7
	#define OLED_CS_PIN       2
	//ADC Pin Definitions
	#define ADC_CS_PIN        9
	//LORA Radio Pin Definitions
	#define LORA_CS_PIN       8
	#define LORA_RST_PIN      4
	#define LORA_IRQ_PIN      3
#else
	//Spare GPIO
	#define GPIO0_PIN         0
	#define GPIO1_PIN         1
	#define GPIO2_PIN         10
	#define GPIO3_PIN         12
	//User Interaction
	#define BUZZER_PIN        6
	#define BUTT0_PIN         13
	#define BUTT1_PIN         11
	//RGB Led Pin Definitions
	#define RGB_LED_RED_PIN   A2
	#define RGB_LED_GRN_PIN   A5
	#define RGB_LED_BLU_PIN   A1
	//Misc
	#define RELAY_PIN         5
	#define UNUSED_1_PIN	  A3
	//GPS Pin Definitions
	#define GPS_1PPS_PIN		  GPIO3_PIN
	//OLED Display Pin Definitions
	#define OLED_DC_PIN       A0
	#define OLED_RST_PIN      7
	#define OLED_CS_PIN       2
	//ADC Pin Definitions
	#define ADC_CS_PIN        9
	//LORA Radio Pin Definitions
	#define LORA_CS_PIN       8
	#define LORA_RST_PIN      4
	#define LORA_IRQ_PIN      3
#endif
//==================================



//BROADCASTING PAGE DEFINITIONS ==================
//As defined from bottom left
#define BP_ADC_XPOS 16
#define BP_ADC_YPOS 63
	//#define BP_VOLT_XPOS 0
	//#define BP_VOLT_YPOS 45
//Defined from top left
#define BP_GPS_DATA_XPOS 0
#define BP_GPS_DATA_YPOS 32

//ADC PAGE DEFINITIONS ==================
#define ADC_FRAME_WIDTH	 32
#define ADC_FRAME_HEIGHT 32
#define ADC_TITLE_HEIGHT 10
#define ADC_TITLE_XPOS 4
#define ADC_TITLE_YPOS (ADC_TITLE_HEIGHT/2)+1
#define ADC_READING_XPOS 4
#define ADC_READING_YPOS (ADC_TITLE_HEIGHT+((ADC_FRAME_HEIGHT-ADC_TITLE_HEIGHT)/2))+1


//MISC DEFINITIONS ==================
#define convertKnotsToMph(x) (x*1.15078)
#define TOGGLE 0x02
enum{
	SUCCESS,
	FAILED,
	LORA_ACK_FAILURE,
	LORA_CAD_FAILURE
	};
enum{
	CONNECTED=0,//has to be 0, fail strikes increment this value
	DISCONNECTED
};

//LED DEFINITIONS ==================
//RGB LED PRESETS
#define LED_OFF 0,0,0
#define LED_RED 255,0,0
#define LED_GRN 0,255,0
#define LED_BLU 0,0,255
//#define RGB_BLU_DIM 0,0,250
#define LED_GRN_DIM 0,50,0
#define LED_PUR_DIM 10,0,10
#define LED_ORA_DIM 20, 5, 0
//For blinking
#define ONTIME  200
#define OFFTIME 2500

#endif /* GLOBALS_H_ */
