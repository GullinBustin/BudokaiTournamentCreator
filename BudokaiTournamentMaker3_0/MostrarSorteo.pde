class MostrarSorteo {

  private ArrayList<Grupo> Grupos;
  private ImagenGrupos[] Panel;
  private int numeroGrupos;
  private PImage fondo;
  public ArrayList<String> cambios;
  private ControlP5 cp5;
  public Button btnNext;

  MostrarSorteo (ArrayList<Grupo> grup, ControlP5 cp5) {
    this.cp5 = cp5;
    btnNext = cp5.addButton("Continuar").setPosition(w*7/9,h*8/9).setSize(w/8,h/13).setVisible(false);
    cambios = new ArrayList<String>();
    fondo = loadImage("Boles_de_drac.jpg");
    Grupos = grup;
    numeroGrupos = Grupos.size();
    Panel = new ImagenGrupos[numeroGrupos];
    for (int i =0; i<numeroGrupos; i++) {
      Panel[i] = new ImagenGrupos(i+1, Grupos.get(i).personajes, w/120+w/40*(i%4)+int(w*9/40.*(i%4)), h/20+h*8/20*(i/4), int(w*9/40.), h/13, cambios);
    }
  }

  public void drawMostrarGrupos() {
    image(fondo, 0, 0, w, h);
    int changeGrup = -1;
    String changeName = "-1";
    for (int i=0; i<numeroGrupos; i++) {
      Panel[i].dibujaGrupo();
      if (mousePressed) {
        String temp = Panel[i].CharacterPulse();
        if (!temp.equals("-1")) {
          changeGrup = i;
          changeName = temp;
        }
      }
    }

    if (changeGrup != -1) {
      CambiarPersonaje(changeGrup, changeName);
    }
  }

  private void CambiarPersonaje(int n, String jugador) {
    boolean ok=true;
    for (int i=0; i<cambios.size (); i++) {
      if (cambios.get(i).equals(jugador)) ok=false;
    }
    if (ok) {
      cambios.add(jugador);
      for (int i=0; i<Grupos.get (n).personajes.size(); i++) {
        if (Grupos.get(n).personajes.get(i).jugador.equals(jugador)) {
          Grupos.get(n).personajes.get(i).setNombrePersonaje(torneo.getReserva().get(cambios.size()-1));
        }
      }
    }
  }

  public void Destapar() {
    boolean end=true;
    for (int i=0; i<numeroGrupos; i++) {
      if (Panel[i].MostrarMas()) {
        end=false;
        break;
      }
    }
    btnNext.setVisible(end);
  }
  
  public void endMostrarSorteo(){
    torneo.setGrupos(Grupos);
    torneo.setPantalla(Torneo.PANTALLA_GRUPOS);
    btnNext.remove();
  }
  
}

public void Continuar(){
  PanelesSorteo.endMostrarSorteo();
}
