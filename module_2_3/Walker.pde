public class Walker
{
    public float x, y;
    public float thickness;
    public float r, g, b;
    
    public float tx = 0, ty = 10000;
    public float tSize = 20000;
    public float tr = 30000, tg = 40000, tb = 50000;
    
    void render()
    {
        noStroke();
        fill(r, g, b, 255);
        circle(x, y, thickness);
    }
    
    void perlinWalk()
    {
      x = map(noise(tx), 0, 1, -510, 510);
      y = map(noise(ty), 0, 1, -360, 360);
      
      thickness = map(noise(tSize), 0, 1, 5, 150);
      
      r = map(noise(tr), 0, 1, 0, 255);
      g = map(noise(tg), 0, 1, 0, 255);
      b = map(noise(tb), 0, 1, 0, 255);
      
      tx += 0.01f;
      ty += 0.01f;
      tSize += 0.01f;
      tr += 0.01f;
      tg += 0.01f;
      tb += 0.01f;
    }
}
