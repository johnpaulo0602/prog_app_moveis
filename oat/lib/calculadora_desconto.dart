// Calculadora de Desconto de Produto

class CalculadoraDesconto {
  double _precoOriginal = 120.00;
  double _percentualDesconto = 15.0;
  String _nomeProduto = "Tênis Esportivo";
  
  CalculadoraDesconto();
  
  double calcularValorDesconto() {
    return (_precoOriginal * _percentualDesconto) / 100;
  }
  
  double calcularPrecoFinal() {
    double valorDesconto = calcularValorDesconto();
    return _precoOriginal - valorDesconto;
  }
  
  double calcularEconomia() {
    return calcularValorDesconto();
  }
  
  String formatarMoeda(double valor) {
    return 'R\$ ${valor.toStringAsFixed(2)}';
  }
  
  double calcularPercentualEconomia() {
    return _percentualDesconto;
  }
  
  void executar() {
    print('CALCULADORA DE DESCONTO');
    print('');
    print('Produto: $_nomeProduto');
    print('Preço original: ${formatarMoeda(_precoOriginal)}');
    print('Desconto aplicado: ${_percentualDesconto.toStringAsFixed(0)}%');
    print('');
    
    double valorDesconto = calcularValorDesconto();
    double precoFinal = calcularPrecoFinal();
    
    print('CÁLCULOS:');
    print('Valor do desconto: ${formatarMoeda(valorDesconto)}');
    print('Preço final: ${formatarMoeda(precoFinal)}');
    print('');
    
    print('RESUMO DA COMPRA:');
    print('Você economizou: ${formatarMoeda(valorDesconto)}');
    print('Valor a pagar: ${formatarMoeda(precoFinal)}');
    
    if (_percentualDesconto >= 20) {
      print('Tu é o bixão mermo quase leva de graça!');
    } else if (_percentualDesconto >= 10) {
      print('Certeza que conhece o dono');
    } else {
      print('Por esse desconto é melhor comprar na internet kkkkkk');
    }
  }
  
  // getter e setter
  double get precoOriginal => _precoOriginal;
  double get percentualDesconto => _percentualDesconto;
  String get nomeProduto => _nomeProduto;
  
  set precoOriginal(double novoPreco) => _precoOriginal = novoPreco;
  set percentualDesconto(double novoDesconto) => _percentualDesconto = novoDesconto;
  set nomeProduto(String novoNome) => _nomeProduto = novoNome;
}

