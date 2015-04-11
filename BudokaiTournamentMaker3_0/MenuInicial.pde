class MenuInicial {

  private PImage fondo;
  private ControlP5 cp5;
  private Button btnNew, btnLoad;
  private PFont font;

  MenuInicial(ControlP5 cp5) {
    this.cp5 = cp5;
    btnNew = cp5.addButton("Nuevo").setSize(w/4, h/8).setPosition(w/2-w/8, h/3-h/16);
    btnLoad = cp5.addButton("Cargar").setSize(w/4, h/8).setPosition(w/2-w/8, h/3+h/8);

    font = loadFont("MenuInicial.vlw");
    fondo = loadImage("Boles_de_drac.jpg");

    btnNew.getCaptionLabel().setPadding(w/32, 0).setFont(font);
    btnLoad.getCaptionLabel().setPadding(w/100, 0).setFont(font);
  }

  public void drawTitle() {
    image(fondo,0,0,w,h);
  }
  
  public void endMenuInicial(){
    btnLoad.remove();
    btnNew.remove();
  }
}

public void Nuevo() {

  torneo = new Torneo();
  Menu.endMenuInicial();
}

public void Cargar() {
}
