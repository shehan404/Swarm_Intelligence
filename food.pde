class Food {

  int xpos;
  int ypos;
  int size=20;

  Food() {

    xpos = 1000;
    ypos = 900;
  }


  void display(){

        xpos = mouseX;
        ypos = mouseY;


    fill(300, 0, 0);
    noStroke();
    rect(xpos, ypos, size, size);
  }
}
