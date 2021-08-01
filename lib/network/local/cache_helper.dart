import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper
{
  static SharedPreferences sharedPreferences= SharedPreferences.getInstance() as SharedPreferences ;
  static init () async
  {
    return sharedPreferences =  await SharedPreferences.getInstance();
  }
  static Future <bool> putdata (String key , bool value) async
  {
    return await sharedPreferences.setBool(key,value);
  }
  static dynamic getdata (String key)
  {
    return  sharedPreferences.getBool(key);
  }

}