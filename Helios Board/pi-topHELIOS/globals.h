#ifndef GLOBALS_H_
#define GLOBALS_H_


//SERIAL DEBUGS =====================
//#define SERIAL_DEBUG_ADC

//PIN DEFINITIONS ==================
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
//==================================


//LORA RADIO DEFINITIONS ==================
#define RF95_FREQ 915.0 //Define Frequency for radio
#define LORA_TX_INTERVAL 5000//1500 //important variable - how long to wait between sending data packets back to chase car
#define LORA_CONNECTION_TX_FAILCOUNT	2// the number of failed transmits required on the TX side to register a 'broken connection'
#define LORA_CONNECTION_RX_TIMEOUT (LORA_TX_INTERVAL*2.1/*3.5*/) //high-layer timeout before we say connection is lost on the RX end
#define TRANSMIT_WINDOW (100*PAIRING_ID)
#define RF95_CAD_TIMEOUT 1000 //channel activity detection window - wait this long for a blank window in which to transmit
#define RF95_ACK_TIMEOUT 1000 //how long to wait for an ACK reply after sending a message

//OLED SCREEN DEFINITIONS ==================
#define BROADCAST_PAGE_UPDATE_INTERVAL 250 //how frequently page is update - may affect GPS parsing
#define OLED_WIDTH 128
#define OLED_HEIGHT 64
#define U8LOG_WIDTH 32
#define U8LOG_HEIGHT 10
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
#define KNOTS_TO_MPH(x) (x*1.15078)
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

/* PIN DEFINITIONS FOR HARDWARE REVISION 1 (ALPHA PROTOTYPE) --- DO NOT USE --- */
/*
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
*/
#endif /* GLOBALS_H_ */
