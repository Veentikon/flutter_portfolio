import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/components.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutWeb extends StatefulWidget {
  const AboutWeb({super.key});

  @override
  State<AboutWeb> createState() => _AboutWebState();
}

class _AboutWebState extends State<AboutWeb> {
  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    return Scaffold(
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
          // About me, first section
          SizedBox(
            height: 500.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SansBold(text: "About me", size: 40.0),
                    SizedBox(height: 15.0,),
                    Sans(text: "Hello I'm Vitalii Radzividlo, I am a Software developer", size: 15.0),
                    Sans(text: "I strive to ensure astounding performance with state of", size: 15.0),
                    Sans(text: "the art security for Android, Ios, Web, Mac, Linux and Windows", size: 15.0,),
                    SizedBox(height: 10.0,),
                    Row(
                      spacing: 4.0,
                      children: [
                        SkillBox(text: "Python"),
                        SkillBox(text: "Golang"),
                        SkillBox(text: "Java"),
                        SkillBox(text: "Flutter"),
                        SkillBox(text: "SQL"),
                        SkillBox(text: "Linux"),
                        SkillBox(text: "Android")
                      ],
                    )
                  ],
                ),
                CircleAvatar(
                  radius: 72.0,
                  backgroundColor: Colors.tealAccent,
                  child: CircleAvatar(
                    radius: 70.0,
                    backgroundColor: Colors.white,
                    child: Image.asset("assets/image.png", filterQuality: FilterQuality.high,),
                  ),
                ),
              ],
            ),
          ),
          
          // Web development
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AnimatedCard(image: "assets/webL.png", height: 250.0, width: 250.0,),
              SizedBox(
                width: widthDevice/3,
                child:Column(
                  children: [
                    SansBold(text: "Web development", size: 30.0),
                    SizedBox(height: 15.0,),
                    Sans(text: "I'm here to build your presence online with state of the art web apps",size: 15.0),
                  ],
                )
              )
            ],
          ),
          SizedBox(height: 20.0,),

          // App development
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: widthDevice/3,
                child: Column(
                  children: [
                    SansBold(text: "App development", size: 30.0),
                    SizedBox(height: 15.0,),
                    Sans(text: "Building high-performace, responsive and beautiful applications.",size: 15.0),
                  ],
                ),
              ),
              AnimatedCard(image: "assets/app.png",height: 250.0,width: 250.0,reverse: true,),
            ],
          ),
          SizedBox(height: 20.0,),

          // Back-end development
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AnimatedCard(image: "assets/firebase.png",height: 250.0,width: 250.0,),
              SizedBox(
                width: widthDevice/3,
                child: Column(
                  children: [
                    SansBold(text: "Back-end development", size: 30.0),
                    SizedBox(height: 15.0),
                    Sans(text: "Building highly scalable and secure back-end.",size: 15.0,),
                  ]
                )
              ),
            ],
          ),
          SizedBox(height: 40.0),
        ],
      ),
    );
  }
}