class Page {
  final int id;
  final String title;
  final String description;
  bool isFavorite;

  Page(
      {required this.title,
      required this.description,
      required this.isFavorite,
      required this.id});

  Page isFavourite() {
    return Page(
        id: id,
        title: title,
        description: description,
        isFavorite: !isFavorite);
  }
}
