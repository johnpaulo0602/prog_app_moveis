void main() {
  List<int> numeros = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  
  print('Exibindo apenas os números 5, 6, 7, 8');
  print('====================================');
  
  for (int numero in numeros) {
    if (numero < 5) {
      continue;
    }
    
    if (numero > 8) {
      break;
    }
    
    print(numero);
  }
}