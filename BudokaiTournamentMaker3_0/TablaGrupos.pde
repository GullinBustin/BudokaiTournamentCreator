class TablaGrupos {

  public ArrayList<Personaje> Jugadores; 
  private String nombreTabla;
  private int posx, posy, sizex, sizey;
  private boolean[] ya;


  TablaGrupos(ArrayList<Personaje> jug, String name, int px, int py, int sx, int sy) {
    Jugadores = jug;
    nombreTabla = name;
    posx=px;
    posy=py;
    sizex=sx;
    sizey=sy;
    ya=new boolean[Jugadores.size()];
    for (int i=0; i<ya.length; i++) {
      ya[i]=false;
    }
  }

  public void drawTabla() {
    textSize(int(22*w/1200)); 
    textAlign(CENTER, CENTER);
    
    for (int i=0; i<ya.length; i++) {
      ya[i]=false;
    }
    //titulo
    fill(0);
    rect(posx, posy, sizex, sizey);
    fill(255);
    text(nombreTabla, posx, posy, sizex, sizey);
    //leyenda
    fill(100);
    rect(posx, posy+sizey, sizex*4/10, sizey);
    fill(0);
    text("Jugador", posx, posy+sizey, sizex*4/10, sizey);

    fill(150);
    rect(posx+sizex*4/10, posy+sizey, sizex*4/10, sizey);
    fill(0);
    text("Personaje", posx+sizex*4/10, posy+sizey, sizex*4/10, sizey);

    fill(100);
    rect(posx+2*sizex*4/10, posy+sizey, sizex/10, sizey);
    fill(0);
    text("P", posx+2*sizex*4/10, posy+sizey, sizex/10, sizey);

    fill(150);
    rect(posx+sizex*9/10, posy+sizey, sizex/10, sizey);
    fill(0);
    text("V", posx+sizex*9/10, posy+sizey, sizex/10, sizey);

    //jugadores

    for (int i=0; i<Jugadores.size (); i++) {

      int punt=0;
      int jug = -1;

      for (int j=0; j<Jugadores.size (); j++) {
        if (!ya[j]) {
          int tempunt=Jugadores.get(j).getVidas()+Jugadores.get(j).getVictorias()*100;
          if (tempunt >= punt) {
            punt = tempunt;
            jug = j;
          }
        }
      }
      ya[jug]=true;
      
      fill(100+(155*(i%2)),100,100-(155*((i%2)-1)));
      rect(posx, posy+sizey*(2+i), sizex*4/10, sizey);
      fill(0);
      text(Jugadores.get(jug).getJugador(), posx, posy+sizey*(2+i), sizex*4/10, sizey);

      fill(255*(i%2),0,-255*((i%2)-1));
      rect(posx+sizex*4/10, posy+sizey*(2+i), sizex*4/10, sizey);
      fill(0);
      text(Jugadores.get(jug).getNombrePersonaje(), posx+sizex*4/10, posy+sizey*(2+i), sizex*4/10, sizey);

      fill(100+(155*(i%2)),100,100-(155*((i%2)-1)));
      rect(posx+2*sizex*4/10, posy+sizey*(2+i), sizex/10, sizey);
      fill(0);
      text(""+Jugadores.get(jug).getVictorias(), posx+2*sizex*4/10, posy+sizey*(2+i), sizex/10, sizey);

      fill(255*(i%2),0,-255*((i%2)-1));
      rect(posx+sizex*9/10, posy+sizey*(2+i), sizex/10, sizey);
      fill(0);
      text(""+Jugadores.get(jug).getVidas(), posx+sizex*9/10, posy+sizey*(2+i), sizex/10, sizey);
    }
  }
  
  
}
