class Personaje{
  private int victorias;
  private int vidas;
  private String jugador;
  private String nombrePersonaje;
  
  public Personaje(){
    this.victorias = 0;
    this.vidas = 0;
  }
  
  public void setVictorias(int victorias){
    this.victorias=victorias;
  }
  public int getVictorias(){
    return victorias;
  }
  public void setVidas(int vidas){
    this.vidas=vidas;
  }
  public int getVidas(){
    return vidas;
  }
  public void sumarVictoria(){
    victorias++;
  }
  public void sumarVidas(int v){
    vidas=vidas+v;
  }
  public void setJugador(String jugador){
    this.jugador=jugador;
  }
  public String getJugador(){
    return jugador;
  }
  public void setNombrePersonaje(String nombrePersonaje){
    this.nombrePersonaje=nombrePersonaje;
  }
  public String getNombrePersonaje(){
    return nombrePersonaje;
  }
}
