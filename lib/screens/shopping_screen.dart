import 'my_information_screen.dart';
import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';
import '../widgets/hot_offer_item.dart';
import '../widgets/product_card.dart';
import '../widgets/product_page_view.dart';

class ShoppingScreen extends StatefulWidget {
  final ValueChanged<Locale> onLocaleChange;

  const ShoppingScreen({super.key, required this.onLocaleChange});

  @override
  State<ShoppingScreen> createState() => _ShoppingScreenState();
}

class _ShoppingScreenState extends State<ShoppingScreen> {
  // Changes between English and Arabic.
  void _toggleLanguage() {
    final String currentLanguage = Localizations.localeOf(context).languageCode;

    if (currentLanguage == 'en') {
      widget.onLocaleChange(const Locale('ar'));
    } else {
      widget.onLocaleChange(const Locale('en'));
    }
  }

  void _openMyInformation() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MyInformationScreen()),
    );
  }

  // Shows a message when a product is added to the cart.
  void _showCartSnackBar() {
    final AppLocalizations l10n = AppLocalizations.of(context)!;

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(l10n.itemAddedToCart)));
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context)!;
    final double screenWidth = MediaQuery.of(context).size.width;

    final List<Map<String, String>> products = [
      {'name': l10n.product1, 'image': 'assets/images/p1.jfif'},
      {'name': l10n.product2, 'image': 'assets/images/p2.jfif'},
      {'name': l10n.product3, 'image': 'assets/images/p3.jfif'},
      {'name': l10n.product4, 'image': 'assets/images/p4.jfif'},
      {'name': l10n.product5, 'image': 'assets/images/p5.jfif'},
      {'name': l10n.product6, 'image': 'assets/images/p6.jfif'},
    ];

    final List<Map<String, String>> hotOffers = [
      {'text': l10n.hotOffer1, 'image': 'assets/images/p1.jfif'},
      {'text': l10n.hotOffer2, 'image': 'assets/images/p2.jfif'},
      {'text': l10n.hotOffer3, 'image': 'assets/images/p3.jfif'},
      {'text': l10n.hotOffer4, 'image': 'assets/images/p4.jfif'},
      {'text': l10n.hotOffer5, 'image': 'assets/images/p5.jfif'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.shopping),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: _toggleLanguage,
            icon: const Icon(Icons.language),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _openMyInformation,
                icon: const Icon(Icons.person),
                label: Text(l10n.myInformation),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              l10n.ourProducts,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            const ProductPageView(),
            const SizedBox(height: 25),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, index) {
                return ProductCard(
                  productName: products[index]['name']!,
                  imagePath: products[index]['image']!,
                  onAddToCart: _showCartSnackBar,
                );
              },
            ),
            const SizedBox(height: 25),
            Text(
              l10n.hotOffers,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: hotOffers.length,
              itemBuilder: (context, index) {
                return HotOfferItem(
                  imagePath: hotOffers[index]['image']!,
                  offerText: hotOffers[index]['text']!,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
