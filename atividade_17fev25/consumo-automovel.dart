void main() {
  int distancia = 500;
  double combustivel = 35.0;
  
  double consumoMedio = distancia / combustivel;
  
  print('${consumoMedio.toStringAsFixed(3)} km/l');
}