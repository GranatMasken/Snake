int score = 0;
PImage foodImage;
Snake s;
float scl = 30;
PVector food;
int i = 0;
void pickLocation() {
  float cols = floor(width/scl);
  float rows = floor(height/scl);
  food = new PVector(floor(random(cols)), floor(random(rows)));
  food.mult(scl);
  
}

void setup() {
  frameRate(10);
  size(1020, 600);
  s = new Snake();
  pickLocation();
  foodImage = loadImage("apple.png");
  
}

void draw() {
  background(51);
  s.touchingFood();
  s.death();
  s.update();
  s.show();
  gameover();
  if (s.eat(food)){
    pickLocation();
  }
  fill(0,0,100);
  image(foodImage, food.x, food.y, scl, scl);
  displayScore();
}

void keyPressed() {
  if (s.dead == false) {
    if (keyCode == UP && s.yspeed != 1) {
      s.dir(0, -1);
    } else if (keyCode == DOWN && s.yspeed != -1 ){
      s.dir(0, 1);
    } else if (keyCode == RIGHT && s.xspeed != -1){
      s.dir(1, 0);
    } else if (keyCode == LEFT && s.xspeed != 1){
      s.dir(-1, 0);
    }
  }
}
void gameover(){
  if (s.dead == true) {
    i++;
    textSize(50);
    text("Game Over", width/2, height/2 );
    if (i > 30) {
      s.dead = false;
      i = 0;
    }
  }
}
void displayScore() {
  fill(255, 255, 0);
  textSize(20);
  text("Score: " + score, 10, 20);
}
