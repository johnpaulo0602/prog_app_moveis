void main() {
  int numero = 7;
  
  print('Verificador de Número Par ou Ímpar');
  print('==================================');
  print('Insira um Número Inteiro: $numero');
  
  if (numero % 2 == 0) {
    print('O número $numero é par.');
  } else {
    print('O número $numero é ímpar.');
  }
}