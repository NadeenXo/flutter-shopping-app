import 'package:flutter/material.dart';

class ImagesRow extends StatelessWidget {
  const ImagesRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/shopping_image.jpg',
          width: 150,
          height: 150,
          fit: BoxFit.cover,
        ),
        const SizedBox(width: 20),
        Image.network(
          'https://img.magnific.com/free-photo/supermarket-banner-with-various-items_23-2149501012.jpg?semt=ais_test_b&w=740&q=80',
          width: 150,
          height: 150,
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}
