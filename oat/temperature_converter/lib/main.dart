// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Conversor de Temperatura',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      home: const TemperatureConverter(),
    );
  }
}

class TemperatureConverter extends StatefulWidget {
  const TemperatureConverter({super.key});

  @override
  State<TemperatureConverter> createState() => _TemperatureConverterState();
}

class _TemperatureConverterState extends State<TemperatureConverter> {
  bool isCelsiusToFahrenheit = true;
  final TextEditingController _inputController = TextEditingController(text: "0");
  double _result = 32.0;
  List<TemperatureConversion> _history = [];
  
  // Valores comuns de temperatura
  final Map<String, double> _commonCelsiusValues = {
    "Freezing: 0°C": 0,
    "Room Temp: 20°C": 20,
    "Body Temp: 37°C": 37,
    "Boiling: 100°C": 100,
  };

  final Map<String, double> _commonFahrenheitValues = {
    "Freezing: 32°F": 32,
    "Room Temp: 68°F": 68,
    "Body Temp: 98.6°F": 98.6,
    "Boiling: 212°F": 212,
  };

  @override
  void initState() {
    super.initState();
    _convertTemperature();
  }
  
  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }

  void _convertTemperature() {
    double? inputValue = double.tryParse(_inputController.text);
    if (inputValue == null) return;
    
    setState(() {
      if (isCelsiusToFahrenheit) {
        // Celsius para Fahrenheit: (°C × 9/5) + 32 = °F
        _result = (inputValue * 9/5) + 32;
        // Adicionar à história
        _history.add(TemperatureConversion(
          inputValue, 
          _result, 
          isCelsiusToFahrenheit
        ));
      } else {
        // Fahrenheit para Celsius: (°F − 32) × 5/9 = °C
        _result = (inputValue - 32) * 5/9;
        // Adicionar à história
        _history.add(TemperatureConversion(
          inputValue, 
          _result, 
          isCelsiusToFahrenheit
        ));
      }
      
      // Limitar histórico a 5 conversões
      if (_history.length > 5) {
        _history = _history.sublist(_history.length - 5);
      }
    });
  }

  void _toggleConversion() {
    setState(() {
      isCelsiusToFahrenheit = !isCelsiusToFahrenheit;
      // Trocar o valor de entrada com o resultado
      final temp = _inputController.text;
      _inputController.text = _result.toStringAsFixed(1);
      _convertTemperature();
    });
  }

  void _setCommonValue(double value) {
    setState(() {
      _inputController.text = value.toString();
      _convertTemperature();
    });
  }

  Color _getTemperatureColor(double temp) {
    if (isCelsiusToFahrenheit) {
      // Para Fahrenheit
      if (temp < 32) return Colors.blue.shade800; // Muito frio
      if (temp < 50) return Colors.blue.shade400; // Frio
      if (temp < 68) return Colors.green.shade300; // Fresco
      if (temp < 77) return Colors.green; // Agradável
      if (temp < 86) return Colors.yellow; // Quente
      if (temp < 95) return Colors.orange; // Muito quente
      return Colors.red; // Extremamente quente
    } else {
      // Para Celsius
      if (temp < 0) return Colors.blue.shade800; // Muito frio
      if (temp < 10) return Colors.blue.shade400; // Frio
      if (temp < 20) return Colors.green.shade300; // Fresco
      if (temp < 25) return Colors.green; // Agradável
      if (temp < 30) return Colors.yellow; // Quente
      if (temp < 35) return Colors.orange; // Muito quente
      return Colors.red; // Extremamente quente
    }
  }

  String _getTemperatureDescription(double temp) {
    if (isCelsiusToFahrenheit) {
      // Para temperatura em Fahrenheit
      if (_result < 32) return "Muito frio";
      if (_result < 50) return "Frio";
      if (_result < 68) return "Fresco";
      if (_result < 77) return "Agradável";
      if (_result < 86) return "Quente";
      if (_result < 95) return "Muito quente";
      return "Extremamente quente";
    } else {
      // Para temperatura em Celsius
      if (_result < 0) return "Muito frio";
      if (_result < 10) return "Frio";
      if (_result < 20) return "Fresco";
      if (_result < 25) return "Agradável";
      if (_result < 30) return "Quente";
      if (_result < 35) return "Muito quente";
      return "Extremamente quente";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      body: SafeArea(
        child: Center(
          child: Card(
            margin: const EdgeInsets.all(16),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Título e botão switch
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.thermostat,
                              color: Colors.blue,
                              size: 30,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Temperature Converter',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: _toggleConversion,
                          child: const Text('Switch'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    
                    // Input da temperatura
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Enter ${isCelsiusToFahrenheit ? "Celsius" : "Fahrenheit"}:',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextField(
                          controller: _inputController,
                          keyboardType: TextInputType.numberWithOptions(decimal: true),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            suffixText: isCelsiusToFahrenheit ? '°C' : '°F',
                            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                          ),
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9.-]')),
                          ],
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              _convertTemperature();
                            }
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    
                    // Resultado da conversão
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Result in ${isCelsiusToFahrenheit ? "Fahrenheit" : "Celsius"}:',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  // Termômetro visual
                                  Expanded(
                                    child: Container(
                                      height: 20,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        gradient: LinearGradient(
                                          colors: [
                                            Colors.blue.shade800,
                                            Colors.blue.shade400,
                                            Colors.green.shade300,
                                            Colors.green,
                                            Colors.yellow,
                                            Colors.orange,
                                            Colors.red,
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        '${_result.toStringAsFixed(1)}${isCelsiusToFahrenheit ? "°F" : "°C"}',
                                        style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              // Descrição da temperatura
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                                decoration: BoxDecoration(
                                  color: _getTemperatureColor(_result).withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  _getTemperatureDescription(_result),
                                  style: TextStyle(
                                    color: _getTemperatureColor(_result),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    
                    // Valores comuns
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Common ${isCelsiusToFahrenheit ? "Celsius" : "Fahrenheit"} Values:',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: (isCelsiusToFahrenheit
                              ? _commonCelsiusValues.entries
                              : _commonFahrenheitValues.entries)
                              .map((entry) => ActionChip(
                                label: Text(entry.key),
                                onPressed: () => _setCommonValue(entry.value),
                                backgroundColor: Colors.blue.shade100,
                              ))
                              .toList(),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    
                    // Histórico de conversão
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Conversion History',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  _history.clear();
                                });
                              },
                              child: Text('Clear'),
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.blue,
                                visualDensity: VisualDensity.compact,
                                padding: EdgeInsets.zero,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Column(
                          children: _history.reversed.map((conversion) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${conversion.input.toStringAsFixed(1)}${conversion.isCelsiusToFahrenheit ? "°C" : "°F"}',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  Icon(Icons.arrow_forward, size: 16, color: Colors.grey),
                                  Text(
                                    '${conversion.result.toStringAsFixed(1)}${conversion.isCelsiusToFahrenheit ? "°F" : "°C"}',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    
                    // Fórmula de conversão
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Conversion Formula:',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          isCelsiusToFahrenheit
                              ? '°F = (°C × 9/5) + 32'
                              : '°C = (°F − 32) × 5/9',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Classe para armazenar informações de conversão
class TemperatureConversion {
  final double input;
  final double result;
  final bool isCelsiusToFahrenheit;
  
  TemperatureConversion(this.input, this.result, this.isCelsiusToFahrenheit);
}