//variables : A B //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>//
//constants : none
//axiom : A
//rules : (A → AB), (B → A)


int generation = 1;
int iii = 0;

int lSystem = 6;
// 1 //Koch curve
// 2 //Sierpinski triangle
// 3 //Sierpiński arrowhead curve
// 4 //Fractal plant
// 5 //  bush like plant
// 6 // Fractal (binary) tree

String axiom = new String(); 

int col = 30;
PVector[] savePosXY = new PVector[col];
PVector[] savePosAngle = new PVector[col];

int stackSize = 0;


float x=40;
float y =0;
float lastX=0;
float lastY=0; 
float ang = 0; 

void setup() {
  size(800, 600);
  initial();
  createSentence(generation);

  iii=axiom.length();
}

void draw() {

  background(255);
  //frameRate(2*axiom.length());
  frameRate(30);
  stroke(1);
  strokeWeight(1);
  initialDraw();

  if (lSystem == 1 || lSystem == 2 || lSystem == 3 || lSystem == 3 ) {
    if (iii<axiom.length() && axiom.length() < 2000) {
      for (int i = 0; i<iii+1; i++) {
        drawDraw(i);
      }
      iii++;
    } else {
      //iii=0;
      for (int i = 0; i<axiom.length(); i++) {
        drawDraw(i);
      }
    }
  } else {

    if (iii<axiom.length()) {
      for (int i = 0; i<iii+1; i++) {
        drawDraw(i);
      }
      if (axiom.length()>5000) {
        iii+=300;
      } else if (axiom.length()>300) {
        iii+=10;
      } else { 
        iii++;
      }
      initial();
      createSentence(generation);
    } else {
      for (int i = 0; i<axiom.length(); i++) {
        drawDraw(i);
      }

      //iii=0;
      initial();
      createSentence(generation);
      println("END");
    }
  }
  //println(axiom);
  println("Generation = "+ generation);
}


void initial() {
  switch (lSystem) {
  case 1:  
    axiom = "F";  //Koch curve
    ang = radians(90);//Koch curve 90%
    break;

  case 2:  
    axiom = "F-G-G"; //Sierpinski triangle 
    ang = radians(120);  //Sierpinski triangle 120%
    break;

  case 3:  
    axiom = "A"; //Sierpiński arrowhead curve
    ang = radians(60);  //Sierpiński arrowhead curve
    break;

  case 4:  
    axiom = "-X"; //Fractal plant
    ang = radians(25);  
    x = (width*.20)/( generation+1);
    x = 0;
    y = -10;

    lastX=200;
    lastY=height-10;
    stackSize = 0;

    for (int i = 0; i < col; i++) {
      savePosXY[i] = new PVector(0.0, 0.0);
      savePosAngle[i] = new PVector(0.0, 0.0);
    }
    break;

  case 5:  
    axiom = "F"; //Fractal plant
    ang = radians(30);  //16
    //ang = PI/6;
    x = (width*.15)/( generation+1);
    x = 0;

    y = (height - 20)/(pow(4, generation));
    if (y<1) {
      y=1;
    }
    y *=-1;

    lastX=width*.5;
    lastY=height-10;
    stackSize = 0;

    for (int i = 0; i < col; i++) {
      savePosXY[i] = new PVector(0.0, 0.0);
      savePosAngle[i] = new PVector(0.0, 0.0);
    }
    break;

  case 6:  
    axiom = "0"; //Fractal plant
    ang = radians(45);  
    x = (width*.20)/( generation+1);
    x = 0;
    y = -10;
    if (x<1) {
      x=1;
    }
    lastX=200;
    lastY=height-10;
    stackSize = 0;

    for (int i = 0; i < col; i++) {
      savePosXY[i] = new PVector(0.0, 0.0);
      savePosAngle[i] = new PVector(0.0, 0.0);
    }
    break;

  default:
    break;
  }
}


void initialDraw() // reset to start
{
  switch (lSystem) {
  case 1:  
    lastX=10;
    lastY=height-10;
    x = (width - 20)/(pow(3, generation));
    y =0;
    if (x<1) {
      x=1;
    }
    break;
  case 2:  
    lastX=10;
    lastY=10;
    x = (width - 20)/(pow(2, generation));
    y =0;
    if (x<1) {
      x=1;
    }
    break;

  case 3:  //Sierpiński arrowhead curve
    if (generation%2==0) {
      lastX=10;
      lastY=height-10;
    } else {
      lastX=10;
      lastY=10;
    }
    x = (width - 20)/(pow(2, generation));
    if (x<1) {
      x=1;
    }
    y = 0;
    break;

  case 4:  
    x = 0;
    y = -5;
    break;

  case 5:  
    x = 0;
    y = (height - 20)/(pow(3, generation));
    if (y<1) {
      y=1;
    }
    //y=15;
    y *=-1;
    lastX=width*.5;
    lastY=height-10;
    stackSize = 0;
    break;

  default:
    break;
  }
}

void mouseClicked() {
  generation++;
  initial();
  createSentence(generation);
  initialDraw();
  iii=0;
}

void createSentence(int generation) {
  String sentence = new String ();
  for (int n =0; n<generation; n++) {
    for (int i = 0; i<axiom.length(); i++) {
      char letter = axiom.charAt(i);
      switch (letter) {
      case 'A':  
        sentence += "B-A-B";
        break;
      case 'B':  
        sentence += "A+B+A";
        break;
      case 'F': 
        switch (lSystem) {
        case 1:  
          sentence += "F+F-F-F+F"; //Koch curve 
          break;
        case 2:  
          sentence += "F-G+F+G-F";//Sierpinski triangle
          break;
        case 4:  
          sentence += "FF";//Fractal plant
          break;
        case 5:  
          sentence += "FF-[-F+F+F]+[+F-F-F]";
          break;
        default:
          break;
        }
        break;
      case 'G':  
        sentence += "GG";//Sierpinski triangle 120%
        break;
      case '0':  
        sentence += "1[0]0";//Sierpinski triangle 120%
        break;
      case '1':  
        sentence += "11";//Sierpinski triangle 120%
        break;
      case 'X':  
        //sentence += "X+YF+";
        switch (lSystem) {
        case 4:  
          sentence += "F+[[X]-X]-F[-FX]+X";//Fractal plant
          break;
        default:
          break;
        }
        break;
      case 'Y':  
        sentence += "-FX-Y";
        break;
      default:
        sentence += letter;
        break;
      }
    }
    axiom = sentence;
    // println(axiom);
    sentence = "";
  }
}


void drawDraw(int i) {
  char letter = axiom.charAt(i);
  float tempX = x;
  float tempY = y;
  float nextX = 0.0;
  float nextY = 0.0;
  // println(letter);

  switch (letter) {
  case 'F':  
    nextX = x+lastX;
    nextY = y+lastY;
    line(lastX, lastY, nextX, nextY);
    lastX=nextX;
    lastY=nextY;
    break;
  case 'G':  
    nextX = x+lastX;
    nextY = y+lastY;
    line(lastX, lastY, nextX, nextY);
    lastX=nextX;
    lastY=nextY;
    break;
  case 'A':  
    nextX = x+lastX;
    nextY = y+lastY;
    line(lastX, lastY, nextX, nextY);
    lastX=nextX;
    lastY=nextY;
    break;
  case 'B':  
    nextX = x+lastX;
    nextY = y+lastY;
    line(lastX, lastY, nextX, nextY);
    lastX=nextX;
    lastY=nextY;
    break;
  case '-': 
    tempX = x;
    tempY = y;
    x = ( tempX * cos(ang) - tempY * sin(ang));
    y = ( tempY * cos(ang) + tempX * sin(ang));
    break;
  case '+': 
    tempX = x;
    tempY = y;
    x = ( tempX * cos(-ang) - tempY * sin(-ang));
    y = ( tempY * cos(-ang) + tempX * sin(-ang));
    break;

  case '[': 
    savePosXY[stackSize].add(lastX, lastY);
    savePosAngle[stackSize].add(x, y);
    stackSize++;
    if (stackSize>=col) {
      stackSize = col-1;
    }
    break;
  case ']': 
    lastX=savePosXY[stackSize-1].x;
    lastY=savePosXY[stackSize-1].y;
    x=savePosAngle[stackSize-1].x;
    y=savePosAngle[stackSize-1].y;

    savePosXY[stackSize-1].set(0.0, 0.0);
    savePosAngle[stackSize-1].set(0.0, 0.0);
    stackSize--;
    if (stackSize<0) {
      stackSize = 0;
    }
    break;

  default:
    break;
  }
}
