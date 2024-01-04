class Flask {
  
  // Fields
  Solution solution;
  
  
  // Constructor 
  Flask(Solution s){
    this.solution = s;
  }
  
  
  // Methods
  
  void drawFlask() {
    
    // Flask
    fill(220);
    stroke(0);
    triangle(265,315, 235,400, 295,400);
    rect(255,310,20,30);
    
    // Stirrer
    fill(40);
    rect(229,401, 72,25);
    fill(190);
    circle(280,412, 10);
    
    // Solution
    this.drawSolution(); 
  }

  void drawSolution(){
    
    // Height of the solution rectangle as a function of the volume
    float h = 0.5 * this.solution.volume;
    
    // Coordinates of the trapezoid
    float x1 = 295 - ((6*h)/17);
    float x2 = 235 + ((6*h)/17);
    float y = 400 - h;
    
    // For the colour of the solution
    float v = flask.solution.calculateVolume()*1000;    
    float usedv = burette.solution.initialVolume - burette.solution.volume; 
    float ratio = usedv/v;
    
    // Acid to base
    if (flask.solution.name.equals("Unknown HCl")) { 
      
      // Phenolphthalein
      if (indicator.equals("Phenolphthalein")) { // clear to pink
        // Clear:(235,240,255), Neutral:(255,217,237), Overshot:(255,24,139) 
        
        fill(lerpColor(color(235,240,255), color(255,217,237), ratio));
        if (ratio>1) fill(lerpColor(color(255,217,237), color(255,24,139), ratio-1));
      }
      
      // Bromothymol Blue
      else { // yellow to green to blue
        // Yellow:(255,254,150), Neutral:(197,221,163), Overshot:(50,165,192) 
      
        fill(lerpColor(color(255,254,150), color(197,221,163), ratio));
        if (ratio>1) fill(lerpColor(color(197,221,163), color(50,165,192), ratio-1));
      }
    }
    
    // Base to Acid
    else if (flask.solution.name.equals("Unknown NaOH")) { 
      
      // Phenolphthalein
      if (indicator.equals("Phenolphthalein")) { // pink to clear 
        // Pink:(255,24,139), Neutral:(255,217,237), Overshot:(235,240,255) 
        
        fill(lerpColor(color(255,24,139), color(255,217,237), ratio));
        if (ratio>1) fill(lerpColor(color(255,217,237), color(235,240,255), ratio-1));
      
      }
      
      // Bromothymol Blue
      else { // blue to green to yellow
        // Blue:(50,165,192), Neutral:(197,221,163), Overshot:(255,254,150) 
      
        fill(lerpColor(color(50,165,192), color(197,221,163), ratio));
        if (ratio>1) fill(lerpColor(color(197,221,163), color(255,254,150), ratio-1));
      }
    }
    
    // Drawing the trapezoid
    beginShape();
    vertex(235,400);
    vertex(x2,y);
    vertex(x1,y);
    vertex(295,400);
    endShape();
    
    // Spinning of solution image
    image(img, x1-32, y, h, h);
  }
}
