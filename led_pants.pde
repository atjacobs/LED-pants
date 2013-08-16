
/*int led_0 = 13;
 int led_1 = 11;
 int led_2 = 9;
 int led_3 = 8;
 int led_4 = 7;
 int led_5 = 5;*/

int led_array[6] = {
  13, 11, 9, 8, 7, 5};
int inputPin = 3;
int val;
int oldVal;
int mode = 1;
int i;
int DIR = 1;
int xAxis = 1;
int yAxis = 3;
int zAxis = 5;
int dataArray[1000]; //At a sample rate of ~100 Hz -> 10 sec

void setup(){
  
  pinMode(2, OUTPUT);
  pinMode(inputPin, INPUT);
  digitalWrite(2, LOW);
  digitalWrite(inputPin, HIGH);  
  for(int i = 0; i <=5; i++){

    pinMode(led_array[i], OUTPUT);

  }

}

void loop(){

  oldVal = val;
  val = digitalRead(inputPin);
  if ((val == 0)&&(oldVal ==1)){
    if (mode >= 2){
      mode = 1;
    }
    else mode = 2;
    for(int i = 0; i <=5; i++){
      digitalWrite(led_array[i], LOW);
    }
    i = 0;    
  }
  
  if (mode == 1){

    digitalWrite(led_array[i], HIGH);
    delay(100);
    digitalWrite(led_array[i], LOW);

  } 

  if (mode == 2){

    digitalWrite(led_array[i], DIR);
    delay(100);

    if (i >= 5){
      if (DIR) DIR = 0;
      else DIR = 1;
    }

  }
  i++;
  if (i >=6) i = 0;  

}


