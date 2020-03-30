

function setup() {
  createCanvas(400, 400);
}

function draw() {
  background(0);

noFill();
  fill(20);
  text(hour() + ':' + minute()+':'+second(), 10, 200);

  strokeWeight(4);
  stroke(255);
  noFill();
}
