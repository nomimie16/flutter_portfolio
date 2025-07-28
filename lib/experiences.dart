import 'package:flutter/material.dart';
import 'package:flutter_portfolio/manager/globalmanager.dart';

class ExperienceWidget extends StatefulWidget {
  final List<Map<String, String>> experiences = [
    {
      'title': 'BUT Informatique',
      'subtitle': 'Université du littoral côte d\'opale • ',
      'years':'2023 - Aujourd\'hui',
      'description':
          "Développement web et mobile dans un établissement scolaire qui a pour objectif de faire de ses élèves la liberté.",
    },
    {
      'title': 'Baccalauréat Général',
      'subtitle': 'Lycée Giraux Sannier • ',
      'years':'2020 - 2023',
      'description':
          "Diplome avec mention très bien lié au spécialités Informatqiue et Mathématiques. Option Euro Anglais au cours d'1 an.",
    },
     {
      'title': 'Diplome National du Brevet',
      'subtitle': 'College Le Trion • ',
      'years':'2016 - 2020',
      'description':
          "Diplome avec mention très bien lié au spécialités Informatqiue et Mathématiques. Option Euro Anglais au cours d'1 an.",
    },
   
  ];

  ExperienceWidget({super.key, experiences});

  @override
  State<ExperienceWidget> createState() => _ExperienceWidgetState();
}

class _ExperienceWidgetState extends State<ExperienceWidget> {
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
            'Parcours',
            style: TextStyle(
              color: GlobalManager.blue,
              fontSize: 34,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 40),
          // Loop through the experiences and create a ListTile for each
          ...widget.experiences.map((experience) {
            return  Material(
            color: Colors.transparent,
            child: Container(
              margin: EdgeInsets.only(bottom: 40),
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                    color: GlobalManager.blue.withOpacity(0.5),
                    width: 2.0, 
                  ),
                ),
              ),
              child: ListTile(
                enabled: true,
                hoverColor: GlobalManager.blue.withOpacity(0.1),
                onTap: () {},
                mouseCursor: SystemMouseCursors.basic,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 5,
                ),
                
                title: Text(
                  experience['title']!,
                  style: TextStyle(
                    // color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                  ),
                ),
                subtitle: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          experience['subtitle']!,
                          style: TextStyle(
                            // color: const Color.fromARGB(255, 203, 203, 203),
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          experience ['years']!,
                          style: TextStyle(
                            color: GlobalManager.blue,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      experience['description']!,
                      style: TextStyle(
                        // color: const Color(0xFFD6D6D6),
                        fontWeight: FontWeight.w300,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            );
          }
          ),
        ],
      ),
    );
  }
}
