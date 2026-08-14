import 'package:flutter/material.dart';

class ProductPageView extends StatelessWidget {
  const ProductPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    final List<String> productImages = [
      'assets/images/p1.jfif',
      'assets/images/p2.jfif',
      'assets/images/p3.jfif',
      'assets/images/p4.jfif',
      'assets/images/p5.jfif',
      'assets/images/p6.jfif',
    ];

    return SizedBox(
      height: screenHeight * 0.25,
      child: PageView.builder(
        itemCount: productImages.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(productImages[index], fit: BoxFit.cover),
            ),
          );
        },
      ),
    );
  }
}
