import 'package:flutter/material.dart';
import 'package:flutter_portfolio/extensions/hover_extensions.dart';
import 'manager/globalmanager.dart';

class SkillWidget extends StatefulWidget {
  const SkillWidget({super.key});

  @override
  State<SkillWidget> createState() => _SkillWidgetState();
}

class _SkillWidgetState extends State<SkillWidget> {
  final List<Map<String, String>> skills = [
    {'text': 'Flutter', 'img': 'assets/images/flutter.png'},
    {'text': 'HTML', 'img': 'assets/images/html.png'},
    {'text': 'CSS', 'img': 'assets/images/css.png'},
    {'text': 'Typescript', 'img': 'assets/images/typescript.png'},
    {'text': 'JavaScript', 'img': 'assets/images/javascript.png'},
    {'text': 'Java', 'img': 'assets/images/java.png'},
    {'text': 'Python', 'img': 'assets/images/python.png'},
    {'text': 'Figma', 'img': 'assets/images/figma.png'},
    {'text': 'Docker', 'img': 'assets/images/docker.png'},
    {'text': 'Symfony', 'img': 'assets/images/synfony.png'},
    {'text': 'Canva', 'img': 'assets/images/canva.png'},
    {'text': 'NodeJS', 'img': 'assets/images/node.png'},
    {'text': 'PostgreSQL', 'img': 'assets/images/mysql.jpg'},
    {'text': 'VueJS', 'img': 'assets/images/vue.png'},
    {'text': 'GitHub', 'img': 'assets/images/github.png'},
    {'text': 'Langage C', 'img': 'assets/images/c.png'},

    
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Skills',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
           Text(
            'Skills',
            style: TextStyle(
              fontSize: 18,
              color: GlobalManager.opacitylow
            ),
          ),
          SizedBox(height: 40),
          SizedBox(
            width: 1000, 
            child:
          Wrap(
            direction: Axis.horizontal,
            children: skills.map((skill) {
              return HoverExtensions(
                child: FakeButtonImg(text: skill['text']!, img: skill['img']!),
              );
            }).toList(),
          ),)
        ],
      ),
    );
  }
}

class FakeButtonImg extends StatelessWidget {
  final String text;
  final String img;

  const FakeButtonImg({required this.text, required this.img});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
      margin: const EdgeInsets.only(right: 18, top: 15, bottom: 15),
      decoration: BoxDecoration(
        color: GlobalManager.blue.withOpacity(0.05),
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: GlobalManager.blue.withOpacity(0.2)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(img, width: 25, height: 25),
          const SizedBox(width: 8),
          Text(text, ),
        ],
      ),
    );
  }
}
