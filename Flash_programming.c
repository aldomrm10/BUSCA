#include "F2837xD_device.h"
#pragma CODE_SECTION(InitFlash, "RamFuncs")
void InitFlash(void){
Flash0CtrlRegs.FPAC1.bit.PMPPWR = 0x1;
Flash0CtrlRegs.FBFALLBACK.bit.BNKPWR0 = 0x3;
Flash0CtrlRegs.FRD_INTF_CTRL.bit.DATA_CACHE_EN = 0;
Flash0CtrlRegs.FRD_INTF_CTRL.bit.PREFETCH_EN = 0;
Flash0CtrlRegs.FRDCNTL.bit.RWAIT = 0x3;
Flash0CtrlRegs.FRD_INTF_CTRL.bit.DATA_CACHE_EN = 1;
Flash0CtrlRegs.FRD_INTF_CTRL.bit.PREFETCH_EN = 1;
Flash0EccRegs.ECC_ENABLE.bit.ENABLE = 0xA;
asm(" RPT #6 || NOP"); }
extern Uint16 RamFuncs_loadstart; extern Uint16 RamFuncs_loadsize; extern Uint16 RamFuncs_runstart;

Uint32 push_button;
Uint32 fast = 0;
int main(void)
{
    EALLOW;
    WdRegs.WDCR.all = 0b000000001101000;

    WdRegs.WDCR.all = 0b000000000101000;

    GpioCtrlRegs.GPAGMUX1.bit.GPIO0 = 0b00;
    GpioCtrlRegs.GPAMUX1.bit.GPIO0 = 0b00;
    GpioCtrlRegs.GPADIR.bit.GPIO0 = 0;
    GpioCtrlRegs.GPAPUD.bit.GPIO0 = 0;

    GpioCtrlRegs.GPAGMUX2.bit.GPIO31 = 0b00;
    GpioCtrlRegs.GPAMUX2.bit.GPIO31 = 0b00;
    GpioCtrlRegs.GPADIR.bit.GPIO31 = 1;
    GpioCtrlRegs.GPAPUD.bit.GPIO31 = 1;

    GpioCtrlRegs.GPBGMUX1.bit.GPIO34 = 0b00;
    GpioCtrlRegs.GPBMUX1.bit.GPIO34 = 0b00;
    GpioCtrlRegs.GPBDIR.bit.GPIO34 = 1;
    GpioCtrlRegs.GPBPUD.bit.GPIO34 = 1;
    GpioDataRegs.GPASET.bit.GPIO31 = 1;
    EDIS;
    ClkCfgRegs.SYSPLLMULT.all = 0;
    ClkCfgRegs.SYSCLKDIVSEL.all = 0;

    //memcpy(&RamFuncs_runstart, &RamFuncs_loadstart, (Uint32) &RamFuncs_loadsize);
    //InitFlash();

    while(1){
        EALLOW;
        WdRegs.WDKEY.all = 0x55;
        WdRegs.WDKEY.all = 0xAA;
        EDIS;
        /*push_button =  GpioDataRegs.GPADAT.bit.GPIO0 ;
           if(push_button){
               GpioDataRegs.GPBSET.bit.GPIO31 = 1;
           } else {
               GpioDataRegs.GPACLEAR.bit.GPIO31 = 1;
           }*/
        fast++;
        if(fast%100000 == 0){
            GpioDataRegs.GPBTOGGLE.bit.GPIO34 = 1;
        }

    }
}
