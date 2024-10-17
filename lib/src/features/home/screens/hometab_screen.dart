
import 'package:flutter/material.dart';
import 'package:glovevoice/src/constants/colors.dart';
import 'package:glovevoice/src/constants/image_strings.dart';
import 'package:glovevoice/src/constants/sizes.dart';
import 'package:glovevoice/src/features/home/screens/featured_screen.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    FeaturedScreen(),
    FeaturedScreen(),
    FeaturedScreen(),
    FeaturedScreen(),
    FeaturedScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      
    );
  }
}