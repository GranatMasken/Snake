class Snake {
  float x = 0;
  float y = 0;
  float xspeed = 1;
  float yspeed = 0;
  int total = 3;
  boolean dead = false;
  ArrayList<PVector> tail = new ArrayList<PVector>();
  
  
  boolean eat(PVector pos){
    float d = dist(this.x, this.y, pos.x, pos.y);
    if(d < 3){
      total += 2;
      score++;
      return true;
    } else {return false;}
    
  }
  
  void dir(float x, float y){
    this.xspeed = x;
    this.yspeed = y;
  }
  
  void update(){
    wrapAround();
    if (total > 0) {
      if (total == tail.size() && !tail.isEmpty()) {
        tail.remove(0);
      }
      tail.add(new PVector(x, y));
    }
    this.x = this.x + this.xspeed*scl;
    this.y = this.y + this.yspeed*scl;
  }
  
  void show(){
    fill(255);
    for (PVector v : tail) {
    rect(v.x, v.y, scl, scl);
    
    }
    fill(0, 200, 255);
    stroke(0, 200, 255);
    rect(this.x, this.y, scl, scl);
  }
    void death(){
      for (int i = 0; i < tail.size(); i++){
        PVector pos = tail.get(i);
        float d = dist(this.x, this.y, pos.x, pos.y);
        if (d < 1) {
          this.total = 3;
          this.tail = new ArrayList<PVector>();
          dead = true;
          score = 0;
        }
      }
    }
    
    void wrapAround(){
      if(x < 0){
        x = width - scl;
      } else if (x > width - scl) {
        x = 0;
      } else if (y < 0) {
        y = height - scl;
      } else if (y > height - scl) {
        y = 0;
      }
    }
    void touchingFood() {
      for (int i = 0; i < tail.size(); i++){
        PVector pos = tail.get(i);
        float d = dist(pos.x, pos.y, food.x, food.y);
        if (d < scl) {
          pickLocation();
        } 
      } 
    }
}
