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
    return Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Projets',
            style: TextStyle(
              color: GlobalManager.blue,
              fontSize: 34,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            runAlignment: WrapAlignment.start,
            spacing: MediaQuery.of(context).size.width * 0.017,
            runSpacing: MediaQuery.of(context).size.width * 0.02,
            children: [
            Project(title : "Nutrimeal - Application de partage de recettes", img :"assets/images/nutrimeal.png", description: "Nutrimeal est une application mobile développée en Flutter qui permet de créer et de gérer un carnet de recettes personnalisé. Elle offre la possibilité d’ajouter de nombreux détails à chaque recette, comme le temps de préparation, les valeurs nutritionnelles et une note d’évaluation."  ,),
            Project(title : "Chachoumarket - Logiciel de recherche de chemins", img :"assets/images/chachou.png", description: "Chachoumarket est un logiciel développé en Python. Celui-ci a pour but d'optimiser les chemins des clients d'un supermarché. Les utilsateurs rentrent le plan d'un magasin de grande surface et l'application calcule automatqiuement le parcours le plus simple à emprunter parmi les rayons."  ,),
            Project(title : "PredictoLoto - Site web de predictions pour le Loto", img :"assets/images/loto.png", description: "PredictoLoto est un appliaction web dynamique qui a pour objectif de fournir des prédictions sur le Loto. Ce projet réalisé par équipe de 5 utilise les données officielles du Loto dans le but de fournir des indications sur le prochain tirage. Ce site est développé en PHP avec une base de données PostgreSql."  ,),
            Project(title : "Spaceapp - Application mobile sur l'astronomie", img :"assets/images/space3.png", description: "Développée en Flutter, l'application Spaceapp concerne l'astronomie. Cette application mobile a été conçu pour donner des informations sur les planetes et l'espace à ses utilisateurs. Une fois lancée, vous pourrez y retrouver les astres, le descriptif de certaines planetes et bien plus encore. "  ,),
            Project(title : "Astrophoto - Traitement d'images astronomiques", img :"assets/images/space.png", description: "Nutrimeal est une application mobile développée en Flutter qui permet de créer et de gérer un carnet de recettes personnalisé. Elle offre la possibilité d’ajouter de nombreux détails à chaque recette, comme le temps de préparation, les valeurs nutritionnelles et une note d’évaluation. "  ,),
            Project(title : "Portfolio - Site interactif retrançant mon parcours", img :"assets/images/portfolio.png", description: "Portfolio Personnel réalisé en Javascript Html et CSS dans le cadre de ma recherche d’alternance. Un site web moderne et responsive mettant en valeur mes compétences et mes projets acquis durant mes années de formation. Et je rajoute du texte pour voir la taille."  ,),

     ])]);
  }

}


class Project extends StatefulWidget {
  // final double width;
  // final double height;
  final String title;
  final String description;
  final String img;

  const Project({
    super.key,
    // this.width = 300,
    // this.height = 500,
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
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Card.outlined(
      color : Colors.transparent,
      

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.all(Radius.circular(10)),
        
        side: BorderSide(
          color: hover
              ? GlobalManager.blue.withOpacity(0.6)
              : GlobalManager.blue.withOpacity(0.3),
          // width: 2,
        ),
      ),
      child: MouseRegion(
                onEnter: (_) => setState(() => hover = true),
                onExit: (_) => setState(() => hover = false),

      child: Container(
        constraints: BoxConstraints(
            minWidth: 230,
            maxWidth: 370, 
          ),
          decoration: BoxDecoration(
            gradient: hover ? LinearGradient(
              colors: [
                GlobalManager.blue.withOpacity(0.05),
                GlobalManager.violet2.withOpacity(0.05),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ) : LinearGradient(
              colors: [
                Colors.transparent,
                Colors.transparent,
              ],
          ),  ),        
      child: Padding(
        padding: EdgeInsetsGeometry.all(25),
          child: Column(
            mainAxisAlignment : MainAxisAlignment.center,
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
                        SizedBox(width: screenWidth * 0.01,),
                        
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.title,
                                softWrap : true,
                                overflow: TextOverflow.visible,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: hover
                                      ? Color(0xFF5EA1F4)
                                      : Theme.of(
                                          context,
                                        ).textTheme.bodyMedium!.color,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: screenHeight * 0.007,),
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeOut,
                                height: screenHeight*0.004,
                                width: hover ? screenWidth*0.1 : screenWidth*0.02,
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
                    SizedBox(height: screenHeight* 0.02),
                    Opacity(
                      opacity: 0.7,
                      child: Text(
                        widget.description,
                        softWrap: true,
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    // --------------- Lien git hub -------------------------------
                    SizedBox(height: screenHeight* 0.02),

                  ],
                ),
              
              HoverExtensions(
                child: 
                FakeButton(
                  text: "Github",
                  link: "https://github.com/nomimie16/",
                  enabled: true,
                ),
              ),
            ])
          ),
        // ),
      ),),
    );
  }
}
