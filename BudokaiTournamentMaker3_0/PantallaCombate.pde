class PantallaCombate {

  private String Jugador1, Jugador2;
  private String Personaje1, Personaje2;
  private PImage ImP1, ImP2;
  //private RadioButton rdWiner;
  public Slider sldVidas;
  private int sldvalorVidas;
  private int ganador=-1;
  private Button btnEndBatalla;
  private int FaseCombate;

  PantallaCombate(String j1, String j2, String p1, String p2, ControlP5 cp5, int FC) {
    FaseCombate = FC;
    Jugador1 = j1;
    Jugador2 = j2;
    Personaje1 = p1;
    Personaje2 = p2;
    ImP1 = loadImage("Imagenes Personajes/"+Personaje1+".jpg");
    ImP2 = loadImage("Imagenes Personajes/"+Personaje2+".jpg");
    sldVidas = cp5.addSlider("sldvalorVidas")
      .setPosition(w/4, h*21/24)
        .setSize(w/2, h/20)
          .setRange(0, 4)
            .setValue(0)
              .setNumberOfTickMarks(5)
                .setValueLabel("Vidas Ganador")
                  ;
    btnEndBatalla = cp5.addButton("FinalBatalla").setPosition(w*7/8, h*22/24);
    if (FC == Torneo.PANTALLA_GRUPOS) {
      sldVidas.setVisible(true);
    }
    if (FC == Torneo.PANTALLA_FASE_FINAL) {
      sldVidas.setVisible(false);
    }
  }

  void drawCombate() {
    if (FaseCombate == Torneo.PANTALLA_GRUPOS) {
      if (sldVidas.getValue() > 0 && ganador>0) {
        sldvalorVidas = int(sldVidas.getValue());
        btnEndBatalla.setVisible(true);
      } else {
        btnEndBatalla.setVisible(false);
      }
    }
    if (FaseCombate == Torneo.PANTALLA_FASE_FINAL) {
      if (ganador>0) {
        sldvalorVidas = int(sldVidas.getValue());
        btnEndBatalla.setVisible(true);
      } else {
        btnEndBatalla.setVisible(false);
      }
    }

    background(0);
    image(ImP1, 0, 0, w/2, h*2/3);
    image(ImP2, w/2, 0, w/2, h*2/3);
    textAlign(CENTER, CENTER);
    textSize(int(42*w/1200)); 
    if (ganador == 1) fill(0, 255, 0);
    else fill(0, 0, 255);
    rect(0, h*2/3, w/2, h/6);
    if (ganador == 2) fill(0, 255, 0);
    else fill(0, 0, 255);
    rect(w/2, h*2/3, w/2, h/6);
    fill(0);
    text(Jugador1+'\n'+"Mando 1", 0, h*2/3, w/2, h/6);
    fill(0);
    text(Jugador2+'\n'+"Mando 2", w/2, h*2/3, w/2, h/6);

    if (mousePressed) {
      if (mouseX < w/2 && mouseY> h*2/3 && mouseY< (h*2/3 + h/6)) {
        ganador = 1;
      }
      if (mouseX > w/2 && mouseY> h*2/3 && mouseY< (h*2/3 + h/6)) {
        ganador = 2;
      }
    }
  }

  public void killCombate() {

    sldVidas.setVisible(false);
    btnEndBatalla.setVisible(false);
  }

  public int getGanador() {
    return ganador;
  }

  public int getVidas() {
    return sldvalorVidas;
  }
}

public void FinalBatalla() {
  if (Fight.FaseCombate == Torneo.PANTALLA_GRUPOS) {
    Liga.setCombate(Fight.getGanador(), Fight.getVidas());
    torneo.setPantalla(Torneo.PANTALLA_GRUPOS);
  }
  if (Fight.FaseCombate == Torneo.PANTALLA_FASE_FINAL) {
    torneo.setPantalla(Torneo.PANTALLA_FASE_FINAL);
    FinalCombat.setCombate(Fight.getGanador());

  }
  
  Fight.killCombate();
}
