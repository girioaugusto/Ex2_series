import 'package:app2_series/my_theme_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Eu amo Séries 🎬',
                    style: GoogleFonts.lobster(
                      textStyle: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: context.read<MyThemeModel>().switchTheme,
                    label: const Text('MUDAR TEMA'),
                    icon: context.watch<MyThemeModel>().isDark
                        ? const Icon(Icons.wb_sunny_rounded, size: 24)
                        : const Icon(Icons.nightlight_round_sharp, size: 24),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.onPrimary,
                      foregroundColor: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.of(context).pop();
              context.go('/');
              WidgetsBinding.instance.addPostFrameCallback((_) {});
            },
          ),
          ListTile(
            leading: const Icon(Icons.add),
            title: const Text('Adicionar série'),
            onTap: () {
              Navigator.of(context).pop();
              context.go('/add');
              WidgetsBinding.instance.addPostFrameCallback((_) {});
            },
          ),
        ],
      ),
    );
  }
}
