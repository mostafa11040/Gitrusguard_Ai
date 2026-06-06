import 'dart:ui' as ui;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gitrusguard_ai/Features/Home/home_screen.dart';
import 'package:gitrusguard_ai/Features/Map/gis_map_screen.dart';
import 'package:gitrusguard_ai/Features/Scan/ScanScreen.dart';
import 'package:gitrusguard_ai/Features/Settings/settings_screen.dart';
import 'package:gitrusguard_ai/Features/Profile/profile_screen.dart';
import 'package:gitrusguard_ai/core/localization/locale_keys.dart';

class BottomNavigationBarShell extends StatefulWidget {
  const BottomNavigationBarShell({super.key, this.initialIndex = 4});

  final int initialIndex;

  @override
  State<BottomNavigationBarShell> createState() =>
      _BottomNavigationBarShellState();
}

class _BottomNavigationBarShellState extends State<BottomNavigationBarShell> {
  late int _currentIndex;

  final List<_BottomNavDestination> _destinations = const [
    _BottomNavDestination(
      index: 0,
      labelKey: LocaleKeys.navSettings,
      icon: Icons.settings_outlined,
      selectedIcon: Icons.settings,
    ),
    _BottomNavDestination(
      index: 1,
      labelKey: LocaleKeys.ProfileTitle,
      icon: Icons.person_outline_rounded,
      selectedIcon: Icons.person_rounded,
    ),
    _BottomNavDestination(
      index: 2,
      labelKey: LocaleKeys.navGisMap,
      icon: Icons.map_outlined,
      selectedIcon: Icons.map,
    ),
    _BottomNavDestination(
      index: 3,
      labelKey: LocaleKeys.navScan,
      icon: Icons.qr_code_scanner_rounded,
      selectedIcon: Icons.qr_code_scanner,
    ),
    _BottomNavDestination(
      index: 4,
      labelKey: LocaleKeys.navHome,
      icon: Icons.home_outlined,
      selectedIcon: Icons.home,
    ),
  ];

  late final List<Widget> _pages = <Widget>[
    const SettingsScreen(),
    const ProfileScreen(),
    const GisMapScreen(),
    const Scanscreen(),
    const HomeScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex.clamp(0, _pages.length - 1);
  }

  void _handleDestinationSelected(int index) {
    if (index == _currentIndex) {
      return;
    }

    HapticFeedback.selectionClick();
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _pages),
      bottomNavigationBar: _GlassBottomNavigationBar(
        currentIndex: _currentIndex,
        destinations: _destinations,
        onDestinationSelected: _handleDestinationSelected,
      ),
    );
  }
}

class _GlassBottomNavigationBar extends StatelessWidget {
  const _GlassBottomNavigationBar({
    required this.currentIndex,
    required this.destinations,
    required this.onDestinationSelected,
  });

  final int currentIndex;
  final List<_BottomNavDestination> destinations;
  final ValueChanged<int> onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    final visibleDestinations =
        Directionality.of(context) == ui.TextDirection.rtl
        ? destinations.reversed.toList(growable: false)
        : destinations;

    return SafeArea(
      top: false,
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
        child: BackdropFilter(
          filter: ui.ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            height: 81,
            decoration: BoxDecoration(
              color: const Color(0xB0111412),
              border: Border(
                top: BorderSide(color: Colors.white.withValues(alpha: 0.08)),
              ),
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  for (final destination in visibleDestinations)
                    _BottomNavItem(
                      destination: destination,
                      isSelected: currentIndex == destination.index,
                      onTap: () => onDestinationSelected(destination.index),
                      highlightHome: destination.index == 4,
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _BottomNavItem extends StatelessWidget {
  const _BottomNavItem({
    required this.destination,
    required this.isSelected,
    required this.onTap,
    this.highlightHome = false,
  });

  final _BottomNavDestination destination;
  final bool isSelected;
  final VoidCallback onTap;
  final bool highlightHome;

  @override
  Widget build(BuildContext context) {
    final Color activeColor = highlightHome
        ? const Color(0xFF95D4B3)
        : const Color(0xFFF1F6F2);
    final Color inactiveColor = const Color(0xBFBFC9C1);

    final Widget icon = Icon(
      isSelected ? destination.selectedIcon : destination.icon,
      size: highlightHome ? 20 : 19,
      color: isSelected ? activeColor : inactiveColor,
    );

    final Widget label = Text(
      destination.labelKey.tr(),
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: highlightHome ? 12 : 11.5,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.6,
        color: isSelected ? activeColor : inactiveColor,
        height: 1.2,
      ),
    );

    final Widget content = highlightHome
        ? Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: isSelected ? const Color(0x332D6A4F) : Colors.transparent,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [icon, const SizedBox(height: 4), label],
            ),
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [icon, const SizedBox(height: 4), label],
          );

    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Center(child: content),
      ),
    );
  }
}

class _BottomNavDestination {
  const _BottomNavDestination({
    required this.index,
    required this.labelKey,
    required this.icon,
    required this.selectedIcon,
  });

  final int index;
  final String labelKey;
  final IconData icon;
  final IconData selectedIcon;
}
