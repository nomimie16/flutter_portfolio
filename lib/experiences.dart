import 'package:flutter/material.dart';
import 'package:flutter_portfolio/container.dart';
import 'package:flutter_portfolio/manager/globalmanager.dart';

class ExperienceWidget extends StatefulWidget {
  final List<Map<String, String>> experiences = [
    {
      'title': 'BUT Informatique',
      'subtitle': 'Université du Littoral Côte d\'Opale • ',
      'years':'2023 - Aujourd\'hui',
      'description':
          "Compétences en programmation, bases de données, réseaux et gestion de projet. \nParcours : Réalisation d'applications, conception et développement \nTOEIC Niveau B2 | 795 points",
    },
    {
      'title': 'Baccalauréat Général',
      'subtitle': 'Lycée Giraux Sannier • ',
      'years':'2020 - 2023',
      'description':
          "Spécialités Numérique Science de l'Informatique et Mathématiques. \nOption Euro Anglais pendant 1 an. \nMention très bien | LV2 Allemand",
    },
     {
      'title': 'Diplome National du Brevet',
      'subtitle': 'College Le Trion • ',
      'years':'2016 - 2020',
      'description':
          " Mention Très Bien | LV2 Allemand \n Option Latin pendant 3 ans.",
    },
   
  ];

  ExperienceWidget({super.key, experiences});

  @override
  State<ExperienceWidget> createState() => _ExperienceWidgetState();
}

class _ExperienceWidgetState extends State<ExperienceWidget> {
  int? hover;

  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 60),
          Text(
            'Parcours académique',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Parcours académique',
            style: TextStyle(
              fontSize: 18,
              color: GlobalManager.opacitylow
            ),
          ),
          SizedBox(height: 40),
          // Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: [
          SizedBox(
            width: 1000,
            height: 650,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
          ...widget.experiences.map((experience) {
            int index = widget.experiences.indexOf(experience);
           
            return PortfolioInfoCard(
              width: 800,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Text(
                experience['title']!,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 3),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      children: [
                        Text(
                          experience['subtitle']!,
                          style: TextStyle(
                            color: GlobalManager.blue,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          experience ['years']!,
                          style: TextStyle(
                            color: GlobalManager.opacitylow,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Text(
                      experience['description']!,
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: GlobalManager.opacitylow,
                        fontSize: 16,
                      ),
                    ),
                  ],)]
                )]);
  }),
        ]),
            )]));
          }
}
