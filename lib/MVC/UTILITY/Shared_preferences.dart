import 'package:shared_preferences/shared_preferences.dart';

abstract class Preferences {
  Future<String>addStringToSF(String forKey,String forValue);
  Future<int>addIntToSF(String forKey, int forValue);
  Future<double>addDoubleToSF(String forKey,double forValue);
  Future<bool>addBoolToSF(String forKey, bool forValue);
//MARK: get value with key
  Future<String>getStringValuesSF(String forKey);
  Future<bool>getBoolValuesSF(String forKey);
  Future<int>getIntValuesSF(String forKey);
  Future<double>getDoubleValuesSF(String forKey);
}

class Shared implements Preferences {
  //MARK: save  value with key
  addStringToSF(String forKey,String forValue) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('$forKey', '$forValue');
  }

  addIntToSF(String forKey, int forValue) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('$forKey', forValue);
  }

  addDoubleToSF(String forKey,double forValue) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble('$forKey', forValue);
  }

  addBoolToSF(String forKey, bool forValue) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('$forKey', forValue);
  }

  //MARK: get value with key
  Future<String>getStringValuesSF(String forKey) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String stringValue = prefs.getString('$forKey');
    return stringValue;
  }

  Future<bool>getBoolValuesSF(String forKey) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return bool
    bool boolValue = prefs.getBool('$forKey');
    return boolValue;
  }

  Future<int>getIntValuesSF(String forKey) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return int
    int intValue = prefs.getInt('$forKey');
    return intValue;
  }

  Future<double>getDoubleValuesSF(String forKey) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return double
    double doubleValue = prefs.getDouble('$forKey');
    return doubleValue;
  }
  Future<bool>isKeyPresnt(String forKey) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  return prefs.containsKey('$forKey');
  }
}
