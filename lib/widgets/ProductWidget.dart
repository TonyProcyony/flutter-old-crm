import 'package:flutter/material.dart';
import 'package:flutter_old_crm/widgets/ProductDetailWidget.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget(this.title, this.price, this.vendor, {super.key});
  final String title;
  final double price;
  final String vendor;
//   @override
//   State<ProductWidget> createState() => _ProductWidgetState();
// }

// class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () => showModalBottomSheet(
        context: context,
        builder: (context) => ProductDetailWidget(price, title, vendor),
      ),
      child: Card(
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
                title,
                textAlign: TextAlign.center,
                softWrap: true,
              ),
            ),
            Text(
              '${price.toString()}€',
            ),
          ],
        ),
      ),
    );
  }
}
