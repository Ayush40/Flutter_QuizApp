import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            //Make trransparent by adding colour on it
            color: const Color.fromARGB(170, 255, 255, 255),
          ),
          const SizedBox(
            height: 75,
          ),
          Text(
            'New Way to Learn!',
            style: GoogleFonts.poppins(
                color: const Color.fromARGB(255, 237, 223, 252),
                fontSize: 27,
                fontStyle: FontStyle.normal),
          ),
          const SizedBox(height: 20),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.arrow_right_outlined),
            label: const Text("Start",
                style: TextStyle(
                  fontSize: 20,
                )),
          ),
        ],
      ),
    );
  }
}
