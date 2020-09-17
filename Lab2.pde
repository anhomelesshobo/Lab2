int currentTime;
int previousTime;
int deltaTime;

Bounding_Box Box1;
Bounding_Box Box2;
Bounding_Circle Circle1;
Bounding_Circle Circle2;
int compteur = 0;

ArrayList<Mover> flock;
int flockSize = 1;


void setup () {
  //fullScreen(P2D);
  size (800, 600);
  currentTime = millis();
  previousTime = millis();
  
  flock = new ArrayList<Mover>();
  
  Circle1 = new Bounding_Circle(random(50,700),random(50,400),30);
  Circle2 = new Bounding_Circle(random(50,700),random(50,400),30);
  
  //Box1 = new Bounding_Box(100,250,50,50);
  //Box2 = new Bounding_Box(600,250,50,50);
  
  for (int i = 0; i < flockSize; i++) {
    Mover m = new Mover(new PVector(random(0, width), random(0, height)), new PVector(random (-2, 2), random(-2, 2)));
    m.fillColor = color(random(255), random(255), random(255));
    flock.add(m);
  }
  


  flock.get(0).debug = true;
}

void draw () {
  currentTime = millis();
  deltaTime = currentTime - previousTime;
  previousTime = currentTime;

  
  update(deltaTime);
  display();  
}

/***
  The calculations should go here
*/



void update(int delta) {
  
  for (Mover m : flock) {
    
    //if (Box1.isCollidingFlock(m)) {
      
    // m.location.x = Box2.Left() - 15;
   //  m.location.y = Box2.Top() - 15;

  //}
  
  if(Circle1.isCollidingFlock(m))
  {    
      m.location.x = Circle2.x;
      m.location.y = Circle2.y;
  }
  

    m.flock(flock);
    m.update(delta);
  }
}

/***
  The rendering should go here
*/
void display () {
  background(0);
   
   
   Circle1.displaycircle();
   Circle2.displaycircle();
   
   
  //Box1.display(255,200,255,222);
  //Box2.display(0,0,0,0);
  
  for (Mover m : flock) {
    m.display();
  }
  
  
}

void mousePressed()
{
  if(mouseButton == LEFT)
  {
    Mover m = new Mover(new PVector(random(0, width), random(0, height)), new PVector(random (-2, 2), random(-2, 2)));
    m.fillColor = color(random(255), random(255), random(255));
    flock.add(m);
  }
}

void keyPressed() {
  switch (key) {
    case 'd':
      flock.get(0).debug = !flock.get(0).debug;
      break;
      
    case ' ':
      Circle1 = new Bounding_Circle(-100,-100,30);
      Circle2 = new Bounding_Circle(-100,-100,30);
      break;
      
    case 'r':
      Circle1 = new Bounding_Circle(random(50,700),random(50,400),30);
      Circle2 = new Bounding_Circle(random(50,700),random(50,400),30);
      flockSize = 1;
      flock = new ArrayList<Mover>();
      Mover m = new Mover(new PVector(random(0, width), random(0, height)), new PVector(random (-2, 2), random(-2, 2)));
      m.fillColor = color(random(255), random(255), random(255));
      flock.add(m);
      break;
  }
}

void keyReleased()
{
  switch (key) {
    case ' ':
      Circle1 = new Bounding_Circle(random(50,700),random(50,400),30);
      Circle2 = new Bounding_Circle(random(50,700),random(50,400),30);
      break;
  }
  
}
