class MostrarSorteo {

  public ArrayList<Grupo> Grupos;
  private ImagenGrupos[] Panel;
  private int numeroGrupos;
  private PImage fondo;
  public ArrayList<String> cambios;

  MostrarSorteo (ArrayList<Grupo> grup) {
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
      CanviarPersonaje(changeGrup, changeName);
    }
  }

  private void CanviarPersonaje(int n, String jugador) {
    boolean ok=true;
    for (int i=0; i<cambios.size (); i++) {
      if (cambios.get(i).equals(jugador)) ok=false;
    }
    if (ok) {
      cambios.add(jugador);
      for (int i=0; i<Grupos.get (n).personajes.size(); i++) {
        if (Grupos.get(n).personajes.get(i).jugador.equals(jugador)) {
          Grupos.get(n).personajes.get(i).setNombrePersonaje(torneo.getReserva().get(cambios.size()-1).nombrePersonaje);
        }
      }
    }
  }

  public void Destapar() {
    for (int i=0; i<numeroGrupos; i++) {
      if (Panel[i].MostrarMas()) {
        break;
      }
    }
  }
}
