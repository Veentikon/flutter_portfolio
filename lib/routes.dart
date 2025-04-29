import 'package:flutter/material.dart';
import 'package:portfolio/mobile/about_mobile.dart';
import 'package:portfolio/mobile/blog_mobile.dart';
import 'package:portfolio/mobile/contact_mobile.dart';
import 'package:portfolio/mobile/landing_page_mobile.dart';
import 'package:portfolio/web/about_web.dart';
import 'package:portfolio/web/blog_web.dart';
import 'package:portfolio/web/contact_web.dart';
import 'package:portfolio/web/landing_page_web.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(settings: settings,
          builder: (_) => LayoutBuilder(builder: (context, constraints) {
            if (constraints.maxWidth > 800){
              return LandingPageWeb();
            } else {
              return LandingPageMobile();
            }
          })
        );
      case '/contact':
        return MaterialPageRoute(
          builder: (_) => LayoutBuilder(builder: (context, constraints) {
            if (constraints.maxWidth > 800) {
              return const ContactWeb();
            } else 
              return const ContactMobile();
          }),
          settings: settings,
        );
      case '/about':
        return MaterialPageRoute(
          builder: (_) => LayoutBuilder(builder: (context, constraints) {
            if (constraints.maxWidth > 800) {
              return const AboutWeb();
            } else {
              return const AboutMobile();
            }
          }),
          settings: settings,
        );
      case '/blog':
        return MaterialPageRoute(
          builder: (_) => LayoutBuilder(builder: (context, constraints) {
            if (constraints.maxWidth > 800) {
              return const BlogWeb();
            } else {
              return const BlogMobile();
            }
          }),
          settings: settings,
        );
      default:
        return MaterialPageRoute(settings: settings,
          builder: (_) => LayoutBuilder(builder: (context, constraints) {
            if (constraints.maxWidth>800){
              return LandingPageWeb();
            } else {
              return LandingPageMobile();
            }
          })
        );
    }
  }
}