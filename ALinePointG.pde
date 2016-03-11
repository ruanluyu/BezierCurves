class ALinePoint{
ArrayList<APoint> pointG = new ArrayList<APoint>();
boolean controlable = false;

ALinePoint(int n,int size,boolean shT){
controlable = shT;
for(int i = 0;i<n;i++){
pointG.add(new APoint(floor(400+i*600/n),floor(height/2),size,i,shT));
}
}



ArrayList<APoint> getList(){
return pointG;
}
PVector getPosition(int id){
return pointG.get(id).position;
}
int getSize(){
return pointG.size();
}



APoint setId(APoint pt,int id){
APoint pt2 = pt;
pt2.id=id;
return pt2;
};
void setPosition(int id,int x,int y){
APoint pur = pointG.get(id);
pur.setPosition(x,y);
pointG.set(id,pur);
}
void setNum(int n){
if(n!=pointG.size()){
int pn = n;
if(pn>pointG.size()){
  for(int i = pointG.size();pointG.size()<pn;i++){
pointG.add(i,new APoint(0,0,pointG.get(0).size,i,controlable));
  }
}else if(pn<pointG.size()){
for(int i = pointG.size()-1;pointG.size()>pn;i--){
pointG.remove(i);
}
}
for(int i = 0;i<pointG.size();i++){
setPosition(i,floor(400+i*600/pointG.size()),floor(height/2));
}
}
}



void mouseOn(){
for(APoint pt:pointG){
  if(pt.inside()){
pt.mouseOn();
break;
}
}
}
void mouseOff(){
for(APoint pt:pointG){
pt.mouseOff();
}
}


void show(int r,int g,int b){
  
stroke(r,g,b);

if(controlable){strokeWeight(5);}else{strokeWeight(3);}
for(int i = 0;i<pointG.size()-1;i++){
  line(pointG.get(i).position.x,pointG.get(i).position.y,pointG.get(i+1).position.x,pointG.get(i+1).position.y);
}
  if(controlable){fill(255);strokeWeight(5);stroke(r,g,b);}else{noStroke();fill(r,g,b);}
for(APoint pt:pointG){
  pt.show();
}
}



}