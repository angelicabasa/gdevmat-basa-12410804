public class Walker {
 
  public PVector postion = new PVector();
  public float scale = 15;
  
  public Walker(){}
  
  public void render()
  {
    circle(postion.x, postion.y, scale);
  }
} 
