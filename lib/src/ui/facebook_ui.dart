import 'package:facebook_ui/src/ui/models/publication.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:faker/faker.dart';
import '../widgets/icons/custom_icons.dart';

import 'widgets/circle_button.dart';
import 'widgets/publication_item.dart';
import 'widgets/quick_actions.dart';
import 'widgets/stories.dart';
import 'widgets/what_is_on_your_mind.dart';

class FacebookUi extends StatelessWidget {
  const FacebookUi({super.key});

  @override
  Widget build(BuildContext context) {
    final faker = Faker();
    final publications = <Publication>[];
    for (var i = 0; i < 5; i++) {
      final random = faker.randomGenerator;
      const reactions = Reaction.values;
      final reactionIndex = random.integer(reactions.length - 1);
      final publication = Publication(
        user: User(avatar: faker.image.image(), userName: faker.person.name()),
        title: faker.lorem.sentence(),
        createdAt: faker.date.dateTime(),
        imageUrl: faker.image.image(),
        commentsCount: random.integer(50000),
        sharesCount: random.integer(50000),
        currentUSerReaction: reactions[reactionIndex],
      );
      publications.add(publication);
    }
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 140,
        leading: SvgPicture.asset(
          'assets/logos/facebook.svg',
          colorFilter:
              const ColorFilter.mode(Colors.blueAccent, BlendMode.srcIn),
          width: 150,
        ),
        actions: const [
          CircleButton(
            color: Color(0xffBFBFBF),
            iconData: CustomIcons.search,
          ),
          SizedBox(width: 15),
          CircleButton(
            color: Color(0xffFE7574),
            iconData: CustomIcons.bell,
          ),
          SizedBox(width: 15),
          CircleButton(
            color: Color(0xff7BBAFF),
            iconData: CustomIcons.userFriends,
            showBadge: true,
          ),
          SizedBox(width: 15),
          CircleButton(
            color: Color(0xff1C86E4),
            iconData: CustomIcons.messenger,
          ),
          SizedBox(width: 15),
        ],
      ),
      body: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          const SizedBox(height: 10),
          const WhatIsOnYourMind(),
          const SizedBox(height: 30),
          const QuickActions(),
          const SizedBox(height: 30),
          const Stories(),
          const SizedBox(height: 20),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: publications.length,
            itemBuilder: (_, int index) => PublicationItem(
              publication: publications[index],
            ),
          ),
        ],
      ),
    );
  }
}
