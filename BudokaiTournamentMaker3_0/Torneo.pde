class Torneo{
  public static final int PANTALLA_INTRO_JUGADORES=1;
  public static final int PANTALLA_SORTEO=2;
  public static final int PANTALLA_GRUPOS=3;
  public static final int PANTALLA_COMBATE=4;
  
  private int pantalla;
  private int numGrupos;
  
  
  
  public Torneo(){
    this.pantalla=1;
  }
  
  public void setPantalla(int pantalla){
    this.pantalla=pantalla;
  }
  public int getPantalla(){
    return pantalla;
  }
  public void setNumGrupos(int numGrupos){
    this.numGrupos=numGrupos;
  }
  public int getNumGrupos(){
    return numGrupos;
  }
  
  
  
  
}
