import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TopMenu extends StatelessWidget {
   TopMenu({super.key});

  final menuItems = const ['Accueil', 'Projets', 'Contact'];
  Icon theme = const Icon(Icons.wb_sunny_outlined, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 60, bottom: 60, right: 40),
      color: Colors.transparent, 
      child: Row(children: [

       Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: menuItems.map((title) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: _HoverMenuItem(title: title),
          );
        }).toList(),
        
      ),
        const Spacer(),
        ThemeToggleButton(),
      ])
    );
  }
}

class _HoverMenuItem extends StatefulWidget {
  final String title;
  const _HoverMenuItem({required this.title});

  @override
  State<_HoverMenuItem> createState() => _HoverMenuItemState();
}

class _HoverMenuItemState extends State<_HoverMenuItem> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      cursor: SystemMouseCursors.click,
      child: AnimatedDefaultTextStyle(
        duration: const Duration(milliseconds: 200),
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          decoration: _hovering ? TextDecoration.underline : TextDecoration.none,
        ),
        child: Text(widget.title),
      ),
    );
  }
}

class ThemeToggleButton extends StatefulWidget {
  const ThemeToggleButton({super.key});

  @override
  State<ThemeToggleButton> createState() => _ThemeToggleButtonState();
}

class _ThemeToggleButtonState extends State<ThemeToggleButton> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isDark ? Icons.nightlight_round : Icons.wb_sunny_outlined,
        color: Colors.white,
      ),
      onPressed: () {
        setState(() {
          isDark = !isDark;
          // Ici tu peux aussi changer le thème global si nécessaire
        });
      },
    );
  }
}