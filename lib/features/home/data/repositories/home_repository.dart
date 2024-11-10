



import 'package:barikoi/features/core/path/file_path.dart';

class HomeRepository {
  late DioClient dioClient;
  //final String _baseUrl = dotenv.env["BASE_URL"]!;
  final String _baseUrl = "";
  static const storage = FlutterSecureStorage();
  bool selectedMarker = false;
  double latitude = 0.0;
  double longitude = 0.0;
  String userId = "";
  HomeRepository() {
    var dio = Dio();
    dioClient = DioClient(_baseUrl, dio);
  }

/*  Future<UserMapDataSubmitModel> userMapDataSubmit() async {
    try {
      final resp = await dioClient.post("emp-location-tracking");

      UserMapDataSubmitModel userMapDataSubmitResponse =
          UserMapDataSubmitModel.fromJson(jsonDecode(jsonEncode(resp)));

      return userMapDataSubmitResponse;
    } catch (e) {
      rethrow;
    }
  }*/

}
