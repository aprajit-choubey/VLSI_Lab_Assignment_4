*********************************************************************************
*INCLUDE TSMC180 LIBRARY & DEFINE CLOBALS
*********************************************************************************
.LIB /home/simulator/mentor/Library/ADK/technology/ic/models/tsmc018.mod
.temp 27 * Set Operating temperatrue to 27 degrees celcious 

.global VDD GND
VFORCE_VDD VDD GND dc 1.8
.CONNECT GND 0
.option post

*********************************************************************************
*INCLUDE CALIBRE NETLIST
*********************************************************************************
.include 'and_final.sp'

*********************************************************************************
*ADD Top level simulation netlist
***************************************************************************X1******

X1 INA INB OUT GND VDD and_final
C1 OUT GND 300f
  

*********************************************************************************
*Stimulus
*********************************************************************************
****INPUT STIMULS****
*add  any input vector here

v1 INA gnd pulse(0 1.8 0.01n 0.01n 0.01n 1.25n 2.5n)
v2 INB gnd dc 1.8

*********************************************************************************
*Run a transient analysis
*********************************************************************************

.tran 0.1ns 10ns
.print tran V(OUT)