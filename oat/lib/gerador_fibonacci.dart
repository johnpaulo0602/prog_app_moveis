// Gerador de Fibonacci

class GeradorFibonacci {
  int _numeroTermos = 10;
  
  GeradorFibonacci();
  
  // gerar a sequência de Fibonacci
  List<int> gerarSequencia(int n) {
    List<int> fibonacci = [];
    
    if (n <= 0) {
      return fibonacci;
    }
    
    if (n >= 1) {
      fibonacci.add(0);
    }
    
    if (n >= 2) {
      fibonacci.add(1);
    }
    
    for (int i = 2; i < n; i++) {
      int proximoTermo = fibonacci[i - 1] + fibonacci[i - 2];
      fibonacci.add(proximoTermo);
    }
    
    return fibonacci;
  }
  
  // calcular um termo específico
  int calcularTermoRecursivo(int n) {
    if (n <= 0) return 0;
    if (n == 1) return 1;
    print('olha aqui! $n');
    return calcularTermoRecursivo(n - 1) + calcularTermoRecursivo(n - 2);
  }
  
  void exibirSequencia(List<int> sequencia) {
    print('Sequência de Fibonacci com ${sequencia.length} termos:');
    print('');
    
    // printa cada termo com sua posição
    for (int i = 0; i < sequencia.length; i++) {
      print('  Termo ${i + 1}: ${sequencia[i]}');
    }
    
    print('');
    
    // printa a sequência em uma linha
    String sequenciaTexto = '';
    for (int i = 0; i < sequencia.length; i++) {
      sequenciaTexto += sequencia[i].toString();
      if (i < sequencia.length - 1) {
        sequenciaTexto += ', ';
      }
    }
    
    print('Sequência completa: $sequenciaTexto');
  }
  
  // executar a geração
  void executar() {
    print('Gerando $_numeroTermos termos da sequência de Fibonacci');
    print('');
    
    List<int> sequencia = gerarSequencia(_numeroTermos);
    
    exibirSequencia(sequencia);
  }
  
  // getter e setter
  int get numeroTermos => _numeroTermos;
  set numeroTermos(int novoNumero) => _numeroTermos = novoNumero;
}

