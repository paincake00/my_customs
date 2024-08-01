import 'package:flutter/material.dart';
import 'package:my_customs_v2/pages/clients_page.dart';
import 'package:my_customs_v2/pages/customs_page.dart';
import 'package:my_customs_v2/pages/purchases_page.dart';
import 'package:my_customs_v2/pages/settings_page.dart';

class MainBar extends StatefulWidget {
  const MainBar({super.key});

  @override
  State<MainBar> createState() => _MainBarState();
}

class _MainBarState extends State<MainBar> {
  int _selectedIndex = 0;
  final _pageController = PageController();

  static const List<Widget> pages = <Widget>[
    PurchasesPage(),
    CustomsPage(),
    ClientsPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (value) {
          setState(() => _selectedIndex = value);
        },
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        selectedItemColor: theme.primaryColor,
        unselectedItemColor: theme.hintColor,
        currentIndex: _selectedIndex,
        onTap: _openPage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Закупки',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.construction),
            label: 'Заказы',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Клиенты',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Настройки',
          ),
        ],
      ),
    );
  }

  void _openPage(int index) {
    setState(() => _selectedIndex = index);
    FocusScope.of(context).unfocus();

    // _pageController.animateToPage(index,
    //     duration: const Duration(milliseconds: 500), curve: Curves.linear);

    _pageController.jumpToPage(index);
  }
}
