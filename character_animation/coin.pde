class Coin {
  PVector position;
  float r = 10;
  
  
  int frameNum;
  
  Coin(){
    position = new PVector(random(width-50), random(height-50));
  }
  
  void display(){

    if (frameCount % 10 ==0){
     frameNum = (frameNum+1) % coinAnim.length; 
    }
    
    imageMode(CENTER);
    image(coinAnim[frameNum],position.x,position.y);
  }
  
  boolean collision(float x, float y, float w, float h){
    //remember that we're drawing her at
    //rect(x - w/4, y - 0.9 * h, w/2, h);
    //debug: show the hitbox diagonal:
    //line((x - w/4), (y - 0.9 * h), (x + w/4), (y - 0.9 * h) + h);
    if((x - w/4) < position.x - r && (x + w/4) > position.x + r
        && (y - 0.9 * h) < position.y - r && (y - 0.9 * h) + h > position.y + r){
          if (!pickup.isPlaying()){pickup.play();}
      return true;
    }
    else return false;
  }

}
