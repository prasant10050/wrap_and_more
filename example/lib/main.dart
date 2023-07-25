import 'package:flutter/material.dart';
import 'package:wrap_and_more/wrap_and_more.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key});
  static const List<String> categories = [
    "Automotive",
    "Services",
    "Home and application",
    "Beauty and Care",
    "Fashion and Apparel",
    "Technology and Electronics",
    "Health and Wellness",
    "Food and Beverages",
    "Toys and Games",
    "Books and Entertainment",
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Wrap and More"),
        ),
        body: Container(
          padding: const EdgeInsets.all(16),
          width: 500,
          child: WrapAndMore(
            maxRow: 3,
            spacing: 5,
            runSpacing: 5,
            overflowWidget: (restChildrenCount) {
              return MyChip(text: "+$restChildrenCount");
            },
            children: categories
                .map(
                  (e) => MyChip(text: e),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}

class MyChip extends StatelessWidget {
  final String text;
  const MyChip({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
          color: Colors.grey, borderRadius: BorderRadius.circular(10)),
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
