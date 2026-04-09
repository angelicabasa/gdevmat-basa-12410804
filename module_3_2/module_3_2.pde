void setup() // the function that gets called at the very first frame
{
  size(1080 , 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
}

PVector mousePos()
{
  float x = mouseX - Window.windowWidth / 2;
  float y = -(mouseY - Window.windowHeight / 2);
  
  return new PVector(x, y);
}

void draw()
{
  background(0);
  
  PVector mouse = mousePos();
  mouse.normalize().mult(300); 
  
  PVector opposite = PVector.mult(mouse, -1);

  // red outer glow
  strokeWeight(25);
  stroke(255, 0, 0, 150); // Red with some transparency for glow effect
  drawDoubleBlade(mouse, opposite);
  
  // white inner glow
  strokeWeight(8);
  stroke(255); // Pure white core
  drawDoubleBlade(mouse, opposite);
  
  // handle
  strokeWeight(15);
  stroke(0); 
  line(mouse.copy().normalize().mult(-40).x, mouse.copy().normalize().mult(-40).y, 
       mouse.copy().normalize().mult(40).x, mouse.copy().normalize().mult(40).y);

  println("Magnitude of Blade: " + mouse.mag());
}

void drawDoubleBlade(PVector sideA, PVector sideB)
{
  line(0, 0, sideA.x, sideA.y);
  line(0, 0, sideB.x, sideB.y);
}
