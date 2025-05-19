void main() {
  int tempoHoras = 10;
  int velocidadeMedia = 85;
  
  int distancia = tempoHoras * velocidadeMedia;
  double litrosNecessarios = distancia / 12;
  
  print(litrosNecessarios.toStringAsFixed(3));
}