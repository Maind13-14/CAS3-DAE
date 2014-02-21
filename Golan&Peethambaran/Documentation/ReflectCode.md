 REFLECT	
====================

Code Title
—————————-
Arduino mockup of waterfall printer
Processing mockup of waterfall printer


Description
——————————-
The prototype consists of two parts the architectural model and the mock up of the waterfall printer.

**Arduino**:The Arduino operates the LEDs in the architectural model. When the  figure is set in place its closing a circuit and the Arduino sends the values to one of the three shift resistors so the specific group of LEDs are light up one after another. Also the Arduino sends values to forth resistor that light up another group of LEDs one after another all the time**Processing**:
The mockup of the waterfall printer runs on processing. A kinect captures the structures in front of the screen and passes it to a processing code. The processing code takes depth images and pixelates it and displays them as flowing images. When the flowing image reaches the end of the screen an audio feedback- sound of splashing water, is played.

Reference to other codes and projects
————————-————————-————————-——————————
1.	https://code.google.com/p/simple-openni/2.	http://shiffman.net/p5/kinect/3.	http://ericmedine.com/tutorials/LECTURE_kinect_hacking.htm

Libraries
————————-
1.	Simple Open NI(Kinect)2.	Minim (Sound)