## Exercício 1: Conceitos de POO

**Abstração**: É a simplificação da realidade, pegando só o que importa para o sistema. Por exemplo, numa biblioteca, a classe Livro teria título, autor e ISBN, mas não precisaria ter informações como peso do papel ou tipo de cola usada na encadernação.
```dart
class Livro {
  String titulo;
  String autor;
  String isbn;
}
```

**Encapsulamento**: É esconder detalhes internos e só expor o necessário. Na biblioteca, a classe Usuário teria senha protegida, permitindo acesso apenas por métodos seguros.
```dart
class Usuario {
  String nome;
  String _senha; // privado
  
  bool verificarSenha(String tentativa) {
    return _senha == tentativa;
  }
}
```

**Herança**: Permite criar classes novas baseadas em existentes. Na biblioteca, poderia ter uma classe Pessoa, e depois Bibliotecario e Leitor que herdam de Pessoa.
```dart
class Pessoa {
  String nome;
  String cpf;
}

class Bibliotecario extends Pessoa {
  String turno;
  void catalogarLivro() {}
}
```

**Polimorfismo**: Permite que objetos de classes diferentes respondam ao mesmo método de formas diferentes. Na biblioteca, classes ItemBiblioteca (Livro, DVD, Revista) teriam um método calcularMulta() que funciona diferente para cada tipo.
```dart
abstract class ItemBiblioteca {
  double calcularMulta(int diasAtraso);
}

class Livro extends ItemBiblioteca {
  double calcularMulta(int diasAtraso) => diasAtraso * 0.50;
}

class DVD extends ItemBiblioteca {
  double calcularMulta(int diasAtraso) => diasAtraso * 1.00;
}
```

## Exercício 2: POO vs Programação Funcional

**Diferenças principais:**
- POO organiza código em objetos que combinam dados e comportamentos, enquanto Programação Funcional separa dados e funções
- POO usa estado mutável, Funcional prefere imutabilidade
- POO usa herança, Funcional usa composição de funções

**Vantagens POO:**
- Fácil de modelar objetos do mundo real
- Reutilização via herança
- Encapsulamento protege dados

**Desvantagens POO:**
- Pode ficar complexo com muitas classes
- Mutabilidade pode causar bugs difíceis de achar

**Vantagens Funcional:**
- Código mais previsível pela imutabilidade
- Funções puras são fáceis de testar
- Paralelismo mais fácil

**Desvantagens Funcional:**
- Curva de aprendizado íngreme
- Modelagem de alguns problemas pode ser menos intuitiva

## Exercício 3: Classe Pessoa em Dart

```dart
class Pessoa {
  String nome;
  int idade;
  String endereco;
  
  Pessoa(this.nome, this.idade, this.endereco);
  
  void exibirDetalhes() {
    print('Nome: $nome');
    print('Idade: $idade');
    print('Endereço: $endereco');
  }
}

void main() {
  var pessoa = Pessoa('Maria Silva', 25, 'Rua ABC, 123');
  pessoa.exibirDetalhes();
}
```

## Exercício 4: Herança e Polimorfismo

```dart
abstract class Animal {
  void fazerSom();
}

class Cachorro extends Animal {
  @override
  void fazerSom() {
    print('Au Au');
  }
}

class Gato extends Animal {
  @override
  void fazerSom() {
    print('Miau');
  }
}

void main() {
  List<Animal> animais = [
    Cachorro(),
    Gato(),
    Cachorro(),
    Gato()
  ];
  
  for (var animal in animais) {
    animal.fazerSom();
  }
}
```

## Exercício 5: Encapsulamento e Manipulação de Dados

```dart
class ContaBancaria {
  String numeroConta;
  double _saldo = 0.0;
  
  ContaBancaria(this.numeroConta);
  
  double get saldo => _saldo;
  
  bool depositar(double valor) {
    if (valor > 0) {
      _saldo += valor;
      return true;
    }
    return false;
  }
  
  bool sacar(double valor) {
    if (valor > 0 && valor <= _saldo) {
      _saldo -= valor;
      return true;
    }
    return false;
  }
}

void main() {
  var conta = ContaBancaria('12345-6');
  
  print('Saldo inicial: ${conta.saldo}');
  
  conta.depositar(1000);
  print('Após depósito: ${conta.saldo}');
  
  if (conta.sacar(300)) {
    print('Saque realizado com sucesso');
  } else {
    print('Saque não permitido');
  }
  
  print('Saldo final: ${conta.saldo}');
}
```