class Solution {
  
  // Fields
  String name;
  float volume; 
  float initialVolume;
  float concentration;
  float moles;
  
  
  // Constructor
  Solution(String n, String[] d){
    this.name = n;
    
    for (int i=0; i<d.length; i++) {
      if (d[i].equals(n)) {
        this.volume = float(d[i+1]);
        this.initialVolume = float(d[i+1]);
        this.concentration = float(d[i+2]);
        this.moles = float(d[i+3]);
      }
    }
  }
  
  
  // Methods
  
  float calculateVolume(){
    
    // Find volume of burette solution needed to titrate the flask solution
    float m1 = flask.solution.concentration;
    float m2 = burette.solution.concentration;
    float v1 = flask.solution.initialVolume/1000;
    float v2 = (m1*v1)/m2;
        
    return v2;
  }
  
}
