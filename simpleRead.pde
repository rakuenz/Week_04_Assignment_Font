/**
 * Simple Read
 * 
 * Read data from the serial port and change the color of a rectangle
 * when a switch connected to a Wiring or Arduino board is pressed and released.
 * This example works with the Wiring / Arduino program that follows below.
 */


import processing.serial.*;

Serial myPort;  // Create object from Serial class
int val;      // Data received from the serial port
float dots;      // color for filling the rectangle.

void setup() 
{
  size(400, 400);
  // I know that the first port in the serial list on my mac
  // is always my  FTDI adaptor, so I open Serial.list()[0].
  // On Windows machines, this generally opens COM1.
  // Open whatever port is the one you're using.
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);
}

void draw()
{
  
  if ( myPort.available() > 0) {  // If data is available,
    String val = myPort.readStringUntil('\n');         // read it and store it in val
    if(val != null){
      println(val);
      dots = float(val); // convert String to float value.     
    }
  }
 
  size(400,400);
background(205);
noStroke();
fill(0);
int[] x = {100,250,150,200,160,330};
int[] y = {100,150,180,230,270,330};
int[] a = {60,80};
int[] b = {100,330};
int Y;
int X;
float grain_size = 3 ;
float dot_size = grain_size * .3;
smooth();

int i;
for(i=0; i<5; i++){
  for(Y= y[i]; Y < y[i+1]; Y = Y + int(grain_size)){
    for(X=x[0]; X < x[i+1]; X = X + int(grain_size)){
      float d = map(X,x[0],x[i+1],dot_size,dot_size * dots);
      ellipse ( X, Y, d, d);
  }
}
}
}
