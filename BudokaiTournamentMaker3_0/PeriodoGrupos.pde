class PeriodoGrupos{
 
  private ArrayList<ArrayList<Pair>> calendario;
  private ArrayList<Grupo> Grupos;
  private int actualGrupo;
  private int actualJornada;
  private int actualPartido;
  private TablaGrupos Tabla;
  
  PeriodoGrupos(ArrayList<Grupo> grup){
    calendario = generaCalendario(grup.get(0).getTamano());
    this.Grupos = grup;
    actualGrupo = 0;
    actualJornada = 0;
    actualPartido = 0;
    Tabla = new TablaGrupos(Grupos.get(0).personajes,"Grupo 0", w/10,h/8,w/2,h/15);
  }
  
  public void drawPeriodoGrupos(){
   Tabla.drawTabla(); 
  }
  
}
