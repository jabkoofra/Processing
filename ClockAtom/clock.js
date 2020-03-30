
function setup() {
  createCanvas(400,400);
  angleMode(DEGREES);

}

function draw() {
  background(0);
  translate(200,200);
  rotate(-90);

let sizeCircle = 300;
let sizeStrokeWeight = sizeCircle*0.03;

let hr = hour();
let mn = minute();
let sec = second();
let msec = millis();

push();
fill(255);
stroke(255);
ellipse(0,0,sizeCircle+3,sizeCircle+3);
pop();

  strokeWeight(sizeStrokeWeight);
  stroke(255,0,0);
  noFill();
  let secAngle = map(sec,0,60,0,360);
  arc(0,0,sizeCircle*1,sizeCircle*1,0,secAngle);
  push();
  rotate(secAngle);
  line(0,0,sizeCircle*0.35,0);
  pop();

    stroke(50,255,50);
  let minAngle = map(mn,0,60,0,360);
  arc(0,0,sizeCircle*0.9,sizeCircle*0.9,0,minAngle);
  push();
  rotate(minAngle);
  line(0,0,sizeCircle*0.3,0);
  pop();

    stroke(0,100,255);
  let hrAngle = map(hr%12,0,12,0,360);
  arc(0,0,sizeCircle*0.8,sizeCircle*0.8,0,hrAngle);
  push();
  rotate(hrAngle);
  line(0,0,sizeCircle*0.25,0);
  pop();

strokeWeight(1);
let msecAngle = map(msec,0,1000,0,360);
fill(100,255,100);
arc(0,0,sizeCircle*0.1,sizeCircle*0.1,0,msecAngle);


strokeWeight(sizeStrokeWeight);
stroke(255);
point(0,0);


for (let i = 0 ; i<12 ; i++){
  let x = map(i,0,12,0,360);
  push();
    stroke(0,255,255);
    strokeWeight(1);
    rotate(x);
    line(sizeCircle*0.4-4,0,sizeCircle*0.5,0);
  pop();
}

for (let i = 0 ; i<60 ; i++){
  let x = map(i,0,60,0,360);
  push();
    stroke(0);
    strokeWeight(1);
    rotate(x);
    line(sizeCircle*0.3,0,sizeCircle*0.4,0);
  pop();
}
  // fill(255);
  // noStroke();
  // text(hr + ':' + mn+':'+sec, 10,200);

// strokeWeight(8);
// stroke(255);
// noFill();
//   ellipse(200,200,300,300);



}
