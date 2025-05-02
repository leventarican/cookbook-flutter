import 'dart:math';
import 'package:flutter/material.dart';

class MemoryGamePage extends StatefulWidget {
  const MemoryGamePage({super.key});

  @override
  MemoryGamePageState createState() => MemoryGamePageState();
}

class MemoryGamePageState extends State<MemoryGamePage> {
  List<String> emojis = [
    '🐶',
    '🐱',
    '🐭',
    '🐹',
    '🐰',
    '🦊',
    '🐻',
    '🐼',
    '🐨',
    '🐯',
    '🦁',
    '🐮',
    '🐷',
    '🐸',
    '🐵',
    '🐔',
  ];
  List<String> gameEmojis = [];
  List<bool> isFaceUp = [];
  List<int> flippedCards = [];
  int cardsCount = 4;
  bool gameWon = false;

  @override
  void initState() {
    super.initState();
    _startGame();
  }

  void _startGame() {
    setState(() {
      gameWon = false;
      isFaceUp.clear();
      flippedCards.clear();
      cardsCount = [4, 8, 16][Random().nextInt(3)];
      gameEmojis = _generateGameEmojis(cardsCount);
      isFaceUp = List.generate(cardsCount, (_) => false);
    });
  }

  List<String> _generateGameEmojis(int count) {
    List<String> selectedEmojis = [];
    List<String> shuffledEmojis = List.from(emojis)..shuffle();
    for (int i = 0; i < count / 2; i++) {
      selectedEmojis.addAll([shuffledEmojis[i], shuffledEmojis[i]]);
    }
    selectedEmojis.shuffle();
    return selectedEmojis;
  }

  void _flipCard(int index) {
    if (flippedCards.length < 2 && !isFaceUp[index] && !gameWon) {
      setState(() {
        isFaceUp[index] = true;
        flippedCards.add(index);
        if (flippedCards.length == 2) {
          _checkMatch();
        }
      });
    }
  }

  void _checkMatch() {
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        int card1Index = flippedCards[0];
        int card2Index = flippedCards[1];
        if (gameEmojis[card1Index] == gameEmojis[card2Index]) {
          // Match found
          isFaceUp[card1Index] = true;
          isFaceUp[card2Index] = true;
          bool allMatched = isFaceUp.every((element) => element);
          if (allMatched) {
            gameWon = true;
          }
        } else {
          // No match
          isFaceUp[card1Index] = false;
          isFaceUp[card2Index] = false;
        }
        flippedCards.clear();
      });
    });
  }

  int _getCrossAxisCount(int count) {
    if (count == 4) return 2;
    if (count == 8) return 4;
    if (count == 16) return 4;
    return 2;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Emoji Memory Game')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (gameWon)
              const Text(
                'You Won!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: cardsCount,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: _getCrossAxisCount(cardsCount),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => _flipCard(index),
                    child: Container(
                      decoration: BoxDecoration(
                        color: isFaceUp[index] ? Colors.white : Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black, width: 2),
                      ),
                      child: Center(
                        child: Text(
                          isFaceUp[index] ? gameEmojis[index] : '❓',
                          style: const TextStyle(fontSize: 40),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: _startGame,
              child: const Text('New Game'),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
