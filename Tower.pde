class Tower
{
  PVector location;
  float h; // height
  float size; // width depth
  float speed;
  float angle;
  float direction;
  color body_color;
  
  Tower(float x, float y, float z, float _h, float s)
  {
    location = new PVector(x, y, z);
    h = _h;
    size = s;
    body_color = color(random(255), 255, 255);
   }
    
  void addHeight(float x, float z)
  {
    float dist = PVector.dist(new PVector(location.x, location.y, location.z), new PVector(x, 0, z));
    
    if(dist < 40)
    {
      if(h < height)
      {
        h += dist;
      }
    }
  }
  
  void update()
  {
    if(h > 10)
    {
      h -= 3;
    }
  }
  
  void display()
  {
    pushMatrix();
    translate(location.x, location.y - h / 2, location.z);
    fill(body_color, 128);
    stroke(body_color);
    box(size, h, size);
    popMatrix();
  }
}