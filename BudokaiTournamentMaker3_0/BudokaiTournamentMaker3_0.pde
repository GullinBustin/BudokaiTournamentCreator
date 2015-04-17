import controlP5.*;

ControlP5 cp5; 
MenuInicial Menu;
MenuJugador EscogerJugador;
MostrarSorteo PanelesSorteo;
Torneo torneo;
PeriodoGrupos Liga;
PantallaCombate Fight;
FaseFinal FinalCombat;
ArrayList<String> nombrePersonajes = new ArrayList<String>();

int w, h;

void setup() {
  size(800, 600);
  w=width;
  h=height; 
  cp5 = new ControlP5(this);
  Menu = new MenuInicial(cp5);
  readPersonajes();
}

void draw() {

  if (torneo ==null) {
    Menu.drawTitle();
  } else {
    background(255);
    switch( torneo.getPantalla() ) {
    case Torneo.PANTALLA_INTRO_JUGADORES:
      if (EscogerJugador == null) {
        EscogerJugador = new MenuJugador(cp5);
      }
      EscogerJugador.drawMenuJugador();
      break;
    case Torneo.PANTALLA_SORTEO:
      if (PanelesSorteo == null) {
        PanelesSorteo = new MostrarSorteo(torneo.getGrupos(), cp5);
      }
      PanelesSorteo.drawMostrarGrupos();
      break;
    case Torneo.PANTALLA_GRUPOS:
      background(255);
      if (Liga == null) {
        Liga = new PeriodoGrupos(torneo.getGrupos(), cp5);
      }
      Liga.drawPeriodoGrupos();
      break;
    case Torneo.PANTALLA_COMBATE:
      Fight.drawCombate();
      break;
    case Torneo.PANTALLA_FASE_FINAL:
      background(255);
      if (FinalCombat == null) {
        FinalCombat = new FaseFinal(torneo.getFaseFinalEliminatoria(), cp5);
      }
      FinalCombat.drawFaseFinal();
      break;
    case Torneo.PANTALLA_COMBATE_FINAL:
      background(255);
      for(int i=0; i<FinalCombat.Winer.size() ; i++){
       text(FinalCombat.Winer.get(i).jugador+": "+FinalCombat.Winer.get(i).nombrePersonaje, w/2,100+40*i);
      }
      break;
    }
  }
}

void keyReleased() {
  if (PanelesSorteo != null && torneo.getPantalla() == Torneo.PANTALLA_SORTEO) {
    PanelesSorteo.Destapar();
  }
}

void readPersonajes() {
  String line;
  BufferedReader reader = createReader("personajes.txt");

  try {
    while ( (line = reader.readLine ()) != null) {
      nombrePersonajes.add(line);
    }
  } 
  catch (IOException e) {
    e.printStackTrace();
  }
}
