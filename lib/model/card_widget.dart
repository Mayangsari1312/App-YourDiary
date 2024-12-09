import 'package:flutter/material.dart';
import 'package:yourdiary3/theme.dart';
import 'card_item.dart';

class ExploreCardWidget extends StatelessWidget {
  final CardItem card;

  const ExploreCardWidget({required this.card, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(left: 30, right: 30, top: 10),
      clipBehavior: Clip.antiAlias,
      color: blue2Color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: 100.0,
              minWidth: 100.0,
            ),
            child: Image.asset(card.imagePath, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  card.title,
                  style: mediumTextStyle.copyWith(
                      fontWeight: FontWeight.w600, color: blueColor),
                ),
                const SizedBox(height: 0),
                Text(
                  card.author,
                  style: lightTextStyle.copyWith(
                      fontWeight: FontWeight.w100, color: blueColor),
                ),
                const SizedBox(height: 5),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
