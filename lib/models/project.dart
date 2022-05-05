class Project {
  Project({
    required this.link,
    required this.content,
  });

  final String link;
  final Map<String, dynamic> content;

  Map<String, dynamic> toMap() {
    return {
      'link': link,
      'content': content,
    };
  }

  factory Project.fromMap(Map<String, dynamic> map) {
    return Project(
      link: map['link'] ?? '',
      content: Map<String, dynamic>.from(map['content'] ?? {}),
    );
  }
}
