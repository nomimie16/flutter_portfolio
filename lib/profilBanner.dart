import 'package:flutter/material.dart';
import 'manager/globalmanager.dart';
import 'navigation.dart';

// Packages
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:zo_animated_border/zo_animated_border.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:text_typewriter/text_typewriter.dart';
import 'package:url_launcher/url_launcher.dart';

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
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // TopMenu(),
          SizedBox(height: 60),
          // ZoMonoCromeBorder(
          //   trackBorderColor: GlobalManager.blue,
          //   cornerRadius: 100.0,
          //   borderStyle: ZoMonoCromeBorderStyle.mirror,
          //   borderWidth: 8,
          //   duration: const Duration(seconds: 10),
          //   child: CircleAvatar(
          //     radius: 90,
          //     backgroundColor: Colors.transparent,
          //     backgroundImage: AssetImage('assets/images/avatar.png'),
          //   ),
          // ),

          ZoAnimatedGradientBorder(
            borderRadius: 100,
            borderThickness: 4,
            gradientColor: [
              GlobalManager.pink,
              GlobalManager.violet,
              GlobalManager.blue,
            ],
            duration: Duration(seconds: 4),
              child: CircleAvatar(
              radius: 90,
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage('assets/images/avatar2.png'),  
          ),),

          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FakeButton(text: 'Frontend', enabled: false,),
              const SizedBox(width: 12),
              FakeButton(text: 'Flutter', enabled: false,),
              const SizedBox(width: 12),
              FakeButton(text: 'Mobile', enabled: false,),
            ],
          ),
          SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GradientText(
                text: "Noémie Lignier",
                style: const TextStyle(
                  fontSize: 54,
                  fontWeight: FontWeight.bold,
                ),
                gradient: LinearGradient(
                  colors: [GlobalManager.violet, GlobalManager.pink],
                ),
              ),

              SizedBox(width: 10),
              Animate(
              effects: [
                  // Supprime FadeEffect si tu veux uniquement l'agrandissement
                  ScaleEffect(
                    begin: Offset(1, 1), // taille initiale
                    end: Offset(0.9, 0.9), // taille finale (50% plus grande)
                    duration: 1.seconds,
                    curve: Curves.easeInOut,
                  ),
                ],
                child:
                    Icon(
                          Symbols.star_shine,
                          size: 38,
                          color: GlobalManager.blue,
                        )
                        .animate(
                          onPlay: (controller) =>
                              controller.repeat(reverse: true),
                        )
                        .scale(
                          begin: Offset(1, 1),
                          end: Offset(0.7, 0.7),
                          duration: 1.seconds,
                          curve: Curves.easeInOut,
                        )
              )
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
                  ' Apprentie analyste programmeuse',
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
            child:
            //  Animate(
            //   effects: [FadeEffect(), ScaleEffect()],
            //   child:
            Text(
                  "Apprentie Développeuse et étudiante en dernière année de BUT Informatique. A la recherche d'une alternance pour la rentrée 2026.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    // color: GlobalManager.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                  ),
                )
            //           .animate(
            //             onPlay: (controller) =>
            //                 controller.repeat(reverse: true),
            //           )
            //           .moveY(begin: 0, end: -10, duration: 1.3.seconds),
            // ),
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
class FakeButton extends StatelessWidget {
  final String text;
  final bool enabled;
  final String? link;

  FakeButton({required this.text, required this.enabled, this.link});

  Uri _getLink(String? link) {
    return Uri.parse(link!);
  }

  Future<void> _launchUrl(_url) async {
    print(enabled);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(horizontal: 13, vertical: 6),
        ),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (states) {
            if (states.contains(MaterialState.disabled)) {
              return GlobalManager.blue.withOpacity(0.05); 
            }
            return GlobalManager.blue.withOpacity(0.05); 
          },
        ),
        //  foregroundColor: MaterialStateProperty.resolveWith<Color>(
        //   (states) {
        //     if (states.contains(MaterialState.disabled)) {
        //       return GlobalManager.blue; 
        //     }
        //     return Colors.white; 
        //   },
        // ),
         overlayColor: MaterialStateProperty.all(Colors.transparent), 
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(color: GlobalManager.blue.withOpacity(0.2)),
          ),
        ),
      ),

      onPressed: enabled
          ? () { 
              launchUrl(_getLink(link));
            }
          : null,

      child: Text(text, style: TextStyle(color: GlobalManager.blue)),
    );
  }
}
