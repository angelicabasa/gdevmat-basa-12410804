void setup() // the function that gets called at the very first frame
{
  size(1020, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
}

Walker myWalker = new Walker();

void draw() 
{
  background(255);
  
  myWalker.moveAndBounce();
  myWalker.render();
}
