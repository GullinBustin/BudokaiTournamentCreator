class FaseFinal {

  private ArrayList<Personaje> Winer;
  private ArrayList<Personaje> CombatesFinal;
  private int numBatalla;
  private ControlP5 cp5;
  private Button btnBatallaFinal;
  private PImage fondo;

  FaseFinal(ArrayList<Personaje> CF, ControlP5 cp5) {
    fondo = loadImage("Boles_de_drac.jpg");
    this.cp5 = cp5;
    CombatesFinal =  CF;
    Winer = new ArrayList<Personaje>();
    numBatalla=0;
    btnBatallaFinal = cp5.addButton("BatallaFinal").setPosition(w*8/10, h*8/10);
  }

  public void drawFaseFinal() {
    image(fondo,0,0,w,h);
    textAlign(CENTER, CENTER);
    textSize(int(22*w/1200)); 
    for (int i = 0; i<CombatesFinal.size()/2; i++) {
      fill(255);
      rect(w/4, h/8+h*(i+1)/10, w/2, h/10);
      if (i < numBatalla) fill(0);
      if (i == numBatalla) fill(255, 0, 0);
      if (i > numBatalla) fill(0, 0, 255);
      text(CombatesFinal.get(i*2).jugador+": "+CombatesFinal.get(i*2).nombrePersonaje+" VS "+CombatesFinal.get(i*2+1).jugador+": "+CombatesFinal.get(i*2+1).nombrePersonaje, w/4, h/8+h*(i+1)/10, w/2, h/10);
    }
  }

  public void EscenaCombate() {
    Fight = new PantallaCombate( CombatesFinal.get(numBatalla*2).jugador, CombatesFinal.get(numBatalla*2+1).jugador, CombatesFinal.get(numBatalla*2).nombrePersonaje, CombatesFinal.get(numBatalla*2+1).nombrePersonaje, cp5, torneo.getPantalla());
    btnBatallaFinal.setVisible(false);
  }

  public void setCombate(int ganador) {

    btnBatallaFinal.setVisible(true);

    if (ganador == 1) {
      Winer.add(CombatesFinal.get(numBatalla*2));
    } else {
      Winer.add(CombatesFinal.get(numBatalla*2+1));
    }

    numBatalla++;
    if(CombatesFinal.size() <= numBatalla*2){
      torneo.setPantalla(Torneo.PANTALLA_COMBATE_FINAL);
      btnBatallaFinal.setVisible(false);
      
    }
  }
}

public void BatallaFinal() {
  FinalCombat.EscenaCombate();
  torneo.setPantalla(Torneo.PANTALLA_COMBATE);
}
