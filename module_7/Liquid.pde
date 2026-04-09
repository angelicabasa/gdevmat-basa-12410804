public class Liquid
{
  public float x, y, horizon, depth, cd;
  
  public Liquid(float x, float y, float horizon, float depth, float cd)
  {
    this.x = x;
    this.y = y;
    this.horizon = horizon;
    this.depth = depth;
    this.cd = cd;
  }
  
  public void render()
  {
    noStroke();
    fill(28, 120, 186, 150);
    beginShape();
    vertex(x - horizon, y, 0);
    vertex(x + horizon, y, 0);
    vertex(x + horizon, y + depth, 0);
    vertex(x - horizon, y + depth, 0);
    endShape();
  }
  
  public boolean isCollidingWith(Walker walker)
  {
    return walker.position.y <= this.y;
  }
  
  public PVector calculateDragForce(Walker walker)
  {
    float speed = walker.velocity.mag();
    float dragMagnitude = this.cd * speed * speed;
    
    PVector dragForce = walker.velocity.copy();
    dragForce.mult(-1);
    dragForce.normalize();
    dragForce.mult(dragMagnitude);
    
    return dragForce;
  }
}
