import 'package:flutter/material.dart';
import 'package:flutter_portfolio/manager/globalmanager.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class FooterWidget extends StatefulWidget {
  const FooterWidget({super.key});

  @override
  State<FooterWidget> createState() => _FooterWidgetState();
}

class _FooterWidgetState extends State<FooterWidget> {
  final Uri github = Uri.parse('https://github.com/nomimie16');
  final Uri linkedin = Uri.parse('https://www.linkedin.com/in/noemie-lignier-a38959300/');
  final Uri twitter = Uri.parse('https://flutter.dev');

 Future<void> _launchUrl(_url) async {
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 150,
        child : Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed:(){  _launchUrl(github);},
              icon: FaIcon(FontAwesomeIcons.github),),
               IconButton(
              onPressed: () {_launchUrl(linkedin);},
              icon: FaIcon(FontAwesomeIcons.linkedin),),
               IconButton(
              onPressed: () {_launchUrl(twitter);},
              icon: FaIcon(FontAwesomeIcons.twitter),),
          ],
        ),),



        SizedBox(height: 20),
        Text("Fait avec ♥ par Noémie LIGNIER",
        //  style: TextStyle(color: Colors.grey),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.code, color: GlobalManager.blue),
            Text(" Construit avec Flutter",
            //  style: TextStyle(color: Colors.grey,)
             ),
          ],
        ),
      ],
    );
  }

 
}
