import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';

class CustomMenuItem extends StatefulWidget {
  final String text;
  final Function onPressed;
  final int delay;

  const CustomMenuItem({
    super.key,
    required this.text,
    required this.onPressed,
    this.delay = 0,
  });

  @override
  State<CustomMenuItem> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<CustomMenuItem> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      from: 10,
      delay: Duration(milliseconds: widget.delay),
      duration: Duration(milliseconds: 150),
      child: MouseRegion(
        //ejecuta el estado si el cursor ya salio del boton
        onEnter: (_) => setState(() => isHover = true),
        onExit: (_) => setState(() => isHover = false),
        child: GestureDetector(
          onTap: () => widget.onPressed(),
          //cambia el color
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            width: 150,
            height: 50,
            color: isHover ? Colors.pinkAccent : Colors.transparent,
            child: Center(
              child: Text(
                widget.text,
                style: GoogleFonts.roboto(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
