import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroTextWidget extends StatelessWidget {
  const IntroTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome to FunMap!",
              style: GoogleFonts.poppins(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Ever experienced something funny, weird, or just too good not to share? "
              "With FunMap, you can pin your funniest moments and strange encounters right on the map! 🗺️😂",
              style: GoogleFonts.roboto(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 16),
            Text(
              "Share hilarious events from your daily life, discover what others nearby have spotted, "
              "and explore a world full of smiles and surprises. Whether it’s a quirky street performer, "
              "an awkward sign, or a random act of comedy — every little story has its place here.",
              style: GoogleFonts.roboto(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 16),
            Text(
              "👉 Add your event, mark the spot, and let the community enjoy the laughter with you.",
              style: GoogleFonts.roboto(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "Because the world’s a lot more fun when we laugh together. 🌍✨",
              style: GoogleFonts.roboto(
                fontSize: 16,
                fontStyle: FontStyle.italic,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
