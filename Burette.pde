class Burette {
  
  // Fields
  Solution solution;
  
  
  // Constructor 
  Burette(Solution s){
    this.solution = s;
  }
  
  
  // Methods
  
  void drawBurette() {
    
    // Body
    noFill();
    stroke(0);
    rect(250,70, 30,180);
    
    // Bottom
    fill(235, 240, 255);
    triangle(250,249, 280,249, 265,280);
    
    fill(220);
    rect(260,270, 10,20);
    
    // Stopcock
    rect(255,265, 20,5);
    rect(275,260, 5,15);  
      
    // Solution
    this.drawSolution();
    
    // Draw the tick marks    
    for (int i=0; i<17; i++) {
      int y = 80+(10*i);
      line(250,y, 255,y);
    } 
  }


  void drawSolution(){
    
    // Height of the solution rectangle as a function of the volume
    float h = 3.4 * this.solution.volume;
    float yval = 80+(170-h);
    
    fill(235, 240, 255);
    rect(251,yval, 29,h-1); 
  }
  
}
