int wmax;
int wmin;
int c1;
int c2;
int maxt;

boolean move;

int messy = 50;

ArrayList <Partical> p1;
Food f1;

int p_density = 100;

int x;
int y;

//int F = 10*(x-1)^2 + 20*(y-2)^2;
int Fx;
int Fy;

int[] fitnessX = new int [p_density];
int[] fitnessY = new int [p_density];

int[] xbest = new int [p_density];
int[] ybest = new int [p_density];

int gbestx=1000;
int gbesty=1000;

int r1 = int(random(0, 10));
int r2 = int(random(0, 10));
int w =2;


void setup() {
  size(1500, 800);

  wmax = 9;
  wmin = 4;
  c1 = 2;
  c2 = 2;
  maxt = 50;


  p1 = new ArrayList <Partical> ();
  f1= new Food();

  for (int i=0; i<p_density; i++) {
    p1.add(new Partical());
  }
}

//////////////////////////////////////////////////

void draw() {
  frameRate(30);
  background(0);

  
  for (int i=0; i<p_density; i++) {
    xbest[i] = p1.get(i).xpos;
    ybest[i] = p1.get(i).ypos;
  }


  for (int i=0; i<p_density; i++) {


    //p1.get(i).xstep = int(0.01*p1.get(i).xpos);
    //p1.get(i).ystep = int(0.01*p1.get(i).ypos);


    if (fitnessX[i]<xbest[i]) {
      xbest[i] = fitnessX[i];
    }

    if (fitnessY[i]<ybest[i]) {
      ybest[i] = fitnessY[i];
    }

    //print("xbest:");
    //print(xbest[i]);
    //print("  fitness:");
    //println(fitness[i]);

    p1.get(i).xstep = int((w*p1.get(i).xstep+ c1*r1*(xbest[i] - p1.get(i).xpos) + c2*r2*(gbestx-p1.get(i).xpos))/600);
    p1.get(i).ystep = int((w*p1.get(i).ystep+ c1*r1*(ybest[i] - p1.get(i).ypos) + c2*r2*(gbesty-p1.get(i).ypos))/600);
    
    p1.get(i).display();

    //println(p1.get(i).ystep);


    Fx= f1.xpos;
    Fy= f1.ypos;


    //F = ((10*(x-1)^2 + 20*(y-2)^2)/1000);
    //F= (x-10)^2-(y-30)^2;

    fitnessX[i] = Fx;
    fitnessY[i] = Fy;
  }

  f1.display();
  
  if (move){
    
   for (int i=0; i<p_density; i++) {
    p1.get(i).xpos+=int(random(-messy,messy));
    p1.get(i).ypos+=int(random(-messy,messy));
    
 
  }
  
     move=false;
  
  //print(move);
  
  gbestx=1000;
  gbesty=1000;
    
  
  }

  if (min(fitnessX)<gbestx) {
    gbestx = min(fitnessX);
  }

  if (min(fitnessY)<gbesty) {
    gbesty = min(fitnessY);
  }
  

  
}

void mouseMoved(){

  move = true;
  


}
