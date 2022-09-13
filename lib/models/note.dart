class Note {
  String? id;
  String? title;
  String? body;
  String? dateCreated;
  String? lastEdited;
  String? noteColor;
  String? category;
  String? isArchive;
  String? isPinned;
  String? isFavorite;

  Note({
    this.id,
    this.title,
    this.body,
    this.dateCreated,
    this.lastEdited,
    this.noteColor,
    this.category,
    this.isArchive,
    this.isPinned,
    this.isFavorite,
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
