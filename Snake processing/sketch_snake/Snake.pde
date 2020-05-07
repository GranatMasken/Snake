class Snake {
  float x = 0;
  float y = 0;
  float xspeed = 1;
  float yspeed = 0;
  int total = 0;
  ArrayList<PVector> tail = new ArrayList<PVector>();
  
  
  boolean eat(PVector pos){
    float d = dist(this.x, this.y, pos.x, pos.y);
    if(d < 1){
      total++;
      return true;
    } else {return false;}
    
  }
  
  void dir(float x, float y){
    this.xspeed = x;
    this.yspeed = y;
  }
  
  void update(){
    if (total > 0) {
      if (total == tail.size() && !tail.isEmpty()) {
        tail.remove(0);
      }
      tail.add(new PVector(x, y));
    }
    
    this.x = this.x + this.xspeed*scl;
    this.y = this.y + this.yspeed*scl;
    
    this.x = constrain(this.x, 0, width-scl);
    this.y = constrain(this.y, 0, height-scl);
    

    
  }
  
  void show(){
    fill(255);
    for (PVector v : tail) {
    rect(v.x, v.y, scl, scl);
    
    }
    rect(this.x, this.y, scl, scl);
  }
    void death(){
      for (int i = 0; i < tail.size(); i++){
        PVector pos = tail.get(i);
        float d = dist(this.x, this.y, pos.x, pos.y);
        if (d < 1) {
          this.total = 0;
          this.tail = new ArrayList<PVector>();
        }
      }
    }
}
