// Verifica se um número é primo e lista divisores se não for

class VerificadorPrimo {
  int _numero = 29;
  
  VerificadorPrimo();
  // verifica se o número é primo
  bool ehPrimo(int numero) {
    if (numero < 2) {
      return false;
    }
    
    if (numero == 2) {
      return true;
    }
    
    if (numero % 2 == 0) {
      return false;
    }
    
    for (int i = 3; i * i <= numero; i += 2) {
      if (numero % i == 0) {
        return false;
      }
    }
    
    return true;
  }
  
  // encontrar todos os divisores de um número
  List<int> encontrarDivisores(int numero) {
    List<int> divisores = [];
    
    for (int i = 1; i <= numero; i++) {
      if (numero % i == 0) {
        divisores.add(i);
      }
    }
    
    return divisores;
  }
  
  // executar a verificação
  void executar() {
    print('Número analisado: $_numero');
    print('');
    
    if (ehPrimo(_numero)) {
      print('O número $_numero é primo!');
      print('Um número primo só é divisível por 1 e por ele mesmo.');
    } else {
      print('O número $_numero não é primo.');
      print('');
      
      // encontrar e exibir os divisores
      List<int> divisores = encontrarDivisores(_numero);
      print('Divisores de $_numero:');
      
      String divisoresTexto = '';
      for (int i = 0; i < divisores.length; i++) {
        divisoresTexto += divisores[i].toString();
        if (i < divisores.length - 1) {
          divisoresTexto += ', ';
        }
      }
      
      print('  $divisoresTexto');
      print('Total de divisores: ${divisores.length}');
    }
  }
  
  // getter e setter
  int get numero => _numero;
  set numero(int novoNumero) => _numero = novoNumero;
}

