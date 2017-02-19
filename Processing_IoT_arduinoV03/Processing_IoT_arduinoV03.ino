#include <OneWire.h> //Se importan las librerías
#include <DallasTemperature.h>
#define Pin 2 //Se declara el pin donde se conectará la DATA
OneWire ourWire(Pin); //Se establece el pin declarado como bus para la comunicación OneWire
DallasTemperature sensors(&ourWire); //Se instancia la librería DallasTemperature

void setup() {
delay(1000);
Serial.begin(9600);
sensors.begin(); //Se inician los sensores
}

void loop() {
sensors.requestTemperatures(); //Prepara el sensor para la lectura

Serial.print("Temperatura=");
Serial.println(sensors.getTempCByIndex(0)); //Se lee e imprime la temperatura en grados Celsius
delay(3000); //Se provoca un lapso de 3 segundos antes de la próxima lectura
}
