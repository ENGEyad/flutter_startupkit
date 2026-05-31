import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Primary brand colors
  static const Color primary = Color(0xFF6366F1); // Indigo
  static const Color secondary = Color(0xFF14B8A6); // Teal

  // Light theme colors
  static const Color lightBackground = Color(0xFFF8FAFC);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightPrimary = Color(0xFF4F46E5);
  static const Color lightOnBackground = Color(0xFF0F172A);
  static const Color lightOnSurface = Color(0xFF334155);

  // Dark theme colors (sleek navy/slate dark mode)
  static const Color darkBackground = Color(0xFF0B0F19);
  static const Color darkSurface = Color(0xFF1E293B);
  static const Color darkPrimary = Color(0xFF6366F1);
  static const Color darkOnBackground = Color(0xFFF8FAFC);
  static const Color darkOnSurface = Color(0xFF94A3B8);

  // Accents and semantic colors
  static const Color success = Color(0xFF10B981);
  static const Color error = Color(0xFFEF4444);
  static const Color warning = Color(0xFFF59E0B);
  static const Color info = Color(0xFF3B82F6);
  static const Color grey = Color(0xFF64748B);
}
