import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jokegenerator/model/jokeModel.dart';

class FirebaseHelper {
  static FirebaseHelper instance = FirebaseHelper();
  Future<List<jokeModel>> getApiData() async {
    try {
      final data = await FirebaseFirestore.instance.collection('jokes').get();
      final dataget =
          data.docs.map((e) => jokeModel.fromJson(e.data())).toList();
      return dataget;
    } catch (e) {
      throw Exception('No data');
    }
  }}