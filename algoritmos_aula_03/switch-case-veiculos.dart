void main() {
  String modelo = 'Uno';
  
  print('Identificador de Marca de Veículo');
  print('================================');
  print('Modelo: $modelo');
  
  switch (modelo) {
    case 'Pollo':
    case 'Up':
    case 'Gol':
      print('Marca: Volkswagen');
      break;
    case 'Uno':
    case 'Palio':
      print('Marca: Fiat');
      break;
    case 'Ka':
      print('Marca: Ford');
      break;
    case 'Sandero':
    case 'Clio':
      print('Marca: Renault');
      break;
    default:
      print('Marca desconhecida');
  }
}