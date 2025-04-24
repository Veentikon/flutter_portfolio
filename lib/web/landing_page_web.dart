import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/components.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:url_launcher/url_launcher_string.dart';

class LandingPageWeb extends StatefulWidget {
  const LandingPageWeb({super.key});

  @override
  State<LandingPageWeb> createState() => _LandingPageWebState();
}

class _LandingPageWebState extends State<LandingPageWeb> {
  urlLauncher(String imgPath, String url) {
    return IconButton(
      onPressed: () async {
        await launchUrl(Uri.parse(url));
      }, 
      icon: SvgPicture.asset(imgPath,
        color: Colors.black, width: 35.0
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    var heightDevice=MediaQuery.of(context).size.height;
    var widthDevice=MediaQuery.of(context).size.width;
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
            SizedBox(height: 15.0),
            SansBold(text: "Vitalii Radzividlo", size: 30.0),
            SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                urlLauncher("assets/instagram2.svg", "https://www.instagram.com/tomcruise/"),
                urlLauncher("xlogo.svg", "https://www.twitter.com/tomcruise"),
                urlLauncher("assets/github.svg", "https://www.github.com/Veentikon"),
              ], // (Image.asset) Does not support svg images
              // SVG images are not pixelated
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          size: 25.0,
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Row(
          children: [
            Spacer(flex: 3),
            TabsWeb(title: "Home"),
            Spacer(),
            TabsWeb(title: "Works"),
            Spacer(),
            TabsWeb(title: "Blog"),
            Spacer(),
            TabsWeb(title: "About"),
            Spacer(),
            TabsWeb(title: "Contacts"),
            Spacer(),
          ],
        ),
      ),
      body: ListView(
        children: [
          // First section
          Container(
            height: heightDevice-56,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.tealAccent,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0),
                        ),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0,),
                      child: SansBold(text: "Hello I'm", size: 15)
                    ),
                    SizedBox(height: 15),
                    SansBold(text: "Vitalii Radzividlo", size: 55.0),
                    Sans(text: "Software developer", size: 30.0),
                    SizedBox(height: 15.0),
                    Row(
                      children: [
                        Icon(Icons.email),
                        SizedBox(width: 20.0),
                        Sans(text: "radzividlo.vitalii@gmail.com", size: 15),
                      ],
                    ),
                    SizedBox(height: 15.0),
                    Row(
                      children: [
                        Icon(Icons.call),
                        SizedBox(width: 20.0),
                        Sans(text: "123 123 123", size: 15),
                      ],
                    ),
                    SizedBox(height: 15.0),
                    Row(
                      children: [
                        Icon(Icons.location_pin),
                        SizedBox(width: 20.0),
                        Sans(text: "Saskatoon SK Canada", size: 15),
                      ],
                    ),
                  ],
                ),
                CircleAvatar(
                  radius: 147.0,
                  backgroundColor: Colors.tealAccent, 
                  child: CircleAvatar(
                    radius: 142.0,
                    backgroundColor: Colors.black,
                    child: CircleAvatar(
                      radius: 140.0,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage("assets/image.png"),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Second section
          // Divider(),
          Container(
            height: heightDevice/1.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("web.jpg",height: widthDevice/1.9),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SansBold(text: "About me", size: 40.0),
                    SizedBox(height: 15),
                    Sans(text: "Hello I'm Vitalii Radzividlo, I am full stack web developer, and cybersecurity specialist", size: 15),
                    Sans(text: "I strive to ensure astounding performance with state of ", size: 15),
                    Sans(text: "the art security for Android, Ios, Web, Mac, Linux and Windows", size: 15),
                    SizedBox(height: 10),
                    Row(
                      spacing: 2.0,
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
                  ],
                ),
              ],
            ),
          ),
          // Third section
          Container(
            height: heightDevice/1.3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SansBold(text: "What I do?", size: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    WorksCard(image: "assets/webL.png", description: "Web development",fit:BoxFit.contain,reverse:true),
                    WorksCard(image: "assets/app.png", description: "App development"),
                    WorksCard(image: "assets/firebase.png", description: "Back-end development",fit:BoxFit.contain,reverse:true),
                    // WorksCard()
                  ],
                ),
              ],
            ),
          ),
          // Forth section
          Container(
            height: heightDevice,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SansBold(text: "Contact me", size: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        TextForm(
                          heading: "First name", 
                          width: 350, 
                          hintText: "Please type your first name",
                        ),
                        SizedBox(height: 15),
                        TextForm(
                          heading: "Email", 
                          width: 350, 
                          hintText: "Please type your email",
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        TextForm(
                          heading: "Last name", 
                          width: 350, 
                          hintText: "Please type your last name",
                        ),
                        SizedBox(height: 15),
                        TextForm(
                          heading: "Phone number", 
                          width: 350, 
                          hintText: "Please type your phone number",
                        ),
                      ],
                    ),
                  ],
                ),
                TextForm(heading: "Message", width: widthDevice/1.5, hintText: "Please enter your message", maxLines: 10,),
                MaterialButton(
                  elevation: 20.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  height: 60.0,
                  minWidth: 100.0,
                  color: Colors.teal,
                  child: SansBold(text: "Submit", size: 20.0),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
