import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TabsWeb extends StatefulWidget {
  final title;
  final route;
  const TabsWeb({super.key, required this.title, this.route});

  @override
  State<TabsWeb> createState() => _TabsWebState();
}

class _TabsWebState extends State<TabsWeb> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(widget.route);
      },
      child: MouseRegion(
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
            decorationThickness: 2.0,
            decorationColor: Colors.tealAccent,
          ): 
          GoogleFonts.oswald(color: Colors.black, fontSize:20.0 ),
          child: Text(widget.title
          ),
        ),
      ),
    );
  }
}

class TabsMobile extends StatefulWidget {
  final text;
  final route;
  const TabsMobile({super.key, required this.text, required this.route});

  @override
  State<TabsMobile> createState() => _TabsMobileState();
}

class _TabsMobileState extends State<TabsMobile> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 20.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      color: Colors.black,
      height: 50.0,
      minWidth: 200.0,
      child: Text(widget.text,
        style: GoogleFonts.openSans(
          fontSize: 20.0,
          color: Colors.white,
        )
      ),
      onPressed: () {
        Navigator.of(context).pushNamed(widget.route);
      },
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

class AnimatedCard extends StatefulWidget {
  final image;
  final description;
  final fit;
  final reverse;
  final height;
  final width;
  final animateVertical;

  const AnimatedCard(
    {
      super.key,
      required this.image,
      this.description,
      this.fit,
      this.reverse,
      this.height,
      this.width,
      this.animateVertical,
    }
  );

  @override
  State<AnimatedCard> createState() => _AnimatedCardState();
}

class _AnimatedCardState extends State<AnimatedCard> with SingleTickerProviderStateMixin {
  late AnimationController _controller = AnimationController(vsync: this,duration: const Duration(seconds: 4),)..repeat(reverse: true);
  // vsync prevents animations running in the background when invisible
  
  late Animation<Offset> _verticalAnimation=Tween(
    begin: widget.reverse == true ? Offset(0, 0.08) : Offset.zero,
    end: widget.reverse == true ? Offset.zero : Offset(0, 0.08),
  ).animate(_controller);

  late Animation<Offset> _horizontalAnimation=Tween(
    begin: widget.reverse == true ? Offset(0.08, 0.0) : Offset.zero,
    end: widget.reverse == true ? Offset.zero : Offset(0.08, 0.0),
  ).animate(_controller);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: widget.animateVertical==null?_verticalAnimation : _horizontalAnimation,
      child: Card(
        elevation: 30,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: BorderSide(color: Colors.tealAccent),
        ),
        shadowColor: Colors.tealAccent,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                widget.image,height: widget.height==null?200.0 : widget.height, 
                width: widget.width==null? 200.0 : widget.width, 
                fit: widget.fit == null? null : widget.fit,
              ),
              SizedBox(height: 10.0),
              widget.description==null?SizedBox():SansBold(text: widget.description, size: 15.0),
              // SansBold(text: widget.description, size: 15.0),
            ],
          ),
        ),
      ),
    );
  }
}

class TextForm extends StatelessWidget {
  final text;
  final containerWidth;
  final hintText;
  final maxLines;

  const TextForm({
    super.key, 
    required this.text, 
    required this.containerWidth, 
    required this.hintText, 
    this.maxLines
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Sans(text: text, size: 16.0,),
        SizedBox(height: 5),
        SizedBox(
        width: containerWidth,
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
            hintStyle: GoogleFonts.poppins(fontSize: 14.0),
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

class AbelCustom extends StatelessWidget {
  final text;
  final size;
  final color;
  final fontWeight;
  const AbelCustom({super.key, required this.text, required this.size, this.color, this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: GoogleFonts.abel(
      fontSize: size,
      color: color==null? Colors.black : color,
      fontWeight: fontWeight==null? FontWeight.normal : fontWeight,
    ));
  }
}