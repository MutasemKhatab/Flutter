import 'package:cloud_firestore/cloud_firestore.dart';

enum ContactType { number, email }

class Book {
   Book(
      {required this.username,
      required this.userImage,
      required this.userID,
      required this.collage,
      required this.specialization,
      required this.name,
      required this.author,
      required this.printYear,
      required this.uploadDate,
      required this.contactType,
      required this.contact,
      required this.image,
      required this.showName});

  factory Book.fromJSON(Map<String, dynamic> data) {
    Timestamp timestamp = data['createdAt'];
    DateTime dateTime =
        DateTime.fromMicrosecondsSinceEpoch(timestamp.microsecondsSinceEpoch);
    return Book(
        username: data['user']['name'],
        userID: data['user']['id'],
        userImage: data['user']['avatar'],
        collage: data['categoryName'],
        specialization: data['specializationName'],
        name: data['name'],
        author: data['author'],
        uploadDate: dateTime,
        printYear: data['printingYear'],
        contactType: data['methodOfContact']['name'] == ContactType.email.name
            ? ContactType.email
            : ContactType.number,
        contact: data['methodOfContact']['name'] == ContactType.email.name
            ? data['methodOfContact']['data']['email']
            : data['methodOfContact']['data']['number'],
        image: data['imageUrl'],
        showName: data['user']['publicName']);
  }
  final String username;
   String? id;
  final String userID;
  final String userImage;
  final String collage;
  final String specialization;
  final String name;
  final String author;
  final String printYear;
  final ContactType contactType;
  final String contact;
  final String image;
  final DateTime uploadDate;
  final bool showName;
}