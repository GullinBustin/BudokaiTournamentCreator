class PeriodoGrupos{
 
  private ArrayList<ArrayList<Pair>> calendario;
  private ArrayList<Grupo> Grupos;
  private int actualGrupo;
  private int actualJornada;
  private int actualPartido;
  // private int sizeGrupo;
  // private int sizeJornada;
  // private int sizePartido;
  private int mostrarGrupo;
  private TablaGrupos Tablas[];
  private ControlP5 cp5;
  private Button btnBatalla;
  
  PeriodoGrupos(ArrayList<Grupo> grup, ControlP5 cp5){
    this.cp5 = cp5;
    btnBatalla = cp5.addButton("Batalla").setPosition(w*8/10,h*8/10);
    calendario = generaCalendario(grup.get(0).getTamano());
    this.Grupos = grup;
    actualGrupo = 0;
    actualJornada = 0;
    actualPartido = 0;
    mostrarGrupo = 0;
    Tablas = new TablaGrupos[Grupos.size()];
    for(int i=0; i<Tablas.length; i++){
      Tablas[i] = new TablaGrupos(Grupos.get(i).personajes,"Grupo "+(i+1), w/40,h/8,w/2,h/15);
    }
  }
  
  public void drawPeriodoGrupos(){
   Tablas[mostrarGrupo].drawTabla();
   textSize(int(22*w/1200));
   textAlign(LEFT, CENTER);
   for(int i=0; i<calendario.get(actualJornada).size();i++){
     if(i==actualPartido) fill(255,0,0);
     if(i<actualPartido) fill(0);
     if(i>actualPartido) fill(0,0,255);
    text(Grupos.get(mostrarGrupo).personajes.get(calendario.get(actualJornada).get(i).x).jugador+": "+Grupos.get(mostrarGrupo).personajes.get(calendario.get(actualJornada).get(i).x).nombrePersonaje + "  VS  " + Grupos.get(mostrarGrupo).personajes.get(calendario.get(actualJornada).get(i).y).jugador+": "+Grupos.get(mostrarGrupo).personajes.get(calendario.get(actualJornada).get(i).y).nombrePersonaje,w*9/16,h/8+h*i/20);
   }
  }
  
  public void EscenaCombate(){
    Fight = new PantallaCombate(Grupos.get(actualGrupo).personajes.get(calendario.get(actualJornada).get(actualPartido).x).jugador,Grupos.get(actualGrupo).personajes.get(calendario.get(actualJornada).get(actualPartido).y).jugador,Grupos.get(actualGrupo).personajes.get(calendario.get(actualJornada).get(actualPartido).x).nombrePersonaje,Grupos.get(actualGrupo).personajes.get(calendario.get(actualJornada).get(actualPartido).y).nombrePersonaje, cp5);
    btnBatalla.setVisible(false);
  }
  
  public void setCombate(int ganador, int vidas){
    int numW, numL;
    if(ganador == 1){
     numW = calendario.get(actualJornada).get(actualPartido).x;
     numL = calendario.get(actualJornada).get(actualPartido).y;
    }else{
     numW = calendario.get(actualJornada).get(actualPartido).y;
     numL = calendario.get(actualJornada).get(actualPartido).x;
    }
    println(actualGrupo +"   "+ numW + "   " + numL + "   " + vidas);
    torneo.hazCombate(actualGrupo,numW,numL,vidas);
    actualPartido++;
    if(actualPartido >= calendario.get(actualJornada).size()){
     actualGrupo++;
     actualPartido=0;
     if(actualGrupo >= Grupos.size()){
      actualJornada++;
      actualGrupo=0;
      if(actualJornada >= calendario.size()){
       //HACER ALGO 
      }
     }
    }
  }
  
}

public void Batalla(){
  Liga.EscenaCombate();
  torneo.setPantalla(Torneo.PANTALLA_COMBATE);

}
