import 'dart:convert';
import 'dart:developer';


import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:http/io_client.dart';

class ServiceHttp {
  static String baseUrl = "103.252.119.85:8080";

  Future<Map<String, dynamic>> request({
    required String uri,
    dynamic body,
    Map<String, String>? header,
  }) async {
    // Create a custom HttpClient that allows bad certificates
    // HttpClient httpClient = HttpClient()
    //   ..badCertificateCallback =
    //       ((X509Certificate cert, String host, int port) => true);

    var client = IOClient();

    header =  {
      'Accept': '*/*',
      'Content-Type': 'application/json',
    };

    var token = "";

    if (token.isNotEmpty) {
      header['Authorization'] = 'Bearer $token';
    }

    print("Request Header=========>>>>> $uri\n$header");

    print("Request Body=========>>>>> $uri\n${jsonEncode(body)}");

    try {
      if (body is! String && body is! Map<String, dynamic>) {
        body = jsonEncode(body);
      }

      // Handle potential conversions for body data
      if (body is Map<String, dynamic>) {
        body = jsonEncode(body); // Convert to JSON string
      }

      final response = await client.post(
        Uri.http(baseUrl, uri),
        body: body,
        headers: header,
        encoding: utf8,
      );

      if (response.statusCode < 200 || response.statusCode >= 300) {
        throw Exception("Error: Status code ${response.statusCode}");
      }

      final decodedResponse = jsonDecode(response.body) as Map<String, dynamic>;

      print("RESP====>>>>>> $uri\n$decodedResponse");

      return decodedResponse;
    } catch (e) {
      if (kDebugMode) {
        print("During request: $e");
      }
      rethrow;
    } finally {
      client.close();
    }
  }


  Future<Map<String, dynamic>> getRequest({
    required String uri,
    String path = "",
    String query  = "",
    Map<String, String>? header,
  }) async {
    if(path.isNotEmpty) {
        uri+=path;
      }
    var client = IOClient();

    // header =  {
    //   'Accept': '*/*',
    //   'Content-Type': 'application/json',
    // };

    // var token = "";

    // if (token.isNotEmpty) {
    //   header['Authorization'] = 'Bearer $token';
    // }

    print("Request Header=========>>>>> $uri\n$header");


    print("Request Query=========>>>>> $uri\n$query");

    try {

      
      final response = await client.get(
        query.isNotEmpty?
        Uri.http(baseUrl, uri, {
          'q': query,
        }) : 
        Uri.http(baseUrl, uri)
        ,headers: header,
      );

      if (response.statusCode < 200 || response.statusCode >= 300) {
        throw Exception("Error: Status code ${response.statusCode}");
      }

      // print("resp 1: ${response.body}");

      dynamic decodedResponse;

      try {
        // Try parsing the response as a Map (in case the response is in that format)
        decodedResponse = jsonDecode(response.body) as Map<String, dynamic>;
      } catch (e) {
        // If parsing as Map fails, handle it as a List and wrap it in a Map with 'data'
        decodedResponse = {
          'data': jsonDecode(response.body) as List<dynamic>
        };
      }


      log("RESP====>>>>>> $uri\n$decodedResponse");

      return decodedResponse;
    } catch (e) {
      if (kDebugMode) {
        print("During request: $e");
      }
      rethrow;
    } finally {
      client.close();
    }
  }



}
