import 'package:shared_preferences/shared_preferences.dart';
export 'package:test_bloc/config/keys.dart';
import 'package:test_bloc/config/keys.dart';

class SharedUtil{

  factory SharedUtil() => _getInstance();

  static SharedUtil get instance => _getInstance();
  static SharedUtil _instance;


  SharedUtil._internal() {
  }

  static SharedUtil _getInstance() {
    if (_instance == null) {
      _instance = new SharedUtil._internal();
    }
    return _instance;
  }


  Future saveString (String key, String value) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(key == Keys.email){
      await prefs.setString(key, value);
      return;
    }
    String email = prefs.getString(Keys.email) ?? "default";
    await prefs.setString(key + email, value);
  }

  Future saveInt (String key, int value) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String email = prefs.getString(Keys.email) ?? "default";
    await prefs.setInt(key + email, value);
  }

  Future saveDouble (String key, double value) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String email = prefs.getString(Keys.email) ?? "default";
    await prefs.setDouble(key + email, value);
  }

  Future saveBoolean (String key, bool value) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String email =  prefs.getString(Keys.email) ?? "default";
    await prefs.setBool(key + email, value);
  }

  Future saveStringList (String key, List<String> list) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String email =  prefs.getString(Keys.email) ?? "default";
    await prefs.setStringList(key + email, list);
  }


  Future<bool> readAndSaveList(String key, String data) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String email =  prefs.getString(Keys.email) ?? "default";
    List<String> strings = prefs.getStringList(key + email) ?? [];
    if(strings.length >= 10) return false;
    strings.add(data);
    await prefs.setStringList(key + email, strings);
    return true;
  }

  void readAndExchangeList(String key, String data, int index) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String email =  prefs.getString(Keys.email) ?? "default";
    List<String> strings = prefs.getStringList(key + email) ?? [];
    strings[index] = data;
    await prefs.setStringList(key + email, strings);
  }

  void readAndRemoveList(String key,int index) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String email =  prefs.getString(Keys.email) ?? "default";
    List<String> strings = prefs.getStringList(key + email) ?? [];
    strings.removeAt(index);
    await prefs.setStringList(key + email, strings);
  }


  //-----------------------------------------------------get----------------------------------------------------


  Future<String> getString (String key) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(key == Keys.email){
      return prefs.getString(key);
    }
    String email =  prefs.getString(Keys.email) ?? "default";
    return prefs.getString(key + email);
  }

  Future<int> getInt (String key) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String email =  prefs.getString(Keys.email) ?? "default";
    return prefs.getInt(key + email);
  }

  Future<double> getDouble (String key) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String email =  prefs.getString(Keys.email) ?? "default";
    return prefs.getDouble(key + email);
  }

  Future<bool> getBoolean (String key) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String email =  prefs.getString(Keys.email) ?? "default";
    return prefs.getBool(key + email)??false;
  }

  Future<List<String>> getStringList(String key) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String email =  prefs.getString(Keys.email) ?? "default";
    return prefs.getStringList(key + email);
  }

  Future<List<String>> readList(String key) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String email =  prefs.getString(Keys.email) ?? "default";
    List<String> strings = prefs.getStringList(key + email) ?? [];
    return strings;
  }

}