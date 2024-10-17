import 'package:flutter/material.dart';
import 'package:glovevoice/src/constants/colors.dart';
import 'package:glovevoice/src/constants/image_strings.dart';
import 'package:glovevoice/src/features/home/screens/courses_screen.dart'; // Make sure this screen is defined
import 'package:glovevoice/src/features/home/screens/glove_screen.dart'; // Make sure this screen is defined
import 'package:glovevoice/src/features/home/screens/chat_screen.dart'; // Make sure this screen is defined
import 'package:glovevoice/src/features/home/screens/hometab_screen.dart';
import 'package:glovevoice/src/features/home/screens/settings_screen.dart'; // Make sure this screen is defined

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0; // Track the currently selected index
  final List<Widget> _screens = [
    BaseScreen(),  // Ensure BaseScreen is defined
    CourseScreen(), // Your Courses screen
    GloveScreen(),  // Your Glove screen
    ChatScreen(),   // Your Chat screen
    SettingsScreen(), // Your Settings screen
  
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index; // Update the current index when an item is tapped
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex], // Display the current screen
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        selectedItemColor: tPrimaryColor, // Color for the selected item
        unselectedItemColor: Colors.grey, // Color for unselected items
        showSelectedLabels: true, // Show labels for selected items
        showUnselectedLabels: true, // Show labels for unselected items
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Courses',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              width: 60,
              height: 60,
              child: Image(
                image: AssetImage(tGloveTabImage), // Make sure this image exists
              ),
            ),
            label: 'Glove',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mic),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        backgroundColor: Colors.white, // Background color for the bottom navigation bar
        elevation: 5, // Add elevation for a shadow effect
      ),
    );
  }
}
