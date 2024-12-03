import 'package:flutter/material.dart';
import 'dart:async';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNav extends StatefulWidget {
  BottomNav({required this.page, Key? key});
  int? page;
  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  Future<void> getPage(int index) async {
    if (index == 0) {
      await Navigator.pushReplacementNamed(context, '/dashboard');
    } else if (index == 1) {
      await Navigator.pushReplacementNamed(context, '/mybooking');
    } else if (index == 2) {
      await Navigator.pushReplacementNamed(context, '/movie');
    } else if (index == 3) {
      await Navigator.pushReplacementNamed(context, '/cinema');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: true,
      showSelectedLabels: true,
      selectedItemColor: Theme.of(context).primaryColor,
      selectedFontSize: 12.0, // Ukuran font item yang dipilih
      unselectedFontSize: 12.0,
      currentIndex: widget.page!,
      onTap: (int index) {
        getPage(index); // Pemanggilan fungsi async
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home_filled,
            size: 27,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: FaIcon(
            FontAwesomeIcons.ticketAlt,
            size: 26,
          ),

          label: 'My Booking',
        ),
        BottomNavigationBarItem(
          icon: FaIcon(
            FontAwesomeIcons.film,
            size: 26,
          ),
          label: 'Movie',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.movie_filter,
            size: 27,
          ),
          label: 'Cinema',
        )
      ],
    );
  }
}
