public ArrayList generaCalendario(int nj){
  ArrayList calendario = new ArrayList ();
  IntList numList = new IntList ();
  for(int i = 0; i < nj; i++){
    numList.append(i);
  }
  
  if(nj%2 == 0){ //si hay un numero par de jugadores es facilito
    for(int i = 0; i < nj-1; i++){
      ArrayList jornada = new ArrayList ();
      
      for(int j = 0; j < nj/2; j++){
        Pair match = new Pair(numList.get(j),numList.get(nj-1-j));
        jornada.add(match);
      }
      
      calendario.add(jornada);
      numList = pseudoShift(numList);
    }
  }
  else{ //si hay un numero impar me toca las pelotas
  numList.append(-1); //rival fantasma (equivalente a descansar)
    for(int i = 0; i < nj; i++){
      ArrayList jornada = new ArrayList ();
      
      for(int j = 0; j < (nj+1)/2; j++){
        Pair match = new Pair(numList.get(j),numList.get(nj-j));
        if(numList.get(j)!=-1 && numList.get(nj-j) != -1) jornada.add(match); 
      }
      
      calendario.add(jornada);
      numList = pseudoShift(numList);
    }
  }
  return calendario;
}

class Pair{
  public int x;
  public int y;
  
  public Pair(int i, int j){
    x = i;
    y = j;    
  }
}

//shiftea el array para algoritmo de todos-contra-todos
public IntList pseudoShift (IntList numList){
  IntList listAux = new IntList ();
  listAux.append(1);
  for(int i = 1; i < numList.size(); i++){
    if(i==1) listAux.append(numList.get(numList.size()-1));
    else listAux.append(numList.get(i-1));
  }
  return listAux;
}
