float x=0;  //<>// //<>// //<>// //<>//
float y=0;
float ang = radians(90);
float sizeKart = 3;

PVector x1 = new PVector(20, 20);

float nextX = 0;
float nextY = 0;


String str = new String("F+");


void setup() {
  size(600, 600);
}

void moveF() {
  nextY ++;
}

void movePlus() {
  float tempX;
  float tempY;
  tempX = nextX;
  tempY = nextY;
  nextX =  tempX*cos(ang) - tempY*sin(ang);
  nextY =  tempX*sin(ang) + tempY*cos(ang);
}

void moveMinus() {
  float tempX;
  float tempY;
  tempX = nextX;
  tempY = nextY;
  nextX =  tempX*cos(-ang) - tempY*sin(-ang);
  nextY =  tempX*sin(-ang) + tempY*cos(-ang);
}

void drawPoint() {
  float px = map(x, -sizeKart, sizeKart, 0, width);
  float py = map(y, -sizeKart, sizeKart, width, 0);
  stroke(255, 0, 0);
  strokeWeight(8);
  point(px, py);
  stroke(255);
  strokeWeight(4);
}

void drawLine() {
  float px = map(x, -sizeKart, sizeKart, 0, width);
  float py = map(y, -sizeKart, sizeKart, width, 0);
  float npx = map(nextX, -sizeKart, sizeKart, 0, width);
  float npy = map(nextY, -sizeKart, sizeKart, width, 0);
  line(px, py, npx, npy);
}

void drawAll() {
  for (int i = 0; i < str.length(); i++) {
    char s = str.charAt(i);
    if (s == 'F') {
      moveF();
    } else if (s == '+') {
      movePlus();
    } else if (s == '-') {
      moveMinus();
    }
  }

  drawPoint();
  drawLine();
  x=nextX;
  y=nextY;
}


void draw() {
  background(0);
  stroke(255);
  strokeWeight(4);
  frameRate(1);
  //String tempS = new String();
  //for (int j=0; j<3; j++) {
  //  for (int i=0; i<str.length(); i++) {
  //    char s = str.charAt(i);
  //    if (s == 'F') {
  //      tempS = tempS+"F++F-F-";
  //    } else if (s == '+') {
  //      tempS = tempS+"F-F";
  //    }
  //  }
  //  str = tempS;
  //  tempS = "";
  //}

  drawAll();
}
