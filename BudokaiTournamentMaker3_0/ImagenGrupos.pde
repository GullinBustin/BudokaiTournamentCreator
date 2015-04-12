class ImagenGrupos {

  private int numero;
  public ArrayList<Personaje> Participante;
  private int mostrar=0;
  private int mostrarMax;
  private int posx, posy;
  private int sizex, sizey;
  public ArrayList<String> bann;

  ImagenGrupos(int num, ArrayList<Personaje> jug, int x, int y, int sx, int sy , ArrayList<String> b) { 
    bann = b;
    numero = num;
    Participante = jug;
    mostrarMax = jug.size();
    posx= x;
    posy = y;
    sizex = sx;
    sizey = sy;
  }

  public void dibujaGrupo() {
    textAlign(CENTER, CENTER);
    textSize(int(22*w/1200)); 
    fill(0);
    rect(posx, posy, sizex, sizey);
    fill(255);
    text("Grupo "+numero, posx, posy, sizex, sizey);
    for (int i=0; i<mostrar; i++) {
      fill(0, 0, 255);
      rect(posx, posy+(i+1)*sizey, sizex/2, sizey);
      boolean baned = false;
      for(int k=0; k<bann.size();k++){
        if(bann.get(k).equals(Participante.get(i).jugador)) baned = true;
      }
      if(baned) fill(100,100,100);
      else{
        if (mouseX>posx+sizex/2 && mouseX<posx+sizex && mouseY>posy+(i+1)*sizey && mouseY<posy+(i+2)*sizey) fill(255, 0, 0); 
        else fill(255, 100, 100);
      }
      rect(posx+sizex/2, posy+(i+1)*sizey, sizex/2, sizey);
      fill(255);
      text(Participante.get(i).jugador, posx, posy+(i+1)*sizey, sizex/2, sizey);
      text(Participante.get(i).nombrePersonaje, posx+sizex/2, posy+(i+1)*sizey, sizex/2, sizey);
    }
  }

  public String CharacterPulse() {
    String temp = "-1";
    for (int i=0; i<mostrar; i++) {
      if (mouseX>posx+sizex/2 && mouseX<posx+sizex && mouseY>posy+(i+1)*sizey && mouseY<posy+(i+2)*sizey) {
        temp =  Participante.get(i).jugador;
      }
    }
    return temp;
  }

  public boolean MostrarMas() {
    if (mostrar<mostrarMax) {
      mostrar++;
      return true;
    } else {
      return false;
    }
  }
}
