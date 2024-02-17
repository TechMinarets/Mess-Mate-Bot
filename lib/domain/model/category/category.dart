class Category {
  final int id;
  String name;
  String? table;
  final String? user;
  final String createdAt;
  final String modifiedAt;
  final List? messages;

  Category({
    required this.id,
    required this.name,
    required this.user,
    required this.table,
    required this.createdAt,
    required this.modifiedAt,
    required this.messages,
  });

  toJson() {
    return {
      'name': name,
      'user': user,
      'table': table,
      'messages': messages,
    };
  }
}
