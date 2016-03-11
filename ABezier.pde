class ABezier{
ArrayList<ALinePoint> bzG = new ArrayList<ALinePoint>();
int numOfP = 200;
PVector[] pt = new PVector[numOfP];
float process = 0;

ABezier(){
for(int i = 0;i<3;i++){
bzG.add(new ALinePoint(i+1,10,false));
}
for(int i = 0;i<numOfP;i++){
pt[i]=new PVector(0,0);
}
}




void setNum(int n){
if(n!=bzG.size()){
int pn = n;
if(pn>bzG.size()){
  for(int i = bzG.size();bzG.size()<pn;i++){
bzG.add(i,new ALinePoint(i+1,10,false));
  }
}else if(pn<bzG.size()){
for(int i = bzG.size()-1;bzG.size()>pn;i--){
bzG.remove(i);
}
}
}
}

ALinePoint sendValue(ALinePoint input,ALinePoint output,float t){
if(input.getSize()-1 == output.getSize()){
for(int i = 0;i<output.getSize();i++){
PVector a,b,c;
a = input.getPosition(i);
b = input.getPosition(i+1);
c = new PVector(a.x*(1-t)+b.x*t,a.y*(1-t)+b.y*t);
output.setPosition(i,floor(c.x),floor(c.y));
}
}
return output;
}



void calculate(ALinePoint input,float t){
  process = t;
if(bzG.size()>=2){
bzG.set(bzG.size()-1,sendValue(input,bzG.get(bzG.size()-1),t));
for(int i = bzG.size()-2;i>=0;i--){
bzG.set(i,sendValue(bzG.get(i+1),bzG.get(i),t));
}
}else{
bzG.set(0,sendValue(input,bzG.get(0),t));
}
}



int stepMult(int in){
  int out = 1;
for(int i = in;i>1;i--){
out *=i ;
}
return out;
}
int cnr(int n,int r){
return stepMult(n) / ( stepMult(n-r)*stepMult(r)  );
}




void pointArray(ALinePoint input){
  int pn = input.getSize();
  for(int i = 0;i<numOfP;i++){
    float t = (float)i / (float)numOfP;
    float x = 0;
    float y = 0;
    for(int j = 0;j<pn;j++){
      x += input.getPosition(j).x *pow((1-t),pn-1-j)*pow(t,j)*cnr(pn-1,j);
      y += input.getPosition(j).y *pow((1-t),pn-1-j)*pow(t,j)*cnr(pn-1,j);
    }
    pt[i].set(x,y);
  }
}





void show(int n){
  for(int i = 0;i<numOfP*process;i++){
  fill(150+(i+1)*100/numOfP,150+i*100/numOfP,250+(bzG.size()-i)*100/numOfP);
  noStroke();
ellipse(pt[i].x,pt[i].y,5,5);
}
  if(n!=0&&bzG.size()>1){
for(int i = bzG.size()-1;i>=0&&bzG.size()-i<=n;i--){
  ALinePoint solo = bzG.get(i);
  solo.show(150+(i+1)*100/bzG.size(),150+i*100/bzG.size(),250+(bzG.size()-i)*100/bzG.size());
}
ALinePoint solo = bzG.get(0);
solo.show(200,200,200);
}else{
ALinePoint solo = bzG.get(0);
solo.show(200,200,200);
}

}




}