//import processing.opengl.*;

//variables from RECursive
int are=300; //starting radius
int arestart=are;
float s=are;
int en =6; //number of branches
int rs=18; //random seed
int step=1;
int stepper=4;

int colorA=0; 
int colorB=0; 
int colorC=0;

//variables from COL
  float radius=150.00000000; //set start colony radius
  float radiustart=radius;
 
  void setup()
{
 size(1200,800);
 stroke(colorA,colorB,colorC,255);
 smooth();
  background (255,255);
  frameRate(30);
randomSeed(rs);
// noLoop();
}

void draw()
{

   if (keyPressed){
  if (key==' '){//condition for COL to run
   float ex=random(mouseX-(mouseX/10),mouseX+(mouseX/10)); //determine x location of current colony
float why=random(mouseY-(mouseY/10),mouseY+(mouseY/20));  //determine y location of current colony
float num=20.00000000;
  float theta=2*PI/num;
float r=2*radius*sin(theta/2);//small radius gets fraction of large radius
if ((radius>5)&&(radius<radiustart)){
colony(radius,ex,why,num,theta,r);
radius+=step;
}
else{
step*=-1;
radius+=step;
}
}  
if (key=='s'){
saveFrame("doigeneration-####.jpg");
}
if (key=='a'){
fill(255,255);
rect(0,0,width,height);
}
}
  
  if (mousePressed){ //condition for REC to start
   if((are>0)&&(are<=arestart)){  //if radius is greater than 0, perform drawcircle
float x=random(mouseX-(mouseX/6),mouseX+(mouseX/6));  //randomize position of each outer circle
float y=random(mouseY-(mouseY/6),mouseY+(mouseY/6));
  drawCircle(x,y,are,en); //call drawCircle
 are-=stepper; //subtract radius
 }
 else{
   stepper*=-1;
  are-=stepper;
 }
}
}

//start drawCircle method
void drawCircle(float xx,float yy, float radiuss, int numb)
{
 float value=255;  //shade and opacity of circles,t
 

  if (radiuss<20){
  strokeWeight(0.5);
   fill(value,199);
  }
  else{
   fill(value,12);
    strokeWeight(10/s);}
 
 ellipse(xx,yy,radiuss*2,radiuss*2); //draw circle at x,y,
 if(numb>1) //passed from global var n
 //go through one recursion,
  {
    numb=numb-1;
    int branches=int(random(2,6)); //determine number of branches
    for (int i=0; i< branches;i++) //for each branch, make a newx and y value based on num and random var a
    {
      pushMatrix();
      ellipseMode(CENTER);
      float a =(random(0,PI/20))+(i*(2*PI/branches));
      float newx=xx+cos(-a)*20.0*numb; //determine amount of variation in newx
      float newy=yy+sin(-a)*20.0*numb;
      float newradius=radiuss/(2);
    
  
      drawCircle(newx, newy, newradius, numb); //recall drawCircle, replacing newx and newy, and newradius
      popMatrix();
  }}
  value--;
}


//start colony method
void colony(float radius,float ex,float why,float num,float theta,float r){
 for (num=num; num>10; num--)
  {
    float strk=(radius/(radius+20));//strokeweight decreases with raidus
    for (float i=0.00000000;i<2*PI;i+=theta)
     { //increment the angle by theta
 
       float x=ex+cos(i)*radius; //x and y position determined by i,
       float y=why+sin(i)*radius;
       strokeWeight(random(0.4*strk,strk));
       fill(255,177);
       ellipse(x+random(-.1*r,.1*r),y+random(-.1*r,.1*r),r,r);
      }
    radius=radius-(r-(r/5)); //update ring radius
 r=2*radius*sin(theta/2);  //update little circle's radius
  }
}


