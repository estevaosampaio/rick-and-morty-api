class ApiInfo {
  final int count;
  final int pages;
  final String? next;
  final String? previous;

  ApiInfo({
    required this.count,
    required this.pages,
    this.next,
    this.previous,
  });

  factory ApiInfo.fromMap(Map<String, dynamic> map) {
    return ApiInfo(
      count: map['count']?.toInt() ?? 0,
      pages: map['pages']?.toInt() ?? 0,
      next: map['next'],
      previous: map['prev'],
    );
  }
}
