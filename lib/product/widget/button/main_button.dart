import 'package:biren_kocluk/product/init/theme/light_theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.color,
  });

  final VoidCallback onPressed;
  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: 70,
        decoration: BoxDecoration(
          borderRadius: context.highBorderRadius,
          color: color,
          gradient: color == null
              ? const LinearGradient(
                  colors: [
                    LightThemeColors.blazeOrange,
                    LightThemeColors.red,
                  ],
                )
              : null,
        ),
        child: Center(
          child: _text(context),
        ),
      ),
    );
  }

  Text _text(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
          color: LightThemeColors.white, fontWeight: FontWeight.bold),
    );
  }
}
