class MenuJugador {

  private PImage fondo;
  private ControlP5 cp5;
  private ScrollList slJugadores;
  private Textfield txfNewPlayer;
  private PFont font;//corbel-bold
  private RadioButton rbGrupos;
  private Button btnContinue;

  MenuJugador(ControlP5 cp5) {

    font = loadFont("MenuJugador.vlw");
    fondo = loadImage("Boles_de_drac.jpg");

    this.cp5 = cp5;

    slJugadores = new  ScrollList("Jugadores", w/4-w/8, h/2-h/4, w/4, h/14, font);

    txfNewPlayer = cp5.addTextfield("NuevoJugador", w/4-w/8, h/12, w/4, h/14).setFont(font);

    rbGrupos = cp5.addRadioButton("Grupos")
      .setPosition(w*6/8, 100)
        .setSize(40, 40)
          .setItemsPerRow(1)
            .setSpacingRow(60)
              .addItem("2", 2)
                .addItem("4", 4)
                  .addItem("8", 8)
                    .setNoneSelectedAllowed(false);
    ;

    btnContinue = cp5.addButton("Sorteo").setPosition(w*5/8, h*6/8).setSize(w/8, h/16).setVisible(false);

    btnContinue.getCaptionLabel().setFont(font);
  }

  public void drawMenuJugador() {
    image(fondo, 0, 0, w, h);
    textFont(font);
    fill(255);
    text("Numero de Grupos", w*9/16, h*9/26);
    slJugadores.drawScrollList(); 

    if (slJugadores.getlength()>=2 && rbGrupos.getValue() != 0) {
      if (slJugadores.getlength()*(rbGrupos.getValue() +1) <= 38) {
        btnContinue.setVisible(true);
      } else {
        btnContinue.setVisible(false); 
        fill(255, 0, 0);
        text("Demasiados Personajes", w*4/8, h*6/8, w/2, h/16);
      }
    } else {
      btnContinue.setVisible(false);
    }
  }
  //numJug(numGrup + 1) <= 38
  public void addPlayer(String name) {
    slJugadores.addName(name);
  }
  
  public ArrayList getJugadores(){
   return slJugadores.getList(); 
  }
  
  public int getGrupos(){
   return int(rbGrupos.getValue()); 
  }
  
  public void endMenuJugador(){
    rbGrupos.setVisible(false);
    txfNewPlayer.setVisible(false);
    btnContinue.setVisible(false);

  }
  
}

public void NuevoJugador(String name) {
  EscogerJugador.addPlayer(name);
}

public void Sorteo(){
  torneo.setJugadores(EscogerJugador.getJugadores());
  torneo.setNumGrupos(EscogerJugador.getGrupos());
  torneo.sorteo();
  torneo.setPantalla(Torneo.PANTALLA_SORTEO);
  EscogerJugador.endMenuJugador();
}
