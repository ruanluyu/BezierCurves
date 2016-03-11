

class ANumber {
PVector position = new PVector(0,0);
int num = 1;
int orgNum = 1;
int max,min;
String name = "A";
boolean lockCut = false;
boolean lockPlus = false;
PShape tri = createShape();
PShape tri2 = createShape();

ANumber(int x, int y,String n,int minV ,int maxV,int nm){
  min = minV;
  max = maxV;
  //type = ty;
  orgNum = nm;
  num = nm;
position.set(x,y);
name = n;
tri.beginShape();
tri.vertex(0,0);
tri.vertex(-10,10);
tri.vertex(10,10);
tri.fill(255);
tri.noStroke();
tri.endShape();
tri2.beginShape();
tri2.vertex(0,0);
tri2.vertex(-10,-10);
tri2.vertex(10,-10);
tri2.fill(255);
tri2.noStroke();
tri2.endShape();
tri.translate(position.x,position.y-30);
tri2.translate(position.x,position.y+30);
}




void reSet(){
num = orgNum;
}

void mmCheck(){
if(num>max){num = max;}else if(num<min){num = min;}
if(num==max){lockPlus = true;}else{lockPlus = false;}
if(num==min){lockCut = true;}else{lockCut = false;}
}
void limitV(int minV,int maxV){
min = minV;
max = maxV;
}

int getVal(){
return num;
}



void show(){
  
  mmCheck();
  if(lockCut == false){shape(tri2);}
  if(lockPlus == false){shape(tri);}
  textSize(25);
  fill(255);
  text(num,position.x,position.y-5);
  text(name,position.x,position.y-60);
}


boolean overRect(float x, float x2,float y,float y2) {
  if (mouseX >= x && mouseX <= x2 && 
      mouseY >= y && mouseY <= y2) {
    return true;
  } else {
    return false;
  }
}

void modify(){
  int step = 1;
  if(mouseButton == LEFT){
  step = 1;
 }else if(mouseButton == RIGHT){
  step = 5;
  }else{
  step = 20;
  }
if(overRect(   position.x-10,position.x+10,position.y-35,position.y-15       )&&lockPlus == false){
  num+=step;
if(num >max){
num = max;
}
}else if(overRect(   position.x-10,position.x+10,position.y+15,position.y+35       )&&lockCut == false){
num-=step;
if(num <min){
num = min;
}
}
}
}