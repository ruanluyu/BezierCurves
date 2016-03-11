/*
Processing project
BezierCurves
by ZzStarSound

Firstly ,we need some UI classes.
(I've written them under the draw method.They are ANumber(A number box);ASlider(A simple slider)).
*/
int maxStep = 7;
//Then,you can change the max step of bezier curve by modifying this variable.


ANumber num,showNum;
ASlider pro;
ALinePoint alp;
ABezier abg;
void setup(){
size(1280,720);
frameRate(60);
num = new ANumber(100,100,"NOP",2,maxStep,4);
showNum = new ANumber(200,100,"NON",0,num.getVal()-2,4);
pro = new ASlider(150,200,100,0);
alp = new ALinePoint(4,15,true);
abg = new ABezier();
}

void draw(){
  
textAlign(CENTER,CENTER);
background(100);
alp.setNum(num.getVal());
alp.show(0,0,0);
abg.setNum(num.getVal()-1);
abg.calculate(alp,pro.getVal()/100.0);
abg.pointArray(alp);
abg.show(showNum.getVal());

num.show();
showNum.show();
pro.update();
}


void mousePressed(){
num.modify();
showNum.modify();
showNum.limitV(0,num.getVal()-2);
pro.mouseOn();
alp.mouseOn();
}
void mouseReleased(){
pro.mouseOff();
alp.mouseOff();
}