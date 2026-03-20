import 'package:flutter/material.dart';
import 'package:flutter_portfolio/manager/globalmanager.dart';

class PortfolioInfoCard extends StatelessWidget {
	final double? width;
	final double? height;
	final EdgeInsetsGeometry padding;
	final List<Widget> children;
	final BorderRadiusGeometry borderRadius;
	final Color? color;
	final Color? borderColor;
	final double borderWidth;
	final MainAxisAlignment mainAxisAlignment;
	final CrossAxisAlignment crossAxisAlignment;

	const PortfolioInfoCard({
		super.key,
		this.width,
		this.height,
		this.padding = const EdgeInsets.symmetric(horizontal: 100, vertical: 30),
		required this.children,
		this.borderRadius = const BorderRadius.all(Radius.circular(10)),
		this.color,
		this.borderColor,
		this.borderWidth = 0.3,
		this.mainAxisAlignment = MainAxisAlignment.start,
		this.crossAxisAlignment = CrossAxisAlignment.center,
	});

	@override
	Widget build(BuildContext context) {
		return SizedBox(
			width: width,
			height: height,
			child: Card(
				color: color ?? GlobalManager.blue.withOpacity(0.1),
				shape: RoundedRectangleBorder(
					borderRadius: borderRadius,
					side: BorderSide(
						color: borderColor ?? GlobalManager.blue.withOpacity(0.6),
						width: borderWidth,
					),
				),
				child: Padding(
					padding: padding,
					child: Column(
						mainAxisSize: MainAxisSize.min,
						mainAxisAlignment: mainAxisAlignment,
						crossAxisAlignment: crossAxisAlignment,
						children: children,
					),
				),
			),
		);
	}
}
