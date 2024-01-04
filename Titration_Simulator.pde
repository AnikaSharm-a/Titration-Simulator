// Final Project: Titration Simulator 
// Programmer: Anika Sharma

// NOTE: When you run the program for the first time, it might give a null pointer exception
// Not sure why it's happening, but just run it again and it should work - it won't do it again

import g4p_controls.*;

// GUI variables
String bSol = "1.0 M NaOH";
String fSol = "Unknown HCl";
String indicator = "Phenolphthalein";
float amount = 2.0;
float userBCon = 0.0;
float userFInitVol = 0.0;
float userUsedBVol = 0.0;



// Global variables
String[] data;
String[] equations;
PImage img;
PImage error;
float totalvol;
Solution buretteSolution;
Solution flaskSolution;
Burette burette;
Flask flask;



void setup(){
  size(400,500);
  createGUI();  
  data = loadStrings("Properties.txt");
  equations = loadStrings("Equations.txt");
  img = loadImage("Spinning.png");
  error = loadImage("Error Screen.png");
  reset();
  displayEquation();
}



void draw(){
  String partOfFSol = flask.solution.name.substring(8);

  // If user chose two bases or two acids (cannot titrate)
  if (burette.solution.name.indexOf(partOfFSol) != -1) {
    image(error, 0,0); 
    hideGUI();
  }
  
  // Regular program running
  else {
    background(220); 
    unhideGUI();
    burette.drawBurette();
    flask.drawFlask();
    displayInfoOnMain();
  }
}



// Display all text on the left of main screen 
void displayInfoOnMain() {  
  
  // Formatting - 2 decimal places
  float burettevol = float(nf(burette.solution.volume, 0, 2));
  float flaskvol = float(nf(flask.solution.volume, 0, 2));
  
  // Burette Text
  fill(0);
  textSize(18);
  text("Burette", 50,70);
  
  textSize(15);
  text(burette.solution.name, 50,100);
  text("Initial: " + burette.solution.initialVolume + " mL", 50,120);
  text("Final: " + burettevol + " mL", 50,140);
  text("Used: " + (burette.solution.initialVolume-burettevol) + " mL", 50,160);
  
  // Flask Text
  textSize(18);
  text("Flask", 50,200);
  
  textSize(15);
  text(flask.solution.name, 50,230);
  text("Initial: " + flask.solution.initialVolume + " mL", 50,250);
  text("Final: " + flaskvol + " mL", 50,270);
  
  // Indicator Text
  textSize(18);
  text("Indicator", 50,330);
  
  textSize(15);
  text(indicator, 50,360);
}



// Calculates the concentration using user's inputs 
float calculateUserConcentration(){
  float c = (userBCon*userFInitVol)/userUsedBVol;
  return c;  
}



// Displays balanced chemical equation
void displayEquation() {
  String name = burette.solution.name + " and " + flask.solution.name;
  
  for (int i=0; i<equations.length; i++) {
    if (equations[i].equals(name)) equation.setText(equations[i+1]);
  }
}



// Hide GUI elements on main screen
void hideGUI() {
  window2.setVisible(false);  
  releaseSol.setVisible(false);
  button1.setVisible(false);
  amountSlider.setVisible(false);
  label1.setVisible(false);
}



// Unhide GUI elements on main screen
void unhideGUI() {
  window2.setVisible(true);  
  releaseSol.setVisible(true);
  button1.setVisible(true);
  amountSlider.setVisible(true);
  label1.setVisible(true);
}



// Reset button on main screen
void reset() {  
  buretteSolution = new Solution(bSol, data);
  flaskSolution = new Solution(fSol, data);
  burette = new Burette(buretteSolution);
  flask = new Flask(flaskSolution);
  totalvol = burette.solution.volume + flask.solution.volume; 
  displayEquation();
}
