import 'package:flutter/material.dart';

final customTextTheme = TextTheme(
  bodyMedium: const TextStyle(
    color: Colors.black,
    fontSize: 16,
    fontFamily: 'Agrandir',
    fontWeight: FontWeight.bold,
  ),
  bodySmall: TextStyle(
    color: Colors.black.withOpacity(0.6),
    fontSize: 14,
    fontFamily: 'Agrandir',
  ),
  headlineMedium: const TextStyle(
    color: Colors.white,
    fontSize: 22,
    fontFamily: 'Agrandir',
    fontWeight: FontWeight.w700,
    height: 0.06,
    letterSpacing: -0.40,
  ),
  titleSmall: TextStyle(
    color: Colors.black.withOpacity(0.6),
    fontSize: 16,
    fontFamily: 'Agrandir',
    letterSpacing: -0.40,
  ),
  titleMedium: TextStyle(
    color: Colors.white.withOpacity(0.6),
    fontSize: 16,
    fontFamily: 'Agrandir',
    fontWeight: FontWeight.bold,
    height: 0.11,
    letterSpacing: -0.40,
  ),
  labelMedium: const TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontFamily: 'Agrandir',
    fontWeight: FontWeight.bold,
  ),
  labelLarge: const TextStyle(
    color: Color(0xFF4FA07B),
    fontSize: 16,
    fontFamily: 'Agrandir',
    fontWeight: FontWeight.w700,
    height: 0.09,
  ),
  labelSmall: const TextStyle(
    color: Colors.black,
    fontSize: 8,
    fontFamily: 'Agrandir',
    fontWeight: FontWeight.w700,
    height: 0.18,
  ),
);
