import 'package:flutter/material.dart';
import 'package:forseason/model/document_model.dart';
import 'package:forseason/util/make_star_rating.dart';
import 'package:forseason/view/document_page/community_detail.dart';

class RecommendedCard extends StatefulWidget {
  RecommendedCard(this.document);

  final Document document;

  @override
  _RecommendedCardState createState() => _RecommendedCardState();

}

class _RecommendedCardState extends State<RecommendedCard> {
  @override
  Widget build(BuildContext context) {
  final document = widget.document;
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => CommunityDetailPage(widget.document)));
      },
      child: Card(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 200,
              child: Image.network(
                document.documentInput![2].text,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(document.documentInput![0].text),
            Expanded(child: Container()),
            Text(
              'Forseason Tip',
              style: TextStyle(fontSize: 12),
            ),
            SizedBox(height: 4),
            Row(
              children: [
                MakeStarRating(),
                SizedBox(
                  width: 4,
                ),
                Text(
                  document.favoriteCount.toString(),
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 9),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
