class SpotM {
  String id, title, date, currentPrice, change, buy, capital, stopLoss, icon;
  List<Target> targets;
  SpotM({
    required this.id,
    required this.title,
    required this.date,
    required this.currentPrice,
    required this.change,
    required this.buy,
    required this.capital,
    required this.stopLoss,
    required this.icon,
    required this.targets,
  });

  factory SpotM.fromJson(Map<String, dynamic> json) {
    return SpotM(
      id: json['id'],
      title: json['title'],
      date: json['date'],
      currentPrice: json['currentPrice'],
      change: json['change'],
      buy: json['buy'],
      capital: json['capital'],
      stopLoss: json['stopLoss'],
      icon: json['icon'],
      targets: (json['targets'] as List)
          .map((e) => Target.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'date': date,
      'currentPrice': currentPrice,
      'change': change,
      'buy': buy,
      'capital': capital,
      'stopLoss': stopLoss,
      'icon': icon,
      'targets': targets.map((e) => e.toJson()).toList(),
    };
  }
}

class Target {
  String number, change;
  Target({required this.number, required this.change});

  Map<String, dynamic> toJson() {
    return {
      'number': number,
      'change': change,
    };
  }

  factory Target.fromJson(Map<String, dynamic> json) {
    return Target(
      number: json['number'],
      change: json['change'],
    );
  }
}
