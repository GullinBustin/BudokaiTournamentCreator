import controlP5.*;

ControlP5 cp5; 
MenuInicial Menu; 
int w,h;

void setup(){
 size(800,600);
 w=width;
 h=height; 
 cp5 = new ControlP5(this);
 Menu = new MenuInicial(cp5);
 
}

void draw(){
  background(0);
}
