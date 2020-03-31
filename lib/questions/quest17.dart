import 'package:covid19_TG/models/radio_item.dart';
import 'package:covid19_TG/questions/last_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Quest17 extends StatefulWidget {
  @override
  _Quest17State createState() => _Quest17State();
}

class _Quest17State extends State<Quest17> {
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
                  SizedBox(height: MediaQuery
                      .of(context)
                      .size
                      .width * 0.4,),
                  Center(
                      child: Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * 0.9,
                          height: MediaQuery
                              .of(context)
                              .size
                              .width * 0.2,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(7)),
                              color: Colors.blue.withOpacity(0.7)
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text("Ces dernières 24h avez-vous des difficultés à avaler ou à boire ?"),
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
                  splashColor: Colors.blue,
                  onTap: () {
                    http.post(url, body: {
                      "q14": sampleData[index].text,
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LastPage()),
                    );
                    setState(() {
                      print(sampleData[index].text);
                      sampleData.forEach((element) =>
                      element.isSelected = false);
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
