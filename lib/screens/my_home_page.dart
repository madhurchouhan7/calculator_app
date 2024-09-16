import 'package:expressions/expressions.dart';
import 'package:flutter/material.dart';

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

            Row(
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

            const Divider(),

            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //C button
                InkWell(
                  highlightColor: Colors.grey[800],
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {
                    buttonPressed('C');
                  },
                  child: Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Center(
                      child: Text(
                        " C ",
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                ),

                // () button
                InkWell(
                  highlightColor: Colors.deepPurple[800],
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {
                    buttonPressed('()');
                  },
                  child: Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple[800],
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Center(
                      child: Text(
                        "( )",
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                ),

                // %
                InkWell(
                  highlightColor: Colors.deepPurple[800],
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {
                    buttonPressed('%');
                  },
                  child: Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple[800],
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Center(
                      child: Text(
                        " % ",
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                ),

                // ÷ button
                InkWell(
                  highlightColor: Colors.deepPurple[800],
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {
                    buttonPressed('÷');
                  },
                  child: Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple[800],
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Center(
                      child: Text(
                        " ÷ ",
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
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
                //7 button
                InkWell(
                  highlightColor: Colors.grey[800],
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {
                    buttonPressed('7');
                  },
                  child: Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Center(
                      child: Text(
                        " 7 ",
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                ),

                // 8 button
                InkWell(
                  highlightColor: Colors.grey[800],
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {
                    buttonPressed('8');
                  },
                  child: Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Center(
                      child: Text(
                        "8",
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                ),

                // 9
                InkWell(
                  highlightColor: Colors.grey[800],
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {
                    buttonPressed('9');
                  },
                  child: Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Center(
                      child: Text(
                        " 9 ",
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                ),

                // X button
                InkWell(
                  highlightColor: Colors.deepPurple[800],
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {
                    buttonPressed('*');
                  },
                  child: Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple[800],
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Center(
                      child: Text(
                        " X ",
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
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
                //4 button
                InkWell(
                  highlightColor: Colors.grey[800],
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {
                    buttonPressed('4');
                  },
                  child: Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Center(
                      child: Text(
                        " 4 ",
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                ),

                // 5 button
                InkWell(
                  highlightColor: Colors.grey[800],
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {
                    buttonPressed('5');
                  },
                  child: Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Center(
                      child: Text(
                        "5",
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                ),

                // 6
                InkWell(
                  highlightColor: Colors.grey[800],
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {
                    buttonPressed('6');
                  },
                  child: Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Center(
                      child: Text(
                        " 6 ",
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                ),

                // - button
                InkWell(
                  highlightColor: Colors.deepPurple[800],
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {
                    buttonPressed('-');
                  },
                  child: Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple[800],
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Center(
                      child: Text(
                        " - ",
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
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
                //1 button
                InkWell(
                  highlightColor: Colors.grey[800],
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {
                    buttonPressed('1');
                  },
                  child: Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Center(
                      child: Text(
                        " 1 ",
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                ),

                // 2 button
                InkWell(
                  highlightColor: Colors.grey[800],
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {
                    buttonPressed('2');
                  },
                  child: Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Center(
                      child: Text(
                        "2",
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                ),

                // 3
                InkWell(
                  highlightColor: Colors.grey[800],
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {
                    buttonPressed('3');
                  },
                  child: Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Center(
                      child: Text(
                        " 3 ",
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                ),

                // + button
                InkWell(
                  highlightColor: Colors.deepPurple[800],
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {
                    buttonPressed('+');
                  },
                  child: Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple[800],
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Center(
                      child: Text(
                        " + ",
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
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
                // + or - thing button
                InkWell(
                  highlightColor: Colors.grey[800],
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {
                    buttonPressed('+/-');
                  },
                  child: Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Center(
                      child: Text(
                        "+/-",
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                ),

                //zero button
                InkWell(
                  highlightColor: Colors.grey[800],
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {
                    buttonPressed('0');
                  },
                  child: Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Center(
                      child: Text(
                        "0",
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                ),

                // dot or decimal
                InkWell(
                  highlightColor: Colors.grey[800],
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {
                    buttonPressed('.');
                  },
                  child: Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Center(
                      child: Text(
                        " . ",
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                ),

                // equals to button
                InkWell(
                  highlightColor: Colors.deepPurple[800],
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {
                    buttonPressed('=');
                  },
                  child: Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple[800],
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Center(
                      child: Text(
                        " = ",
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
