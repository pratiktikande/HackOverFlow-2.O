// import 'package:coco/models/shopitem_model.dart';
// import 'package:coco/screens/allShopScreenCollection/single_product_screen.dart';
// import 'package:coco/screens/miscpages/payment_gateway.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import '../provider/shoplist_provider.dart';
// class CustomCard extends StatelessWidget {
//   final ShopItems details;
//   const CustomCard({super.key,required this.details});
//
//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<LikeProvider>(context);
//     return Hero(
//       tag: "details${details.id}",
//       child: GestureDetector(
//         onTap: (){
//           Navigator.of(context).push(
//             MaterialPageRoute(
//               builder: (context)=>SingleProduct(productDetails: details)
//             )
//           );
//         },
//         child: Card(
//           clipBehavior: Clip.antiAlias,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(24),
//           ),
//           child: Column(
//             children: [
//               Stack(
//                 children: [
//                   Ink.image(
//                     image: NetworkImage(
//                       details.url
//                     ),
//                     height: 240,
//                     fit: BoxFit.cover,
//                   ),
//                 ],
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(16).copyWith(bottom: 0),
//                 child: Row(
//                   children: [
//                     Flexible(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(details.name,
//                             style: const TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                             ),
//                             overflow: TextOverflow.ellipsis,
//                             softWrap: true,
//                           ),
//                           Text("Rs. ${details.price.toString()}",
//                             style: const TextStyle(
//                               fontSize: 15,
//                               fontWeight: FontWeight.normal,
//                               color: Colors.grey
//                             ),
//                           ),
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               ButtonBar(
//                 alignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   TextButton(
//                     child: const Text('Add to cart'),
//                     onPressed: () {
//                       provider.toggleLike(details.name);
//                     },
//                   ),
//                   TextButton(
//                     child: const Text('Buy Now!'),
//                     onPressed: () {
//
//                       Navigator.of(context).push(
//                         MaterialPageRoute(
//                           builder: (context)=> const PaymentGateway(),
//                         )
//                       );
//                     },
//                   )
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
