part of 'shared.dart';

class MyRoute extends MaterialPageRoute {
  MyRoute({required WidgetBuilder builder}) : super(builder: builder);

  @override
  Duration get transitionDuration => const Duration(milliseconds: 0);
}

class Config {
  Future<Options> getOptions() async {
    var options = Options(
      validateStatus: (status) {
        return status! < 502;
      },
      headers: {
        'Content-Type': 'application/json',
        'token': await Datas().getString(Datas.token),
      },
    );
    return options;
  }
}
