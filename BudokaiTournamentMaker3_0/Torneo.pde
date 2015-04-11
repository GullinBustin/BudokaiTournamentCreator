class Torneo{
  public static final int PANTALLA_INTRO_JUGADORES=1;
  public static final int PANTALLA_SORTEO=2;
  public static final int PANTALLA_GRUPOS=3;
  public static final int PANTALLA_COMBATE=4;
  
  private int pantalla;
  private int numGrupos;
  private ArrayList<Grupo> grupos;
  private ArrayList<String> jugadores;
  private ArrayList<String> listaPersonajes;
  
  
  public Torneo(){
    this.pantalla=1;
    this.grupos = new ArrayList<Grupo> ();
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
  
  public void sorteo(){
    listShuffle(listaPersonajes);
    int k = 0;
    for(int i = 0; i < this.numGrupos; i++){
      listShuffle(jugadores);
      Grupo grupo = new Grupo();
      grupo.tamano = (this.jugadores).size();
      for(int j = 0; j < grupo.getTamano(); j++){
        Personaje personaje = new Personaje();
        personaje.setJugador(jugadores.get(j));
        personaje.setNombrePersonaje(listaPersonajes.get(k));
        grupo.asignarPersonaje(personaje);
        k++;
      }
   
    
    grupos.add(grupo);
    }
  }
  
}

public void listShuffle(ArrayList listaP){ //random shuffle of ListArrays
  IntList numList = new IntList();
  ArrayList listaAux = new ArrayList ();
  
  for(int i = 0; i < listaP.size();i++){
    numList.append(i);
  }
  numList.shuffle();
  for(int i = 0; i < listaP.size(); i++){
    listaAux.add(listaP.get(numList.get(i)));
  }
  listaP = listaAux;
}
