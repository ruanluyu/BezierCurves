




class ASlider{

  PVector position = new PVector(0,0);
  PVector size = new PVector(20,20);
  float lengthOfSlider = 100.0;
  float BValue = 50.0;
  float orgVal = 50.0;
  boolean visiable = true ;
  float centerX = 0;
  float easing = 0.3;
  float positionX = 50.0;
  
  
  
  ASlider(float x,float y,float len,float st){
    
    position.set(x,y);
    lengthOfSlider = len;
    orgVal = st;
    BValue = st;
    centerX = (BValue/100.0-0.5)*lengthOfSlider+position.x;
    positionX = centerX;
  
  }
  
  
  
boolean overRect(float x, float x2,float y,float y2) {
  if (mouseX >= x && mouseX <= x2 && 
      mouseY >= y && mouseY <= y2) {
    return true;
  } else {
    return false;
  }
}
float lock(float val, float minv, float maxv) { 
  return  min(max(val, minv), maxv); 
} 


  
  void reSet(){
  BValue = orgVal;
  }
  void setVisiable(boolean v){
  visiable = v;
  }
  float getVal(){
  return BValue;
  }
  
  
  
  void show(){
    centerX = (BValue/100.0-0.5)*lengthOfSlider+position.x;
    positionX += (centerX-positionX)*easing;
    if(visiable){
    noStroke();
    fill(255);
    rectMode(CENTER);
    rect(position.x,position.y,lengthOfSlider,2);
    stroke(100);
    strokeWeight(3);
    ellipse(positionX,position.y,size.x,size.y);
    noStroke();
    textSize(15);
    text("0",position.x-lengthOfSlider/2-30,position.y-3);
    text("1",position.x+lengthOfSlider/2+30,position.y-3);
    }else{
      noStroke();
    fill(255,100);
    rectMode(CENTER);
    rect(position.x,position.y,lengthOfSlider,2);
    noStroke();
    fill(106,78,78);
    ellipse(positionX,position.y,size.x+6,size.y+6);
    stroke(255,100);
    noFill();
    strokeWeight(2);
    ellipse(positionX,position.y,size.x-2,size.y-2);
    noStroke();
    fill(255,100);
    textSize(15);
    text("0",position.x-lengthOfSlider/2-30,position.y-3);
    text("1",position.x+lengthOfSlider/2+30,position.y-3);
      
    }
  }
  
  
  
  boolean mouseP = false;
  void mouseOn(){
    if(overRect(  position.x-lengthOfSlider/2,position.x+lengthOfSlider/2,position.y-size.y, position.y+size.y   ) == false){}else{
    mouseP = true;
}
}
  void mouseOff(){
    mouseP = false;
  }
  void modify(){
    if(mouseP){
    if(visiable){
        centerX = lock(mouseX,position.x-lengthOfSlider/2,position.x+lengthOfSlider/2);
        BValue = ((centerX-position.x)/lengthOfSlider+0.5)*100.0;
        //sendValue();
    }
  }
  }
  
  
  void update(){
    
    modify();
    show();
  
  }

}