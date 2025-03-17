void main() {
  int velocidade = 90;
  
  print('Verificador de Multa');
  print('====================');
  print('Velocidade: $velocidade km/h');
  
  if (velocidade > 80) {
    print('Motorista foi multado.');
  } else {
    print('Motorista não foi multado.');
  }
}