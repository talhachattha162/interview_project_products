import 'dart:convert';

import 'package:http/http.dart' as http;


Future<dynamic> loginUser(String username, String password) async {
  try {
    final url = Uri.parse('https://fakestoreapi.com/auth/login');
    final response = await http.post(url, body: {
      'username': username,
      'password': password,
    });


    if (response.statusCode == 200)
    {
      final responseData=jsonDecode(response.body);
      if(responseData["token"].toString().isNotEmpty||responseData["token"].isDefinedAndNotNull){
        return 'success';
      }
      else{
        return "Error occurred try again later";
      }
    }
    else {
      final responseData=(response.body);
      return responseData;
    }
  } catch (e) {
    return  "Error occurred try again later";
    ;
  }
}
