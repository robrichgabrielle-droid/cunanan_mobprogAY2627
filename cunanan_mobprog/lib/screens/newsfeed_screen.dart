import 'package:flutter/material.dart';

import '../widgets/newsfeed_card.dart';

class NewsFeedScreen extends StatelessWidget {
  const NewsFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        NewsFeedCard(
          userName: 'Rob Gabrielle',
          avatarPath: 'assets/assets/images/pfp1.jpg',
          postContent: 'Laboratory Act 1',
          numOfLikes: 100,
          date: 'October 11',
        ),
        NewsFeedCard(
          userName: 'Rob Blythe',
          avatarPath: 'assets/assets/images/pfp2.jpg',
          postContent: 'Post ko lang here.',
          numOfLikes: 200,
          imagePath: 'assets/assets/images/pic1.jpg',
          date: 'December 2',
        ),
      ],
    );
  }
}
