class Suggest {
  final String id;
  final bool isBuy;
  final String type;
  final String currency;
  final String fromTo;
  final String points;
  final String sl;
  List<String> tpList;
  final DateTime date;
  Suggest({
    required this.id,
    required this.isBuy,
    required this.type,
    required this.currency,
    required this.fromTo,
    required this.points,
    required this.sl,
    required this.date,
    required this.tpList,
  });

  factory Suggest.fromMap(Map<String, dynamic> map, String id) {
    return Suggest(
      id: id,
      isBuy: map['isBuy'],
      type: map['type'],
      currency: map['currency'],
      fromTo: map['fromTo'],
      points: map['points'],
      sl: map['sl'],
      date: DateTime.parse(map['date']),
      tpList: List<String>.from(map['tpList']),
    );
  }

  Map<String, dynamic> toMap(String id) {
    return {
      'id': id,
      'isBuy': isBuy,
      'type': type,
      'currency': currency,
      'fromTo': fromTo,
      'points': points,
      'sl': sl,
      'date': date.toIso8601String(),
      'tpList': tpList,
    };
  }

  Suggest copyWith({
    String? id,
    bool? isBuy,
    String? type,
    String? currency,
    String? fromTo,
    String? points,
    String? sl,
    DateTime? date,
    List<String>? tpList,
  }) {
    return Suggest(
      id: id ?? this.id,
      isBuy: isBuy ?? this.isBuy,
      type: type ?? this.type,
      currency: currency ?? this.currency,
      fromTo: fromTo ?? this.fromTo,
      points: points ?? this.points,
      sl: sl ?? this.sl,
      date: date?? this.date,
      tpList: tpList ?? this.tpList,
    );
  }
}
