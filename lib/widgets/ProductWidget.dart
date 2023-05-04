import 'package:flutter/material.dart';

class ProductWidget extends StatefulWidget {
  const ProductWidget({super.key, this.title, this.price});
  final String? title;
  final double? price;
  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: Theme.of(context).colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
              widget.title!,
              textAlign: TextAlign.center,
              softWrap: true,
            ),
          ),
          Text(
            widget.price!.toString(),
          ),
        ],
      ),
    );
  }
}

// class CardWidget extends StatelessWidget {
//   const CardWidget({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 3,
//       color: Theme.of(context).colorScheme.surface,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(15),
//       ),
//       child: Column(
//         children: const [
//           Expanded(
//               flex: 2,
//               child: Image(
//                 image: NetworkImage(
//                   'https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aHVtYW58ZW58MHx8MHx8&w=1000&q=80',
//                 ),
//                 fit: BoxFit.fitWidth,
//               )

//               // 'https://www.oldsquare.it/wp-content/uploads/logo_navbar.svg'),
//               ),
//           Expanded(
//             child: Center(
//               child: Text('Product'),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ProductDetailScreen extends StatefulWidget {
//   static const routeName = 'product-detial-screen';
//   const ProductDetailScreen({super.key});

//   @override
//   State<ProductDetailScreen> createState() => _ProductDetailScreenState();
// }

// class _ProductDetailScreenState extends State<ProductDetailScreen> {
//   int counter = 0;
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return Scaffold(
//       body: SizedBox(
//         height: size.height,
//         child: Center(
//           child: Hero(
//             tag: 'Tag1',
//             child: Card(
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(15)),
//               elevation: 3,
//               child: SizedBox(
//                 height: size.height * 0.65,
//                 width: size.width * 0.85,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     const Expanded(
//                       flex: 2,
//                       child: Image(
//                         image: NetworkImage(
//                           'https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aHVtYW58ZW58MHx8MHx8&w=1000&q=80',
//                         ),
//                         fit: BoxFit.contain,
//                       ),
//                     ),
//                     const Padding(
//                       padding: EdgeInsets.all(10),
//                       child: Center(
//                         child: Text("Product name"),
//                       ),
//                     ),
//                     Expanded(
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: const [
//                           Text('Product Vendor'),
//                           Text('Product price'),
//                         ],
//                       ),
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         TextButton(
//                           onPressed: () {
//                             if (counter == 0) {
//                               return;
//                             }
//                             counter--;
//                             setState(() {
//                               counter = counter;
//                             });
//                           },
//                           child: const Text('-'),
//                         ),
//                         Text(
//                           counter.toString(),
//                         ),
//                         TextButton(
//                           onPressed: () {
//                             counter++;
//                             setState(() {
//                               counter = counter;
//                             });
//                           },
//                           child: const Text('+'),
//                         ),
//                       ],
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(10),
//                       child: ElevatedButton(
//                         onPressed: () {
//                           Navigator.of(context).pop();
//                         },
//                         child: const Text(
//                           'Aggiungi al carello',
//                           style: TextStyle(
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
