// Calculadora de Média de Notas

class CalculadoraMedia {
  List<double> _notas = [7.5, 9.0, 6.8, 8.2];
  double _mediaMinima = 6.0;
  
  CalculadoraMedia();
  
  // calcular a média das notas
  double calcularMedia() {
    if (_notas.isEmpty) {
      return 0.0;
    }
    
    double soma = 0.0;
    
    for (double nota in _notas) {
      soma += nota;
    }
    
    return soma / _notas.length;
  }
  
  // verificar se o aluno tá aprovado
  bool estaAprovado(double media) {
    return media >= _mediaMinima;
  }
  
  void exibirNotas() {
    print('Notas do aluno:');
    for (int i = 0; i < _notas.length; i++) {
      print('  Nota ${i + 1}: ${_notas[i]}');
    }
  }
  
  void executar() {
    exibirNotas();
    print('');
    
    double media = calcularMedia();
    print('Média calculada: ${media.toStringAsFixed(2)}');
    
    if (estaAprovado(media)) {
      print('Situação: APROVADO!');
      print('Você atingiu a média mínima de $_mediaMinima');
    } else {
      print('Situação: REPROVADO');
      print('Você precisa de pelo menos $_mediaMinima para ser aprovado');
      double pontosNecessarios = _mediaMinima - media;
      print('Faltaram ${pontosNecessarios.toStringAsFixed(2)} pontos');
    }
  }
  
  // getter e setter
  List<double> get notas => _notas;
  double get mediaMinima => _mediaMinima;
  
  set notas(List<double> novasNotas) => _notas = novasNotas;
  set mediaMinima(double novaMedia) => _mediaMinima = novaMedia;
}

