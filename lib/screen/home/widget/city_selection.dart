import 'package:flutter/material.dart';

/// The page for city search and selection
class CitySelection extends StatefulWidget {
  @override
  State<CitySelection> createState() => _CitySelectionState();
}

class _CitySelectionState extends State<CitySelection> {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context),
      body: getContent(context),
    );
  }

  /// Builds and returns the app bar
  Widget getAppBar(BuildContext context) {
    return AppBar(
      title: Text('City'),
    );
  }

  Widget getContent(BuildContext context) {
    return Form(
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: TextFormField(
                controller: _textController,
                decoration: InputDecoration(
                  labelText: 'City',
                  hintText: 'Toronto',
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.pop(context, _textController.text);
            },
          )
        ],
      ),
    );
  }
}
