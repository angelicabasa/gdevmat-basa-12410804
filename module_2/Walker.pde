class Walker
{
  float x;
  float y;
  
  void render()
  {
    circle(x, y, 30);
  }
  
  void randomWalkBiased()
  {
    float rngBiased = random(1);
    
    if (rngBiased < 0.40)
    {
      x += 10;
    }
    else if (rngBiased < 0.60)
    {
      x -= 10;
    }
    else if (rngBiased < 0.80)
    {
      y -= 10;
    }
    else
    {
      y += 10;
    }
  }
  
  void randomWalk()
  {
    int rng = int(random(8));
    
    if (rng == 0)
    {
      y += 10;
    }
    else if (rng == 1)
    {
      y -= 10;
    }
    else if (rng == 2)
    {
      x += 10;
    }
    else if (rng == 3)
    {
      x -= 10;
    }
    else if (rng == 4) // UPPER RIGHT CORNER
    {
       x += 10;
       y += 10;
    }
    else if (rng == 5) // LOWER RIGHT CORNER
    {
      x += 10;
      y -= 10;
    }
    else if (rng == 6) // UPPER LEFT COFNER
    {
      x -= 10;
      y += 10;
    }
    else if (rng == 7) // LOWER LEFT CORNER
    {
      x -= 10;
      y -= 10;
    }
    
  }
  
}
