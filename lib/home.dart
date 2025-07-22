import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_portfolio/manager/globalmanager.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'profilBanner.dart';

const double _Size = 50;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = true;

  final ScrollController _scrollController = ScrollController();

  void _scrollDown() {
    // Fait défiler de 300 pixels vers le bas
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
    return Scaffold(
      backgroundColor: Color(0xFF101622),
      body: Stack(
        children: [
          // --------- Image Fond de page ---------
          Positioned.fill(
            child: Image.asset('assets/images/img.png', fit: BoxFit.cover),
          ),

          Positioned(
            top: 100,
            left: 550,
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 120, sigmaY: 120),
              child: Container(
                width: 800,
                height: 300,
                decoration: BoxDecoration(
                  color: GlobalManager.violet.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
          ),

          // -------- Acceuil ---------
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                Profilbanner(),
                SizedBox(height: 100),

                // Exemple : section 1
                Container(
                  height: 600,

                  child: Center(
                    child: Text(
                      "À propos",
                      style: TextStyle(color: Colors.white, fontSize: 32),
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
              color: Colors.white,
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

      //   Center(
      //     child: LoadingAnimationWidget.fourRotatingDots(
      //   color: Colors.white,
      //   size: _Size,

      // ),),
    );
  }
}
