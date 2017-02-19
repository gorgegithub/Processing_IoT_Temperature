import processing.serial.*;
float x=0;
//lf es el caracter de retorno de carro, que en ASCII es 10
int lf = 10;
// El puerto serie
Serial myPort;
void setup() {
  size(300, 150);//Tamaño del cuadro
  background(#336699); //Color de relleno
  stroke(255);           
  // Lista todos los puertos serie
  println(Serial.list());
  //Elige el puerto donde tengas conectado Arduino de Serial.list()[0]
  myPort = new Serial(this, Serial.list()[0], 9600);
}
void draw() {
  while (myPort.available() > 0) {
    String lectura = myPort.readStringUntil(lf);
    if (lectura != null) {
      //Parto la cadena recibida para quedarme con valor numerico y pintarlo
      String[] list = split(lectura, '='); 
      loadStrings("https://dweet.io/dweet/for/s4a-jgg?"+lectura); //Envio a la nube
      ellipse(x, (float(list[1])*2), 2, 2);//En vez de un punto que es un pixel
      x=x+5;
      fill(204, 102, 0);
      rect(10, 110, 140, 30); //Pinto rectangulo para borrar el texto anterior
      fill(255);
      text(list[0]+" = "+list[1], 15, 130); //Texto a mostrar
      text("ºC", 130, 130); //Unidades
    }
  }
}