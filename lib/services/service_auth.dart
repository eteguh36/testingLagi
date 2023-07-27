part of 'service.dart';

class ServiceAuth {
  var dio = Dio();

  Future<ResponseAuth> login({
    required String username,
    required String password,
  }) async {
    try {
      var api = "https://bowindo.servehttp.com/login";
      var byte = utf8.encode(password);
      var password256 = sha256.convert(byte);
      var data = {
        "user_id": username,
        "user_password": password256.toString(),
      };
      print(api);
      print(prettyJson(data, indent: 2));
      var response = await dio.post(
        api,
        data: data,
        options: await Config().getOptions(),
      );
      print(prettyJson(response.data, indent: 2));
      return ResponseAuth.fromJson(response.data);
    } catch (ex) {
      return ResponseAuth(
        success: false,
        message: "Terjadi Kesalahan",
        auth: Auth(
          userId: "",
          userName: "",
          branch_id: '',
          store_id: 0,
        ),
        token: "",
        refresh: "",
      );
    }
  }
  //
}
