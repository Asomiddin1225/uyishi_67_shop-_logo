// import 'package:flutter/material.dart';

// import 'package:provider/provider.dart';
// import 'package:uyishi_65/controller/product_controller.dart';
// import 'package:uyishi_65/models/product_model.dart';

// import 'package:uyishi_65/views/widgets/product_item.dart';

// class ProductGrid extends StatelessWidget {
//   const ProductGrid({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<ProductController>(
//       builder: (context, productController, child) {
//         return GridView.builder(
//           padding: const EdgeInsets.symmetric(horizontal: 16.0),
//           shrinkWrap: true,
//           physics: const NeverScrollableScrollPhysics(),
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             crossAxisSpacing: 10.0,
//             childAspectRatio: 0.65,
//           ),
//           itemCount: productController.product.length,
//           itemBuilder: (context, index) {
//             final product = productController.product[index];
//             return ChangeNotifierProvider<ProductModel>.value(
//               value: product,
//               child: ProductItem(
//                 index: index,
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uyishi_65/controller/product_controller.dart';
import 'package:uyishi_65/models/product_model.dart';
import 'package:uyishi_65/views/widgets/product_item.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductController>(
      builder: (context, productController, child) {
        return GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            childAspectRatio: 0.65,
          ),
          itemCount: productController.product.length,
          itemBuilder: (context, index) {
            final product = productController.product[index];
            return ChangeNotifierProvider<ProductModel>.value(
              value: product,
              child: ProductItem(
                index: index,
              ),
            );
          },
        );
      },
    );
  }
}