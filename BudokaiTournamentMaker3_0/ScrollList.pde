class ScrollList{
 
  ArrayList<String> nombres;
  private float posx,posy;
  private float sizex,sizey;
  private String ListName;
  private PFont font;
  private boolean errate = true;
  
  ScrollList(String name, float x, float y, float sx, float sy,PFont font){
    this.font = font;
    ListName = name;
    posx=x;
    posy=y;
    sizex= sx*5/6;
    sizey= sy;
    
    nombres = new ArrayList<String>();
    
  }
  
  public void addName(String name){
   nombres.add(name); 
  }
  
  public int getlength(){
    return nombres.size(); 
  }
  
  public ArrayList getList(){
   return nombres; 
  }
  
  public void drawScrollList(){
    textFont(font);
    textAlign(CENTER, CENTER);
    fill(0);
    rect(posx,posy,sizex*6/5.,sizey);
    fill(255);
    text(ListName,posx,posy,sizex*6/5.,sizey);
    for(int i=0; i<nombres.size(); i++){
      fill(0,0,255);
      rect(posx,posy+(i+1)*sizey,sizex,sizey);
      if(mouseX>posx+sizex && mouseX<posx+sizex*6/5 && mouseY>posy+(i+1)*sizey && mouseY<posy+(i+2)*sizey) fill(255,0,0); 
      else fill(255,100,100);
      rect(posx+sizex,posy+(i+1)*sizey,sizex/5.,sizey);
      fill(255);
      text(nombres.get(i),posx,posy+(i+1)*sizey,sizex,sizey);
      if(mousePressed && mouseX>posx+sizex && mouseX<posx+sizex*6/5 && mouseY>posy+(i+1)*sizey && mouseY<posy+(i+2)*sizey){
        if(errate) nombres.remove(i);
        errate = false;
      }
      if(mousePressed == false){
       errate = true; 
      }
    }
    
  }
  
}
