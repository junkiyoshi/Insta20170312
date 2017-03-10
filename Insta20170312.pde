ArrayList<Tower> towers;
float noise_x;
float noise_z;

void setup()
{
  size(512, 512, P3D);
  frameRate(30);
  colorMode(HSB);
  
  towers = new ArrayList<Tower>();
  for(int x = 0; x < width; x += 25)
  {
    for(int z = 0; z < height; z += 25)
    {
      towers.add(new Tower(x, 0, z, 20, 20));
    }
  }

  noise_x = random(10);
  noise_z = random(10);
}

void draw()
{
  background(255);
  
  float angle = 0;
  float x = 458 * cos(radians(angle));
  float z = 458 * sin(radians(angle));   
  camera(x, -height, z, 
         width / 2, 0, height / 2, 
         0, 1, 0);
  
  float target_x = map(noise(noise_x), 0, 1, width * -0.3, width * 1.3);
  float target_z = map(noise(noise_z), 0, 1, height * -0.3, height * 1.3);
  noise_x += 0.05;
  noise_z += 0.05;
  
  for(Tower t : towers)
  {
    t.addHeight(target_x, target_z);
    t.update();
    t.display();
  }
  
  /*
  println(frameCount);
  saveFrame("screen-#####.png");
  if(frameCount > 900)
  {
     exit();
  }
  */
}