import 'package:flutter/material.dart';
import 'package:flutter_portfolio/container.dart';
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
      // width: 1000,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          Text(
            'A propos',
            style: TextStyle(
              // color: GlobalManager.blue,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          Text(
            "Apprenez à mieux me connaître",
            style: TextStyle(
              color: GlobalManager.opacitylow,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 40),
          SizedBox(
            width: 750,
            child:
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  PortfolioInfoCard(
                    width: 230,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    children: [
                      Text(
                        "2+",
                        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Années d'expérience",
                        style: TextStyle(fontSize: 16,color: GlobalManager.opacitylow),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),

                  PortfolioInfoCard(
                    width: 230,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    children: [
                      Text(
                        "20+",
                        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Projets réalisés",
                        style: TextStyle(fontSize: 16,color: GlobalManager.opacitylow),
                      ),
                    ],
                  ),

                ],
              ),
              SizedBox(
                width: 500,
                child: 
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Bonjour, je suis Noémie Lignier, passionnée par la création d\'applications web et mobiles  évolutives. J\'ai suivi une formation en développement full-stack et je m\'infome constamment des nouvelles technologies afin de perfectionner mes compétences. Mon objectif est d\'intégrer une école d\'ingénieur Informatique pour la rentrée 2026 afin de me spécialiser dans l\'architecture logicielle et le développement mobile.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 16,
                      color: GlobalManager.opacitylow,
                    ),
                  ),
                  SizedBox(height: 5),
                  PortfolioInfoCard(
                    width: 100,
                    height: 40,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    children: [
                      Text(
                        "CV",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ))
            ],
          ),
          )
          
        ],
      ),
    );
  }
}
