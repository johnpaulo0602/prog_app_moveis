void main() {
  int quantidadeMacas = 15;
  double preco;
  
  print('Calculadora de Compra de Maçãs');
  print('==============================');
  print('Quantidade de maçãs: $quantidadeMacas');
  
  if (quantidadeMacas < 12) {
    preco = quantidadeMacas * 0.30;
  } else {
    preco = quantidadeMacas * 0.25;
  }
  
  print('Valor total da compra: R\$ ${preco.toStringAsFixed(2)}');
}