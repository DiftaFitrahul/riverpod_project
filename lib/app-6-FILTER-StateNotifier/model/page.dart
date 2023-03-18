class Person {
  final int id;
  final String title;
  final String description;
  bool isFavorite;

  Person(
      {required this.title,
      required this.description,
      required this.isFavorite,
      required this.id});

  Person isFavourite() {
    return Person(
        id: id,
        title: title,
        description: description,
        isFavorite: !isFavorite);
  }
}
