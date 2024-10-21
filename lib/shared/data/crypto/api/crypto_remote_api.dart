import 'package:cryplet/core/exceptions/api_exception.dart';
import 'package:cryplet/core/services/dio_wrapper/dio_init.dart';
import 'package:cryplet/shared/data/crypto/models/crypto_currency_model.dart';
import 'package:cryplet/shared/data/crypto/models/history_data_item_model.dart';
import 'package:dio/dio.dart';

class CryptoRemoteApi {
  final Dio _dio;

  CryptoRemoteApi(CryptoApiWrapper dio) : _dio = dio.getAppDio();

  Future<List<CryptoCurrencyModel>> getCryptoList() async {
    try {
      final response = await _dio
          .get('/coins/markets', queryParameters: {'vs_currency': 'usd'});
      return List.from(response.data)
          .map((e) => CryptoCurrencyModel.fromMap(e as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      print(e);
      throw ApiException(e.response?.data['message'] ?? e.message);
    } catch (e) {
      print(e.toString());
      throw ApiException('Something went wrong!');
    }
  }

  Future<List<HistoryDataItemModel>> getCryptoHistory(
    String id, {
    String? vsCurrency,
    String? days,
  }) async {
    try {
      final params = <String, dynamic>{};
      if (vsCurrency != null) params['vs_currency'] = vsCurrency;
      if (days != null) params['days'] = days;
      final response =
          await _dio.get('/coins/$id/market_chart', queryParameters: params);
      return (response.data['prices'] as List).map((e) {
        return HistoryDataItemModel(
          time: e[0],
          price: e[1],
        );
      }).toList();
    } on DioException catch (e) {
      print(e);
      throw ApiException(e.response?.data['message'] ?? e.message);
    } catch (e, s) {
      print(e.toString());
      print(s);
      throw ApiException('Something went wrong!');
    }
  }
}
