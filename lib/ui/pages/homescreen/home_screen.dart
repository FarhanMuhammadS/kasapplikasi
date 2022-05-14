import 'package:flutter/material.dart';
import 'package:kasapplikasi/ui/pages/homescreen/home_page.dart';
import 'package:kasapplikasi/ui/pages/listwargascreen/list_warga.dart';
import '../../../shared/theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  final List<Widget> body = [
    Homepage(),
    ListWargaPage(),
  ];

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //=============================================
      //hexcode primary color
      //#211e4a
      //=============================================
      body: body[currentIndex],

      //=======================================
      //bottom navigator
      //=======================================
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'ListWarga',
            ),
          ],
          currentIndex: currentIndex,
          selectedItemColor: kPrimaryColor,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          onTap: onTap,
        ),
    );
  }
}
