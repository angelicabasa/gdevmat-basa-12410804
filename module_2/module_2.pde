void setup() // the function that gets called at the very first frame
{
  size(1020, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  
}

Walker myWalker = new Walker(); //create an instance of our walker class here to sketch
Walker biasedWalker = new Walker();

void draw() // the function that gets called every frame
{
  
  myWalker.randomWalk();
  myWalker.render();
  
  biasedWalker.randomWalkBiased();
  biasedWalker.render();
  
}
