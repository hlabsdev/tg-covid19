import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          TextField(
            autofocus: true,
            autocorrect: true,
            onTap: ()=>{},
            scrollPadding: EdgeInsets.all(8),
          ),
        ],
      ),
    );
  }
}
