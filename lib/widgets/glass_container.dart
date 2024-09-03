import 'dart:ui';

import 'package:flutter/material.dart';

class GlassContainer extends StatelessWidget {
  final double blur;
  final double opacity;
  final AlignmentGeometry? alignment;
  final Widget? child;
  final Clip clipBehavior;
  final BoxConstraints? constraints;
  final Decoration? foregroundDecoration;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Matrix4? transform;
  final AlignmentGeometry? transformAlignment;
  final double? width;
  final Color color;
  final BlendMode? backgroundBlendMode;
  final BoxBorder? border;
  final BorderRadiusGeometry? borderRadius;
  final List<BoxShadow>? boxShadow;
  final Gradient? gradient;
  final BoxShape shape;

  const GlassContainer({
    super.key,
    required this.blur,
    required this.opacity,
    this.alignment,
    this.child,
    this.clipBehavior = Clip.none,
    this.constraints,
    this.foregroundDecoration,
    this.height,
    this.margin,
    this.padding,
    this.transform,
    this.transformAlignment,
    this.width,
    this.color = Colors.blueGrey,
    this.backgroundBlendMode,
    this.border,
    this.borderRadius,
    this.boxShadow,
    this.gradient,
    this.shape = BoxShape.rectangle,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(0),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(
          alignment: alignment,
          clipBehavior: clipBehavior,
          constraints: constraints,
          decoration: BoxDecoration(
            color: color.withOpacity(opacity),
            backgroundBlendMode: backgroundBlendMode,
            border: border,
            borderRadius: borderRadius,
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(.4),
                blurRadius: 180,
                spreadRadius: 5,
                offset: const Offset(5, 5),
              ),
            ],
            gradient: gradient,
            shape: shape,
          ),
          foregroundDecoration: foregroundDecoration,
          height: height,
          key: key,
          margin: margin,
          padding: padding,
          transform: transform,
          transformAlignment: transformAlignment,
          width: width,
          child: child,
        ),
      ),
    );
  }
}
