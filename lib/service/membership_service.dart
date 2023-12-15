import 'package:dio/dio.dart';
import 'package:pos_capstone/models/memberphone_model.dart';
import 'package:pos_capstone/models/membership_model.dart';
import 'package:pos_capstone/models/pointmember_model.dart';
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

  Future<MembershipPhoneNumber> getMembershipByPhoneNumbers(
      String phoneNumber) async {
    try {
      await setToken();
      print(token);

      dio.options.headers['Authorization'] = 'Bearer $token';

      final response = await dio.get(
          Url.BaseUrl + Url.MembershipPhoneNumberUrl + '$phoneNumber',
          options: Options(headers: head));

      print(response.data);
      return MembershipPhoneNumber.fromJson(response.data);
    } catch (_) {
      print(_);
      rethrow;
    }
  }

  Future<List<Results>> searchMembersByPhone(String query) async {
    try {
      await setToken();
      print(token);

      dio.options.headers['Authorization'] = 'Bearer $token';

      final response = await dio.get(
        Url.BaseUrl + Url.MembershipUrl,
        options: Options(headers: head),
      );

      final membershipData = MembershipPhoneNumber.fromJson(response.data);
      final List<Results> allMembers = [membershipData.results];

      if (query.isNotEmpty) {
        // Filter hasil berdasarkan nomor telepon
        final List<Results> filteredResults = allMembers
            .where((result) =>
                result.phoneNumber.toLowerCase().contains(query.toLowerCase()))
            .toList();
        return filteredResults;
      } else {
        // Jika query kosong, kembalikan semua anggota
        return allMembers;
      }
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

  Future<PointModelMember> getPointConvertMember() async {
    try {
      await setToken();
      print(token);

      dio.options.headers['Authorization'] = 'Bearer $token';

      final response = await dio.get(Url.BaseUrl + Url.PointMemberUrl,
          options: Options(headers: head));

      print(response.data);
      return PointModelMember.fromJson(response.data);
    } catch (_) {
      print(_);
      rethrow;
    }
  }
}
