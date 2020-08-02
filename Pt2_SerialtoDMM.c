/*
 * helloworld.c: simple test application
 *
 * This application configures UART 16550 to baud rate 9600.
 * PS7 UART (Zynq) is not initialized by this application, since
 * bootrom/bsp configures it to baud rate 115200
 *
 * ------------------------------------------------
 * | UART TYPE   BAUD RATE                        |
 * ------------------------------------------------
 *   uartns550   9600
 *   uartlite    Configurable only in HW design
 *   ps7_uart    115200 (configured by bootrom/bsp)
 */

#include <stdio.h>
#include <stdint.h> //defines int8_t, uint8_t, int16_t,unint16_t, etc.
#include "xuartps.h"

#define UART_DEVICE_ID              XPAR_PS7_UART_1_DEVICE_ID

int main()
{

	XUartPs Uart_PS;
	XUartPs_Config *Config;
	int Status;
	unsigned char RecvBuffer1[40]; //buffer for reading instrument
	unsigned char RecvBuffer2[40]; //buffer for reading instrument
	short int clear=0x0300; //Ctrl-C for clearing
	int ReceivedCount=0,y=0;

	/*
	 * Initialize the UART driver so that it's ready to use.
	 * Look up the configuration in the config table, then initialize it.
	 * Do not use init_platform which is used by helloworld.c application
	 */
	Config = XUartPs_LookupConfig(UART_DEVICE_ID);
	if (NULL == Config) {
		return XST_FAILURE;
	}

	Status = XUartPs_CfgInitialize(&Uart_PS, Config, Config->BaseAddress);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Check hardware build.
	 */
	Status = XUartPs_SelfTest(&Uart_PS);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}
	XUartPs_SetBaudRate(&Uart_PS, 9600);//change baud rate from default (115200)
while(1){

    //print("Hello World\n\r");
	printf("SYST:REM\n");
	printf("*rst\n");
	printf("%s",clear);
	printf("APPL:SIN 3.0E+3,1.1\n");
	//Need delay before reading from instrument
	for(y=0;y<0x8000000;y++);
	printf("freq?\n");

	while(XUartPs_IsSending(&Uart_PS)==0);//make sure uart finished sending
			ReceivedCount=0;y=0;

	while (RecvBuffer1[y] != 0x0A){
	while(!XUartPs_Recv(&Uart_PS, &RecvBuffer1[ReceivedCount],1));//wait until char received
		ReceivedCount++;//count number of bytes received
		y=ReceivedCount-1;//adjust to check last element that has been written to the buffer
	}

}
    return 0;
}
