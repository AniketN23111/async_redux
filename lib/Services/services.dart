import 'dart:convert';
import 'dart:typed_data';
import 'package:mime/mime.dart';
import 'package:http_parser/http_parser.dart';
import 'package:last_step/Constants/response_api.dart';
import 'package:last_step/Services/data_service.dart';
import 'package:http/http.dart' as http;

class Services extends DataService {
  final baseUrl = "https://fakestoreapi.com/products";
  final fileUploadUrl = "https://api.escuelajs.co/api/v1/files/upload";

  @override
  Future<ResponseApi> getAllProduct() async {
    return perfromHTTPGET(baseUrl);
  }

  @override
  Future<ResponseApi> getSingleProduct(productResponse) {
    return perfromHTTPGET('$baseUrl/${productResponse.id}');
  }

  @override
  Future<ResponseApi> updateProduct(productResponse) {
    final data = productResponse.toJson();
    return performHTTPPUT('$baseUrl/${productResponse.id}', data);
  }

  @override
  Future<ResponseApi> deleteProduct(productResponse) {
    return performHTTPDELETE("$baseUrl/${productResponse.id}");
  }

  @override
  Future<ResponseApi> uploadFile(Uint8List? fileBytes, String? fileName) async {
    return await performHTTPPOST(fileUploadUrl,
        fileBytes: fileBytes, fileName: fileName);
  }

  Future<ResponseApi> perfromHTTPGET(String url) async {
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        // return jsonDecode(response.body);
        return ResponseApi(data: jsonDecode(response.body), err: "");
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }

  Future<ResponseApi> performHTTPGET(String url) async {
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        return ResponseApi(data: jsonDecode(response.body), err: "");
      } else {
        return ResponseApi(
            data: null, err: 'Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      return ResponseApi(data: null, err: 'Failed to load data: $e');
    }
  }

  Future<ResponseApi> performHTTPPOST(
    String url, {
    dynamic data,
    Uint8List? fileBytes,
    String? fileName,
  }) async {
    try {
      http.Response response;
      if (fileBytes != null && fileName != null) {
        String? mimeType = lookupMimeType(fileName);
        var mediaType = mimeType?.split('/');

        var request = http.MultipartRequest('POST', Uri.parse(url));
        request.files.add(http.MultipartFile.fromBytes(
          'file',
          fileBytes,
          filename: fileName,
          contentType: MediaType(mediaType![0], mediaType[1]),
        ));

        if (data != null) {
          data.forEach((key, value) {
            request.fields[key] = value.toString();
          });
        }

        var streamedResponse = await request.send();
        response = await http.Response.fromStream(streamedResponse);
      } else {
        response = await http.post(
          Uri.parse(url),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(data),
        );
      }
      print(response.statusCode);

      if (response.statusCode == 201 || response.statusCode == 200) {
        return ResponseApi(data: jsonDecode(response.body), err: "");
      } else {
        return ResponseApi(
            data: null, err: 'Failed to create data: ${response.statusCode}');
      }
    } catch (e) {
      return ResponseApi(data: null, err: 'Failed to create data: $e');
    }
  }

  Future<ResponseApi> performHTTPPUT(
      String url, Map<String, dynamic> data) async {
    try {
      final response = await http.put(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(data),
      );

      print("Updated ${response.statusCode}");
      if (response.statusCode == 200) {
        return ResponseApi(data: jsonDecode(response.body), err: "");
      } else {
        return ResponseApi(
            data: null, err: 'Failed to update data: ${response.statusCode}');
      }
    } catch (e) {
      return ResponseApi(data: null, err: 'Failed to update data: $e');
    }
  }

  Future<ResponseApi> performHTTPDELETE(String url) async {
    try {
      final response = await http.delete(Uri.parse(url));

      if (response.statusCode == 200) {
        print('Deleted ${response.statusCode}');
        return ResponseApi(data: jsonDecode(response.body), err: "");
      } else {
        return ResponseApi(
            data: null, err: 'Failed to delete data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to delete data: $e');
    }
  }
}
