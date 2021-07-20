import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:forseason/model/document_model.dart';
import 'package:forseason/util/make_star_rating.dart';
import 'package:forseason/view/document_page/community_detail.dart';

class ResentCards extends StatefulWidget {
  ResentCards(this.document);

  final Document document;

  @override
  _ResentCardsState createState() => _ResentCardsState();
}

class _ResentCardsState extends State<ResentCards> {
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
              height: 120,
              child: Image.network(widget.document.documentInput![2].text!,
                  fit: BoxFit.cover),
            ),
            SizedBox(
              height: 4.0,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.document.documentInput![0].text!,
                  style: TextStyle(),
                ),
              ],
            ),
            Expanded(child: SizedBox()),
            Text(widget.document.user!.name!),
            MakeStarRating(),
          ],
        ),
      )),
    );
  }
}
