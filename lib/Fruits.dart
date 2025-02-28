import 'package:flutter/material.dart';

void main() {
  runApp(Fruits());
}

class Fruits extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FruitsPage(),
    );
  }
}

class FruitsPage extends StatelessWidget {
  final List<Map<String, String>> fruitWords = [
  {'english': 'Apple', 'gujarati': 'સફરજન',
    'signImage': 'assets/sign_apple.png',
    'photo': 'assets/photo_apple.png'},
  {'english': 'Banana', 'gujarati': 'કેળું',
    'signImage': 'assets/sign_banana.png',
    'photo': 'assets/photo_banana.png'},
  {'english': 'Orange', 'gujarati': 'સંતરા',
    'signImage': 'assets/sign_orange.png',
    'photo': 'assets/photo_orange.png'},
  {'english': 'Grapes', 'gujarati': 'દ્રાક્ષ',
    'signImage': 'assets/sign_grapes.png',
    'photo': 'assets/photo_grapes.png'},
  {'english': 'Mango', 'gujarati': 'આમ',
    'signImage': 'assets/sign_mango.png',
    'photo': 'assets/photo_mango.png'},
  {'english': 'Pineapple', 'gujarati': 'આનાસ',
    'signImage': 'assets/sign_pineapple.png',
    'photo': 'assets/photo_pineapple.png'},
  {'english': 'Strawberry', 'gujarati': 'સ્ટ્રોબેરી',
    'signImage': 'assets/sign_strawberry.png',
    'photo': 'assets/photo_strawberry.png'},
  {'english': 'Watermelon', 'gujarati': 'તરબૂચ',
    'signImage': 'assets/sign_watermelon.png',
    'photo': 'assets/photo_watermelon.png'},
  {'english': 'Cherry', 'gujarati': 'ચેરી',
    'signImage': 'assets/sign_cherry.png',
    'photo': 'assets/photo_cherry.png'},
  {'english': 'Peach', 'gujarati': 'પીચ',
    'signImage': 'assets/sign_peach.png',
    'photo': 'assets/photo_peach.png'},
  {'english': 'Plum', 'gujarati': 'આંબા',
    'signImage': 'assets/sign_plum.png',
    'photo': 'assets/photo_plum.png'},
  {'english': 'Pomegranate', 'gujarati': 'દાડમ',
    'signImage': 'assets/sign_pomegranate.png',
    'photo': 'assets/photo_pomegranate.png'},
  {'english': 'Papaya', 'gujarati': 'પપૈયા',
    'signImage': 'assets/sign_papaya.png',
    'photo': 'assets/photo_papaya.png'},
  {'english': 'Kiwi', 'gujarati': 'કીવી',
    'signImage': 'assets/sign_kiwi.png',
    'photo': 'assets/photo_kiwi.png'},
  {'english': 'Guava', 'gujarati': 'મામરડી',
    'signImage': 'assets/sign_guava.png',
    'photo': 'assets/photo_guava.png'},
  {'english': 'Lychee', 'gujarati': 'લિચી',
    'signImage': 'assets/sign_lychee.png',
    'photo': 'assets/photo_lychee.png'},
  {'english': 'Blueberry', 'gujarati': 'બ્લુબેરી',
    'signImage': 'assets/sign_blueberry.png',
    'photo': 'assets/photo_blueberry.png'},
  {'english': 'Coconut', 'gujarati': 'નારિયેઝ',
    'signImage': 'assets/sign_coconut.png',
    'photo': 'assets/photo_coconut.png'},
  {'english': 'Avocado', 'gujarati': 'એવોકાડો',
    'signImage': 'assets/sign_avocado.png',
    'photo': 'assets/photo_avocado.png'},
  {'english': 'Apricot', 'gujarati': 'ખุบણી',
    'signImage': 'assets/sign_apricot.png',
    'photo': 'assets/photo_apricot.png'},
  {'english': 'Fig', 'gujarati': 'અંગ્રેજી આંબા',
    'signImage': 'assets/sign_fig.png',
    'photo': 'assets/photo_fig.png'},
  {'english': 'Date', 'gujarati': 'ખજૂર',
    'signImage': 'assets/sign_date.png',
    'photo': 'assets/photo_date.png'},
  {'english': 'Raspberry', 'gujarati': 'રાસ્પબેરી',
    'signImage': 'assets/sign_raspberry.png',
    'photo': 'assets/photo_raspberry.png'},
  {'english': 'Blackberry', 'gujarati': 'બ્લેકબેરી',
    'signImage': 'assets/sign_blackberry.png',
    'photo': 'assets/photo_blackberry.png'},
  {'english': 'Mango', 'gujarati': 'આમ',
    'signImage': 'assets/sign_mango.png',
    'photo': 'assets/photo_mango.png'},
  {'english': 'Lemon', 'gujarati': 'લેમણ',
    'signImage': 'assets/sign_lemon.png',
    'photo': 'assets/photo_lemon.png'},
  {'english': 'Cucumber', 'gujarati': 'કાકરી',
    'signImage': 'assets/sign_cucumber.png',
    'photo': 'assets/photo_cucumber.png'},
];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        title: Center(
          child: Container(
            padding: EdgeInsets.all(8.0),
            color: Colors.blue,
            child: Text(
              'Daily Words',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: fruitWords.length,
              itemBuilder: (context, index) {
                return WordTile(
                  englishWord: fruitWords[index]['english']!,
                  gujaratiWord: fruitWords[index]['gujarati']!,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WordDetailPage(
                          index: index,
                          dailyWords: fruitWords,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class WordTile extends StatelessWidget {
  final String englishWord;
  final String gujaratiWord;
  final VoidCallback onTap;

  const WordTile({
    required this.englishWord,
    required this.gujaratiWord,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  englishWord,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.blue,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(width: 8.0),
            Icon(
              Icons.arrow_forward,
              color: Colors.white,
            ),
            SizedBox(width: 8.0),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  gujaratiWord,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.blue,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WordDetailPage extends StatelessWidget {
  final int index;
  final List<Map<String, String>> dailyWords;

  const WordDetailPage({
    required this.index,
    required this.dailyWords,
  });

  @override
  Widget build(BuildContext context) {
    final word = dailyWords[index];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          word['english']!,
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(16.0),
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Center(
                      child: Text(
                        'English Name: ${word['english']}',
                        style: TextStyle(fontSize: 24, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(16.0),
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Center(
                      child: Text(
                        'Gujarati Name: ${word['gujarati']}',
                        style: TextStyle(fontSize: 24, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      // Display sign image
                      Image.asset(
                        word['signImage']!,
                        width: 150,
                        height: 150,
                      ),
                      SizedBox(height: 16.0),
                      // Display photo
                      Image.asset(
                        word['photo']!,
                        width: 150,
                        height: 150,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              if (index > 0)
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WordDetailPage(
                          index: index - 1,
                          dailyWords: dailyWords,
                        ),
                      ),
                    );
                  },
                ),
              if (index < dailyWords.length - 1)
                IconButton(
                  icon: Icon(Icons.arrow_forward),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WordDetailPage(
                          index: index + 1,
                          dailyWords: dailyWords,
                        ),
                      ),
                    );
                  },
                ),
            ],
          ),
        ],
      ),
    );
  }
}