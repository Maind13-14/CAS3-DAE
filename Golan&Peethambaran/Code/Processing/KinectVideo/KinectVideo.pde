import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

import SimpleOpenNI.*;
int[] depthValues;

SimpleOpenNI  context;


int displaycols, displayrows;
// Size of each cell in the grid
int cellSize = 6;
int cellSize2 =9;
int [][] img1;
int count;
int flag =0;

Minim minim;
AudioPlayer splash;

int minDistance  = 500;  // 50cm
int maxDistance  = 2230; // 2.5m

//int projectorWidth  = 1024;//1024;
//int projectorHeight = 768;//768;

int kinectWidth=640;
int kinectDepth=480;

PImage maskImage;
PImage bg;

void setup()
{
  size(1024, 768, P2D);
  noCursor();
  context = new SimpleOpenNI(this);
  if (context.isInit() == false)
  {
    println("Can't init SimpleOpenNI, maybe the camera is not connected!"); 
    exit();
    return;
  }

  // mirror is by default enabled
  //context.setMirror(true);

  // enable depthMap generation 
  context.enableDepth();
  maskImage  = createImage(640, 480, RGB);

  displaycols=kinectWidth/cellSize;
  displayrows=kinectDepth/cellSize;
  // The image file must be in the data folder of the current sketch 
  // to load successfully
  frameRate(60);
  img1= new int[displaycols][displayrows]; 

  minim = new Minim(this);
  splash = minim.loadFile("splash_printer.wav");

  count=displayrows;
  bg = loadImage("black_overlay.png");

  noStroke();
  fill(255);
}

void draw()
{

  background(0);
  // update the cam
  context.update();

  depthValues = context.depthMap();
  maskImage.loadPixels();
  for (int pic = 0; pic < depthValues.length; pic++)
    if ( depthValues[pic] < maxDistance)
      // IN RANGE: WHITE PIXEL
      maskImage.pixels[pic] = color(255);
    else
      maskImage.pixels[pic] = color(0);
  maskImage.updatePixels();

  // GET DEPTH VALUES IN MILLIMETERS
  PImage pic= context.depthImage();


  //pic.resize(0, 500);
  pic.filter(THRESHOLD, 0.6);


  pic.mask(maskImage);

  //image(pic,0,0);

  //cols = kinectWidth/ cellSize;
  //rows = pic.height/ cellSize;
  //count=rows;
  dropImage(pic);
}

void dropImage(PImage img)
{

  if (count==0)
  { 
    flag++;
    if (flag==20)
    { 
      count=displayrows-1;
      flag=0;
    }
  }
  else
    count--;

  if (count==40)
  {
    splash.play();
    splash.rewind();
  }

  if (flag==0) {
    for (int i = 0; i < displaycols;i++) {


      // Where are we, pixel-wise?
      int x = i * cellSize;
      int y = count * cellSize;
      int loc = y*img.width+x; 

      color c = img.pixels[loc];

      //float b =brightness(c);

      if (c==color(255))
      {

        img1[i][0]=1;
      }
      else
        img1[i][0]=0;
    }
  }
  else
  {
    for (int i = 0; i < displaycols;i++) {
       img1[i][0]=0;
    }
  }


  for (int j = displayrows-1; j >0;j--) {
    for (int i = 0; i <displaycols;i++) {
      // Begin loop for rows


      int x = i * cellSize2;
      int y = j * cellSize;

      if (img1[i][j]>0)
      {
        rect(x, y+j*j*0.3, cellSize2/6, cellSize/6+0.03*j*j);
        //rect(x+4.3, y+j*j*0.3, cellSize2/6, cellSize2/6+0.03*j*j);
      }

      img1[i][j]=img1[i][j-1];
    }
  }
}

