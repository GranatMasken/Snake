Snake s;
float scl = 20;
PVector food;
void pickLocation() {
  float cols = floor(width/scl);
  float rows = floor(height/scl);
  food = new PVector(floor(random(cols)), floor(random(rows)));
  food.mult(scl);
  
}

void setup() {
  frameRate(10);
  size(600, 600);
  s = new Snake();
  pickLocation();
  
}

void draw() {
  background(51);
  s.death();
  s.update();
  s.show();
  if (s.eat(food)){
    pickLocation();
  }
  fill(0,0,100);
  rect(food.x, food.y, scl, scl);
}

void keyPressed() {
  if (keyCode == UP) {
    s.dir(0, -1);
  } else if (keyCode == DOWN){
    s.dir(0, 1);
  } else if (keyCode == RIGHT){
    s.dir(1, 0);
  } else if (keyCode == LEFT){
    s.dir(-1, 0);
  }
}
