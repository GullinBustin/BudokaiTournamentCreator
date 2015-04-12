class MenuJugador {

  private PImage fondo;
  private ControlP5 cp5;
  private ScrollList slJugadores;
  private Textfield txfNewPlayer;
  private PFont font;//corbel-bold
  private RadioButton Grupos;

  MenuJugador(ControlP5 cp5) {

    font = loadFont("MenuJugador.vlw");
    fondo = loadImage("Boles_de_drac.jpg");

    this.cp5 = cp5;
    
    slJugadores = new  ScrollList("Jugadores",w/4-w/8,h/2-h/4,w/4,h/14,font);

    txfNewPlayer = cp5.addTextfield("NuevoJugador", w/4-w/8, h/6, w/4, h/14).setFont(font);

    Grupos = cp5.addRadioButton("Grupos")
         .setPosition(w*6/8,100)
         .setSize(40,40)
         .setItemsPerRow(1)
         .setSpacingRow(60)
         .addItem("2",1)
         .addItem("4",2)
         .addItem("8",3)
         ;

  }

  public void drawMenuJugador(){
    image(fondo,0,0,w,h);
    textFont(font);
    text("Numero de Grupos", w*9/16, h*9/26);
   slJugadores.drawScrollList(); 
  }
  
  public void addPlayer(String name) {
    slJugadores.addName(name);
  }
  
}

public void NuevoJugador(String name) {
  EscogerJugador.addPlayer(name);
  
}
