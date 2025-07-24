import 'package:flutter/material.dart';
import 'manager/globalmanager.dart';
import 'navigation.dart';

// Packages
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:zo_animated_border/zo_animated_border.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:text_typewriter/text_typewriter.dart';

class GradientText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Gradient gradient;

  const GradientText({
    super.key,
    required this.text,
    required this.gradient,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      blendMode: BlendMode.srcIn,
      child: Text(text, style: style),
    );
  }
}

class Profilbanner extends StatefulWidget {
  const Profilbanner({super.key});
  

  @override
  State<Profilbanner> createState() => _ProfilbannerState();
}

class _ProfilbannerState extends State<Profilbanner> {
  @override
  Widget build(BuildContext context) {
    return
    // Stack(
    //   children: [
    //     SingleChildScrollView(
    //       controller: _scrollController,
    //       child:
    Container(
      margin: EdgeInsets.symmetric(horizontal: 300),
      width: MediaQuery.of(context).size.width ,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TopMenu(),
          SizedBox(height: 60),
          ZoMonoCromeBorder(
            trackBorderColor: GlobalManager.blue,
            cornerRadius: 100.0,
            borderStyle: ZoMonoCromeBorderStyle.mirror,
            borderWidth: 8,
            duration: const Duration(seconds: 10),
            child: CircleAvatar(
              radius: 90,
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage('../assets/images/avatar.png'),
            ),
          ),

          // Container(
          //   padding: const EdgeInsets.all(3),
          //   decoration: BoxDecoration(
          //     shape: BoxShape.circle,
          //     border: Border.all(color: Colors.blue.withOpacity(0.5), width: 2),
          //   ),
          //   child: Container(
          //     decoration: BoxDecoration(
          //       shape: BoxShape.circle,
          //       border: Border.all(
          //         color: Colors.blue.withOpacity(0.5),
          //         width: 2,
          //       ),
          //     ),
          //     child: CircleAvatar(
          //       radius: 70,
          //       backgroundColor: Colors.transparent,
          //       // backgroundImage: AssetImage('../assets/images/test.png'),
          //     ),
          //   ),
          // ),
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _FakeButton(text: 'Frontend'),
              const SizedBox(width: 12),
              _FakeButton(text: 'Flutter'),
              const SizedBox(width: 12),
              _FakeButton(text: 'Mobile'),
            ],
          ),
          SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GradientText(
                text: "Noémie Lignier ",
                style: const TextStyle(
                  fontSize: 54,
                  fontWeight: FontWeight.bold,
                ),
                gradient: LinearGradient(
                  colors: [GlobalManager.violet, GlobalManager.pink],
                ),
              ),
              SizedBox(width: 10),

              // Icon(Icons.stars, size: 40, color: GlobalManager.blue),
            ],
          ),

          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Symbols.code, size: 32, color: GlobalManager.blue),
              Typewriter(
                [
                  ' Développeuse Frontend Flutter',
                  ' Apprentie Analyste Programmeuse',
                  ' Etudiante en BUT Informatique',
                ],
                textstyle: TextStyle(color: GlobalManager.blue, fontSize: 26),
                loop: true,
                erase: true,
                tailingtext: '|',
              ),
            ],
          ),
          SizedBox(height: 30),
          Container(
            width: MediaQuery.of(context).size.width * 0.3,
            child: Animate(
              effects: [FadeEffect(), ScaleEffect()],
              child:
                  Text(
                        "Apprentie Analyste Programmeuse chez POLYEDRE et étudiante en deuxième année de BUT Informatique ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: GlobalManager.grey,
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                        ),
                      )
                      .animate(
                        onPlay: (controller) =>
                            controller.repeat(reverse: true),
                      )
                      .moveY(begin: 0, end: -10, duration: 1.3.seconds),
            ),
          ),
        ],
      ),
    );
    // ),
    // Positioned(
    //   bottom: 20,
    //   left: 0,
    //   right: 0,
    //   child: Center(
    //     child: IconButton(
    //       icon: const Icon(Icons.keyboard_arrow_down_rounded, size: 40),
    //       onPressed: _scrollDown,
    //     ),
    //   ),
    // ),
    //   ],
    // );
  }
}

//Faux  Bouton
class _FakeButton extends StatelessWidget {
  final String text;

  const _FakeButton({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 6),
      decoration: BoxDecoration(
        color: GlobalManager.blue.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: GlobalManager.blue.withOpacity(0.2)),
      ),
      child: Text(text, style: TextStyle(color: GlobalManager.blue)),
    );
  }
}
