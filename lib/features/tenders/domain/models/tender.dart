import 'package:equatable/equatable.dart';

class Tender extends Equatable {
  final String id;
  final String title;
  final String description;
  final String date;

  const Tender({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
  });

  factory Tender.fromJson(Map<String, dynamic> json) {
    return Tender(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      date: json['date'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'publication_date': date,
    };
  }

  @override
  List<Object?> get props => [id, title, description, date];
}
