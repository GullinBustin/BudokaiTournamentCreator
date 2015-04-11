void generaCalendario(int nj){
  ArrayList calendario = new ArrayList ();
  IntList numList = new IntList ();
  for(int i = 0; i < nj; i++){
    numList.append(i);
  }
  for(int i = 0; i < nj-1; i++){
    //cada iterador registra los combates de la jornada i-esima
    for(int j = 0; j < nj/2; j++){
      
    }
  }
}

class pair{
  public int x;
  public int y;
  
  public pair(int i, int j){
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
