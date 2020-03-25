import 'package:flutter/material.dart';
class Civisme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            iconSize: 23.0,
            color: Colors.blue,
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text(
          'Civisme',
          style: TextStyle(
              color: Colors.blue,
              fontSize: 20.0,
              fontFamily: 'Open Sans'),
        ),
      ),
      body: Padding(padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: <Widget>[
        Container(
        child: ExpansionTile(
            title: Text('Propagation', style: TextStyle(color: Colors.blue, fontSize: 19)),
        leading: Image.asset('assets/icons/image164.png'),
        children: <Widget>[
          Padding(padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Column(
              children: <Widget>[
                Center(
                  child: Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/tansmission.png"),
                            fit: BoxFit.cover
                        )
                    ),
                  ),
                ),
                SizedBox(height: 12,),
                Center(
                  child: Text( "On peut etre contaminé en serrant les mains, en se touchant physiquement",
                    style: TextStyle(
                        fontFamily: 'Open Sans',
                        fontSize: 15
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    )
          ],
        ),
      )
    );
  }
}
