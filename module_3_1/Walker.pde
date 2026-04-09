class Walker
{
  PVector position = new PVector(0, 0);
  PVector speed = new PVector(5, 8);
  
  void render()
  {
    float r = random(255);
    float g = random(255);
    float b = random(255);
    float a = random(50, 100); 
    
    fill(r, g, b, a);
    noStroke();
    
    circle(position.x, position.y, 30);
  }
  
  void moveAndBounce()
  {
    position.add(speed);
    
    if ((position.x > Window.right) || (position.x < Window.left))
    {
      speed.x *= -1;
    }
    
    if ((position.y > Window.top) || (position.y < Window.bottom))
    {
      speed.y *= -1;
    }
  }
}
