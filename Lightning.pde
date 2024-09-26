//Bouncing ball code is from processing library
int rad = 60;        // Width of the shape
float xpos, ypos;    // Starting position of shape    

float xspeed = 2.8;  // Speed of the shape
float yspeed = 2.2;  // Speed of the shape

int xdirection = 1;  // Left or Right
int ydirection = 1;  // Top to Bottom

void setup() {
  size(500,500);
  background(0);
  ellipseMode(RADIUS);
  frameRate(30);
  xpos = width/2;
  ypos = height/2;
}

void draw() {
  background(0);

  // Update position of the moving ball
  xpos = xpos + (xspeed * xdirection);
  ypos = ypos + (yspeed * ydirection);
  
  // Bounce off the edges
  if (xpos > width - rad || xpos < rad) {
    xdirection *= -1;
  }
  if (ypos > height - rad || ypos < rad) {
    ydirection *= -1;
  }
  
  // Draw the ball
  int diam = 0;
  float r = 255;
  noFill();
  strokeWeight(2);
  while(diam < 75){
    stroke(r,0,r);
    ellipse(xpos,ypos,diam,diam);
    diam++;
    r-=255/100.0;

  }
}

void lightning(float startX, float startY) {
  float endX = startX;
  float endY = startY;
  
  int rng = (int)(Math.random() * 2);
  int rng2 = (int)(Math.random() * 2);
  
  for (int i = 0; i < 50; i++) { // Number of segments in the lightning    
    // Randomly change the end points for the lightning's next segment
    if (rng == 0)
      endX = startX + (int)(Math.random() * 250);
    else 
      endX = startX + (int)(Math.random() * -250);
    if (rng2 == 0)
        endY = startY + (int)(Math.random() * 250);
      else 
        endY = startY + (int)(Math.random() * -250);
 
    stroke(255);
    strokeWeight(10);
    line(startX, startY, endX, endY);
    line(startX, startY, endX, endY);
    
    startX = endX;
    startY = endY;
  }
}

void mousePressed() {
  lightning(xpos, ypos);
  lightning(xpos, ypos);
  lightning(xpos, ypos);
  lightning(xpos, ypos);
}

void keyPressed(){
  lightning(xpos, ypos);
}
