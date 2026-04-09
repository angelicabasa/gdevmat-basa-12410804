class Walker 
{
  PVector position;
  float r, g, b, a;
  boolean isSuckedIn = false;
  
  Walker() 
  {
    reset();
  }
  
  void reset() 
  {
    position = new PVector(random(Window.left, Window.right), random(Window.bottom, Window.top));
    r = random(255);
    g = random(255);
    b = random(255);
    a = random(50, 100);
    
    isSuckedIn = false;
  }
  
  void update(PVector target) 
  {
    if (!isSuckedIn) 
    {
      PVector dir = PVector.sub(target, position);

      dir.normalize();
      position.add(dir.mult(7));
    }
  }
  
  void render() 
  {
    if (!isSuckedIn) 
    {
      fill(r, g, b, a);
      noStroke();
      circle(position.x, position.y, 30);
    }
  }
}
