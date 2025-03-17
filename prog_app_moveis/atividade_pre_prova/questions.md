## Questão 1: Diferença entre final e const

**Final vs Const:**
- `final`: Variável que só pode ser atribuída uma vez, mas seu valor pode ser definido em tempo de execução
- `const`: Variável que é constante em tempo de compilação, ou seja, o valor deve ser conhecido antes da execução do programa

**Exemplos:**
```dart
// final - valor pode ser calculado em runtime
final DateTime agora = DateTime.now(); // OK
final String nome = getNomeUsuario(); // OK

// const - valor deve ser conhecido em compile-time
const int PI = 3.14159; // OK
const String saudacao = "Olá Mundo"; // OK
const DateTime hoje = DateTime.now(); // ERRO! Não é compile-time constant
```

Use `final` quando precisa de um valor imutável que depende de algo calculado em runtime, e `const` quando o valor é conhecido em tempo de compilação.

## Questão 2: Estrutura if/else em Dart

A estrutura if/else permite executar blocos de código com base em condições:

```dart
void main() {
  int numero = -5;
  
  if (numero > 0) {
    print("O número $numero é positivo.");
  } else if (numero < 0) {
    print("O número $numero é negativo.");
  } else {
    print("O número é zero.");
  }
}
```

## Questão 3: Herança vs. Composição

**Herança:**
- Relação "é um"
- Uma classe derivada herda características da classe base
- Use quando uma classe é realmente um tipo específico de outra

**Composição:**
- Relação "tem um"
- Uma classe contém instâncias de outras classes
- Use quando uma classe precisa funcionalidade de outra, mas não é um subtipo

**Exemplos:**
```dart
// Herança
class Animal {
  void respirar() => print("Respirando");
}

class Cachorro extends Animal {
  void latir() => print("Au au");
}

// Composição
class Motor {
  void ligar() => print("Motor ligado");
}

class Carro {
  final Motor motor = Motor();
  
  void iniciar() {
    motor.ligar();
    print("Carro pronto para andar");
  }
}
```

## Questão 4: Switch/Case em Dart

A estrutura switch/case avalia uma expressão e executa código baseado em casos específicos:

```dart
void main() {
  String diaSemana = "quarta";
  
  switch (diaSemana) {
    case "segunda":
      print("Início de semana");
      break;
    case "terça":
    case "quarta":
    case "quinta":
      print("Meio de semana");
      break;
    case "sexta":
      print("Quase fim de semana");
      break;
    case "sábado":
    case "domingo":
      print("Fim de semana!");
      break;
    default:
      print("Dia inválido");
  }
}
```

Switch/case é melhor quando há muitos valores possíveis para uma única variável. If/else é melhor para condições complexas ou distintas.

## Questão 5: List vs Map em Dart

**List:**
- Coleção ordenada de elementos acessíveis por índice
- Use quando a ordem importa e você precisa acessar por posição

**Map:**
- Coleção de pares chave-valor
- Use quando precisa associar valores a identificadores específicos

```dart
void main() {
  // Lista
  List<String> frutas = ["maçã", "banana", "laranja"];
  frutas.add("uva");
  print(frutas[1]); // Imprime: banana
  
  // Map
  Map<String, double> precos = {
    "maçã": 2.5,
    "banana": 1.3,
    "laranja": 3.0
  };
  precos["uva"] = 4.2;
  print(precos["banana"]); // Imprime: 1.3
}
```

## Questão 6: For, While e Do/While em Dart

**For:** Use quando sabe exatamente quantas vezes o loop deve executar
```dart
void main() {
  List<int> numeros = [30, 60, 90, 10, 70, 40];
  
  for (int i = 0; i < numeros.length; i++) {
    if (numeros[i] > 50) {
      print(numeros[i]);
    }
  }
  
  // Alternativa com for-in
  for (int numero in numeros) {
    if (numero > 50) {
      print(numero);
    }
  }
}
```

**While:** Use quando não sabe quantas vezes, mas precisa verificar a condição antes de entrar no loop
```dart
void main() {
  List<int> numeros = [30, 60, 90, 10, 70, 40];
  int i = 0;
  
  while (i < numeros.length) {
    if (numeros[i] > 50) {
      print(numeros[i]);
    }
    i++;
  }
}
```

**Do/While:** Use quando precisa executar o loop pelo menos uma vez
```dart
void main() {
  List<int> numeros = [30, 60, 90, 10, 70, 40];
  int i = 0;
  
  do {
    if (numeros[i] > 50) {
      print(numeros[i]);
    }
    i++;
  } while (i < numeros.length);
}
```

## Questão 7: Soma dos números ímpares

```dart
void main() {
  List<int> numeros = [10, 15, 20, 25, 30, 35, 40, 45, 50, 55];
  
  int soma = 0;
  for (int numero in numeros) {
    if (numero % 2 != 0) { // Verifica se é ímpar
      soma += numero;
    }
  }
  
  print("A soma dos números ímpares é: $soma");
}
```

## Questão 8: Verificar palíndromo

```dart
void main() {
  String palavra = "Apos a sopa";
  
  // Remover espaços e converter para minúsculas
  String processada = palavra.toLowerCase().replaceAll(' ', '');
  
  // Inverter a string
  String invertida = processada.split('').reversed.join('');
  
  if (processada == invertida) {
    print("'$palavra' é um palíndromo");
  } else {
    print("'$palavra' não é um palíndromo");
  }
}
```