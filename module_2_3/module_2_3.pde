void setup() // the function that gets called at the very first frame
{
  size(1020, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  background(255);
  
}

Walker perlinWalker = new Walker();

void draw() // the function that gets called every frame
{
  perlinWalker.render();
  perlinWalker.perlinWalk();
}
