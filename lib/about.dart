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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
            'Je suis une développeuse frontend passionnée par la création d\'interfaces utilisateurs. J\'ai eu l\'occasion de trvailler sur divers projets allant de la création de sites web à la réalisation d\'applications web et mobiles.',
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
