import 'package:flutter/material.dart';

import '../models/story.dart';
import 'store_item.dart';

final _stories = [
  Story(
      bg: 'assets/wallpapers/1.jpeg',
      avatar: 'assets/users/1.jpg',
      userName: 'Laura'),
  Story(
      bg: 'assets/wallpapers/2.jpeg',
      avatar: 'assets/users/2.jpg',
      userName: 'Pepe'),
  Story(
      bg: 'assets/wallpapers/3.jpeg',
      avatar: 'assets/users/3.jpg',
      userName: 'Lili'),
  Story(
      bg: 'assets/wallpapers/4.jpeg',
      avatar: 'assets/users/4.jpg',
      userName: 'Baley'),
  Story(
      bg: 'assets/wallpapers/5.jpeg',
      avatar: 'assets/users/5.jpg',
      userName: 'Mario'),
  Story(
      bg: 'assets/wallpapers/6.jpeg',
      avatar: 'assets/users/6.jpg',
      userName: 'Kata'),
];

class Stories extends StatelessWidget {
  const Stories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _stories.length,
        itemBuilder: (_, index) {
          final story = _stories[index];
          return StoryItem(
            story: story,
            isFirst: index == 0,
          );
        },
      ),
    );
  }
}
