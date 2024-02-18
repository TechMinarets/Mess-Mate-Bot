class Category {
  final int id;
  String name;
  String? table;
  final String? user;
  final String createdAt;
  final String modifiedAt;

  Category({
    required this.id,
    required this.name,
    required this.user,
    required this.table,
    required this.createdAt,
    required this.modifiedAt,
  });

  toJson() {
    return {
      'name': name,
      'user': user,
      'table': table,
    };
  }
}
