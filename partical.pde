class Partical {

  int radius;
  int xpos;
  int ypos;

  int xstep;
  int ystep;
  int R, G, B;
  int mov;


  Partical() {
    
    mov =8;

    radius =10;
    xpos=int(random(0,width));
    ypos=int(random(0,height));
    
    xstep = 0;
    ystep = 0;


    R = int(random(0,255));
    G = int(random(0,255));
    B = int(random(0,255));
  }


  void display() {
    fill(R, G, B);
    noStroke();
    circle(xpos+random(-mov,mov), ypos+random(-mov,mov), radius);
    
    move();
  }


  void move() {
    
    //if (xpos>=width || xpos<=0) {
    //  xstep = -xstep;
    //}

    //if (ypos>=height || ypos<=0) {
    //  ystep = -ystep;
    //}


    xpos+=xstep;
    ypos+=ystep;
    
     int l=1;
  }
  
  

  
  
  
}
