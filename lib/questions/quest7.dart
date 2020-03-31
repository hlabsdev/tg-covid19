
import 'package:covid19_TG/models/radio_item.dart';
import 'package:covid19_TG/questions/quest8.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Quest7 extends StatefulWidget {
  @override
  _Quest7State createState() => _Quest7State();
}

class _Quest7State extends State<Quest7> {
  var url = "http://localhost/dashboard/tino_folder/addtest.php";
  List<RadioModel> sampleData = new List<RadioModel>();
  @override
  void initState() {
    super.initState();
    sampleData.add(new RadioModel(false, '1', 'Oui'));
    sampleData.add(new RadioModel(false, '2', 'Non'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
                [
                  SizedBox(height: MediaQuery.of(context).size.width*0.4,),
                  Center(
                      child: Container(
                          width: MediaQuery.of(context).size.width*0.9,
                          height: MediaQuery.of(context).size.width*0.3,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(7)),
                              color: Colors.blueAccent.withOpacity(0.7)
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text("Au cours de ces deux dernières semaines, avez-vous ou un membre de votre famille (vivant ensemble), été en contact proche avec une personne revenant de l'étranger ou d’un pays à risque, mais qui n’a pas été confirmée comme positif?"
                              ),
                            ),
                          )
                      )
                  )
                ]
            ),
          ),
          SliverFillRemaining(
            child: ListView.builder(
              itemCount: sampleData.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  //highlightColor: Colors.red,
                  splashColor: Colors.blueAccent,
                  onTap: () {
                    http.post(url, body: {
                      "q5": sampleData[index].text,
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Quest8()),
                    );
                    setState(() {
                      print(sampleData[index].text);
                      sampleData.forEach((element) => element.isSelected = false);
                      sampleData[index].isSelected = true;
                    });
                  },
                  child: new RadioItem(sampleData[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
