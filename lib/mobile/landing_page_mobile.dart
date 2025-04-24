import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
            Row(
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
            )
          ],
        )
      ), 
    );
  }
}