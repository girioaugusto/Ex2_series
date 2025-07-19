import 'package:app2_series/add_tv_show_screen.dart';
import 'package:app2_series/custom_drawer.dart';
import 'package:app2_series/tv_show_data.dart';
import 'package:app2_series/tv_show_model.dart';
import 'package:app2_series/tv_show_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TvShowModel(),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final List<TvShow> tvShows = favTvShowList;

  void addTvShow(tvShow) {
    setState(() {
      tvShows.add(tvShow);
    });
  }

  void removeTvShow(TvShow tvShow) {
    setState(() {
      //final index = tvShows.indexWhere(
      //(show) => show.title.toLowerCase() == tvShow.title.toLowerCase(),
      //);
      //tvShows.removeAt(index); //Se buscar uma remoção por atributo especifico
      tvShows.remove(tvShow);
    });
  }

  //Screen control
  int currentScreenIndex = 0;

  List<Widget> get screens => [
    TvShowScreen(),
    AddTvShowScreen(switchScreen: switchScreen),
  ];

  void switchScreen(int index) {
    setState(() {
      currentScreenIndex = index;
    });
  }

  //Theme Control

  bool isDark = false;

  void switchTheme() {
    setState(() {
      isDark = !isDark;
    });
  }

  @override
  Widget build(BuildContext context) {
    var color = Colors.purple;

    var colorScheme = ColorScheme.fromSeed(
      seedColor: color,
      brightness: Brightness.light,
    );

    var colorSchemeDark = ColorScheme.fromSeed(
      seedColor: color,
      brightness: Brightness.dark,
    );

    var customTheme = ThemeData(
      colorScheme: colorScheme,
      fontFamily: GoogleFonts.lato().fontFamily,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        toolbarHeight: 100,
        backgroundColor: colorScheme.primary,
        titleTextStyle: GoogleFonts.lobster(
          fontSize: 36,
          fontWeight: FontWeight.bold,
          color: colorScheme.onPrimary,
        ),
        iconTheme: IconThemeData(color: colorScheme.onPrimary, size: 36),
      ),
      cardTheme: CardThemeData(
        color: colorScheme.secondaryContainer,
        shadowColor: colorScheme.onSurface,
        elevation: 5,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );

    var customThemeDark = ThemeData(
      colorScheme: colorSchemeDark,
      fontFamily: GoogleFonts.lato().fontFamily,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        toolbarHeight: 100,
        backgroundColor: colorSchemeDark.primary,
        titleTextStyle: GoogleFonts.lobster(
          fontSize: 36,
          fontWeight: FontWeight.bold,
          color: colorSchemeDark.onPrimary,
        ),

        iconTheme: IconThemeData(color: colorScheme.onPrimary, size: 36),
      ),
      cardTheme: CardThemeData(
        color: colorSchemeDark.secondaryContainer,
        shadowColor: colorSchemeDark.onSurface,
        elevation: 5,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: customTheme,
      darkTheme: customThemeDark,
      themeMode: isDark
          ? ThemeMode.dark
          : ThemeMode.light, // Altere para .system se quiser seguir o SO
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [const Text('Eu amo séries 🎬')],
          ),
        ),
        drawer: CustomDrawer(
          isDark: isDark,
          switchTheme: switchTheme,
          switchScreen: switchScreen,
        ),
        body: screens[currentScreenIndex],
      ),
    );
  }
}
