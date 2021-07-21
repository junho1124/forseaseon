import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:forseason/model/document_model.dart';
import 'package:forseason/util/make_star_rating.dart';
import 'package:forseason/view/document_page/community_detail.dart';

class TopTopicCard extends StatefulWidget {
  @override
  _TopTopicCardState createState() => _TopTopicCardState();

  TopTopicCard(this.document);

  final Document document;
}

class _TopTopicCardState extends State<TopTopicCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => CommunityDetailPage(widget.document)));
      },
      child: Card(
          child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 80,
              child: Image.network(widget.document.documentInput![2].text,
                  fit: BoxFit.cover),
            ),
            SizedBox(height: 4.0,),
            Expanded(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.document.documentInput![0].text,
                  style: TextStyle(),
                ),
              ],
            ),),
            Text(widget.document.user!.name),
            MakeStarRating(),
          ],
        ),
      )),
    );
  }
}
