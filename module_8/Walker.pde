public class Walker
{
  public PVector position = new PVector();
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();
  
  public float velocityLimit = 10;
  public float scale = 15;
  public float mass = 1;
  public float r = 255, g = 255, b = 255, a = 200;
  
  public float gravitationalConstant = 1;
  
  public void applyForce(PVector force)
  {
    PVector f = PVector.div(force, this.mass);
    this.acceleration.add(f); 
  }
  
  public void update()
  {
    this.velocity.add(this.acceleration);
    this.velocity.limit(velocityLimit);
    this.position.add(this.velocity);
    this.acceleration.mult(0);
  }
  
  public void render()
  {
    fill(r, g, b, a);
    noStroke();
    circle(position.x, position.y, scale);
  }
  
  public PVector calculateAttraction(Walker walker)
  {
    // Direction of the force
    PVector force = PVector.sub(this.position, walker.position); 
    float distance = force.mag();
    
    // Constrain distance to avoid extreme forces (Glitches)
    distance = constrain(distance, 5, 25); 
    
    force.normalize(); 
    
    // Gravity Formula: G * (m1 * m2) / r^2
    float strength = (this.gravitationalConstant * this.mass * walker.mass) / (distance * distance);
    force.mult(strength);
    return force;
  }
}
