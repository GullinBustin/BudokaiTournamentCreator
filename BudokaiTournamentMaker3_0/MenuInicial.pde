class MenuInicial{
 
  PImage fondo;
  ControlP5 cp5;
  Button btnNew,btnLoad;
  
 MenuInicial(ControlP5 cp5){
   this.cp5 = cp5;
   btnNew = cp5.addButton("Nuevo").setSize(w/4,h/8);
   btnLoad = cp5.addButton("Cargar");
 } 
  
}
