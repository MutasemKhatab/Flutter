import 'package:flutter_test/flutter_test.dart';
import 'package:money/models/spot_m.dart';

void main() {
  group('SpotM', () {
    test('fromJson should correctly parse JSON', () {
      final json = {
        'id': '1',
        'title': 'Spot 1',
        'date': '2022-01-01',
        'currentPrice': '100',
        'change': '10',
        'buy': '90',
        'capital': '1000',
        'stopLoss': '80',
        'icon': 'spot_icon',
        'targets': [
          {'number': '1', 'change': '5'},
          {'number': '2', 'change': '8'},
        ],
      };

      final spot = SpotM.fromJson(json);

      expect(spot.id, '1');
      expect(spot.title, 'Spot 1');
      expect(spot.date, '2022-01-01');
      expect(spot.currentPrice, '100');
      expect(spot.change, '10');
      expect(spot.buy, '90');
      expect(spot.capital, '1000');
      expect(spot.stopLoss, '80');
      expect(spot.icon, 'spot_icon');
      expect(spot.targets.length, 2);
      expect(spot.targets[0].number, '1');
      expect(spot.targets[0].change, '5');
      expect(spot.targets[1].number, '2');
      expect(spot.targets[1].change, '8');
    });

    test('toJson should correctly convert to JSON', () {
      final spot = SpotM(
        id: '1',
        title: 'Spot 1',
        date: '2022-01-01',
        currentPrice: '100',
        change: '10',
        buy: '90',
        capital: '1000',
        stopLoss: '80',
        icon: 'spot_icon',
        targets: [
          Target(number: '1', change: '5'),
          Target(number: '2', change: '8'),
        ],
      );

      final json = spot.toJson();

      expect(json['id'], '1');
      expect(json['title'], 'Spot 1');
      expect(json['date'], '2022-01-01');
      expect(json['currentPrice'], '100');
      expect(json['change'], '10');
      expect(json['buy'], '90');
      expect(json['capital'], '1000');
      expect(json['stopLoss'], '80');
      expect(json['icon'], 'spot_icon');
      expect(json['targets'].length, 2);
      expect(json['targets'][0]['number'], '1');
      expect(json['targets'][0]['change'], '5');
      expect(json['targets'][1]['number'], '2');
      expect(json['targets'][1]['change'], '8');
    });
  });
}
