import 'package:dio/dio.dart';
import 'package:pos_capstone/models/membership_model.dart';
import 'package:pos_capstone/utils/Api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiServiceMembership {
  final Dio dio = Dio();
  Map<String, dynamic> head = {
    "Content-Type": "application/json",
    "Accept": "application/json"
  };
  String? token;

  Future<void> setToken() async {
    SharedPreferences st = await SharedPreferences.getInstance();
    token = st.getString("access_token");
  }

  Future<Membership> getMembers() async {
    try {
      await setToken();
      print(token);

      dio.options.headers['Authorization'] = 'Bearer $token';

      final response = await dio.get(Url.BaseUrl + Url.MembershipUrl,
          options: Options(headers: head));

      print(response.data);
      return Membership.fromJson(response.data);
    } catch (_) {
      print(_);
      rethrow;
    }
  }

  Future<void> addMembership(String name, String phone) async {
    try {
      await setToken();
      print(token);

      dio.options.headers['Authorization'] = 'Bearer $token';
      final response = await dio.post(
        Url.BaseUrl + Url.AddMembershipUrl,
        options: Options(headers: head),
        data: {
          "Name": name,
          "PhoneNumber": phone,
        },
      );

      if (response.statusCode == 200) {
        print('Membership berhasil ditambahkan');
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }
}
