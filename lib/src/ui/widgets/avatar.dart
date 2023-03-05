import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  const Avatar(
      {super.key,
      required this.asset,
      required this.size,
      this.borderWidth = 0});
  final double size;
  final String asset;
  final double borderWidth;

  @override
  Widget build(BuildContext context) {
    final fromNetwork =
        asset.startsWith('http://') || asset.startsWith('https://');
    final imageProvider = fromNetwork ? NetworkImage(asset) : AssetImage(asset);
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(width: borderWidth, color: Colors.white),
        image: DecorationImage(
            image: imageProvider as ImageProvider, fit: BoxFit.cover),
      ),
    );
    // return Center(
    //   child: ClipRRect(
    //     borderRadius: BorderRadius.circular(size * 0.5),
    //     child: Image.asset(
    //       asset,
    //       width: size,
    //       height: size,
    //     ),
    //   ),
    // );
  }
}
