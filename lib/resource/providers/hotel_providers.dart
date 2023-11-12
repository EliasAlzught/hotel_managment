import 'dart:convert';

import 'package:hotel_managment/resource/api_client.dart';

import '../../model/entity/HotelModel.dart';
import '../links.dart';

class HotelRepository extends BaseClient {
  Future<List<HotelModel>> fetchHotels() async {
    try {
      final response = await client.get(
        Links.GET_ALL_HOTELS,
      );
      if (response.statusCode == 200) {
        List<dynamic> responseData = response.data;

        List<HotelModel> hotels = responseData.map((json) => HotelModel.fromJson(json)).toList();
        return hotels;
      } else {
        throw Exception(
            'Failed to load data, status code: ${response.statusCode}');
      }
    } catch (e){
      throw Exception('Error: $e');
    }
  }
}
