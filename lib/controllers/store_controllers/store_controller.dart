import 'dart:convert';

import 'package:shyheads_deliveryboy_app/models/store_model.dart';
import 'package:shyheads_deliveryboy_app/shared/database_urls/data_base_urls.dart';
import 'package:http/http.dart';

abstract class StoreController {
  static Future<StoreModel> getStoreFromId(int storeId) async {
    try {
      Response response = await post(
        Uri.parse(DataBaseEndPoints.storeDetailsURL),
        body: {
          'storeId': storeId.toString(),
        },
      );
      var result = json.decode(response.body);
      if (result['code'] == '200') {
        return StoreModel.fromMap(result['message']);
      }
      return null;
    } catch (e) {
      print('Exception Occured: $e');
      return null;
    }
  }
}
