import 'package:flutter/material.dart';
import 'package:forseason/model/document_model.dart';
import 'package:forseason/view/main_page/items/resent_card.dart';


class MainPageResent extends StatelessWidget {

  MainPageResent(this.documents);

  final List<Document> documents;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(width: 4,),
            Text(
              'Resent',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 4,
            crossAxisSpacing: 10,
            mainAxisSpacing: 5,
          ),
          itemCount: documents.length,
          itemBuilder: (BuildContext context, int index) {
            return ResentCards(documents[index]);
          },
        ),
      ],
    );
  }
}