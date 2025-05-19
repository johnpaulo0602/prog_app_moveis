void main() {
  int codigo = 2;
  int quantidade = 2;
 
  Map<int, double> precos = {
    1: 4.00,
    2: 4.50,
    3: 5.00,
    4: 2.00,
    5: 1.50
  };
 
  double total = precos[codigo]! * quantidade;
  print("Total: RS ${total.toStringAsFixed(2)}");
 
}