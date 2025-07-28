import 'package:flutter/material.dart';
import 'package:flutter_portfolio/manager/globalmanager.dart';

class AboutWidget extends StatefulWidget {
  const AboutWidget({super.key});

  @override
  State<AboutWidget> createState() => _AboutWidgetState();
}

class _AboutWidgetState extends State<AboutWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1300,
      margin: EdgeInsets.symmetric(horizontal: 300),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 60),
          Text(
            'A propos',
            style: TextStyle(
              color: GlobalManager.blue,
              fontSize: 34,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 40),
          Text(
            'Je suis une développeuse passionné par la création d\'applications web et mobiles. Mon parcours m\'a permis de travailler sur divers projets, allant de la conception d\'interfaces utilisateur à la mise en place de systèmes backend robustes.',
            style: TextStyle(
              // color: Colors.white,
              fontSize: 18,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
