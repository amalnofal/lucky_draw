import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(
    MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.cyan,
          appBar: AppBar(
            title: const Text(
              'Lucky Draw',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontFamily: 'Ubuntu',
                fontWeight: FontWeight.bold,
              ),
            ),
            backgroundColor: Colors.blue[800],
          ),
          body: const Imagepage(),
        ),
      ),
    ),
  );
}

class Imagepage extends StatefulWidget {
  const Imagepage({super.key});

  @override
  State<Imagepage> createState() => _ImagepageState();
}

class _ImagepageState extends State<Imagepage> {
  int leftimg = 1;
  int rightimg = 2;
  void changeImg() {
    setState(() {
      leftimg = Random().nextInt(6) + 1;
      rightimg = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          leftimg == rightimg ? 'CONGRATS! \u{1F389}' : 'Try Again',
          style: const TextStyle(
            fontSize: 42,
            color: Colors.white,
            fontFamily:'Signika',
            fontWeight: FontWeight.bold
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Expanded(
                child: TextButton(
                    onPressed: () {
                      changeImg();
                    },
                    child: Image.asset('images/img-$leftimg.png')),
              ),
              Expanded(
                child: TextButton(
                    onPressed: () {
                      changeImg();
                    },
                    child: Image.asset('images/img-$rightimg.png')),
              ),
            ],
          ),
        )
      ],
    );
  }
}
