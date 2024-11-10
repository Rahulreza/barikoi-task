import 'package:barikoi/features/core/path/file_path.dart';

class HomeRepository {
  late DioClient dioClient;
  //final String _baseUrl = dotenv.env["BASE_URL"]!;
  final String _baseUrl = "https://barikoi.xyz/v2/api/search/";
  static const storage = FlutterSecureStorage();
  bool selectedMarker = false;
  double latitude = 23.806703092211507;
  double longitude = 90.35722628659195;
  String API_KEY =
      "bkoi_5bacf61a76e5047364b3540a662f1ee5865f03ef8736d7475f18538c3fb52a8e";
  HomeRepository() {
    var dio = Dio();
    dioClient = DioClient(_baseUrl, dio);
  }

  Future<Reverce> reverceGeoCodingMapDataSubmit() async {
    try {
      final resp = await dioClient.get(
          "reverse/geocode?api_key=$API_KEY&longitude=$longitude&latitude=$latitude&district=true&post_code=true&country=true&sub_district=true&union=true&pauroshova=true&location_type=true&division=true&address=true&area=true&bangla=true");

      Reverce reverceDataSubmitResponse =
          Reverce.fromJson(jsonDecode(jsonEncode(resp)));
      print("reverceGeoCodingMapDataSubmit:$reverceDataSubmitResponse");
      return reverceDataSubmitResponse;
    } catch (e) {
      rethrow;
    }
  }
}
