class kid{
  PImage kid,kidthrow,mom,momthrow;
  int width;
  int length;
  int speed;
  float x;
  float y;
  int Xsize=40;
  int Ysize=50;
  int stonerate;
  int throwcount;
  boolean dothrow;
  boolean gone;
  
void load(){
  kid=loadImage("data/pic/KID1.png");
  kidthrow=loadImage("data/pic/KID2.png");
  mom=loadImage("data/pic/People1.png");
  momthrow=loadImage("data/pic/People2.png");
}

void display(){
  imageMode(CENTER);
  fill(0);
  if(dothrow==true && speed>0){
  image(kidthrow,x,y);
  }else if(speed>0){
  image(kid,x,y);
  }
  if(dothrow==true && speed<0){
  image(momthrow,x,y);
  }else if(speed<0){
  image(mom,x,y);
  }
  move();
  if(frameCount%stonerate==0){
  throwcount=frameCount;
  dothrow=true;
  throwStone();
  }
  if(frameCount-throwcount>=20){
  dothrow=false;
  }
}

void move(){
  x+=speed;
  if(x>=1320){
    x=-320;
  }else if(x<-1000){
    x=1000;
  }
}

void throwStone(){
      stonenum+=1; 
      stonelist[stonenum]=new stone(x+5,y+10);
      stonelist[stonenum].load();
      stonelist[stonenum].thing=(int)random(4);
    if(stonenum>stonelist.length-10){
      stonenum=0;
      }
}


kid(int x,int y,int speed,int stonerate){
  this.x=x;
  this.y=y;
  width=20;
  length=30;
  this.stonerate=stonerate;
  this.speed=speed;
  }
}
