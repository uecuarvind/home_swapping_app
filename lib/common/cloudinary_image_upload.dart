import 'dart:convert';
import 'dart:io';
import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;

class CloudinaryService {
  static const String cloudName =
      "dorbokwzm"; // Replace with your Cloudinary Cloud Name
  static const String apiKey = "355563563234827"; // Replace with your API Key
  static const String apiSecret =
      "kjVRalFqavXC6cswRLe_MOzaoY8"; // Replace with your API Secret (for learning purposes only)

  /// Generate Cloudinary signature (SHA-1 Hash)
  static String generateSignature(String timestamp) {
    String stringToSign = "timestamp=$timestamp$apiSecret";
    return sha1.convert(utf8.encode(stringToSign)).toString();
  }

  /// Upload image to Cloudinary with API authentication
  static Future<String?> uploadImage(File imageFile) async {
    print('Step 1......');
    final String timestamp =
    (DateTime.now().millisecondsSinceEpoch ~/ 1000).toString();
    final String signature = generateSignature(timestamp);

    final url =
    Uri.parse("https://api.cloudinary.com/v1_1/$cloudName/image/upload");
    print('Step 2......');

    try {
      var request = http.MultipartRequest("POST", url)
        ..fields['api_key'] = apiKey
        ..fields['timestamp'] = timestamp
        ..fields['signature'] = signature
        ..files.add(await http.MultipartFile.fromPath('file', imageFile.path));

      var response = await request.send();
      print('Step 3......${response.toString()}');

      if (response.statusCode == 200) {
        final responseData = await response.stream.bytesToString();
        final jsonData = json.decode(responseData);
        print('Step 4......${jsonData.toString()}');
        return jsonData['secure_url']; // ✅ Return Cloudinary Image URL
      } else {
        print("Failed to upload image: ${response.reasonPhrase}");
        return null;
      }
    } catch (e) {
      print("Error uploading image: $e");
      return null;
    }
  }
}