void main() {
  String nome = "JOAO";
  double salarioFixo = 500.00;
  double totalVendas = 1230.30;
  
  double comissao = totalVendas * 0.15;
  double salarioTotal = salarioFixo + comissao;
  
  print("TOTAL = R\$ ${salarioTotal.toStringAsFixed(2)}");
}