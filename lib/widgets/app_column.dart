import 'package:flutter/material.dart';
import 'package:foody/utils/dimensions.dart';
import 'package:foody/widgets/big_text.dart';
import 'package:foody/widgets/icon_and_text_widget.dart';
import 'package:foody/widgets/small_text.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      BigText(
        text: text,
        size: Dimensions.font26,
      ),
      SizedBox(
        height: Dimensions.height10,
      ),
      Row(
        children: [
          Wrap(
            children: List.generate(5, (index) {
              return const Icon(
                Icons.star,
                color: Colors.amber,
                size: 15,
              );
            }),
          ),
          const SizedBox(
            width: 10,
          ),
          SmallText(text: "4.5"),
          const SizedBox(
            width: 10,
          ),
          SmallText(text: "1287"),
        ],
      ),
      SizedBox(
        height: Dimensions.height10,
      ),
      const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconAndTextWidget(
              icon: Icons.circle_sharp,
              text: "Normal",
              iconColor: Colors.greenAccent),
          IconAndTextWidget(
              icon: Icons.location_on, text: "1.7km", iconColor: Colors.amber),
          IconAndTextWidget(
              icon: Icons.access_time_rounded,
              text: "32min",
              iconColor: Colors.amber),
        ],
      )
    ]);
  }
}
