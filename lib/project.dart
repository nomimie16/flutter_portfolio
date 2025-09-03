import 'package:flutter/material.dart';
import 'package:flutter_portfolio/manager/globalmanager.dart';
import 'package:flutter_portfolio/profilBanner.dart';
import 'package:flutter_portfolio/extensions/hover_extensions.dart';

class ProjectWidget extends StatefulWidget{

  const ProjectWidget({
    super.key,});

    @override
  State<ProjectWidget> createState() => _ProjectWidgetState();
}

class _ProjectWidgetState extends State<ProjectWidget> {

@override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 30,
      runSpacing: 20,
      children: [
      Project(title : "Nutrimeal - Application de partage de recettes", img :"assets/images/nutrimeal_green.png", description: "Nutrimeal est une application mobile développée en Flutter qui permet de créer et de gérer un carnet de recettes personnalisé. Elle offre la possibilité d’ajouter de nombreux détails à chaque recette, comme le temps de préparation, les valeurs nutritionnelles et une note d’évaluation. "  ,),
      Project(title : "Chachoumarket - Logiciel de recherche de chemins", img :"assets/images/chachou.png", description: "Nutrimeal est une application mobile développée en Flutter qui permet de créer et de gérer un carnet de recettes personnalisé. Elle offre la possibilité d’ajouter de nombreux détails à chaque recette, comme le temps de préparation, les valeurs nutritionnelles et une note d’évaluation. "  ,),
      Project(title : "LotoProno - Site web de predictions pour le Loto", img :"assets/images/loto.png", description: "Nutrimeal est une application mobile développée en Flutter qui permet de créer et de gérer un carnet de recettes personnalisé. Elle offre la possibilité d’ajouter de nombreux détails à chaque recette, comme le temps de préparation, les valeurs nutritionnelles et une note d’évaluation. "  ,),
      Project(title : "Spaceapp - Application mobile sur l'astronomie", img :"assets/images/astronaute.jpg", description: "Nutrimeal est une application mobile développée en Flutter qui permet de créer et de gérer un carnet de recettes personnalisé. Elle offre la possibilité d’ajouter de nombreux détails à chaque recette, comme le temps de préparation, les valeurs nutritionnelles et une note d’évaluation. "  ,),
      Project(title : "Astrophoto - Traitement d'images astronomiques", img :"assets/images/space.png", description: "Nutrimeal est une application mobile développée en Flutter qui permet de créer et de gérer un carnet de recettes personnalisé. Elle offre la possibilité d’ajouter de nombreux détails à chaque recette, comme le temps de préparation, les valeurs nutritionnelles et une note d’évaluation. "  ,),
      Project(title : "Portfolio - Site web dynamique", img :"assets/images/portfolio.png", description: "Nutrimeal est une application mobile développée en Flutter qui permet de créer et de gérer un carnet de recettes personnalisé. Elle offre la possibilité d’ajouter de nombreux détails à chaque recette, comme le temps de préparation, les valeurs nutritionnelles et une note d’évaluation. "  ,),

     ]);
  }

}


class Project extends StatefulWidget {
  final double width;
  final double height;
  final String title;
  final String description;
  final String img;

  const Project({
    super.key,
    this.width = 300,
    this.height = 500,
    required this.title,
    required this.description,
    required this.img,
  });

  @override
  State<Project> createState() => _ProjectState();
}

class _ProjectState extends State<Project> {
  bool hover = false;
  
  

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.all(Radius.circular(10)),
        
        side: BorderSide(
          color: hover
              ? GlobalManager.blue.withOpacity(0.5)
              : GlobalManager.blue.withOpacity(0.3),
          // width: 2,
        ),
      ),
      child: MouseRegion(
                onEnter: (_) => setState(() => hover = true),
                onExit: (_) => setState(() => hover = false),

                
      child: Padding(
        padding: EdgeInsetsGeometry.all(25),
        child: SizedBox(
          width: widget.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // ------------------ Nom projet + image ----------------------
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          child: Image.asset(widget.img, width: 50, height: 60),
                        ),
                        SizedBox(width: 15),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.title,
                                softWrap: true,
                                overflow: TextOverflow.visible,
                                style: TextStyle(
                                  fontSize: 17,
                                  color: hover
                                      ? Color(0xFF5EA1F4)
                                      : Theme.of(
                                          context,
                                        ).textTheme.bodyMedium!.color,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5),
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeOut,
                                height: 4,
                                width: hover ? 200 : 50,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      GlobalManager.blue2,
                                      GlobalManager.violet2,
                                    ],
                                  ),
                                 borderRadius : BorderRadius.circular(1)
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    // ------------------ Description projet  ----------------------
                    SizedBox(height: 15),
                    Opacity(
                      opacity: 0.7,
                      child: Text(
                        widget.description,
                        softWrap: true,
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    // --------------- Lien git hub -------------------------------
                    SizedBox(height: 15),
                  ],
                ),
              
              HoverExtensions(
                child: FakeButton(
                  text: "Github",
                  link: "https://github.com/nomimie16/",
                  enabled: true,
                ),
              ),
            ])
          ),
        ),
      ),
    );
  }
}
