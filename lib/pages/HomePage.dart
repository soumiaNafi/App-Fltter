import 'package:Flutter_Showcase/utils/CustomCard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ApiPage extends StatefulWidget {
  @override
  _ApiPageState createState() => _ApiPageState();
}

class _ApiPageState extends State<ApiPage> {
  TextEditingController taskTitleInputController;
  TextEditingController taskDescripInputController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Utiliser Firebase"),
        leading: Icon(FontAwesomeIcons.home),
      ),
      body: Center(
        child: Container(
            padding: const EdgeInsets.all(10.0),
            child: StreamBuilder<QuerySnapshot>(
              stream: Firestore.instance.collection('Task').snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError)
                  return new Text('Error: ${snapshot.error}');
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return new SpinKitPumpingHeart(
                      color: Colors.white38,
                      duration: Duration(milliseconds: 20),
                    );
                  default:
                    return new ListView(
                      children: snapshot.data.documents
                          .map((DocumentSnapshot document) {
                        return new CustomCard(
                          title: document['title'],
                          description: document['description'],
                        );
                      }).toList(),
                    );
                }
              },
            )),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(FontAwesomeIcons.plus),
        backgroundColor: Color(0xff42a5f5),
        tooltip: 'Ajouter une tache',
        onPressed: _showDialog,
      ),
    );
  }

  @override
  initState() {
    taskTitleInputController = new TextEditingController();
    taskDescripInputController = new TextEditingController();
    super.initState();
  }

  _showDialog() async {
    Alert(
        style: AlertStyle(
          constraints: BoxConstraints.expand(),
          overlayColor: Color(0xff212121),
          isCloseButton: true,
          isOverlayTapDismiss: true,
        ),
        context: context,
        title: "Ajouter une Tache",
        content: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              TextField(
                controller: taskTitleInputController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(FontAwesomeIcons.tasks),
                  labelText: 'Titre de Tache',
                ),
              ),
              SizedBox(height: 10.0),
              TextField(
                controller: taskDescripInputController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(FontAwesomeIcons.stickyNote),
                  labelText: 'Description du Tache',
                ),
              ),
            ],
          ),
        ),
        buttons: [
          DialogButton(
              color: Color(0xff42A5F5),
              child: Text(
                'Ajouter',
                style: TextStyle(color: Color(0xffffffff)),
              ),
              onPressed: () {
                if (taskDescripInputController.text.isNotEmpty &&
                    taskTitleInputController.text.isNotEmpty) {
                  Firestore.instance
                      .collection('Task')
                      .add({
                        "title": taskTitleInputController.text,
                        "description": taskDescripInputController.text
                      })
                      .then((result) => {
                            Navigator.pop(context),
                            taskTitleInputController.clear(),
                            taskDescripInputController.clear(),
                          })
                      .catchError((err) => print(err));
                }
              })
        ]).show();
  }
}
