class Post {
  final int? id;
  final String title;
  final String body;
  final int? userId;

  Post({
    this.id,
    required this.title,
    required this.body,
    this.userId,
  });

  // Converte Post para Map (para inserir no banco de dados)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'body': body,
      'userId': userId
    };
  }

  // Cria um Post a partir de um Map (obtido do banco de dados)
  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      id: map['id'],
      title: map['title'],
      body: map['body'],
      userId: map['userId']
    );
  }
}
