class PeriodoGrupos {

  private ArrayList<ArrayList<Pair>> calendario;
  private ArrayList<Grupo> Grupos;
  private int actualGrupo;
  private int actualJornada;
  private int actualPartido;
  // private int sizeGrupo;
  // private int sizeJornada;
  // private int sizePartido;
  private Button btnGrupoMas, btnGrupoMenos;
  private int mostrarGrupo;
  private TablaGrupos Tablas[];
  private ControlP5 cp5;
  private Button btnBatalla;
  private Button btnFinalGrupos;
  private PImage fondo;


  PeriodoGrupos(ArrayList<Grupo> grup, ControlP5 cp5) {
    fondo = loadImage("Boles_de_drac.jpg");
    this.cp5 = cp5;
    btnBatalla = cp5.addButton("Batalla").setPosition(w*8/10, h*8/10);
    calendario = generaCalendario(grup.get(0).getTamano());
    btnGrupoMas = cp5.addButton("GrupoMas").setPosition(w*7/8 - w/10, h/20).setSize(w/10, h/40);
    btnGrupoMenos = cp5.addButton("GrupoMenos").setPosition(w/8, h/20).setSize(w/10, h/40);
    btnFinalGrupos =  cp5.addButton("FinalGrupos").setPosition(w*8/10, h*8/10).setVisible(false);
    this.Grupos = grup;
    actualGrupo = 0;
    actualJornada = 0;
    actualPartido = 0;
    mostrarGrupo = 0;
    Tablas = new TablaGrupos[Grupos.size()];
    for (int i=0; i<Tablas.length; i++) {
      Tablas[i] = new TablaGrupos(Grupos.get(i).personajes, "Grupo "+(i+1), w/40, h/8, w/2, h/15);
    }
  }

  public void drawPeriodoGrupos() {
    image(fondo, 0, 0, w, h);
    Tablas[mostrarGrupo].drawTabla();
    if (actualJornada != -1) {
      
      rect(w*17/32, h/8, w*12/27, h/15);
      fill(255);
      textSize(int(32*w/1200));
      textAlign(CENTER, CENTER);
      text("Jornada "+(actualJornada+1)+"/"+calendario.size(), w*17/32, h/8, w*12/27, h/15);
      
      for (int i=0; i<calendario.get (actualJornada).size(); i++) {
        fill(255);
        rect(w*17/32, h/8+h*(i+1)/15, w*5/27, h/15);
        rect(w*17/32+w*7/27, h/8+h*(i+1)/15, w*5/27, h/15);
        if (i==actualPartido && actualGrupo == mostrarGrupo) fill(255, 0, 0);
        if ((i<actualPartido && actualGrupo == mostrarGrupo ) || actualGrupo > mostrarGrupo) fill(0);
        if ((i>actualPartido && actualGrupo == mostrarGrupo )|| actualGrupo < mostrarGrupo) fill(0, 0, 255);
        textAlign(CENTER, CENTER);
        textSize(int(22*w/1200)); 
        text(Grupos.get(mostrarGrupo).personajes.get(calendario.get(actualJornada).get(i).x).jugador+'\n'+Grupos.get(mostrarGrupo).personajes.get(calendario.get(actualJornada).get(i).x).nombrePersonaje, w*17/32, h/8+h*(i+1)/15, w*5/27, h/15);
        text(Grupos.get(mostrarGrupo).personajes.get(calendario.get(actualJornada).get(i).y).jugador+'\n'+Grupos.get(mostrarGrupo).personajes.get(calendario.get(actualJornada).get(i).y).nombrePersonaje, w*17/32+w*7/27, h/8+h*(i+1)/15, w*5/27, h/15);
        fill(0);
        rect(w*17/32+w*5/27, h/8+h/15*(1+i), w*2/27, h/15);
        fill(255);
        text("VS", w*17/32, h/8+h/15*(1+i), w*12/27, h/15);
      }
    }
  }

  public void EscenaCombate() {
    Fight = new PantallaCombate(Grupos.get(actualGrupo).personajes.get(calendario.get(actualJornada).get(actualPartido).x).jugador, Grupos.get(actualGrupo).personajes.get(calendario.get(actualJornada).get(actualPartido).y).jugador, Grupos.get(actualGrupo).personajes.get(calendario.get(actualJornada).get(actualPartido).x).nombrePersonaje, Grupos.get(actualGrupo).personajes.get(calendario.get(actualJornada).get(actualPartido).y).nombrePersonaje, cp5, torneo.getPantalla());
    btnBatalla.setVisible(false);
    btnGrupoMas.setVisible(false);
    btnGrupoMenos.setVisible(false);
  }

  public void setCombate(int ganador, int vidas) {
    btnGrupoMas.setVisible(true);
    btnGrupoMenos.setVisible(true);
    btnBatalla.setVisible(true);

    int numW, numL;
    if (ganador == 1) {
      numW = calendario.get(actualJornada).get(actualPartido).x;
      numL = calendario.get(actualJornada).get(actualPartido).y;
    } else {
      numW = calendario.get(actualJornada).get(actualPartido).y;
      numL = calendario.get(actualJornada).get(actualPartido).x;
    }

    torneo.hazCombate(actualGrupo, numW, numL, vidas);
    actualPartido++;
    if (actualPartido >= calendario.get(actualJornada).size()) {
      actualGrupo++;
      actualPartido=0;
      if (actualGrupo >= Grupos.size()) {
        actualJornada++;
        actualGrupo=0;
        if (actualJornada >= calendario.size()) {
          btnBatalla.setVisible(false);
          btnFinalGrupos.setVisible(true);
          actualJornada=-1;
        }
      }
    }
    mostrarGrupo = actualGrupo;
  }

  public void MostrarMas() {
    mostrarGrupo++;
    if (mostrarGrupo >= Grupos.size()) {
      mostrarGrupo = 0;
    }
  }

  public void MostrarMenos() {
    mostrarGrupo--;
    if (mostrarGrupo < 0) {
      mostrarGrupo = Grupos.size()-1;
    }
  }

  public void endGrupos() {
    btnGrupoMas.setVisible(false);
    btnGrupoMenos.setVisible(false);
    btnFinalGrupos.setVisible(false);
  }
}

public void Batalla() {
  Liga.EscenaCombate();
  torneo.setPantalla(Torneo.PANTALLA_COMBATE);
}

public void FinalGrupos() {
  Liga.endGrupos();
  torneo.setPantalla(Torneo.PANTALLA_FASE_FINAL);
}

public void GrupoMas() {
  Liga.MostrarMas();
}

public void GrupoMenos() {
  Liga.MostrarMenos();
}
