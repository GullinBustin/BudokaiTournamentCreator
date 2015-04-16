class Combate{
  private int grupo;
  private int mando1;
  private int mando2;
  private int ganador;
  private int vidasDelGanador;
  
  public Combate(){}
  
  public void setGrupo(int grupo){
    this.grupo=grupo;
  }
  public int getGrupo(){
    return grupo;
  }
  public void setMando1(int mando1){
    this.mando1=mando1;
  }
  public int getMando1(){
    return mando1;
  }
  public void setMando2(int mando2){
    this.mando2=mando2;
  }
  public int getMando2(){
    return mando1;
  }
  public void setGanador(int ganador){
    this.ganador=ganador;
  }
  public int getGanador(){
    return ganador;
  }
  public void setVidasDelGanador(int vidasDelGanador){
    this.vidasDelGanador=vidasDelGanador;
  }
  public int getVidasDelGanador(){
    return vidasDelGanador;
  }

}
