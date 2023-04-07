import 'package:flutter/material.dart';

ThemeData getTheme({bool isDarkMode = true}) {
  return ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme.dark().copyWith(
    brightness: Brightness.dark,
    //主要基色
    primary: Colors.white,
    //应用于位于主要内容之上的内容（图标、文本等）
    onPrimary: Colors.red,
    //主容器适用于比主容器需要更少强调的元素
    primaryContainer: Colors.white,
    //容器应用于位于主容器顶部的内容（图标、文本等）
    onPrimaryContainer: Colors.red,
    secondary:Colors.red,
    onSecondary: Colors.red,
    secondaryContainer: Colors.red,
    onSecondaryContainer: Colors.red,
    tertiary: const ColorScheme.dark().onPrimaryContainer,
    onTertiary: const ColorScheme.dark().onPrimaryContainer,
    tertiaryContainer: Colors.red,
    onTertiaryContainer:Colors.red,
    error: const ColorScheme.dark().onPrimaryContainer,
    onError: const ColorScheme.dark().onPrimaryContainer,
    errorContainer: const ColorScheme.dark().onPrimaryContainer,
    onErrorContainer: const ColorScheme.dark().onPrimaryContainer,
    background: Colors.transparent,
    onBackground:Colors.red,
    surface: Colors.transparent,//顶部导航栏，Tab
    onSurface: Colors.white,//surface之上的颜色，tab颜色等
    surfaceVariant:Colors.white,
    onSurfaceVariant: Colors.white,
    outline: const ColorScheme.dark().onPrimaryContainer,
    outlineVariant: const ColorScheme.dark().onPrimaryContainer,
    shadow: const ColorScheme.dark().onPrimaryContainer,
    scrim: const ColorScheme.dark().onPrimaryContainer,
    inverseSurface: const ColorScheme.dark().onPrimaryContainer,
    onInverseSurface: const ColorScheme.dark().onPrimaryContainer,
    inversePrimary: const ColorScheme.dark().onPrimaryContainer,
    surfaceTint: const ColorScheme.dark().onPrimaryContainer,
  ),bottomAppBarTheme:BottomAppBarTheme(

  ));
}
