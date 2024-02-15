import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:an_app/widgets/reusable.dart';
import 'package:an_app/widgets/bottom_button.dart';

void saveResultsToFirebase(
    BuildContext context, String bmiResult, String resultText) {
  FirebaseFirestore.instance.collection('results').add({
    'bmiResult': bmiResult,
    'resultText': resultText,
    'timeStamp': Timestamp.now(),
  }).then((value) => ScaffoldMessenger.of(context)
      .showSnackBar(const SnackBar(content: Text('The result is saved'))));
}

class ResultsPage extends StatelessWidget {
  const ResultsPage(
      {super.key,
      required this.explanation,
      required this.bmiResult,
      required this.resultText});

  final String bmiResult;
  final String resultText;
  final String explanation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.only(left: 55),
            alignment: Alignment.bottomLeft,
            child: const Text(
              'Your Result',
              style: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 228, 191, 214)),
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: const Color.fromARGB(255, 32, 33, 56),
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultText.toUpperCase(),
                    style: const TextStyle(
                      color: Color.fromARGB(255, 25, 236, 120),
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    bmiResult,
                    style: const TextStyle(
                      fontSize: 100,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    explanation,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ReusableCard(
                    color: Theme.of(context).colorScheme.primary,
                    cardChild: TextButton(
                      onPressed: () {
                        saveResultsToFirebase(context, bmiResult, resultText);
                      },
                      style: const ButtonStyle(
                          minimumSize: MaterialStatePropertyAll(Size(120, 50))),
                      child: Text(
                        'SAVE RESULT',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          BottomButton(
            buttonTitle: 'RE-CALCULATE',
            tapped: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
