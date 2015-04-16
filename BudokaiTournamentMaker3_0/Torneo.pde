class Torneo{
  public static final int PANTALLA_INTRO_JUGADORES=1;
  public static final int PANTALLA_SORTEO=2;
  public static final int PANTALLA_GRUPOS=3;
  public static final int PANTALLA_COMBATE=4;
  
  private int pantalla;
  private int numGrupos;
  private ArrayList<String> reserva;
  private ArrayList<Grupo> grupos;
  private ArrayList<String> jugadores;
  private ArrayList<String> listaPersonajes;
  private ArrayList<Combate> listaCombates;
  
  public Torneo(){
    this.pantalla=1;
    this.grupos = new ArrayList<Grupo> ();
    this.jugadores = new ArrayList<String> ();
    this.listaPersonajes = new ArrayList<String> ();
    this.reserva = new ArrayList<String> ();
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
  
  public ArrayList<String> getReserva(){
    return reserva;
  }
  
  public void setJugadores(ArrayList<String> jugadores){
    this.jugadores = jugadores;
  }
  
  public ArrayList<String> getJugadores(){
    return jugadores;
  }
  
  public void setListaPersonajes(ArrayList<String> listaPersonajes){
    this.listaPersonajes = listaPersonajes;
  }
  
  public ArrayList<String> getListaPersonajes(){
    return listaPersonajes;
  }
  
  public ArrayList<Grupo> getGrupos(){
    return grupos;
  }
  
  public void setGrupos (ArrayList<Grupo> grupos){
    this.grupos=grupos;
  }
  
  public void setListaCombates(ArrayList<Combate> listaCombates){
    this.listaCombates=listaCombates;
  }
  public ArrayList<Combate> getListaCombates(){
    return listaCombates;
  }
  
  public void sorteo(){
    listaPersonajes = listShuffle(listaPersonajes);
    int k = 0;
    for(int i = 0; i < this.numGrupos; i++){
      jugadores = listShuffle(jugadores);
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
    for(int i = 0; i < (this.jugadores).size(); i++){
      reserva.add(listaPersonajes.get(k+i));
    }
  }
  
  public void actualizaJugador(int G, int J, int V){
    this.grupos.get(G).personajes.get(J).sumarVictoria();
    this.grupos.get(G).personajes.get(J).sumarVidas(V);
  }
  
  public String getNombreJugadorTorneo(int G, int J){
    return this.grupos.get(G).personajes.get(J).getJugador();
  }
  public String getNombrePersonajeTorneo(int G, int J){
    return this.grupos.get(G).personajes.get(J).getNombrePersonaje();
  }
  
  public ArrayList<Personaje> getFaseFinalEliminatoria(ArrayList<Grupo> grup){
    ArrayList<ArrayList<Personaje>> finalistas = new ArrayList<ArrayList<Personaje>> ();
    ArrayList<Personaje> definitivo = new ArrayList<Personaje>();
    int comb;
    if(this.jugadores.size()<=4) comb = 2;
    else comb = 4;
    boolean[] usado = new boolean[comb];
    
    for(int i = 0; i < grup.size(); i++){
      ArrayList<Personaje> previos = new ArrayList<Personaje> ();
      
      for(int k = 0; k < comb; k++){
        usado[k] = false;
      }
      for(int k = 0; k < comb; k++){
        //buscamos los comb primeros del grupo i
        Personaje ganador = new Personaje();
        int maxim = 0;
        for(int j = 0; j < this.jugadores.size(); j++){
          if (!usado[j]){
            usado[j] = true;
            int punt = grup.get(i).personajes.get(j).victorias*100+grup.get(i).personajes.get(j).vidas;
            if (punt > maxim){
              maxim = punt;
              ganador = grup.get(i).personajes.get(j);
            }
          }
        }
        previos.add(ganador);
      }
      finalistas.add(previos);
    }
    
    //una vez tenemos tan solo los comb primeros, procedemos a hacer el match-making
    for(int i = 0; i < grup.size()/2; i++){
      for(int j = 0; j < comb; j++){
        Personaje ganador1 = new Personaje();
        ganador1 = finalistas.get(2*i).get(j);
        ganador1.enGrupo = 2*i;
        ganador1.posicionFinal = j;
        definitivo.add(ganador1);
        ganador1 = finalistas.get(2*i+1).get(comb-1-j);
        ganador1.enGrupo = 2*i+1;
        ganador1.posicionFinal = comb-1-j;
        definitivo.add(ganador1);
      }
    }
    return definitivo;
  }
  
  public Combate getCombate(int grupo, int pers1, int pers2){
    Combate c = new Combate();
    for(Combate aux:listaCombates){
      if(aux.getGrupo()==grupo && ((aux.getMando1()==pers1 && aux.getMando2()==pers2)||(aux.getMando1()==pers1 && aux.getMando2()==pers1))){
        c=aux;
      }
    }
    return c;
  }
  
  public void hazCombate(int G, int ganador, int perdedor, int vidas){
    //Parametros de combate
    Combate combat = new Combate(G,ganador,perdedor,ganador,vidas);
    this.listaCombates.add(combat);
    
    //Actualizar el objeto torneo
    actualizaJugador(G,ganador,vidas);
  }
}

//random shuffle of ListArrays
public ArrayList listShuffle(ArrayList listaP){
  IntList numList = new IntList();
  ArrayList listaAux = new ArrayList ();
  
  for(int i = 0; i < listaP.size();i++){
    numList.append(i);
  }
  numList.shuffle();
  for(int i = 0; i < listaP.size(); i++){
    listaAux.add(listaP.get(numList.get(i)));
  }
  return listaAux;
}
