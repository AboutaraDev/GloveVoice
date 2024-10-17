class Category {
  String thumbnail;
  String name;
  int noOfCourses;

  Category({
    required this.name,
    required this.noOfCourses,
    required this.thumbnail,
  });
}

List<Category> categoryList = [
  Category(
    name: 'Glove Voice Sign Language',
    noOfCourses: 55,
    thumbnail: 'assets/icons/GV1.png',
  ),
  Category(
    name: 'ASL - English Sign Language',
    noOfCourses: 20,
    thumbnail: 'assets/icons/GV2.png',
  ),
  Category(
    name: 'Sign Language Practice',
    noOfCourses: 16,
    thumbnail: 'assets/icons/GV3.png',
  ),
  Category(
    name: 'Sign Language Articles',
    noOfCourses: 25,
    thumbnail: 'assets/icons/GV4.png',
  ),
];
