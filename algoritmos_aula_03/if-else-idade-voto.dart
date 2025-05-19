void main() {
  int anoNascimento = 2006;
  int anoAtual = 2025;
  int idade = anoAtual - anoNascimento;
  
  print('Verificador de Idade para Votar');
  print('==============================');
  print('Ano de nascimento: $anoNascimento');
  print('Idade: $idade anos');
  
  if (idade >= 16) {
    print('Pode votar.');
  } else {
    print('Não pode votar.');
  }
}