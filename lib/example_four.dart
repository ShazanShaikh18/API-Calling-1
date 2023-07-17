import 'dart:convert'; // API Call Without Json Model Convert Plugin, Model Created By Myself.

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ExampleFour extends StatefulWidget {
  const ExampleFour({super.key});

  @override
  State<ExampleFour> createState() => _ExampleFourState();
}

class _ExampleFourState extends State<ExampleFour> {
  var data;

  Future<void> getUserApi() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (response.statusCode == 200) {
      data = jsonDecode(response.body.toString());
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API Call Complicated Json'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getUserApi(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Column(
                          children: [
                            ReUsedRow(
                                title: 'ID',
                                value: data[index]['id'].toString()),
                            ReUsedRow(
                              title: 'Name',
                              value: data[index]['name'].toString(),
                            ),
                            ReUsedRow(
                                title: 'Username',
                                value: data[index]['username'].toString()),
                            ReUsedRow(
                                title: 'Email',
                                value: data[index]['email'].toString()),
                            ReUsedRow(
                                title: 'Address (Street)',
                                value: data[index]['address']['street']
                                    .toString()),
                            ReUsedRow(
                                title: 'Address (Suite)',
                                value:
                                    data[index]['address']['suite'].toString()),
                            ReUsedRow(
                                title: 'Address (City)',
                                value:
                                    data[index]['address']['city'].toString()),
                            ReUsedRow(
                                title: 'Address (Zipcode)',
                                value: data[index]['address']['zipcode']
                                    .toString()),
                            ReUsedRow(
                                title: 'Geo (Latitude)',
                                value: data[index]['address']['geo']['lat']
                                    .toString()),
                            ReUsedRow(
                                title: 'Geo (Longitude)',
                                value: data[index]['address']['geo']['lng']
                                    .toString()),
                          ],
                        ),
                      );
                    },
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}

class ReUsedRow extends StatelessWidget {
  String title, value;
  ReUsedRow({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(title), Text(value)],
      ),
    );
  }
}
