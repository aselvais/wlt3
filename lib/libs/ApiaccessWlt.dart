import 'package:http/http.dart' as http;
import 'package:wlt3/libs/ApiaccessAbstract.dart';

class ApiaccessWlt extends ApiaccessAbstract
{
  String baseurl = 'https://us-central1-wlt3-66c9a.cloudfunctions.net/';
  
  Future<http.Response> getLeagues() {
    return http.get( baseurl + 'league');
  }


}
