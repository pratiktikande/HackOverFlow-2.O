// import 'dart:convert';
//
// import 'package:coco/models/shopitem_model.dart';
// import 'package:http/http.dart' as http;
// class ShopFoodListService{
//   Future<List<ShopItems>> getAll() async{
//     const url = 'https://coco-backend-cr4j.onrender.com/api/shop/food';
//     // const url = 'http://localhost:3000/api/shop/food';
//     final uri = Uri.parse(url);
//     final response = await http.get(uri);
//     if(response.statusCode == 200){
//       final json = jsonDecode(response.body) as List;
//       final photos = json.map((e) {
//         return ShopItems(
//             name: e['name'],
//             id: e['_id'],
//             url: e['url'],
//             available: e['available'],
//             pet: e['pet'],
//             price: e['price'],
//             desc: e['desc'],
//             type: e['type']
//         );
//       }).toList();
//       return photos;
//     }else{
//       throw "SHits gone api fail";
//     }
//    }
// }
// class ShopAcessoriesListService{
//   Future<List<ShopItems>> getAll() async{
//     const url = 'https://coco-backend-cr4j.onrender.com/api/shop/acessories';
//     // const url = 'http://localhost:3000/api/shop/acessories';
//     final uri = Uri.parse(url);
//     final response = await http.get(uri);
//     if(response.statusCode == 200){
//       final json = jsonDecode(response.body) as List;
//       final photos = json.map((e) {
//         return ShopItems(
//             name: e['name'],
//             id: e['_id'],
//             url: e['url'],
//             available: e['available'],
//             pet: e['pet'],
//             price: e['price'],
//             desc: e['desc'],
//             type: e['type']
//         );
//       }).toList();
//       return photos;
//     }else{
//       throw "SHits gone api fail";
//     }
//   }
// }
// class ShopMedicineListService{
//   Future<List<ShopItems>> getAll() async{
//     const url = 'https://coco-backend-cr4j.onrender.com/api/shop/medicine';
//     // const url = 'http://localhost:3000/api/shop/acessories';
//     final uri = Uri.parse(url);
//     final response = await http.get(uri);
//     if(response.statusCode == 200){
//       final json = jsonDecode(response.body) as List;
//       final photos = json.map((e) {
//         return ShopItems(
//             name: e['name'],
//             id: e['_id'],
//             url: e['url'],
//             available: e['available'],
//             pet: e['pet'],
//             price: e['price'],
//             desc: e['desc'],
//             type: e['type']
//         );
//       }).toList();
//       return photos;
//     }else{
//       throw "SHits gone api fail";
//     }
//   }
// }
//
// class AllShopListService{
//   Future<List<ShopItems>> getAll() async{
//     const url = 'https://coco-backend-cr4j.onrender.com/api/shop/all';
//     // const url = 'http://localhost:3000/api/shop/acessories';
//     final uri = Uri.parse(url);
//     final response = await http.get(uri);
//     if(response.statusCode == 200){
//       final json = jsonDecode(response.body) as List;
//       final photos = json.map((e) {
//         return ShopItems(
//             name: e['name'],
//             id: e['_id'],
//             url: e['url'],
//             available: e['available'],
//             pet: e['pet'],
//             price: e['price'],
//             desc: e['desc'],
//             type: e['type']
//         );
//       }).toList();
//       return photos;
//     }else{
//       throw "SHits gone api fail";
//     }
//   }
// }