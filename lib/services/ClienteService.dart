import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

// * Globals
const String _urlApi = "https://lg-lrs-api.herokuapp.com";
const String _appHash = '858b841deb7f6e42ed2a4e704ce43858';
const String _urlHasura = "https://lg-school-mobile.herokuapp.com/v1/graphql";
/* *
 * * Retorna o token gerado na autenticação
 */
Future<String> getTokenApi() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  var logged = prefs.getBool('logged');
  if (logged == true && logged != null) {
    return prefs.get('tokenapi');
  } else {
    return "";
  }
}

Future<Map<String, String>> getHeader() async {
  var token = await getTokenApi();
  Map<String, String> _header = {
    "Content-type": "application/json",
    "Accept": "application/json",
    'Hash-App': _appHash,
    'authorization': 'Bearer $token'
  };
  return _header;
}

/* *
 * * Autenticar Cliente API
 */
Future<void> autenticate() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  var response = await post('/Auth', {"NomeUsuario": "LGLugardeGente", "SenhaUsuario": "SenhaGerada"}, true);
  var logged = prefs.getBool('logged');
  if (logged != true || logged == null) {
    if (response.statusCode == 200) {
      print('API Autenticada');
      prefs.setString('tokenapi', jsonDecode(response.body));
      prefs.setBool('logged', true);
    } else {
      print('Ocorreu um erro');
      prefs.setBool('logged', false);
      autenticate();
    }
  }else{
    print("Já Autenticada");
  }
}

/* *
 * * Normal request Type POST
 */
Future<Response> post(String end, Map<String, dynamic> obj, bool _tinCan) async {
  var header = await getHeader();
  var response = await http.post(_urlApi + end, headers: header, body: jsonEncode(obj));
  print('Responde body: ${response.body}');
  print('Response Code: ${response.statusCode}');
  return response;
}

/* *
 * * Normal request Type GET
 */
Future<Response> get(String end, String params) async {
  var header = await getHeader();
  var response = await http.get(_urlApi + end + params, headers: header);
  print('Responde body: ${response.body}');
  print('Response Code: ${response.statusCode}');
  return response;
}

/* *
 * * GrapQL Hasura request POST
 */
Future<dynamic> hasura(String obj) async {
  print('Realizando requisição');
  var response = await http.post(_urlHasura,
      headers: {
        "Content-type": "application/json",
        "Accept": "application/json"
      },
      body: jsonEncode({"query": obj}));
  print('Response Code: ${response.statusCode}');
  return jsonDecode(response.body)["data"];
}
