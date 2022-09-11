class Note {
  String id;
  String title;
  String body;
  String dateCreated;
  String lastEdited;
  int noteColor;
  String category;
  int isArchive;
  int isPinned;
  int isFavorite;

  Note({
    required this.id,
    required this.title,
    required this.body,
    required this.dateCreated,
    required this.lastEdited,
    required this.noteColor,
    required this.category,
    required this.isArchive,
    required this.isPinned,
    required this.isFavorite,
  });

  Note fromJson(Map<String, dynamic> json) => Note(
        id: json['id'],
        title: json['title'],
        body: json['body'],
        dateCreated: json['dateCreated'],
        lastEdited: json['lastEdited'],
        noteColor: json['noteColor'],
        category: json['category'],
        isArchive: json['isArchive'],
        isPinned: json['isPinned'],
        isFavorite: json['isFavorite'],
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'title': title,
        'body': body,
        'dateCreated': dateCreated,
        'lastEdited': lastEdited,
        'noteColor': noteColor,
        'category': category,
        'isArchive': isArchive,
        'isPinned': isPinned,
        'isFavorite': isFavorite,
      };
}
