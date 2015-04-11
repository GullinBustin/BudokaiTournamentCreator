class Grupo{
  private int tamano;
  ArrayList<Personaje> personajes;

  public Grupo(){
    personajes = new ArrayList<Personaje> ();
  }
  
  public void setTamano(int tamano){
    this.tamano=tamano;
  }
  public int getTamano(){
    return tamano;
  }
  
  public void asignarPersonaje(Personaje personaje){
    (this.personajes).add(personaje);
  }
}
