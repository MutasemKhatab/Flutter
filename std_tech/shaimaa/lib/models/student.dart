import 'package:cloud_firestore/cloud_firestore.dart';

class Student {
  final String id,
      name,
      loop,
      qualification,
      save,
      number,
      parentNumber,
      location,
      teacher;
  final DateTime joinDate;

  const Student(
      {this.id = '',
      this.name = '',
      this.loop = '',
      this.teacher = '',
      this.qualification = '',
      required this.joinDate,
      this.save = '',
      this.number = '',
      this.parentNumber = '',
      this.location = ''});
  factory Student.fromJson(Map<String, dynamic> json, String docID) {
    final date = DateTime.fromMillisecondsSinceEpoch(
        (json['joinDate'] as Timestamp).millisecondsSinceEpoch);
    return Student(
        id: docID,
        name: json['name'],
        loop: json['loop'],
        teacher: json['teacher'],
        qualification: json['qualification'],
        joinDate: date,
        save: json['save'],
        number: json['number'],
        parentNumber: json['parentNumber'],
        location: json['location']);
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'loop': loop,
      'teacher': teacher,
      'qualification': qualification,
      'joinDate': joinDate,
      'save': save,
      'number': number,
      'parentNumber': parentNumber,
      'location': location
    };
  }
}
