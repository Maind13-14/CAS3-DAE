int output1 = 1;
int output2 = 2;
int output3 = 3;
int output4 = 4;
int output5 = 5;
int output6 = 6;
int output7 = 7;
int output8 = 9;

int out1[] = {0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0};
int out2[] = {0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0};
int out3[] = {0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0};
int out4[] = {0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0};
int out5[] = {0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0};
int out6[] = {0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0};
int out7[] = {0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0};
int out8[] = {0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0};

void setup() {

  pinMode(output1, OUTPUT);
  pinMode(output2, OUTPUT);
  pinMode(output3, OUTPUT);
  pinMode(output4, OUTPUT);
  pinMode(output5, OUTPUT);
  pinMode(output6, OUTPUT);
  pinMode(output7, OUTPUT);
  pinMode(output8, OUTPUT);

}

void loop() {

  for (int i = 0; i < 17; i++)
  {
    digitalWrite(output1, out1[i]);

    digitalWrite(output2, out2[i]);

    digitalWrite(output3, out3[i]);

    digitalWrite(output4, out4[i]);

    digitalWrite(output5, out5[i]);

    digitalWrite(output6, out6[i]);

    digitalWrite(output7, out7[i]);

    digitalWrite(output8, out8[i]);
    if (i <= 8) {
      delay((16 - i) * 2);
    } else {
      delay((16 + 9 - i) * 2);
    }

  }

  delay(500);

}
