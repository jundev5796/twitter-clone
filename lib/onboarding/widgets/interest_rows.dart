import 'package:flutter/material.dart';
import 'package:twitter_clone/constants/sizes.dart';

class HorizontalScrollList extends StatelessWidget {
  final List<String> items;

  const HorizontalScrollList({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _horizontalRow(items.take(6).toList()),
        const SizedBox(height: 10),
        _horizontalRow(items.sublist(6, 12).toList()),
        const SizedBox(height: 10),
        if (items.length > 12) _horizontalRow(items.sublist(12).toList()),
      ],
    );
  }

  Widget _horizontalRow(List<String> subItems) {
    return SizedBox(
      height: 40, // adjust height if necessary
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: subItems.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(right: 10), // spacing between items
            padding: const EdgeInsets.symmetric(
              vertical: Sizes.size14,
              horizontal: Sizes.size24 + 2,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: Colors.grey.shade300,
              ),
            ),
            child: Center(
              child: Text(
                subItems[index],
                style: const TextStyle(
                  fontSize: Sizes.size16,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
