import 'package:covid19_TG/models/radio_item.dart';
import 'package:covid19_TG/questions/tel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Age extends StatefulWidget {
  @override
  createState() {
    return AgeState();
  }
}

class AgeState extends State<Age> {
  var url = "http://localhost/dashboard/tino_folder/addtest.php";
  List<RadioModel> sampleData = List<RadioModel>();

  @override
  void initState() {
    super.initState();
    sampleData.add(new RadioModel(false, '1', '0-2'));
    sampleData.add(new RadioModel(false, '2', '3-20'));
    sampleData.add(new RadioModel(false, '3', '21-40'));
    sampleData.add(new RadioModel(false, '4', '41-60'));
    sampleData.add(new RadioModel(false, '5', '60+'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.blue,
            expandedHeight: 130.0,
            pinned: true,
            automaticallyImplyLeading:true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Quel est votre tranche d'age?",
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
                  child: InkWell(
                    //highlightColor: Colors.blueAccent,
                    splashColor: Colors.blue,
                    onTap: () {
                      http.post(url, body: {
                        "q2": sampleData[index].text,
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Tel()),
                      );
                      setState(() {
                        print(sampleData[index].text);
                        sampleData.forEach((element) => element.isSelected = false);
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
