import 'package:connect_people/Student_Profile_Page/student_ProfilePage.dart';
import 'package:flutter/material.dart';
import '../Components/bottom_navigation_bar.dart';

class CoursePage extends StatefulWidget {
  final String courseName;
  CoursePage(this.courseName);

  @override
  _CoursePageState createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  int _selectedIndex = 0;

  // Function to update _selectedIndex
  void _onTabChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16.0),
              color: Colors.lightGreen, // Color for course section
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Course Availability:',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Available Courses for Fall 2023:',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  // Replace with actual course availability information
                  CourseAvailabilityItem(
                    widget.courseName, // Use widget.courseName here
                    'MWF 10:00 AM - 11:30 AM',
                    Colors.green,
                  ),
                  // You can continue using widget.courseName for other course items as well
                  CourseAvailabilityItem(
                    widget.courseName, // Use widget.courseName here
                    'TTh 1:00 PM - 2:30 PM',
                    Colors.orange,
                  ),
                  CourseAvailabilityItem(
                    widget.courseName, // Use widget.courseName here
                    'MWF 2:00 PM - 3:30 PM',
                    Colors.blue,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              color: Colors.lightBlue, // Color for class schedule section
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Class Schedule:',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'My Class Schedule for Fall 2023:',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  // Replace with actual class schedule information
                  ClassScheduleItem(
                    widget.courseName, // Use widget.courseName here
                    'MWF 10:00 AM - 11:30 AM',
                    'Room 101',
                  ),
                  // You can continue using widget.courseName for other class schedule items as well
                  ClassScheduleItem(
                    widget.courseName, // Use widget.courseName here
                    'TTh 1:00 PM - 2:30 PM',
                    'Room 202',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Bottombar(
        selectedIndex: _selectedIndex,
        onTabChanged: _onTabChanged,
      ),
    );
  }
}
class ClassScheduleItem extends StatelessWidget {
  final String courseName;
  final String schedule;
  final String room;

  ClassScheduleItem(this.courseName, this.schedule, this.room);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlueAccent,
      child: ListTile(
        title: Text(courseName),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(schedule),
            Text('Room: $room'),
          ],
        ),
      ),
    );
  }
}

class CourseAvailabilityItem extends StatelessWidget {
  final String courseName;
  final String schedule;
  final Color color;

  CourseAvailabilityItem(this.courseName, this.schedule, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: ListTile(
        title: Text(courseName),
        subtitle: Text(schedule),
      ),
    );
  }
}