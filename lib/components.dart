import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class TabsWeb extends StatefulWidget {
  final title;
  const TabsWeb({super.key, required this.title});

  @override
  State<TabsWeb> createState() => _TabsWebState();
}

class _TabsWebState extends State<TabsWeb> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          isSelected = true;
        });
      },
      onExit: (_) {
        setState(() {
          isSelected = false;
        });
      },
      child: AnimatedDefaultTextStyle(
        duration: const Duration(milliseconds: 100),
        curve: Curves.elasticIn,
        style: isSelected?GoogleFonts.oswald(
          shadows: [Shadow(color: Colors.black, offset: Offset(0, -6 ),
          )],
          fontSize: 25.0,
          color: Colors.transparent,
          decoration: TextDecoration.underline,
          decorationThickness: 2,
          decorationColor: Colors.tealAccent,
        ): 
        GoogleFonts.oswald(color: Colors.black, fontSize:23.0 ),
        child: Text(widget.title
        ),
      ),
    );
  }
}

class SansBold extends StatelessWidget {
  final text;
  final size;
  const SansBold({super.key, required this.text, required this.size});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: GoogleFonts.openSans(
      fontSize: size, 
      fontWeight: FontWeight.bold
      ),
    );
  }
}

class Sans extends StatelessWidget {
  final text;
  final size;
  const Sans({super.key, required this.text, required this.size});

  @override
  Widget build(BuildContext context) {
    return Text(
      text, style: GoogleFonts.openSans(
        fontSize: size,
        fontWeight: FontWeight.normal,
      )
    );
  }
}

class SkillBox extends StatelessWidget {
  final text;
  const SkillBox({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.tealAccent,
          style: BorderStyle.solid,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(5.0),
      ),
    padding: EdgeInsets.all(7.0),
    child: Sans(text:text, size: 15.0),
    );
  }
}

class WorksCard extends StatelessWidget {
  final image;
  final description;
  const WorksCard(this.image, this.description, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 30,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      shadowColor: Colors.tealAccent,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(image,height: 200, width: 200, fit: BoxFit.contain),
            SizedBox(height: 10),
            SansBold(text: description, size: 15),
          ],
        ),
      ),
    );
  }
}

class TextForm extends StatelessWidget {
  final heading;
  final width;
  final hintText;
  final maxLines;
  
  const TextForm({
    super.key, 
    required this.heading, 
    required this.width, 
    required this.hintText, 
    this.maxLines
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Sans(text: heading, size: 16.0,),
        SizedBox(height: 5),
        SizedBox(
        width: width,
        child: TextFormField(
          // inputFormatters: [
          //   LengthLimitingTextInputFormatter(10),
          //   FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9]')),
          // ],
          maxLines: maxLines==null?null:maxLines,
          decoration: InputDecoration(
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.all(Radius.circular(10.0),),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.teal),
              borderRadius: BorderRadius.all(Radius.circular(10.0),),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.tealAccent,width:2),
                borderRadius: BorderRadius.all(Radius.circular(15.0),
              ),
            ),
            hintText: hintText,
            hintStyle: GoogleFonts.poppins(fontSize: 14),
            ),
            // validator: (text) {
            //   if (RegExp("\\bvitalii\\b", caseSensitive: false).hasMatch(text.toString())){
            //     return "Match found";
            //   }
            // },
            // autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
        ),
      ],
    );
  }
}
