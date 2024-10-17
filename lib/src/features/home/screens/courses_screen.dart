
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:glovevoice/src/constants/colors.dart';
import 'package:glovevoice/src/features/home/models/course_model.dart';
import 'package:glovevoice/src/features/home/screens/course_details_screen.dart';
import 'package:glovevoice/src/utils/theme/widget_theme/circle_button.dart';
import 'package:glovevoice/src/utils/theme/widget_theme/search_testfield.dart';

class CourseScreen extends StatefulWidget {

  @override
  _CourseScreenState createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: Column(
          children: [
            const CustomAppBar(),
            SafeArea(
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 0), // Reduced vertical padding
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Optionally, you can remove or adjust the SizedBox height
                    const SizedBox(height: 5), // Reduced height
                    ListView.separated(
                      padding: const EdgeInsets.symmetric(vertical: 10), // Adjust vertical padding if needed
                      separatorBuilder: (_, __) {
                        return const SizedBox(height: 10);
                      },
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(), // Disable scrolling
                      itemBuilder: (_, int index) {
                        return CourseContainer(course: courses[index]);
                      },
                      itemCount: courses.length,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class CourseContainer extends StatelessWidget {
  final Course course;
  const CourseContainer({
    Key? key,
    required this.course,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailsScreen(
                    title: course.name,
                  ))),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                course.thumbnail,
                height: 60,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(course.name),
                  Text(
                    "Author: ${course.author}",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(height: 5),
                  LinearProgressIndicator(
                    value: course.completedPercentage,
                    backgroundColor: Colors.black12,
                    color: tPrimaryColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 40, left: 15, right: 15),
      height: 120,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.05, 0.6],
          colors: [tPrimaryColor2, tPrimaryColor2],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleButton(
                icon: Icons.arrow_back,
                onPressed: () {
                  print("Back button pressed"); // Debug print statement
                  Navigator.pop(context); // Go back to the previous screen
                },
              ),
              Expanded(
                child: Text(
                  "Glove Voice Sign Language",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              const SizedBox(width: 40),
            ],
          ),
        ],
      ),
    );
  }
}

