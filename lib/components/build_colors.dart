import 'package:flutter/material.dart';
import 'constants.dart';
import '../styles/colors/colors.dart';

class ColorsList extends StatefulWidget {
  const ColorsList({Key? key}) : super(key: key);

  @override
  _ColorsListState createState() => _ColorsListState();
}

class _ColorsListState extends State<ColorsList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: colors.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                colorNumber = index;
              });
            },
            child: CircleAvatar(
              radius: 14.55,
              backgroundColor: black,
              child: CircleAvatar(
                radius: 14.22,
                backgroundColor: colors[index],
                child: colorNumber == index
                    ? const Icon(Icons.done, size: 20, color: black)
                    : const SizedBox(),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 4),
      ),
    );
  }
}
