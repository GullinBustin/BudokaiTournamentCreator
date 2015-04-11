import controlP5.*;

ControlP5 cp5; 
MenuInicial Menu;
Torneo torneo;
ArrayList<String> nombrePersonajes = new ArrayList<String>();

int w, h;

void setup() {
  size(800, 600);
  w=width;
  h=height; 
  cp5 = new ControlP5(this);
  Menu = new MenuInicial(cp5);
  readPersonajes();
}

void draw() {

  if (torneo ==null) {
    Menu.drawTitle();
  } else {
    background(255);
  }
}


void readPersonajes() {
  String line;
  BufferedReader reader = createReader("personajes.txt");

  try {
    while ( (line = reader.readLine ()) != null) {
      nombrePersonajes.add(line);
    }
  } 
  catch (IOException e) {
    e.printStackTrace();
  }
}