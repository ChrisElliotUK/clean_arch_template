import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class SharedZAxisTransitionRouteBuilder<T> extends PageRouteBuilder<T> {
  /// The page to be transitioned to.
  final Widget page;

  /// The duration of the transition.
  ///
  /// Defaults to 300ms
  final Duration? pageTransitionDuration;

  /// The duration of the reverse transition
  ///
  /// Defaults to 300ms
  final Duration? pageReverseTransitionDuration;

  /// The color to fill the background with during the transition.
  ///
  /// Defaults to the [ThemeData.cardColor]
  final Color? fillColor;

  SharedZAxisTransitionRouteBuilder(
      {required this.page,
      required super.settings,
      this.fillColor,
      this.pageReverseTransitionDuration,
      this.pageTransitionDuration})
      : super(
          transitionDuration: pageTransitionDuration ?? const Duration(milliseconds: 300),
          reverseTransitionDuration: pageReverseTransitionDuration ?? const Duration(milliseconds: 300),
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SharedAxisTransition(
              fillColor: fillColor ?? Theme.of(context).cardColor,
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              transitionType: SharedAxisTransitionType.scaled,
              child: child,
            );
          },
        );
}
