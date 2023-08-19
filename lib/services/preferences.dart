import 'package:clamaroj/models/usuarioc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Usuarioc get usuarioc {
    return Usuarioc.fromJson(_prefs.getString('usuario') ?? '{}');
  }

  static set usuario(Usuarioc value) {
    _prefs.setString('usuario', value.toJson());
  }
}