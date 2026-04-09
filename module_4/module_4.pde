Walker[] myWalkers = new Walker[100];

void setup() 
{
  size(1080, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  for (int i = 0; i < myWalkers.length; i++) 
  {
    myWalkers[i] = new Walker();
    myWalkers[i].position = new PVector(random(Window.left, Window.right), random(Window.bottom, Window.top));
    myWalkers[i].scale = random(10, 20);
  }
}

void draw()
{
  background(80);
  
  PVector mouse = new PVector(mouseX - Window.w, -(mouseY - Window.h));
  
  for (Walker w : myWalkers) 
  {
    w.update(mouse);
    w.render();
    w.checkEdges();
  }
}
