class Project {
  Project({
    required this.id,
    required this.link,
    required this.content,
  });

  final String id;
  final String link;
  final Map<String, dynamic> content;

  Project copyWith({
    String? id,
    String? link,
    Map<String, dynamic>? content,
  }) {
    return Project(
      id: id ?? this.id,
      link: link ?? this.link,
      content: content ?? this.content,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'link': link,
      'content': content,
    };
  }

  factory Project.fromMap(Map<String, dynamic> map) {
    return Project(
      id: map['id'] ?? '',
      link: map['link'] ?? '',
      content: Map<String, dynamic>.from(map['content'] ?? {}),
    );
  }
}
