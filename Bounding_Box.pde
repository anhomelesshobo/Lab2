class Bounding_Box
{
  int x;
  int y;
  int w;
  int h;
  
  Bounding_Box(int _x, int _y, int _h, int _w)
  {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    
  }
  
  public int Top()
  {
    return y;
  }
  
   public int Right()
  {
    return x + w;
  }
  
   public int Bottom()
  {
    return y + h;
  }
  
   public int Left()
  {
    return x;
  }
  
  void display(int a,int b,int c,int d)
  {
    noStroke();
    rect(x,y,w,h);
    fill(a,b,c,d);
    
  }
  
  boolean isCollidingFlock(Mover other) {
    boolean result = false;
    
    if(other.location.x > this.Left() && other.location.x < this.Right())
    {
      if(other.location.y > this.Top() && other.location.y < this.Bottom())
      {
         result = true;
      }
     
    }
    
    
    return result;
  }
  
}
