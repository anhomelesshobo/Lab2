class Bounding_Circle
{
  float x;
  float y;
  int r;
  int couleurR;
  int couleurB;
  int couleurG;
  Bounding_Circle(float _x,float _y,int _r)
  {
    this.x = _x;
    this.y = _y;
    this.r = _r;
    this.couleurR = (int)random(50,255);
    this.couleurG = (int)random(50,255);
    this.couleurB = (int)random(50,255);
  }
  
  boolean isCollidingFlock(Mover other) {
    boolean result = false;
    
    if(dist(other.location.x, other.location.y, this.x, this.y) < this.r)
    {
       
      result = true;     
    }
    
    
    return result;
  }
  
   void displaycircle()
  {
    noStroke();
    fill(couleurR,couleurG,couleurB);
    ellipse(x,y,r*2,r*2);
    
  }
  
}
