PImage p;

void setup(){
  size(800,400);
  background (0,100,200);
  p = loadImage("Ricardo.jpg");
}

void draw(){
  image(p, 0, 0, 300, 400);
  fill (0,250,105);
  rect (400,240,150,200);
  fill (110,0,105);
  rect (500,240,150,200);
  fill (255,0,0);
  rect (460,50,150,150);
  fill (0,105,0);
  rect (400,90,90,90);
  fill (0,105,0);
  rect (565,90,90,90);
  fill (120,105,0);
  ellipse (510,190,90,90);
  fill (255,255,0);
  rect (480,150,90,120);
  fill (120,105,0);
  ellipse (510,190,90,90);
  fill (100,255,0);
  rect (330,30,190,50);
  fill (100,255,0);
  rect (540,30,190,50);
  fill (100,0,360);
  rect (520,200,120,50);
}
