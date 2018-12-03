int leds[] ={0,1};

int state[] = {0,0};
byte ledval[] = {0,0};
int ledtime[] = {0,0};
int ledspeed[] = {6,6};

void setup() {
  pinMode(leds[0], OUTPUT);      
  pinMode(leds[1], OUTPUT);   
}



byte i =0;

void loop()
{
  for (i=0; i<2; i++) {
  if (state[i] == 0) { // pick a random time before turning on
    ledtime[i] = random(5,150);  // how long before it comes on
    ledspeed[i] = random(4,12);
    state[i] = 1;
  }
  if (state[i] == 1) { // make it bright
    ledtime[i]--;
    if (ledtime[i] == 0) 
      state[i] = 2;
  }
  if (state[i] == 2) { // full brightness
    if (ledval[i]>255-ledspeed[i]) {
      state[i] = 3;
      analogWrite(leds[i],255);
      ledtime[i] = random(10,100);  // how long before it goes off
    }
    else {
      ledval[i] += ledspeed[i];
      analogWrite(leds[i],ledval[i]);
    }
  }
  if (state[i] == 3) { // wait a bit
    ledtime[i]--;
    if (ledtime[i] == 0)
      state[i] = 4;
  }
  if (state[i] == 4) {  // make it dim
    if (ledval[i]<ledspeed[i]) {
      state[i] = 0;
      analogWrite(leds[i],0);
    }
    else {
      ledval[i] -= ledspeed[i];
      analogWrite(leds[i],ledval[i]);
    }
  }  
  }


    delay(10);
}
