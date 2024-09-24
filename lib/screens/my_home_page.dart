import 'package:expressions/expressions.dart';
import 'package:flutter/material.dart';
import 'package:calculator_app/screens/custom_widgets.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var displayText = " ";

  // when any button is pressed
  void buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        displayText = ''; // Clear the display text
      } else if (buttonText == 'BACKSPACE') {
        if (displayText.isNotEmpty) {
          displayText = displayText.substring(
              0, displayText.length - 1); // Remove last character
        }
      } else if (buttonText == '=') {
        displayText =
            evaluateExpression(displayText); // Evaluate the expression
      } else {
        displayText += buttonText; // Append the button text
      }
    });
  }

  String evaluateExpression(String expression) {
    try {
      // Replace custom symbols with standard Dart operators
      expression = expression.replaceAll('X', '*').replaceAll('÷', '/');

      // Create an expression using the 'expressions' package
      final exp = Expression.parse(expression);

      // Define a context (an empty map in this case)
      final evaluator = const ExpressionEvaluator();
      final result = evaluator.eval(exp, {});

      // Return the result as a string
      return result.toString();
    } catch (e) {
      // If there's an error in the expression, return 'Error'
      return "Error";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 12, left: 12, right: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Text(
                displayText,
                style: const TextStyle(
                  fontSize: 50,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {
                        buttonPressed('BACKSPACE');
                      },
                      child: Icon(
                        Icons.backspace_rounded,
                        color: Colors.grey[200],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const Divider(),

            const SizedBox(
              height: 12,
            ),

            Expanded(
              child: ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // C button
                      CalculatorButton(
                        label: 'C',
                        color: Colors.grey[800]!,
                        onTap: () {
                          buttonPressed('C');
                        },
                      ),

                      // () button
                      CalculatorButton(
                        label: '()',
                        color: Colors.deepPurple[800]!,
                        onTap: () {
                          buttonPressed('( )');
                        },
                      ),

                      // % button
                      CalculatorButton(
                        label: '%',
                        color: Colors.deepPurple[800]!,
                        onTap: () {
                          buttonPressed('%');
                        },
                      ),

                      // ÷ button
                      CalculatorButton(
                        label: '÷',
                        color: Colors.deepPurple[800]!,
                        onTap: () {
                          buttonPressed('÷');
                        },
                      ),
                    ],
                  ),
                  
                  const SizedBox(
                    height: 10,
                  ),
                  
                  //bottom row - 4
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // 7 button
                      CalculatorButton(
                        label: '7',
                        color: Colors.grey[800]!,
                        onTap: () {
                          buttonPressed('7');
                        },
                      ),

                      // 8 button
                      CalculatorButton(
                        label: '8',
                        color: Colors.grey[800]!,
                        onTap: () {
                          buttonPressed('8');
                        },
                      ),

                      // 9 button
                      CalculatorButton(
                        label: '9',
                        color: Colors.grey[800]!,
                        onTap: () {
                          buttonPressed('9');
                        },
                      ),

                      // x button
                      CalculatorButton(
                        label: 'x',
                        color: Colors.deepPurple[800]!,
                        onTap: () {
                          buttonPressed('*');
                        },
                      ),
                    ],
                  ),
                  
                  const SizedBox(
                    height: 10,
                  ),
                  
                  //bottom row - 3
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // 4 button
                      CalculatorButton(
                        label: '4',
                        color: Colors.grey[800]!,
                        onTap: () {
                          buttonPressed('4');
                        },
                      ),

                      // 5 button
                      CalculatorButton(
                        label: '5',
                        color: Colors.grey[800]!,
                        onTap: () {
                          buttonPressed('5');
                        },
                      ),

                      // 6 button
                      CalculatorButton(
                        label: '6',
                        color: Colors.grey[800]!,
                        onTap: () {
                          buttonPressed('6');
                        },
                      ),

                      // - button
                      CalculatorButton(
                        label: '-',
                        color: Colors.deepPurple[800]!,
                        onTap: () {
                          buttonPressed('-');
                        },
                      ),
                    ],
                  ),
                  
                  const SizedBox(
                    height: 10,
                  ),
                  
                  //bottom row - 2
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // 1 button
                      CalculatorButton(
                        label: '1',
                        color: Colors.grey[800]!,
                        onTap: () {
                          buttonPressed('1');
                        },
                      ),

                      // 2 button
                      CalculatorButton(
                        label: '2',
                        color: Colors.grey[800]!,
                        onTap: () {
                          buttonPressed('2');
                        },
                      ),

                      // 3 button
                      CalculatorButton(
                        label: '3',
                        color: Colors.grey[800]!,
                        onTap: () {
                          buttonPressed('3');
                        },
                      ),

                      // + button
                      CalculatorButton(
                        label: '+',
                        color: Colors.deepPurple[800]!,
                        onTap: () {
                          buttonPressed('+');
                        },
                      ),
                    ],
                  ),
                  
                  const SizedBox(
                    height: 10,
                  ),
                  
                  //bottom row - 1
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CalculatorButton(
                        label: '+/-',
                        color: Colors.grey[800]!,
                        onTap: () {
                          buttonPressed('+/-');
                        },
                      ),
                      CalculatorButton(
                        label: '0',
                        color: Colors.grey[800]!,
                        onTap: () {
                          buttonPressed('0');
                        },
                      ),
                      CalculatorButton(
                        label: '.',
                        color: Colors.grey[800]!,
                        onTap: () {
                          buttonPressed('.');
                        },
                      ),
                      CalculatorButton(
                        label: '=',
                        color: Colors.deepPurple[800]!,
                        onTap: () {
                          buttonPressed('=');
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}