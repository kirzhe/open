// the Activation Function
int sign(float n){
  if(n>=0){
  //if (random(5)>2){  
    return 1;
  } else {
    return -1;
  }
}

class Perceptron{  
  
  float[] weights = new float[2];
  // learning rate
  
  float lr = 0.005;
  // Constructor
  Perceptron(){
   // initialise weights randomly
    for (int i=0; i<weights.length;i++){
     weights[i]=random(-1,1); 
    }  
    
  }
  
  int guess(float[] inputs){
    
    float sum=0;
    for (int i=0; i<weights.length;i++){
     sum+=inputs[i]* weights[i];
    }
    
    int output = sign(sum);
    return output;
  }
  
  void train(float[] inputs, int target){
    
    int guess = guess(inputs); 
    int error = target - guess;
    
    // Tune all the weights
    for (int i=0; i<weights.length;i++){
    weights[i]+=error+inputs[i]*lr;
    }
  }
  
}
