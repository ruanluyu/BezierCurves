class APoint{
  
  
PVector position = new PVector(200,200);
int id = 0;
int size = 20;
boolean showT = true;
boolean hold = false;


APoint(int x,int y,int siz,int idi,boolean shT){
id = idi;
position.set(x,y);
showT = shT;
size = siz;
}


boolean inside(){
if(dist(mouseX,mouseY,position.x,position.y)<size+5){return true;}else{return false;}
}
void setPosition(int x,int y){
position.set(x,y);
}
void mouseOn(){
if(inside()){
hold = true;
}
}
void mouseOff(){
hold = false;
}
void modify(){
if(hold){
setPosition(mouseX,mouseY);
}
}



void show(){
modify();
if(showT){
textSize(20);
text("P"+id,position.x,position.y-size-15);
}
ellipse(position.x,position.y,size,size);
}



}