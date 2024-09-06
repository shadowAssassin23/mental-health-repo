import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  String answer = "Stress";
  late String resultText;

  final List<ListItem> items = [
    ListItem(
      text: 'Stress management is essential for maintaining overall well-being.',
    ),
    ListItem(
      text: 'Practicing mindfulness or meditation for 30 minutes each day helps in achieving mental clarity and calmness.',
    ),
    ListItem(
      text: 'Ensuring adequate sleep of 7-8 hours per night is crucial for recovery and resilience against stress.',
    ),
    ListItem(
      text: 'A balanced diet provides the necessary energy and nutrients to cope with stress.',
    ),
    ListItem(
      text: 'Staying connected with loved ones for at least 30 minutes each day fosters emotional support and reduces feelings of isolation.',
    ),
    // Add more items as needed
  ];

  @override
  void initState() {
    super.initState();
    resultText = "According to the result \"You are $answer\"";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Result"),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white54,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 2.0),
                  color: Colors.blueAccent.shade100,
                ),
                padding: EdgeInsets.all(35),
                child: Text(
                  resultText,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ),
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    // contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    leading: CircleAvatar(
                      child: Text((index + 1).toString()),
                    ),
                    title: Text(items[index].text),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ListItem {
  final String text;

  ListItem({
    required this.text,
  });
}

// class WebViewPage extends StatelessWidget {
//   final String url;
//
//   WebViewPage(this.url);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('WebView'),
//       ),
//       body: Center(
//         child: Text('WebView to display $url'),
//       ),
//     );
//   }
// }
