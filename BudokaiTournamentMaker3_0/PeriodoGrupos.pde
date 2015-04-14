class PeriodoGrupos{
 
  private ArrayList<ArrayList<Pair>> calendario;
  private ArrayList<Grupo> Grupos;
  private int actualGrupo;
  private int actualJornada;
  private int actualPartido;
  private TablaGrupos Tablas[];
  
  PeriodoGrupos(ArrayList<Grupo> grup){
    calendario = generaCalendario(grup.get(0).getTamano());
    this.Grupos = grup;
    actualGrupo = 0;
    actualJornada = 0;
    actualPartido = 0;
    Tablas = new TablaGrupos[Grupos.size()];
    for(int i=0; i<Tablas.length; i++){
      Tablas[i] = new TablaGrupos(Grupos.get(i).personajes,"Grupo "+(i+1), w/40,h/8,w/2,h/15);
    }
  }
  
  public void drawPeriodoGrupos(){
   Tablas[actualGrupo].drawTabla();
   textSize(int(22*w/1200)); 
   textAlign(LEFT, CENTER);
   for(int i=0; i<calendario.get(actualJornada).size();i++){
     if(i==actualPartido) fill(255,0,0);
     if(i<actualPartido) fill(0);
     if(i>actualPartido) fill(0,0,255);
    text(Grupos.get(actualGrupo).personajes.get(calendario.get(actualJornada).get(i).x).jugador+": "+Grupos.get(actualGrupo).personajes.get(calendario.get(actualJornada).get(i).x).nombrePersonaje + "  VS  " + Grupos.get(actualGrupo).personajes.get(calendario.get(actualJornada).get(i).y).jugador+": "+Grupos.get(actualGrupo).personajes.get(calendario.get(actualJornada).get(i).y).nombrePersonaje,w*9/16,h/8+h*i/20);
   }
  }
  
}
