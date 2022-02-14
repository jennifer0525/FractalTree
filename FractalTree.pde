private double fractionLength = .8; 
private int smallestBranch = 10; 
private double branchAngle = .2;  
private int r = 0;
private int g = 255;
private int b = 0;

public void mousePressed()
{
  r = (int)(Math.random()*256);
  g = (int)(Math.random()*256);
  b = (int)(Math.random()*256);

}
public void setup() 
{   
  size(640,480);    
  noLoop(); 
} 
public void draw() 
{   
  background(0);
  strokeWeight(4);
  stroke(80,40,0);  // color
  line(320,480,320,380);
  strokeWeight(1);
  stroke(r,g,b);
  drawBranches(320,380,100,3*Math.PI/2);
} 
public void drawBranches(int x,int y, double branchLength, double angle) 
{   
  // creates V shape of branches
   double angle1 = angle + branchAngle;
   double angle2 = angle - branchAngle;
   // makes each new branch shorter
   branchLength = branchLength * fractionLength;
   int endX1 = (int)(branchLength * Math.cos(angle1) + x);
   int endY1 = (int)(branchLength * Math.sin(angle1) + y);
   int endX2 = (int)(branchLength * Math.cos(angle2) + x);
   int endY2 = (int)(branchLength * Math.sin(angle2) + y);
   line(x,y,endX1,endY1);
   line(x,y,endX2,endY2);
   // start of recursive part
 
   if (branchLength > smallestBranch){
     drawBranches (endX1,endY1,branchLength,angle1);
     drawBranches (endX2,endY2,branchLength, angle2);
   }
  
} 


