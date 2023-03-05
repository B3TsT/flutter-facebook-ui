import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:flutter_svg/flutter_svg.dart';
import '../models/publication.dart';
import 'avatar.dart';

class PublicationItem extends StatelessWidget {
  const PublicationItem({super.key, required this.publication});
  final Publication publication;

  String _getEmojiPath(Reaction reaction) {
    switch (reaction) {
      case Reaction.like:
        return 'assets/emojis/like.svg';
      case Reaction.love:
        return 'assets/emojis/heart.svg';
      case Reaction.laughing:
        return 'assets/emojis/laughing.svg';
      case Reaction.sad:
        return 'assets/emojis/sad.svg';
      case Reaction.shocking:
        return 'assets/emojis/shocked.svg';
      case Reaction.angry:
        return 'assets/emojis/angry.svg';
    }
  }

  String _formatCount(int value) {
    if (value <= 1000) {
      return value.toString();
    } else {
      return '${(value / 1000).toStringAsFixed(1)}k';
    }
  }

  @override
  Widget build(BuildContext context) {
    const padding = EdgeInsets.symmetric(horizontal: 20, vertical: 10);
    const reactions = Reaction.values;
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 6,
            color: Color(0xffEBEBEB),
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: padding,
            child: Row(
              children: [
                Avatar(asset: publication.user.avatar, size: 38),
                const SizedBox(width: 10),
                Text(
                  publication.user.userName,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                const Spacer(),
                Text(timeago.format(publication.createdAt))
              ],
            ),
          ),
          AspectRatio(
            aspectRatio: 16 / 9,
            child: CachedNetworkImage(
              width: double.infinity,
              height: 180,
              imageUrl: publication.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: padding.copyWith(top: 15),
            child: Text(
              publication.title,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20).copyWith(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ...List.generate(
                      reactions.length,
                      (index) {
                        final reaction = reactions[index];
                        final isAction =
                            reaction == publication.currentUSerReaction;
                        return Padding(
                          padding: const EdgeInsets.only(right: 7),
                          child: Column(
                            children: [
                              SvgPicture.asset(
                                _getEmojiPath(reaction),
                                width: 25,
                                height: 25,
                              ),
                              const SizedBox(height: 3),
                              Icon(
                                Icons.circle,
                                color: isAction
                                    ? Colors.redAccent
                                    : Colors.transparent,
                                size: 5,
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: FittedBox(
                      child: Row(
                        children: [
                          Text(
                              "${_formatCount(publication.commentsCount)} Comments"),
                          const SizedBox(width: 15),
                          Text(
                              "${_formatCount(publication.sharesCount)} Shares"),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
