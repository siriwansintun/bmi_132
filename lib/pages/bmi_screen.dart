import 'package:bmi_132/pages/result_screen.dart';
import 'package:flutter/material.dart';

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({super.key});

  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  Color cardColor = const Color.fromRGBO(64, 64, 64, 1);
  bool startChecking = false;
  bool isMale = true;
  double height = 165;
  int weight = 65, age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BMI Calculator',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(40, 40, 40, 1),
      ),
      body: Container(
        color: const Color.fromRGBO(24, 24, 24, 1),
        child: Column(
          children: [
            //Male or Female
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    //Male Box
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            startChecking = true;
                            isMale = true;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: isMale & startChecking
                                  ? const Color.fromARGB(255, 33, 170, 255)
                                  : cardColor,
                              borderRadius: BorderRadius.circular(20.0)),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.male,
                                size: 85.0,
                                color: Colors.white,
                              ),
                              SizedBox(
                                height: 16.0,
                              ),
                              Text(
                                'ผู้ชาย',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(
                      width: 20.0,
                    ),

                    //Female Box
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            startChecking = true;
                            isMale = false;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: !isMale & startChecking
                                  ? const Color.fromARGB(255, 253, 112, 173)
                                  : cardColor,
                              borderRadius: BorderRadius.circular(20.0)),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.female,
                                size: 85.0,
                                color: Colors.white,
                              ),
                              SizedBox(
                                height: 16.0,
                              ),
                              Text(
                                'ผู้หญิง',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //Height
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: cardColor,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'ส่วนสูง',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //Number of height
                          Text(
                            '${height.round()}',
                            style: const TextStyle(
                              fontSize: 40.0,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                            ),
                          ),
                          //cm
                          const Text(
                            ' ซม.',
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ],
                      ),

                      const SizedBox(
                        height: 10.0,
                      ),

                      //slider
                      Slider(
                          activeColor: const Color.fromARGB(255, 244, 115, 163),
                          inactiveColor: Colors.white,
                          value: height,
                          max: 220.0,
                          min: 80.0,
                          onChanged: (value) {
                            setState(() {
                              height = value;
                            });
                          }),
                    ],
                  ),
                ),
              ),
            ),

            //Weight & Age
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    //Weight
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: cardColor,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //Weight text
                            const Text(
                              'น้ำหนัก',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),

                            //Number of weight
                            Text(
                              '$weight',
                              style: const TextStyle(
                                  fontSize: 40.0,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white),
                            ),

                            //remove & add Buttons

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                //remove
                                FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                  heroTag: 'w-',
                                  mini: true,
                                  backgroundColor: const Color.fromARGB(255, 255, 163, 197),
                                  child: const Icon(Icons.remove),
                                ),

                                //add
                                FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                  heroTag: 'w+',
                                  mini: true,
                                  backgroundColor: const Color.fromARGB(255, 255, 163, 197),
                                  child: const Icon(Icons.add),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(
                      width: 20.0,
                    ),

                    //Age
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: cardColor,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //Weight text
                            const Text(
                              'อายุ',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),

                            //Number of weight
                            Text(
                              '$age',
                              style: const TextStyle(
                                fontSize: 40.0,
                                fontWeight: FontWeight.w900,
                                color: Colors.white,
                              ),
                            ),

                            //remove & add Buttons

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                //remove
                                FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                  mini: true,
                                  backgroundColor: const Color.fromARGB(255, 255, 163, 197),
                                  heroTag: 'a-',
                                  child: const Icon(Icons.remove),
                                ),

                                //add
                                FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                  mini: true,
                                  backgroundColor: const Color.fromARGB(255, 255, 163, 197),
                                  heroTag: 'a+',
                                  child: const Icon(Icons.add),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //Calculate Button
            Container(
              width: double.infinity,
              color: const Color.fromARGB(255, 255, 122, 171),
              child: MaterialButton(
                onPressed: () {
                  double result;
                  double height1 = height / 100;
                  result = weight / (height1 * height1);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BmiResult(result)),
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    'คำนวณค่า BMI',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
