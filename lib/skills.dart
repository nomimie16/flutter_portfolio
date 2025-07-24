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
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1300,
      // decoration: BoxDecoration(
      //   color : GlobalManager.blue,
      // ),
      margin: EdgeInsets.symmetric(horizontal: 300),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 60),
          Text(
            'Skills',
            style: TextStyle(
              color: GlobalManager.blue,
              fontSize: 34,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 40),

          Wrap(
            direction: Axis.horizontal,
            spacing: 8,
            runSpacing: 8,
            children: skills.map((skill) {
              return HoverExtensions(
                child: _FakeButton(text: skill['text']!, img: skill['img']!),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class _FakeButton extends StatelessWidget {
  final String text;
  final String img;

  const _FakeButton({required this.text, required this.img});

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
          Text(text, style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
