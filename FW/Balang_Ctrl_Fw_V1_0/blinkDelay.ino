/*
 * TimedBlink blink delay sample
 *
 * Makes the built-in LED blink. 200ms ON and 100ms OFF.
 *
 * created January 14, 2017
 * by Lorenzo Pasqualis
 *
 * This example code is in the public domain.
 */
 
#include <TimedBlink.h>
#define BN_ctr_MAXU32_u32 0xFFFFFFFFu
#define BN_ctr_Zero_u8 ((uint8)0u)
#define BN_ctr_OneSecond_cu32 ((uint32)1000)
#define AND_THEN &&
#define OR_ELSE ||
#define THUNG1 ((uint8)1u)
#define THUNG2 ((uint8)2u)
#define BN_ctr_Ten_cu8 ((uint8)10u)
#define BN_ctr_MAXXPOS_cu8 ((uint8)10u)
#define BN_ctr_MAXYPOS_cu8 ((uint8)3u)
#define BN_ctr_MAXBOX_cu8 ((uint8)(BN_ctr_MAXXPOS_cu8* BN_ctr_MAXYPOS_cu8))
#define BN_ctr_OnOffPin_cu8 53
#define BN_ctr_RunningLedPin_cu8 52
#define BN_ctr_CommingYOnCtrPin_cu8 51
#define BN_ctr_CommingYRetCtrPin_cu8 50
#define BN_ctr_CommingXOnCtrPin_cu8 49
#define BN_ctr_CommingXRetCtrPin_cu8 48
#define BN_ctr_CtrUpStop_cu8 A13
#define BN_ctr_CtrDownStop_cu8 A14
#define BN_ctr_UpDownCtrPin_cu8 47
#define BN_ctr_UpDownOnPin_cu8 46
#define BN_ctr_ReturnYHomePin 30
#define BN_ctr_ReturnXHomePin A0

#define BN_ctr_PinGo_cau8 	{0,1,2,3,4,5,6,7,8,9,\
												10,11,12,13,14,15,16,17,18,19,\
												20,21,22,23,24,25,26,27,28,29}

#define BN_ctr_PinXPos_cau8 	{A0, A1, A2, A3, A4, A5, A6, A7, A8, A9}
#define BN_ctr_PinYPos_cau8 	{A10, A11, A12}

typedef unsigned char uint8;
typedef unsigned long uint32;
typedef enum {
	SysSetting_e,
	SysIdle_e,
	SysRunning_e,
	SysDone_e
}bn_ctr_SysCtrStt_en;

typedef enum {
	RunIdle_e,
	RunComming_e,
	RunPickingDow_e,
	RunWait2Pickup_e,
	RunPickingUp,
	RunReturning_e
}bn_Ctr_RunningStt_ten;

typedef enum {
	BoxIdle_e,
	BoxWaiting2Run_e,
	BoxCommingY_e,
	BoxCommingX_e,
	BoxPickingDow_e,
	BoxWait2Pickup_e,
	BoxPickingUp_e,
	BoxReturningX_e,
	BoxReturningY_e,
	BoxRunningDone_e
}bn_ctr_BoxCtrStt_en;

typedef struct {
	bn_ctr_BoxCtrStt_en BoxCtrStt_en;
	uint8 PosDesX_u8;
	uint8 PosDesY_u8;
	uint8 PosCurrX_u8;
	uint8 PosCurrY_u8;
	uint8 PinGo_u8;
	//uint8 PinRet_u8;
	uint32 TimeRemainning_u32;
	uint32 WaitingTimeSetup_u32;
}bn_ctr_BoxProfile_ten;

bn_ctr_BoxProfile_ten bn_ctr_BoxAll_aen[BN_ctr_MAXBOX_cu8];
static void toglePin(uint8 Pin, uint32 PeriodTime_u32 ,uint32* LastTogle_u32);
static void bn_ctr_CtrRunning(bn_ctr_BoxProfile_ten Box_en);
static void bn_ctr_CtrCommingY(bn_ctr_BoxProfile_ten* Box_en);
static void bn_ctr_CtrCommingX(bn_ctr_BoxProfile_ten* Box_en);
static void bn_ctr_CtrPickingDown(bn_ctr_BoxProfile_ten* Box_en);
static void bn_ctr_CtrPickingUp(bn_ctr_BoxProfile_ten* Box_en);
static void bn_ctr_CtrReturningX(bn_ctr_BoxProfile_ten* Box_en);
static void bn_ctr_CtrReturningY(bn_ctr_BoxProfile_ten* Box_en);


TimedBlink monitor(LED_BUILTIN);
uint32 LastTogleRunLedPin_u32 = 0 ;
uint8 bn_ctr_SysStt_en = SysIdle_e;
uint8 bn_ctr_RunStt_en = RunIdle_e;
uint8 bn_ctr_BoxRunIndex_u8 = 0;
void setup() {
uint8 BoxIndex_u8 ;
   Serial.begin(9600);
   pinMode(LED_BUILTIN, OUTPUT);
   monitor.blink(100,300);
   static const uint8 bn_ctrPinGo_au8[BN_ctr_MAXBOX_cu8] = BN_ctr_PinGo_cau8;
   static const uint8 bn_ctr_PinXPos_au8[BN_ctr_MAXXPOS_cu8] = BN_ctr_PinXPos_cau8;
   static const uint8 bn_ctr_PinYPos_cau8[BN_ctr_MAXYPOS_cu8] = BN_ctr_PinYPos_cau8;

   for(BoxIndex_u8 = 0; BoxIndex_u8 < BN_ctr_MAXBOX_cu8; BoxIndex_u8++)
   {
	   bn_ctr_BoxAll_aen[BoxIndex_u8].PosDesX_u8 = bn_ctr_PinXPos_au8[BoxIndex_u8 % BN_ctr_Ten_cu8];
	   bn_ctr_BoxAll_aen[BoxIndex_u8].PosDesY_u8 = bn_ctr_PinYPos_cau8[BoxIndex_u8 / BN_ctr_Ten_cu8];
	   bn_ctr_BoxAll_aen[BoxIndex_u8].BoxCtrStt_en = BoxIdle_e;
	   bn_ctr_BoxAll_aen[BoxIndex_u8].PosCurrX_u8 = BN_ctr_Zero_u8;
	   bn_ctr_BoxAll_aen[BoxIndex_u8].PosCurrY_u8 = BN_ctr_Zero_u8;
	   bn_ctr_BoxAll_aen[BoxIndex_u8].PinGo_u8 = bn_ctrPinGo_au8[BoxIndex_u8];
   }
}

void loop() {
  /*Serial.println("Waiting 3 seconds and blinking the LED at the same time...");
  monitor.blinkDelay(3000);
  toglePin(THUNG1, 1000, &LastTogle_u32Pin1);*/
	uint8 BoxIndex_u8;
	switch(bn_ctr_SysStt_en){
	case SysSetting_e:
	{
		while(LOW!=digitalRead(BN_ctr_OnOffPin_cu8))
			/*Wait until start button is pressed*/
		{
			toglePin(BN_ctr_RunningLedPin_cu8,BN_ctr_OneSecond_cu32,&LastTogleRunLedPin_u32);
		}
		bn_ctr_SysStt_en = SysIdle_e;
	break;
	}
	case SysIdle_e:
	{
		for(BoxIndex_u8= 0; BoxIndex_u8 < BN_ctr_MAXBOX_cu8;BoxIndex_u8++)
		{
			if(digitalRead(bn_ctr_BoxAll_aen[BoxIndex_u8].PinGo_u8) == LOW)/*On*/
			{
				bn_ctr_BoxAll_aen[BoxIndex_u8].BoxCtrStt_en = BoxWaiting2Run_e;
			}else
			{
				/*Do nothing, go next box*/
			}
		}
	break;
	}
	case SysRunning_e:
	{
		bn_ctr_CtrRunning(bn_ctr_BoxAll_aen[bn_ctr_BoxRunIndex_u8]);
		if((BoxRunningDone_e == bn_ctr_BoxAll_aen[bn_ctr_BoxRunIndex_u8].BoxCtrStt_en))
		{
			if (bn_ctr_BoxRunIndex_u8 < BN_ctr_MAXBOX_cu8){
				bn_ctr_BoxRunIndex_u8 ++;
			}else{
				bn_ctr_SysStt_en = SysDone_e;
			}
		}else
		{
			/*No fixed*/
		}
	break;
	}
	default:
	break;
	}
}
static void toglePin(uint8 Pin_u8, uint32 PeriodTime_u32 ,uint32* LastTogle_u32)
{
	uint32 NowTogle_u32 = millis();
	if(((*LastTogle_u32 < NowTogle_u32)AND_THEN((NowTogle_u32 >= *LastTogle_u32 + PeriodTime_u32)))\
	OR_ELSE ((*LastTogle_u32>= NowTogle_u32)AND_THEN(BN_ctr_MAXU32_u32-PeriodTime_u32 >= *LastTogle_u32 - NowTogle_u32)))
	{
			/*Do sth*/
			/*Updated last toggl*/
			*LastTogle_u32 = NowTogle_u32;
			digitalWrite(Pin_u8,!digitalRead(Pin_u8));
	}else
	{
		/* Do nothing*/
	}
}
static void bn_ctr_CtrRunning(bn_ctr_BoxProfile_ten Box_en)
{
	switch(Box_en.BoxCtrStt_en)
	{
	case BoxWaiting2Run_e:
		Box_en.BoxCtrStt_en = BoxCommingY_e;
	break;
	case BoxCommingY_e:
		bn_ctr_CtrCommingY(&Box_en);
	break;
	case BoxCommingX_e:
		bn_ctr_CtrCommingX(&Box_en);
	break;
	case BoxPickingDow_e:
		bn_ctr_CtrPickingDown(&Box_en);
	break;
	case BoxWait2Pickup_e:
		bn_ctr_CtrPickingUp(&Box_en);
	break;
	case BoxReturningX_e:
		bn_ctr_CtrReturningX(&Box_en);
	break;
	case BoxReturningY_e:
		bn_ctr_CtrReturningY(&Box_en);
	break;

	default:
	break;
	}
}
static void bn_ctr_CtrCommingY(bn_ctr_BoxProfile_ten* Box_en)
{
	if(analogRead(Box_en->PosDesY_u8)==LOW){
		digitalWrite(BN_ctr_CommingYOnCtrPin_cu8, HIGH);
		digitalWrite(BN_ctr_CommingYRetCtrPin_cu8, HIGH);
	}else{ /*Control stop motor*/
		digitalWrite(BN_ctr_CommingYOnCtrPin_cu8, LOW);
		digitalWrite(BN_ctr_CommingYRetCtrPin_cu8, LOW);
		Box_en->BoxCtrStt_en = BoxCommingX_e;
	}
}
static void bn_ctr_CtrCommingX(bn_ctr_BoxProfile_ten* Box_en)
{
	if(analogRead(Box_en->PosDesX_u8)==LOW){
		digitalWrite(BN_ctr_CommingXOnCtrPin_cu8, HIGH);
		digitalWrite(BN_ctr_CommingXRetCtrPin_cu8, HIGH);
	}else{ /*Control stop motor*/
		digitalWrite(BN_ctr_CommingXOnCtrPin_cu8, LOW);
		digitalWrite(BN_ctr_CommingXRetCtrPin_cu8, LOW);

	}
}

static void bn_ctr_CtrPickingDown(bn_ctr_BoxProfile_ten* Box_en)
{
	if(analogRead(BN_ctr_CtrDownStop_cu8)==LOW){
		digitalWrite(BN_ctr_UpDownCtrPin_cu8, HIGH);
		digitalWrite(BN_ctr_UpDownOnPin_cu8, HIGH);
	}else{ /*Control stop motor*/
		digitalWrite(BN_ctr_UpDownCtrPin_cu8, LOW);
		digitalWrite(BN_ctr_UpDownCtrPin_cu8, LOW);
		Box_en->BoxCtrStt_en = BoxPickingUp_e;
	}
}

static void bn_ctr_CtrPickingUp(bn_ctr_BoxProfile_ten* Box_en)
{
	if(analogRead(BN_ctr_CtrUpStop_cu8)==LOW){
		digitalWrite(BN_ctr_UpDownCtrPin_cu8, HIGH);
		digitalWrite(BN_ctr_UpDownOnPin_cu8, LOW);
	}else{ /*Control stop motor*/
		digitalWrite(BN_ctr_UpDownCtrPin_cu8, LOW);
		digitalWrite(BN_ctr_UpDownCtrPin_cu8, LOW);
		Box_en->BoxCtrStt_en = BoxReturningX_e;
	}
}

static void bn_ctr_CtrReturningX(bn_ctr_BoxProfile_ten* Box_en)
{
	if(analogRead(BN_ctr_ReturnXHomePin)==LOW){
		digitalWrite(BN_ctr_CommingXOnCtrPin_cu8, LOW);
		digitalWrite(BN_ctr_CommingXRetCtrPin_cu8, LOW);
	}else{ /*Control stop motor*/
		digitalWrite(BN_ctr_CommingXOnCtrPin_cu8, LOW);
		digitalWrite(BN_ctr_CommingXRetCtrPin_cu8, HIGH);
		Box_en->BoxCtrStt_en = BoxReturningY_e;
	}
}
static void bn_ctr_CtrReturningY(bn_ctr_BoxProfile_ten* Box_en)
{
	if(digitalRead(BN_ctr_ReturnYHomePin)==LOW){
		digitalWrite(BN_ctr_CommingYOnCtrPin_cu8, LOW);
		digitalWrite(BN_ctr_CommingYRetCtrPin_cu8, HIGH);
	}else{ /*Control stop motor*/
		digitalWrite(BN_ctr_CommingYOnCtrPin_cu8, HIGH);
		digitalWrite(BN_ctr_CommingYRetCtrPin_cu8, LOW);
		Box_en->BoxCtrStt_en = BoxRunningDone_e;
	}
}
