import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ServiceHttp {

  static String baseUrl = "jsonplaceholder.typicode.com";


  Future<Map<String, dynamic>> request({
  required String uri,
  dynamic body,
  Map<String, String>? header,  // Optional header
}) async {
  var client = http.Client();

  try {

    // Handle potential conversions for body data
    if (body is! String && body is! Map<String, dynamic>) {
      body = jsonEncode(body);  // Convert to JSON string if needed
    }

    final response = await client.post(
      Uri.https(baseUrl, uri),
      body: body,
      headers: header,
      encoding: utf8,
    );

    // Check for successful response codes
    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw Exception("Error: Status code ${response.statusCode}");
    }

    final decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;

    return decodedResponse;  // Return the decoded response data

  } catch (e) {
    if (kDebugMode) {
      print("Error during request: $e");
    }
    rethrow;  // Rethrow the exception for handling outside the function
  } finally {
    client.close();
  }
}


}
