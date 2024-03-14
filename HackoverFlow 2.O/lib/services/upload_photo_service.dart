// import 'dart:async';
//
// import 'package:image_picker/image_picker.dart';
// import 'package:path/path.dart';
// import 'package:async/async.dart';
// import 'dart:io';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
// pickImage(ImageSource source) async {
//   final ImagePicker _imagePicker = ImagePicker();
//   XFile? _file = await _imagePicker.pickImage(source: source);
//   if(_file != null){
//     return await _file;
//   }else{
//     throw("No Image Selected, fallback to Default");
//   }
// }
//
// upload (File imageFile) async {
//   // open a bytestream
//   var stream = http.ByteStream(DelegatingStream(imageFile.openRead()));
//   // get file length
//   var length = await imageFile.length();
//
//   // string to uri
//   var uri = Uri.parse("https://coco-backend-cr4j.onrender.com/api/test");
//
//   // create multipart request
//   var request = new http.MultipartRequest ("POST", uri);
//
//   // multipart that takes file
//   var multipartFile = new http.MultipartFile('profilepic', stream, length, filename: basename(imageFile.path));
//
//   // add file to multipart
//   request.files.add(multipartFile);
//
//   // send
//
//   // listen for response
//   var response = await request.send();
//   if(response.statusCode == 200){
//     response.stream.transform(utf8.decoder).listen((value) {
//       Map<String, dynamic> result;
//       result = jsonDecode(value);
//       // printer(result['downloadURL']);
//     });
//   }
//   else{
//     print("issue");
//   }
// }
// class Callapi {
//   final String _url = "https://coco-backend-cr4j.onrender.com/api/user/";
//   postSignupData(data, apiUrl) async {
//     var fullUrl = _url + apiUrl;
//     return await http.post(
//       Uri.parse(fullUrl),
//       headers: _setHeader(),
//       body: jsonEncode(data),
//     );
//   }
//   postLoginData(data, apiUrl) async {
//     var fullUrl = _url + apiUrl;
//     return await http.post(
//       Uri.parse(fullUrl),
//       headers: _setHeader(),
//       body: jsonEncode(data),
//     );
//   }
//   _setHeader() => {
//     'Content-type': 'application/json',
//     'Accept': 'application/json',
//   };
// }
