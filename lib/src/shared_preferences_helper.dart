import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

///==========================================================
/// CREATED BY MOHAMED GHONEIM 01/01/2022 TEL// +201064626369
///==========================================================
///
class SharedPreferenceHelper {
  static PublishSubject<bool> _isPreferencesInitializedSubject = PublishSubject();
  static Stream<bool> get isPreferencesInitializedStream => _isPreferencesInitializedSubject.stream;
  static SharedPreferences? _prefs;
  static final SharedPreferenceHelper _instance =  SharedPreferenceHelper._internal();

  factory SharedPreferenceHelper() {
    if(_prefs == null){
      _initPrefs();
    }
    return _instance;
  }

  SharedPreferenceHelper._internal();

  static _initPrefs() async{
    _prefs = await SharedPreferences.getInstance();
    _isPreferencesInitializedSubject.sink.add(true);

  }
  static dynamic getValueForKey(String key){
    return _prefs?.get(key);
  }

  static setValueForKey(String key, dynamic value) {
    if (value == null) {
      removeValueForKey(key);
    } else if (value is int) {
      _prefs?.setInt(key, value);
    } else if (value is String) {
      _prefs?.setString(key, value);
    } else if (value is bool) {
      _prefs?.setBool(key, value);
    } else {
      throw "unknown value type :(";
    }
  }

  static removeAllKeys(){
    _prefs?.clear();
  }

  static Future<bool>? removeValueForKey(String key){
    return _prefs?.remove(key);
  }
}
