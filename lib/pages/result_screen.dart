import 'package:flutter/material.dart';

class BmiResult extends StatelessWidget {
  final double result;
  final String state;
  final String feedback;

  BmiResult(this.result, {Key? key})
      : state = _calculateBmiState(result),
        feedback = bmiFeedBack(result),
        super(key: key);

  static String _calculateBmiState(double bmi) {
    if (bmi < 18.5) {
      return 'น้ำหนักต่ำกว่าเกณฑ์';
    } else if (bmi >= 18.5 && bmi <= 22.90) {
      return 'น้ำหนักปกติ';
    } else if (bmi >= 23 && bmi <= 24.9) {
      return 'น้ำหนักเกิน';
    } else if (bmi >= 25 && bmi <= 29.90) {
      return 'อ้วนระดับ 1';
    } else {
      return 'อ้วนระดับ 2 (อันตราย)';
    }
  }

  @override
  Widget build(BuildContext context) {
    String formattedBmi = result.toStringAsFixed(1);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ผลลัพธ์ BMI',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(40, 40, 40, 1),
      ),
      body: Container(
        color: const Color.fromRGBO(24, 24, 24, 1),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              state,
              style: const TextStyle(
                color: Color.fromARGB(255, 255, 167, 197),
                fontWeight: FontWeight.bold,
                fontSize: 50.0,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              'BMI ของคุณ: $formattedBmi',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              feedback,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
              textAlign: TextAlign.center,
            ),
            // Back Button
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(
                    context); // Navigate back to the previous screen (BmiCalculator)
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(
                    255, 255, 141, 183), // Specify the desired pink color
              ),
              child: const Text(
                'ลองใหม่อีกครั้ง',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String bmiFeedBack(double result) {
  if (result < 18.5) {
    return 'ค่า BMI น้อยกว่า 18.5 แสดงว่าอยู่ในเกณฑ์น้ำหนักต่ำกว่าเกณฑ์หรือผอม ซึ่งอาจส่งผลเสียต่อสุขภาพได้หลายประการ ดังนั้นควรเพิ่มน้ำหนักอย่างค่อยเป็นค่อยไป เพื่อให้ร่างกายได้รับสารอาหารและพลังงานที่เพียงพอ และควรปรึกษาแพทย์หรือนักโภชนาการเพื่อขอคำแนะนำที่เหมาะสมกับตนเอง';
  } else if (result >= 18.5 && result < 22.90) {
    return 'ค่า BMI ระหว่าง 18.5- 22.90 ซึ่งอยู่ในเกณฑ์ปกติ ห่างไกลโรคที่เกิดจากความอ้วน และมีความเสี่ยงต่อการเกิดโรคต่าง ๆ น้อยที่สุด แต่ก็ควรพยายามรักษาระดับค่า BMI ให้อยู่ในระดับนี้ให้นานที่สุด และควรตรวจสุขภาพทุกปี';
  } else if (result >= 23 && result < 24.90) {
    return 'ค่า BMI ระหว่าง 23 - 24.90 ซึ่งอยู่ในเกณฑ์น้ำหนักเกิน เสี่ยงต่อการเกิดโรคบางชนิด เช่น โรคหัวใจ โรคเบาหวานชนิดที่ 2 โรคข้อเข่าเสื่อม เป็นต้น ควรปรับพฤติกรรมการรับประทานอาหารและออกกำลังกายอย่างสม่ำเสมอ';
  } else if (result > 25 && result < 30) {
    return 'ค่า BMI ระหว่าง 25 - 29.90  ซึ่งอยู่ในเกณฑ์ อ้วนระดับที่ 1 เสี่ยงต่อการเกิดโรคต่าง ๆ มากขึ้น ควรปรับพฤติกรรมการรับประทานอาหารและออกกำลังกายอย่างเข้มข้นมากขึ้น และอาจต้องปรึกษาแพทย์หรือนักโภชนาการ';
  } else {
    return 'ค่า BMI มากกว่า 30 ซึ่งอยู่ในเกณฑ์ อ้วนระดับที่ 2 เสี่ยงต่อการเกิดโรคต่าง ๆ มาก ควรปรับพฤติกรรมการรับประทานอาหารและออกกำลังกายอย่างเข้มข้นที่สุด และอาจต้องปรึกษาแพทย์หรือนักโภชนาการเพื่อรับการรักษา';
  }
}
