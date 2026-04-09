Walker[] walkers = new Walker[10];

void setup() 
{
  size(1080, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  for (int i = 0; i < walkers.length; i++) 
  {
    walkers[i] = new Walker();
    // Random initial position within window bounds
    walkers[i].position = new PVector(random(Window.left, Window.right), random(Window.bottom, Window.top));
    
    // Random mass and scale (mass affects gravitational pull)
    walkers[i].mass = random(5, 15);
    walkers[i].scale = walkers[i].mass * 5;
    
    // Random colors
    walkers[i].r = random(255);
    walkers[i].g = random(255);
    walkers[i].b = random(255);
    walkers[i].a = random(50, 80);
  }
}

void draw()
{
  background(255);
  
  // Nested loops for mutual attraction
  for (int i = 0; i < walkers.length; i++) 
  {
    for (int j = 0; j < walkers.length; j++) 
    {
      // Don't attract yourself!
      if (i != j) 
      {
        // walkers[j] calculates how much it attracts walkers[i]
        PVector attraction = walkers[j].calculateAttraction(walkers[i]);
        walkers[i].applyForce(attraction);
      }
    }
    
    // Physics update and render
    walkers[i].update();
    // walkers[i].bounce(); // Optional: enable if you want them to stay in bounds
    walkers[i].render();
  }
}
