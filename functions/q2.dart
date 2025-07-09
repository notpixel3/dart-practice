//Write a program in Dart that generates random password.
import 'dart:math';

String password(int length) {
  const keys =
      "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890!@#%^&*()";
  Random random = Random();
  String pass = '';
  for (int i = 0; i < length; i++) {
    int index = random.nextInt(keys.length);
    pass += keys[index];
  }
  return pass;
}

void main() {
  print("Generated Password: ${password(12)}");
}
