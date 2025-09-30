import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_portfolio/manager/globalmanager.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:flutter_portfolio/experiences.dart';
import 'package:flutter_portfolio/about.dart';
import 'package:flutter_portfolio/footer.dart';
import 'package:flutter_portfolio/navigation.dart';
import 'package:flutter_portfolio/project.dart';




import 'profilBanner.dart';
import 'skills.dart';

const double _Size = 50;

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.onThemeChanged});
   final ValueChanged<ThemeMode> onThemeChanged;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = true;

  final ScrollController _scrollController = ScrollController();

  void _scrollDown() {
    _scrollController.animateTo(
      _scrollController.offset + 500,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      // backgroundColor: Color(0xFF101622),
      body: Stack(
        children: [
          // --------- Image Fond de page ---------
          Positioned.fill(
            child: isDarkMode ? Image.asset('assets/images/background1.png', fit: BoxFit.cover) : Image.asset('assets/images/white.png', fit: BoxFit.cover),
          ),

          Positioned(
            top: 100,
            // right : 50,
            left: MediaQuery.of(context).size.width *0.3,
            child: 
            ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 120, sigmaY: 120),
              child: Container(
                width:  MediaQuery.of(context).size.width *0.3,
                height: MediaQuery.of(context).size.height *0.3,
                decoration: BoxDecoration(
                  color: GlobalManager.violet.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
          ),

          // -------- Acceuil ---------
          // Container(
          // decoration: BoxDecoration(
          //   color: const Color(0xFF14203A).withOpacity(0.3), // couleur unie
          // ),
          // child:
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.17,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TopMenu(onThemeChanged: widget.onThemeChanged),
                      Profilbanner(),
                    ],
                  ),
                ),

                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFF0C111D).withOpacity(0.6), 
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.17,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AboutWidget(),
                        SizedBox(height: 80),
                        ExperienceWidget(),
                        SizedBox(height: 80),
                        SkillWidget(),
                        SizedBox(height: 100),
                        ProjectWidget(),
                        SizedBox(height: 100),
                        FooterWidget(),
                        SizedBox(height: 100),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            bottom: 20,
            left: MediaQuery.of(context).size.width * 0.5 - 24,
            child: IconButton(
              onPressed: _scrollDown,
              icon: Icon(Icons.keyboard_arrow_down, size: 48),
              // color: Colors.white,
            ),
          ),
          // --------- Chargement ---------
          if (isLoading)
            Container(
              color: Colors.black,
              child: Center(
                child: LoadingAnimationWidget.fourRotatingDots(
                  color: GlobalManager.blue,
                  size: _Size,
                ),
              ),
            ),
        ],
      ),

    );
  }
}
