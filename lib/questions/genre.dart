import 'package:covid19_TG/models/radio_item.dart';
import 'package:covid19_TG/questions/age.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Genre extends StatefulWidget {
  @override
  createState() {
    return new GenreState();
  }
}

class GenreState extends State<Genre> {
  var url = "http://localhost/dashboard/tino_folder/addtest.php";
  List<RadioModel> sampleData = new List<RadioModel>();

  @override
  void initState() {
    super.initState();
    sampleData.add(new RadioModel(false, '1', 'Homme'));
    sampleData.add(new RadioModel(false, '2', 'Femme'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.blueAccent,
            expandedHeight: 130.0,
            pinned: true,
            automaticallyImplyLeading:true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Quel est votre genre?",
              style: TextStyle(fontSize: 14),
              textAlign: TextAlign.center,),
              centerTitle: true,
            ),
          ),
          SliverFillRemaining(
            child: ListView.builder(
              itemCount: sampleData.length,
              itemBuilder: (BuildContext context, int index) {
                return Center(
                  child: new InkWell(
                    //highlightColor: Colors.red,
                    splashColor: Colors.blueAccent,
                    onTap: () {
                      http.post(url, body: {
                        "q1": sampleData[index].text,
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Age()),
                      );
                      setState(() {
                        print(sampleData[index].text);
                        sampleData
                            .forEach((element) => element.isSelected = false);
                        sampleData[index].isSelected = true;
                      });
                    },
                    child: new RadioItem(sampleData[index]),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
