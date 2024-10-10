import 'package:eagle_valet_parking_mobile/core/utils/routes.dart';
import 'package:eagle_valet_parking_mobile/features/available_parking/models/parking_data.dart';
import 'package:flutter/material.dart';


class MySearchDelegate extends SearchDelegate {
  final List<ParkingData> items;

  MySearchDelegate(this.items);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<ParkingData> matchQuery = [];
    for (var item in items) {
      if (item.parkingTitle.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Row(
            children: [
              Text(result.parkingTitle),
            ],
          ),
          onTap: () {
            // print(result);
             Navigator.of(context).pushNamed(Routes.displayParking,
                arguments: result);
             //close(context, result);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<ParkingData> matchQuery = [];
    for (var item in items) {
      if (item.parkingTitle.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Row(
            children: [
             
              Text(result.parkingTitle),
            ],
          ),
          onTap: () {
            query = result.parkingTitle;
            showResults(context);
          },
        );
      },
    );
  }
}
