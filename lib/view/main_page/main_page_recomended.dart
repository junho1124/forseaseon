import 'package:flutter/material.dart';
import 'package:forseason/model/document_model.dart';

import 'items/top_card.dart';

class RecommendedCards extends StatelessWidget {
  RecommendedCards(this.document);

  final Document document;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 500,
          height: 220,
          child: GridView.builder(
            scrollDirection: Axis.horizontal,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3.5 / 3.1,
              crossAxisSpacing: 20,
              mainAxisSpacing: 5,
            ),
            itemCount: 4,
            itemBuilder: (BuildContext context, int index) {
              return TopCard(document);
            },
          ),
        ),
      ],
    );
  }

}