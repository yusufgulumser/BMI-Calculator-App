import 'package:an_app/screens/about_us.dart';
import 'package:an_app/screens/saved_screen.dart';
import 'package:an_app/widgets/drawer.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:an_app/widgets/icon_content.dart';
import 'package:an_app/widgets/reusable.dart';
import 'package:an_app/screens/result_page.dart';
import 'package:an_app/widgets/bottom_button.dart';
import 'package:an_app/widgets/round_icon.dart';
import 'package:an_app/calculation/calc.dart';

enum Gender {
  male,
  female,
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen> {
  Gender? chosenGender;
  int height = 180;
  int weight = 60;
  int age = 20;

  _setScreen(String identifier) {
    if (identifier == 'saved') {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (ctx) => const SavedResultsPage()));
    }
    if (identifier == 'aboutUs') {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (ctx) => AboutUs()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      drawer: MainDrawer(onTap: _setScreen),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        chosenGender = Gender.male;
                      });
                    },
                    color: chosenGender == Gender.male
                        ? const Color.fromARGB(255, 1, 2, 15)
                        : const Color.fromARGB(255, 32, 33, 56),
                    cardChild: const IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        chosenGender = Gender.female;
                      });
                    },
                    color: chosenGender == Gender.female
                        ? const Color.fromARGB(255, 1, 2, 15)
                        : const Color.fromARGB(255, 32, 33, 56),
                    cardChild: const IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'Female',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: const Color.fromARGB(255, 32, 33, 56),
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'HEIGHT',
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Color.fromARGB(255, 141, 142, 152)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: const TextStyle(
                          fontSize: 50.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const Text(
                        'cm',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Color.fromARGB(255, 141, 142, 152),
                        ),
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor:
                          const Color.fromARGB(255, 143, 144, 154),
                      activeTrackColor: Colors.white,
                      thumbColor: const Color.fromARGB(255, 235, 21, 85),
                      overlayColor: const Color.fromARGB(41, 235, 21, 85),
                      thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          const RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: const Color.fromARGB(255, 32, 33, 56),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'WEIGHT',
                          style: TextStyle(
                              fontSize: 18.0,
                              color: Color.fromARGB(255, 141, 142, 152)),
                        ),
                        Text(
                          weight.toString(),
                          style: const TextStyle(
                            fontSize: 50.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                }),
                            const SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: const Color.fromARGB(255, 32, 33, 56),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'AGE',
                          style: TextStyle(
                              fontSize: 18.0,
                              color: Color.fromARGB(255, 141, 142, 152)),
                        ),
                        Text(
                          age.toString(),
                          style: const TextStyle(
                            fontSize: 50.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(
                                  () {
                                    age--;
                                  },
                                );
                              },
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                })
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonTitle: 'CALCULATE',
            tapped: () {
              Calculator calc = Calculator(height: height, weight: weight);

              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmiResult: calc.calculateBmi(),
                    resultText: calc.getResult(),
                    explanation: calc.getExp(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
