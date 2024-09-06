import 'package:flutter/material.dart';
import 'package:wscube_logintutorial/ResultPage.dart';
import 'package:wscube_logintutorial/main.dart';

class AssessmentPage extends StatefulWidget {
  @override
  _AssessmentPageState createState() => _AssessmentPageState();
}

class _AssessmentPageState extends State<AssessmentPage> {
  int questionNumber = 0;
  List<String> questions = [
    'Are you feeling nervous?',
    'Do you have trouble sleeping?',
    'Do you feel little interest or pleasure in doing things?',
    'Are you feeling down, depressed, or hopeless?',
    'Do you have trouble concentrating on things?',
  ];
  List<bool?> answers = List.filled(5, null); // Stores answers for 5 questions

  void _nextQuestion() {
    setState(() {
      if (questionNumber < questions.length - 1) {
        questionNumber++;
      } else {
        // Logic when questions are completed
        print("Completed all questions: $answers");
      }
    });
  }

  void _previousQuestion() {
    setState(() {
      if (questionNumber > 0) {
        questionNumber--;
      }
    });
  }

  void _submitAnswer(bool answer) {
    setState(() {
      answers[questionNumber] = answer;
    });
    _nextQuestion();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mental Assessment'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column( // Wrap the main content in a Column
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black87, width: 2),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.brown.shade100),
                    alignment: Alignment.center,
                    child: Text(
                      'Question ${questionNumber + 1}',
                      style: TextStyle(fontSize: 16, color: Colors.black87),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black87, width: 2),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.brown.shade100),
                    child: Text(
                      'Total Questions ${questions.length}',
                      style: TextStyle(fontSize: 16, color: Colors.black87),
                    ),
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 60),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black87, width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  questions[questionNumber],
                  style: TextStyle(
                    fontSize: 22,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: () => _submitAnswer(true),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 70, vertical: 20),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black87, width: 2),
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.green.shade400),
                      alignment: Alignment.center,
                      child: Text(
                        'Yes',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black87,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _submitAnswer(false),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 70, vertical: 20),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black87, width: 2),
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.lightBlueAccent.shade400),
                      alignment: Alignment.center,
                      child: Text(
                        'No',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              if (questionNumber == questions.length - 1)
                ElevatedButton(
                  onPressed: () {
                    // Handle the completion logic here
                    print("Completed all questions: $answers");
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResultPage()));
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal:150, vertical: 20),
                    textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,letterSpacing: .5 ),
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white,
                  ),
                  child: Text('Finish'),
                ),
            ],
          ),
        ),
      ),
    );
  }

}
