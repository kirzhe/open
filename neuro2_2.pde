
float cSize=60;

float stepsW=0;
float stepsH=0;

float cX[], cY[];
boolean target[];

Perceptron brain;

void setup(){
  
  size(600,600);
  
  stepsW=width/cSize;
  stepsH=height/cSize;
  
  cX=new float[int(stepsW)];
  cY=new float[int(stepsH)];
  int i3=0;
  target = new boolean[int(stepsW)*int(stepsH)];
  
  for (int i2=0; i2<stepsH;i2++){
   cY[i2]=i2*cSize;
  
  for (int i=0; i<stepsW;i++){
    
    cX[i]=i*cSize;
   
    
    if (random(3)>1)
    target[i3]=false;
    else
    target[i3]=true;
    i3++;
  }
   }
  
  brain=new Perceptron();
  
  noLoop();
  frameRate(1);
  background(0);
}


void draw(){
  /*
     if (mousePressed)loop();
      else noLoop();
  */
  int i3=0;
  for (int i2=0; i2<cY.length;i2++){  
    
  for (int i=0; i<cX.length;i++){
    
    int tmpVal=0;
    
    if (!target[i3]){
    tmpVal=0;  
    fill(255,0,0);}
    else {
    tmpVal=1;  
    fill(255,255,0);
    }
    i3++;
    
    rect(cX[i],cY[i2],cSize,cSize,5);
    
    //if (frameCount %20==0){
    
    float [] inputs = {cX[i], cY[i2]};
    
    int target=tmpVal;   
    
    int guess=brain.guess(inputs);
   
    if (guess==target){
      fill(0,255,0);
    } else {
      fill(255,0,0);
    }
      noStroke();
      ellipse(cX[i]+cSize/2,cY[i2]+cSize/2,cSize/2,cSize/2);
      
    }
          }
    
  }
    
  
  void keyPressed(){
    for (int i=0; i<target.length;i++){
     if (random(3)>1)
    target[i]=false;
    else
    target[i]=true;
    //i++;
    }
     loop();
  }
  
  void keyReleased(){
    
    //noLoop();
    
  }
  //
  
  void mousePressed(){
    //noLoop();
    //if (mousePressed)frameRate(1);
    int i3=0;
  for (int i2=0; i2<cY.length;i2++){  
    
    for (int i=0; i<cX.length;i++){
    
    int tmpVal=0;
    
    if (!target[i]){
    tmpVal=0;  
    fill(255,0,0);}
    else {
    tmpVal=1;  
    fill(255,255,0);
    }
     int target=tmpVal;   
     float [] inputs = {cX[i], cY[i2]};
     brain.train(inputs,target);  
     
    }
 
  }
   }
  
