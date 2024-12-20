class Task {
  final int? id;
  final String title;
  final String description;
  final bool isCompleted;

  Task({
    this.id,
    required this.title,
    required this.description,
    this.isCompleted = false,
  });

  // Converte Task para Map (para inserir no banco de dados)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'isCompleted': isCompleted ? 1 : 0,
    };
  }

  // Cria um Task a partir de um Map (obtido do banco de dados)
  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      isCompleted: map['isCompleted'] == 1, //A resposta dessa checagem retorna true ou false
    );
  }
}
