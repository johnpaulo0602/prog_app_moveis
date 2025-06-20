import 'conversor_temperatura.dart';
import 'calculadora_media.dart';
import 'verificador_primo.dart';
import 'gerador_fibonacci.dart';
import 'calculadora_desconto.dart';
import 'dart:io';

void main() {
  print('=== PROJETO DART OAT PROG APP MÓVEIS ===\n');
  print('Escolha o programa que deseja executar:');
  print('1. Conversor de Temperatura');
  print('2. Calculadora de Média de Notas');
  print('3. Verificador de Números Primos');
  print('4. Gerador de Fibonacci');
  print('5. Calculadora de Desconto');
  stdout.write('Digite o número do programa (1-5): ');
  String? escolha = stdin.readLineSync();

  switch (escolha) {
    case '1':
      var conversor = ConversorTemperatura();
      conversor.executar();
      break;
    case '2':
      var calculadoraMedia = CalculadoraMedia();
      calculadoraMedia.executar();
      break;
    case '3':
      var verificadorPrimo = VerificadorPrimo();
      verificadorPrimo.executar();
      break;
    case '4':
      var geradorFib = GeradorFibonacci();
      geradorFib.executar();
      break;
    case '5':
      var calculadoraDesconto = CalculadoraDesconto();
      calculadoraDesconto.executar();
      break;
    default:
      print('Opção inválida. Por favor, escolha um número de 1 a 5.');
  }
}

