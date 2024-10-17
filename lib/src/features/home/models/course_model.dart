class Course {
  String name;
  double completedPercentage;
  String author;
  String thumbnail;

  Course({
    required this.author,
    required this.completedPercentage,
    required this.name,
    required this.thumbnail,
  });
}

List<Course> courses = [
  Course(
    author: "Marouane",
    completedPercentage: .75,
    name: "Glove Voice SL: Introduction",
    thumbnail: "assets/icons/GV1.png",
  ),
  Course(
    author: "Marouane",
    completedPercentage: .60,
    name: "Glove Voice SL: Basics",
    thumbnail: "assets/icons/GV2.png",
  ),
  Course(
    author: "Marouane",
    completedPercentage: .75,
    name: "Glove Voice SL: Communication Skills",
    thumbnail: "assets/icons/GV3.png",
  ),
  Course(
    author: "Marouane",
    completedPercentage: .75,
    name: "Glove Voice SL: Business Skills",
    thumbnail: "assets/icons/GV4.png",
  ),
  Course(
    author: "Marouane",
    completedPercentage: .60,
    name: "Glove Voice SL: Advances Techniques",
    thumbnail: "assets/icons/GV2.png",
  ),
  Course(
    author: "Marouane",
    completedPercentage: .75,
    name: "Glove Voice SL: Tips & Examples",
    thumbnail: "assets/icons/GV1.png",
  ),
];