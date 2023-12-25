import 'dart:convert';
import 'dart:io';

import 'package:daleel/models/ad.dart';
import 'package:daleel/models/description.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class InfoProvider extends StateNotifier<Map<String, List<String>>> {
  InfoProvider() : super({});
  final infoList = <Description>[];
  final adsList = <Ad>[];
  String? _verNo;

  Map<String, List<String>> getState() {
    return state;
  }

  Future<Map<String, List<String>>> getInfo() async {
    final verNo = _verNo ?? await fetchVersion();
    if (verNo == 'new') {
      return await _fetchNewInfo();
    } else if (verNo == 'old') {
      return await _fetchOldInfo();
    }
    return {};
  }

  Future<List<Ad>> getAds() async {
    return await _fetchNewAds();
  }

  Future<Map<String, List<String>>> _fetchNewInfo() async {
    final respone = await http
        .get(Uri.parse('http://162.250.123.116/zulfiphone/DetailsJson.php'));
    if (respone.statusCode == 200) {
      infoDecode(respone.body);
      final docPath = await getApplicationDocumentsDirectory();
      final infoFile = File('${docPath.path}/info.json');
      await infoFile.writeAsString(respone.body);
    }
    return state;
  }

  Future<Map<String, List<String>>> _fetchOldInfo() async {
    final docPath = await getApplicationDocumentsDirectory();
    final infoFile = File('${docPath.path}/info.json');
    if (!await infoFile.exists()) {
      return await _fetchNewInfo();
    }
    infoDecode(await infoFile.readAsString());
    return state;
  }

  void infoDecode(String body) {
    final categories = {
      '1': <String>[],
      '2': <String>[],
      '3': <String>[],
    };
    final Map<String, dynamic> data = json.decode(body);
    for (var element in data['phones']) {
      infoList.add(Description.fromJSON(element));
      if (element['deptno'] == '1') {
        categories['1']!.add(element['cat']);
      } else if (element['deptno'] == '2') {
        categories['2']!.add(element['cat']);
      } else if (element['deptno'] == '3') {
        categories['3']!.add(element['name']);
      }
      state = categories;
    }
  }

  Future<List<Ad>> _fetchNewAds() async {
    final respone = await http
        .get(Uri.parse('http://162.250.123.116/zulfiphone/AdsJson.php'));
    if (respone.statusCode == 200) {
      final data = json.decode(respone.body);
      for (var element in data['offers']) {
        final ad = Ad.fromJSON(element);
        final image =
            "http://162.250.123.116/zulfiphone/uploads/${element['imgurl']}";
        final icon =
            "http://162.250.123.116/zulfiphone/uploads/${element['iconurl']}";
        ad.image = image;
        ad.icon = icon;
        adsList.add(ad);
      }
    }
    return adsList;
  }

  Future<String> fetchVersion() async {
    final docPath = await getApplicationDocumentsDirectory();
    final verFile = File('${docPath.path}/version.json');
    String? fileVer;
    if (await verFile.exists()) {
      fileVer = await verFile.readAsString();
    }

    final http.Response respone;
    String? serverVer;
    try {
      respone = await http
          .get(Uri.parse('http://162.250.123.116/zulfiphone/version.php'));
      if (respone.statusCode == 200) {
        final data = json.decode(respone.body);
        serverVer = data['ver'][0]['Number'];
      }
    } catch (e) {
      //no internet
    }
    if (serverVer == null) {
      if (fileVer == '') {
        return '-1';
      } else {
        return 'old';
      }
    } else if (fileVer == null) {
      await File('${docPath.path}/version.json').writeAsString(serverVer);
      return 'new';
    } else if (serverVer != fileVer) {
      await File('${docPath.path}/version.json').writeAsString(serverVer);
      return 'new';
    } else {
      return 'old';
    }
  }
}

final infoProvider =
    StateNotifierProvider<InfoProvider, Map<String, List<String>>>(
  (ref) => InfoProvider(),
);
