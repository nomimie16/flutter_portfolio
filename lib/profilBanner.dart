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
          //     backgroundImage: AssetImage('../assets/images/avatar.png'),
          //   ),
          // ),

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
                          // color: GlobalManager.grey,
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
class FakeButton extends StatelessWidget {
  final String text;
  final bool enabled;
  final String? link;

  FakeButton({required this.text, required this.enabled, this.link});

  // Uri _getLink(String? link) {
  //   if (link != null) {
  //     final Uri url = Uri.parse(link);
  //     return (url);
  //   }
  // }

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
        backgroundColor: MaterialStateProperty.all(
          GlobalManager.blue.withOpacity(0.05),
        ),
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
