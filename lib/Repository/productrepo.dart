import 'dart:convert';

import 'package:api/Models/Details.dart';
import 'package:api/Models/Products.dart';
import 'package:http/http.dart' as http;

Future<Stream<products>> getproducts() async {
  Uri uri = Uri.parse("https://6037c52d54350400177235f5.mockapi.io/product");
  try {
    final client = http.Client();
    final streamrest = await client.send(http.Request('get', uri));
    print(uri);
    return streamrest.stream
        .transform(utf8.decoder)
        .transform(json.decoder)
        .expand((data) => (data as List))
        // .map((data) => Helper.getData(data))
        .map((data) => products.fromJson(data));
  } catch (e) {
    print(e);
    return new Stream.value(products.fromJson({}));
  }
}

Future<Stream<Details>> getDetails(String productid) async {
  Uri uri = Uri.parse(
      "https://6037c52d54350400177235f5.mockapi.io/product/$productid");
  print(uri);
  try {
    final client = new http.Client();
    final streamedRest = await client.send(http.Request('get', uri));
    return streamedRest.stream.transform(utf8.decoder).transform(json.decoder)
        //  .map((data) => Helper.getData(data))
        .map((data) {
      return Details.fromJson(data);
    });
  } catch (e) {
    print(e);
    return new Stream.value(Details.fromJson({}));
  }
}
