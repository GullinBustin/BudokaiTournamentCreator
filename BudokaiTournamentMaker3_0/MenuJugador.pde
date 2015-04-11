class MenuJugador {

  private PImage fondo;
  private ControlP5 cp5;
  private ListBox lstbJugadores;
  private Textfield txfNewPlayer;
  private PFont font;//corbel-bold

  MenuJugador(ControlP5 cp5) {

    font = loadFont("MenuJugador.vlw");

    this.cp5 = cp5;
    lstbJugadores = cp5.addListBox("Jugadores")
      .disableCollapse()
        .setPosition(w/2-w/8, h/2 - h/8)
          .setSize(w/4, h/2)
            .setItemHeight(h/16)
              .setBarHeight(h/14) 
                ;

    txfNewPlayer = cp5.addTextfield("NuevoJugador", w/2-w/8, h/6, w/4, h/14).setFont(font);

    lstbJugadores.getCaptionLabel().setPadding(w/24, 0 ).setFont(font);
  }

  public void addPlayer(String name) {
    lstbJugadores.addItem(name, 1);
  }

  public void removePlayer(String name){
     lstbJugadores.removeItem(name); 
  }
  
}

public void NuevoJugador(String name) {
  EscogerJugador.addPlayer(name);
}
