class PantallaCombate{
 
  private String Jugador1, Jugador2;
  private String Personaje1, Personaje2;
  private PImage ImP1, ImP2;
  private RadioButton rdWiner;
  
  PantallaCombate(String j1, String j2,String p1,String p2,ControlP5 cp5){
    Jugador1 = j1;
    Jugador2 = j1;
    Personaje1 = p1;
    Personaje2 = p2;
    println("Imagenes Personajes/"+Personaje1+".jpg");
    ImP1 = loadImage("Imagenes Personajes/"+Personaje1+".jpg");
    ImP2 = loadImage("Imagenes Personajes/"+Personaje2+".jpg");
  }
  
  void drawCombate(){
    image(ImP1,0,0,w/2,h*2/3);
    image(ImP2,w/2,0,w/2,h*2/3);
    textAlign(CENTER, CENTER);
    text(Jugador1+'\n'+Personaje1,w/4,h*2/3);
    text(Jugador2+'\n'+Personaje2,w*3/4,h*2/3);
  }
  
  
  
  
}
