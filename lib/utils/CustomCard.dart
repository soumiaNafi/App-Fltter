import 'package:Flutter_Showcase/pages/SecondPage.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  CustomCard({@required this.title, this.description});

  final title;
  final description;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: new EdgeInsets.symmetric(horizontal: 00.0, vertical: 0.0),
      child: Container(
        decoration: BoxDecoration(color: Color(0xff42a5f5)),
        child: makeListTile(context, title, description),
      ),
    );
  }

  makeListTile(context, title, descritpion) => ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        leading: Container(
          padding: EdgeInsets.only(right: 12.0),
          decoration: new BoxDecoration(
            border: new Border(
              right: new BorderSide(width: 1.0, color: Colors.blue),
            ),
          ),
          child: Icon(Icons.event_note, color: Colors.white),
        ),
        title: Text(
          "Title : " + title,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        trailing: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      SecondPage(title: title, description: descritpion),
                ),
              );
            },
            child: Icon(Icons.keyboard_arrow_right,
                color: Colors.white, size: 30.0)),
      );
}
