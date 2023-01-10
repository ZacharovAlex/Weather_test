import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';

class AddressSearch extends SearchDelegate<Suggestion> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        tooltip: 'Clear',
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      tooltip: 'Back',
      icon: Icon(Icons.arrow_back),
      onPressed: () {

      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text('7');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder<List<Suggestion>>(
      // We will put the api call here
      future: null,
      builder: (context, snapshot) => query == ''
          ? Container(
        padding: EdgeInsets.all(16.0),
        child: Text('Enter your address'),
      )
          : snapshot.hasData
          ? ListView.builder(
        itemBuilder: (context, index) => ListTile(
          // we will display the data returned from our future here
          title:
          Text(snapshot!.data![index].toString()),
          onTap: () {
            close(context, snapshot!.data![index]);
          },
        ),
        itemCount: snapshot!.data!.length,
      )
          : Container(child: Text('Loading...')),
    );
  }
}

//-------------------DIVIDER



class Suggestion {
  final String placeId;
  final String description;

  Suggestion(this.placeId, this.description);

  @override
  String toString() {
    return 'Suggestion(description: $description, placeId: $placeId)';
  }
}

class PlaceApiProvider {
  final client = Client();

  PlaceApiProvider();

 // final sessionToken;

  static final String androidKey = 'AIzaSyAXdCnvb8Da5N79dJXUOPFj1l1nP7hiU0Q';
  static final String iosKey = 'AIzaSyAXdCnvb8Da5N79dJXUOPFj1l1nP7hiU0Q';
  final apiKey = Platform.isAndroid ? androidKey : iosKey;

  Future<List<Suggestion>> fetchSuggestions(String input, String lang) async {
    final request =
    Uri.parse('https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$input&types=address&components=country:ch&key=$apiKey');

    final response = await client.get(request);
    print(response);
    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      print(response.body);
      if (result['status'] == 'OK') {
        // compose suggestions in a list
        return result['predictions']
            .map<Suggestion>((p) => Suggestion(p['place_id'], p['description']))
            .toList();
      }
      if (result['status'] == 'ZERO_RESULTS') {
        return [];
      }
      throw Exception(result['error_message']);
    } else {
      throw Exception('Failed to fetch suggestion');
    }
  }



}



