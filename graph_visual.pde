import processing.serial.*;

Serial myPort;        // The serial port
int xPos = 1;         // horizontal position of the graph 
String inString = "0123456789";

//Variables to draw a continuous line.
int lastxPos=1;
int lastheight=0;

float inByte;
int temp;
int i;

int bufferSize = 256;

int[] scopeBuffer = new int[bufferSize];


void setup () {
  frameRate(600);
  // set the window size:
  size(256, 256);

  // List all the available serial ports
  printArray(Serial.list());
  // Check the listed serial ports in your machine
  // and use the correct index number in Serial.list()[].

  myPort = new Serial(this, Serial.list()[0], 19200);  //

  // A serialEvent() is generated when a newline character is received :
  //myPort.bufferUntil('\n');
  background(0);      // set inital background:

  stroke(127, 34, 255);  //stroke color
  strokeWeight(2);    //stroke wider
}

void draw () {

  i = 0;
  temp = 0;

  while (true) {
    if (myPort.available() > 0) {
      temp = myPort.read();
      scopeBuffer[i++] = temp;

      if (i >= bufferSize) {
        break;
      }
    } else {
      delay(1);
    }
  }

  background(0);
  
  for (i = 0; i < bufferSize; i++)
  {
    //point(i, scopeBuffer[i]);
    line(i, height, i, height - scopeBuffer[i]);
  }
}

//scopeBuffer[i] = 0;
/*
    if (xPos >= width) {
 xPos = 0;
 } else {
 xPos++;
 }
 */

/**
 for (i = 0; i < bufferSize; i++)
 {
 point(xPos, scopeBuffer[i]);
 
 if (xPos >= width) {
 xPos = 0;
 background(0);  //Clear the screen.
 } else {
 // increment the horizontal position:
 xPos++;
 }
 }
 **/
/***
 if (myPort.available() > 0)
 {
 //printArray(frameRate);
 //inString = myPort.readStringUntil('\n');
 temp = myPort.read();
 //if (inString != null)
 //if (temp != -1)
 //{
 //inString = trim(inString);                // trim off whitespaces.
 //inByte = float(inString);           // convert to a number.
 //inByte = map(inByte, 0, 1023, 0, height);
 //inByte = map(temp, 0, 255, 0, height);
 //printArray(temp);
 
 //background(mouseX, mouseY, int(inByte));
 
 point(xPos, temp);
 //line(xPos, height, xPos, height - inByte);
 
 if (xPos >= width) {
 xPos = 1;
 background(0);  //Clear the screen.
 } else {
 // increment the horizontal position:
 xPos++;
 }
 }
 ***/