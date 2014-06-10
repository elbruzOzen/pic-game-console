PIC Game Console

Simple Game Console powered by Microchip PIC16F887

**********************************************************************

What you need ?

- PICKIT 2 + Its USB cable
- 1x Microchip PIC16F887
- 1x 16*2 LCD Screen (YAOUYU YM1602G-1) or similar one (Look at Proteus Sketch)
- 1x 10 OHM potentiometer
- 4x Switch Button
- 4x 10 OHM resistor
- Jumpers or some kind of wires (Look at Proteus Sketch)
- Breadboard (Col:65 Row:a-j)

- MikroC IDE and Compiler(Limited free version is enough)
- PICKIT 2 Software
- Proteus Pro(One of the recent versions)

***************************************************************************************

Steps:

*How to test program:

-Open "RaceGame" project by using MikroC and compile it(actually hex file is already in project but that what you should do for your modifications)
-Open PICKIT 2 Software Connect PICKIT and your PIC, then program "RaceGame.hex" into PIC
-Establish the circuit as shown in Proteus Sketch
-Power the circuit. It should work.

*How to test program on Proteus:

-Open "RaceGame" project by using MikroC and compile it(actually hex file is already in project but that what you should do for your modifications)
-Open the project under the file "Game Console" by using Proteus
-Select the "RaceGame.hex" as a source of PIC on the sketch(Right Click on PIC and Properties)
-Run Simulation

*********************************************************************************

You can write other projects and games for this console. I want to create a "Pong" Game as soon as possible
