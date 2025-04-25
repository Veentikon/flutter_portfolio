import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/components.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactWeb extends StatefulWidget {
  const ContactWeb({super.key});

  @override
  State<ContactWeb> createState() => _ContactWebState();
}

class _ContactWebState extends State<ContactWeb> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 72.0,
              backgroundColor: Colors.tealAccent,
              child: CircleAvatar(
                radius: 70.0,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage("assets/image.png"),
              ),
            ),
            SizedBox(height: 15.0,),
            SansBold(text: "Vitalii Radzividlo", size: 30.0),
            SizedBox(height: 15.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: ()async{
                    await launchUrl(Uri.parse("https://www.instagram.com/tomcruse"));
                  }, 
                  icon: SvgPicture.asset("assets/instagram.svg", width: 35.0,),
                  color: Colors.black,
                ),
                IconButton(
                  onPressed: ()async{
                    await launchUrl(Uri.parse("https://www.twitter.com/tomcruse"));
                  }, 
                  icon: SvgPicture.asset("assets/xlogo.svg", width: 35.0,),
                  color: Colors.black,
                ),
                IconButton(
                  onPressed: ()async{
                    await launchUrl(Uri.parse("https://www.github.com/Veentikon"));
                  }, 
                  icon: SvgPicture.asset("assets/github.svg", width: 35.0,),
                  color: Colors.black,
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}