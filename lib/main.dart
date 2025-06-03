import 'package:flutter/material.dart';

void main() {
  runApp(const QuotesApp());
}

class QuotesApp extends StatelessWidget {
  const QuotesApp({super.key});

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sensible Quotes',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 203, 59, 37),
        ),
      ),
      home: const QuotePage(title: 'Sensible "Quotes"'),
    );
  }
}

class QuotePage extends StatefulWidget {
  const QuotePage({super.key, required this.title});

  final String title;

  @override
  State<QuotePage> createState() => _QuotePageState();
}

class _QuotePageState extends State<QuotePage> {
  ///#########################################################
  ///#                LIST OF QUOTES                         #
  ///#########################################################
  List<Map<String, String>> quotes = [
    {
      'quote': 'What I know is a drop. What I don\'t know is an ocean.',
      'author': 'Isaac Newton',
    },
    {
      'quote':
          'The definition of insanity is -- doing the same thing over and over and expecting different results.',
      'author': 'Albert Einstein',
    },
    {
      'quote': 'I\'d rather die believing, than live doubting.',
      'author': 'Smith Wigglesworth',
    },
    {
      'quote': 'I can\'t die believing, and I can\'t live doubting.',
      'author': 'Apostle Grace Lubega',
    },
  ];

  int currentIndex = 0;

  ///#########################################################
  ///#                NEXT QUOTE FUNCTION                    #
  ///#########################################################
  void _showNextQuote() {
    setState(() {
      if (currentIndex + 1 < quotes.length) {
        currentIndex++;
      } else {
        currentIndex = 0;
      }
      //  currentIndex = (currentIndex + 1) % quotes.length; // loops back to first
    });
  }

  ///#########################################################
  ///#             PREVIOUS QUOTE FUNCTION                   #
  ///#########################################################
  void _showPreviousQuote() {
    setState(() {
      if (currentIndex > 0) {
        currentIndex--;
      } else {
        currentIndex = quotes.length - 1;
      }
      //  currentIndex = (currentIndex + 1) % quotes.length; // loops back to first
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///------------------------------------------------
      ///-                  APP BAR                    --
      ///------------------------------------------------
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(40),
        child: Center(
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Icon(
                            Icons.format_quote,
                            size: 40,
                            color: Colors.grey,
                          ),
                        ),
                        Expanded(
                          flex: 5,

                          ///===============================
                          ///           QUOTE
                          ///===============================
                          child: Text(
                            '${quotes[currentIndex]['quote']}',
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                        Divider(
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                        Expanded(
                          flex: 1,

                          ///===============================
                          ///           AUTHOR
                          ///===============================
                          child: Text(
                            '${quotes[currentIndex]['author']}',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                flex: 1,

                ///===============================
                ///        QUOTE NAVIGATION
                ///===============================
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: _showPreviousQuote,
                      child: Icon(Icons.arrow_back),
                    ),
                    SizedBox(width: 30),
                    Text(
                      '${currentIndex + 1} of ${quotes.length}',
                      style: TextStyle(
                        // color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ),
                    SizedBox(width: 30),
                    ElevatedButton(
                      onPressed: _showNextQuote,
                      child: Icon(Icons.arrow_forward),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
