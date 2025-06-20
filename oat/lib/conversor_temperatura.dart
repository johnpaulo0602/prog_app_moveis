// Conversor de Temperatura

class ConversorTemperatura {
  double _temperaturaFahrenheit = 68.0;
  double _temperaturaCelsius = 20.0;
  
  ConversorTemperatura();
  
  double fahrenheitParaCelsius(double fahrenheit) {
    // formula: C = (F - 32) * 5/9
    return (fahrenheit - 32) * 5 / 9;
  }
  
  double celsiusParaFahrenheit(double celsius) {
    // formula: F = C * 9/5 + 32
    return celsius * 9 / 5 + 32;
  }
  
  void executar() {
    print('Temperatura inicial em Fahrenheit: ${_temperaturaFahrenheit}°F');
    
    double resultadoCelsius = fahrenheitParaCelsius(_temperaturaFahrenheit);
    print('Convertido para Celsius: ${resultadoCelsius.toStringAsFixed(1)}°C');
    
    print('');
    
    print('Temperatura inicial em Celsius: ${_temperaturaCelsius}°C');
    
    double resultadoFahrenheit = celsiusParaFahrenheit(_temperaturaCelsius);
    print('Convertido para Fahrenheit: ${resultadoFahrenheit.toStringAsFixed(1)}°F');
  }
  
  // getter
  double get temperaturaFahrenheit => _temperaturaFahrenheit;
  double get temperaturaCelsius => _temperaturaCelsius;
  
  // setter
  set temperaturaFahrenheit(double valor) => _temperaturaFahrenheit = valor;
  set temperaturaCelsius(double valor) => _temperaturaCelsius = valor;
}

