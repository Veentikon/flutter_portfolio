import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/components.dart';
import 'package:url_launcher/url_launcher.dart';

class LandingPageMobile extends StatefulWidget {
  const LandingPageMobile({super.key});

  @override
  State<LandingPageMobile> createState() => _LandingPageMobileState();
}

class _LandingPageMobileState extends State<LandingPageMobile> {

  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(
          size: 35.0,
          color: Colors.black,
        ),
      ),
      endDrawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DrawerHeader(
              padding: EdgeInsets.only(bottom: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 2.0, color: Colors.black),
                ),
                child: Image.asset('assets/image.png'),
              ),
            ),
            TabsMobile(text: "Home", route: "/"),
            SizedBox(height: 20.0),
            TabsMobile(text: "Works", route: "/works"),
            SizedBox(height: 20.0,),
            TabsMobile(text: "Blog", route: "/blog"),
            SizedBox(height: 20.0,),
            TabsMobile(text: "About", route: "/about"),
            SizedBox(height: 20.0),
            TabsMobile(text: "Contact", route: "/contact"),
            SizedBox(height: 40.0),
            RepaintBoundary(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () async => await launchUrl(Uri.parse('https://www.instagram.com/tomcruise'),), 
                  icon: SvgPicture.asset(
                    "assets/instagram.svg",
                    color: Colors.black,
                    width: 35.0,
                  ),),
                  IconButton(
                    onPressed: () async => await launchUrl(Uri.parse('https://www.twitter.com/tomcruise'),), 
                  icon: SvgPicture.asset(
                    "assets/xlogo.svg",
                    color: Colors.black,
                    width: 35.0,
                  ),),
                  IconButton(
                    onPressed: () async => await launchUrl(Uri.parse('https://www.github.com/Veentikon'),), 
                  icon: SvgPicture.asset(
                    "assets/github.svg",
                    color: Colors.black,
                    width: 35.0,
                  ),),
                ],
              ),
            )
          ],
        )
      ),
      body: ListView(
        children: [
          // Intro, First section
          CircleAvatar(
            radius: 117.0,
            backgroundColor: Colors.tealAccent,
            child: CircleAvatar(
              radius: 110.0,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage("assets/image.png"),
            ),
          ),
          Padding(
            // padding: const EdgeInsets.only(left: 20.0),
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                SizedBox(height: 25.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.tealAccent,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0),
                        ),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0),
                      child: SansBold(text: "Hello I'm", size: 15.0),
                    ),
                    SansBold(text: "Vitalii Radzividlo", size: 40.0),
                    Sans(text: "Software developer", size: 20.0),
                  ],
                ),
                SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Wrap(
                      direction: Axis.vertical,
                      spacing: 3.0,
                      children: [
                        Icon(Icons.email),
                        Icon(Icons.call),
                        Icon(Icons.location_pin),
                      ],
                    ),
                    SizedBox(width: 40.0),
                    Wrap(
                      direction: Axis.vertical,
                      spacing: 9.0,
                      children: [
                        Sans(text: "radzividlo.vitalii@gmail.com", size: 15.0),
                        Sans(text: "+123 123 123", size: 15.0),
                        Sans(text: "Saskatoon SK Canada", size: 15.0),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 90.0),
          // About me, Second section
          Padding(
            // padding: EdgeInsets.only(left: 20.0),
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SansBold(text: "About me", size: 35.0),
                Sans(text: "Hello! I'm Vitalii Radzividlo, I am a software developer", size: 15.0),
                Sans(text: "I strive to ensure astounding performence with state of", size: 15.0),
                Sans(text: "the art security for Android, Ios, Web, Mac, Linux", size: 15.0),
                SizedBox(height: 10.0),
                Wrap(
                  spacing: 7.0,
                  runSpacing: 7.0,
                  children: [
                    SkillBox(text: "Python"),
                    SkillBox(text: "Golang"),
                    SkillBox(text: "Java"),
                    SkillBox(text: "Flutter"),
                    SkillBox(text: "SQL"),
                    SkillBox(text: "Linux"),
                    SkillBox(text: "Android")
                  ],
                ),
                // SizedBox(height: 20.0,), 
              ],
            ),
          ),
          SizedBox(height: 60.0,),
          //Third section, What I do?
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SansBold(text: "What I do?", size: 35.0),
                AnimatedCard(image: "assets/webL.png", description: "Web development",fit:BoxFit.contain,reverse:true,width: 300.0,animateVertical: false,),
                AnimatedCard(image: "assets/app.png", description: "App development",fit:BoxFit.contain,width: 300.0,animateVertical: false,),
                AnimatedCard(image: "assets/firebase.png", description: "Back-end development",fit:BoxFit.contain,reverse:true,width: 300.0,animateVertical: false,),
            ],
          ),
          // Forth section, Contact
          Wrap(
            runSpacing: 20.0,
            spacing: 20.0,
            alignment: WrapAlignment.center,
            children: [
              SansBold(text: "Contact me", size: 35.0),
              TextForm(text: "First Name", containerWidth: widthDevice/1.4, hintText: "Please type first name"),
              TextForm(text: "Last Name", containerWidth: widthDevice/1.4, hintText: "Please type last name"),
              TextForm(text: "email", containerWidth: widthDevice/1.4, hintText: "Please type email address"),
              TextForm(text: "Phone number", containerWidth: widthDevice/1.4, hintText: "Please type your phone number"),
              TextForm(text: "Message", containerWidth: widthDevice/1.4, hintText: "Enter your message here",maxLines: 10,),
              MaterialButton(onPressed: (){},
                elevation: 20.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)
                ),
                height: 60.0,
                minWidth: widthDevice/2.2,
                color: Colors.tealAccent,
                child: SansBold(text: "Submit", size: 20.0),
              ),
            ],
          ),
          SizedBox(height: 20.0,),
        ],
      ),
    );
  }
}