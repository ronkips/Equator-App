import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:poc_app/models/new_token_model.dart';

class FetchDataRepository {
  Stream<List<TokenInfo>> fetchPrices() async* {
    while (true) {
      await Future.delayed(const Duration(seconds: 5));
      try {
        var res = await http.get(
            Uri.parse('http://149.28.119.165/arbvolume/live/price/v1/api/ftx'));

        if (res.statusCode == 200) {
          final tokenData = tokenDataFromJson(res.body);
          yield tokenData.data!;
        } else {
          log(res.reasonPhrase.toString());
        }
      } catch (e) {
        log(e.toString());
      }
    }
  }
}
