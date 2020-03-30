//variables : A B //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>//
//constants : none
//axiom : A
//rules : (A → AB), (B → A)


int generation = 2;
int iii = 0;

int lSystem =2;
// 1 //Koch curve
// 2 //Sierpinski triangle
// 3 //Sierpiński arrowhead curve
// 4 //Fractal plant

String axiom = new String(); 

int col = 15;
int rows = 3;
PVector[][] savePos = new PVector[col][rows];
int stackSize = 0;


float x=40;
float y =0;
//float nextX=0; 
//float nextY=0;
float lastX=0;
float lastY=0; 
float ang = 0; 

void setup() {
  size(800, 600);
  initial();
  //for (int n =0; n<generation+1; n++) {
  createSentence(generation);
  //drawRect();
  // }


  for (int j = 0; j < rows; j++) {
    for (int i = 0; i < col; i++) {
      savePos[i][j] = new PVector(0.0, 0.0);
    }
  }
}

void draw() {

  background(255);
  frameRate(2*axiom.length());
  stroke(1);
  strokeWeight(1);
  initialDraw();

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

  //if (iii<axiom.length() && axiom.length() < 2000) {
  //  drawDraw(iii);
  //  iii++;
  //} else {
  //  iii=0;
  //}

  println(axiom);
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
    axiom = "XF"; //Fractal plant
    ang = radians(25);  
       x = (width*.20)/( generation+1);
    x = 30;
    y = 0;
    if (x<1) {
      x=1;
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
    //nextX=0; 
    //nextY=0;
    lastX=10;
    lastY=height-10;
    x = (width - 20)/(pow(3, generation));
    y =0;
    if (x<1) {
      x=1;
    }
    break;
  case 2:  
    //nextX=0; 
    //nextY=0;
    lastX=10;
    lastY=10;
    x = (width - 20)/(pow(2, generation));
    y =0;
    if (x<1) {
      x=1;
    }
    break;

  case 3:  //Sierpiński arrowhead curve
    //nextX=0; 
    //nextY=0;
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
    //nextX=0; 
    //nextY=0;
    //lastX=width*.1;
    //lastY=height-10;
        lastX=50;
    lastY=500;
    
 
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
        default:
          break;
        }
        break;
      case 'G':  
        sentence += "GG";//Sierpinski triangle 120%
        break;
      case '+':  
        sentence += "+";
        break;
      case '-':  
        sentence += "-";
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
        break;
      }
    }
    axiom = sentence;
    // println(axiom);
    sentence = "";
  }
}


//void drawLine() {
//  for (int i = 0; i<axiom.length(); i++) {
//    char letter = axiom.charAt(i);
//    float tempX = x;
//    float tempY = y;
//    float nextX = 0.0;
//    Float nextY = 0.0;

//    switch (letter) {
//    case 'F':  
//      nextX = x+lastX;
//      nextY = y+lastY;
//      line(lastX, lastY, nextX, nextY);
//      lastX=nextX;
//      lastY=nextY;
//      break;
//    case 'G':  
//      nextX = x+lastX;
//      nextY = y+lastY;
//      line(lastX, lastY, nextX, nextY);
//      lastX=nextX;
//      lastY=nextY;
//      break;

//    case 'A':  
//      nextX = x+lastX;
//      nextY = y+lastY;
//      line(lastX, lastY, nextX, nextY);
//      lastX=nextX;
//      lastY=nextY;
//      break;
//    case 'B':  
//      nextX = x+lastX;
//      nextY = y+lastY;
//      line(lastX, lastY, nextX, nextY);
//      lastX=nextX;
//      lastY=nextY;
//      break;

//    case '-': 
//      tempX = x;
//      tempY = y;

//      //x' = x cos f - y sin f
//      //y' = y cos f + x sin f

//      x = ( tempX * cos(ang) - tempY * sin(ang));
//      y = ( tempY * cos(ang) + tempX * sin(ang));
//      break;
//    case '+': 
//      tempX = x;
//      tempY = y;
//      x = ( tempX * cos(-ang) - tempY * sin(-ang));
//      y = ( tempY * cos(-ang) + tempX * sin(-ang));
//      break;
//    default:
//      break;
//    }
//  }
//}


void drawDraw(int i) { //<>//
  char letter = axiom.charAt(i);
  float tempX = x;
  float tempY = y;
      float nextX = 0.0; //<>//
    Float nextY = 0.0;
    
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
    //

    //savePos[stackSize][0].add(x, y);
    savePos[stackSize][1].add(nextX, nextY);
    savePos[stackSize][2].add(lastX, lastY);
    stackSize++;
    if (stackSize>=col) {
      stackSize = col-1;
    }
    break;
  case ']': 
    //
    //x=savePos[stackSize][0].x;
    //y = savePos[stackSize][0].y;
    nextX=savePos[stackSize-1][1].x ;
    nextY=savePos[stackSize-1][1].y;
    lastX=savePos[stackSize-1][2].x;
    lastY=savePos[stackSize-1][2].y;

    savePos[stackSize-1][0].set(0.0, 0.0);
    savePos[stackSize-1][1].set(0.0, 0.0);
    savePos[stackSize-1][2].set(0.0, 0.0);

    stackSize--;
    if (stackSize<0) {
      stackSize = 0;
    }
    break;

  default:
    break;
  }
}
