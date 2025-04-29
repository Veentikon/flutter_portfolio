import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/components.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutMobile extends StatefulWidget {
  const AboutMobile({super.key});

  @override
  State<AboutMobile> createState() => _AboutMobileState();
}

class _AboutMobileState extends State<AboutMobile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ListView(
            children: [
              // Introduction, first section
              CircleAvatar(
                radius: 117.0,
                backgroundColor: Colors.tealAccent,
                child: CircleAvatar(
                  radius: 113.0,
                  backgroundColor: Colors.black,
                  child: CircleAvatar(
                    radius: 110.0,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage("assets/image.png"),
                    // child: Image.asset("assets/image.png", fit: BoxFit.cover,),
                  ),
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
                    SizedBox(height: 10.0),
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
              SizedBox(height: 40.0),

              // Web development, second section
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AnimatedCard(image: "assets/webL.png", reverse: true,width: 200.0),
                  SizedBox(height: 30.0,),
                  SansBold(text: "Web development", size: 20.0),
                  SizedBox(height: 10.0,),
                ],
              ),
              Sans(text: "I'm here to build your presense online with state of the art web apps", size: 15.0),

              // App development, third section
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20.0,),
                  AnimatedCard(image: "assets/app.png",width: 200.0,reverse: true,),
                  SizedBox(height: 30.0),
                  SansBold(text: "App development", size: 20.0),
                  SizedBox(height: 10.0,),
                ],
              ),
              Sans(text: "Do you need a high-performance, responsie and beautiful app?, I've got you covered.", size: 15.0),

              // Back end development
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20.0,),
                  AnimatedCard(image: "assets/firebase.png",width: 200.0,reverse: true,),
                  SizedBox(height: 30.0),
                  SansBold(text: "Back end development", size: 20.0),
                  SizedBox(height: 10.0,),
                ],
              ),
              Sans(text: "Build highly scalable and secure back end.", size: 15.0),
              SizedBox(height: 20.0,),
            ],
          ),
        ),
      ),
    );
  }
}