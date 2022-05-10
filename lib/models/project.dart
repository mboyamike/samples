class Project {
  Project({
    required this.id,
    required this.link,
    required this.content,
    required this.userDetails,
  });

  final String id;
  final String link;
  final Map<String, dynamic> content;
  final Map<String, dynamic> userDetails;

  Project copyWith({
    String? id,
    String? link,
    Map<String, dynamic>? content,
    Map<String, dynamic>? userDetails,
  }) {
    return Project(
      id: id ?? this.id,
      link: link ?? this.link,
      content: content ?? this.content,
      userDetails: userDetails ?? this.userDetails,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'link': link,
      'content': content,
      'userDetails': userDetails,
    };
  }

  factory Project.fromMap(Map<String, dynamic> map) {
    return Project(
      id: map['id'] ?? '',
      link: map['link'] ?? '',
      content: Map<String, dynamic>.from(map['content'] ?? {}),
      userDetails: Map<String, dynamic>.from(map['userDetails'] ?? {}),
    );
  }
}
