import 'dart:convert';

import 'package:api_call_3/Models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<UserModel> userList = [];

  Future<List<UserModel>> getUserApi() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      userList.clear();
      for (Map i in data) {
        userList.add(UserModel.fromJson(i));
      }
      return userList;
    } else {
      return userList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("API Calling Complicated Json"),
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
            future: getUserApi(),
            builder: (context, AsyncSnapshot<List<UserModel>> snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              } else {
                return ListView.builder(
                  itemCount: userList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            ReUsableRow(
                                title: 'ID',
                                value: snapshot.data![index].id.toString()),
                            ReUsableRow(
                                title: 'Name',
                                value: snapshot.data![index].name.toString()),
                            ReUsableRow(
                                title: 'Username',
                                value:
                                    snapshot.data![index].username.toString()),
                            ReUsableRow(
                                title: 'Email',
                                value: snapshot.data![index].email.toString()),
                            ReUsableRow(
                                title: 'Address (Street)',
                                value: snapshot.data![index].address!.street
                                    .toString()),
                            ReUsableRow(
                                title: 'Address (Suite)',
                                value: snapshot.data![index].address!.suite
                                    .toString()),
                            ReUsableRow(
                                title: 'Address (City)',
                                value: snapshot.data![index].address!.city
                                    .toString()),
                            ReUsableRow(
                                title: 'Address (ZipCode)',
                                value: snapshot.data![index].address!.zipcode
                                    .toString()),
                            ReUsableRow(
                                title: 'Geo (Latitude)',
                                value: snapshot.data![index].address!.geo!.lat
                                    .toString()),
                            ReUsableRow(
                                title: 'Geo (Longitude)',
                                value: snapshot.data![index].address!.geo!.lng
                                    .toString()),
                            ReUsableRow(
                                title: 'Phone',
                                value: snapshot.data![index].phone.toString()),
                            ReUsableRow(
                                title: 'Website',
                                value:
                                    snapshot.data![index].website.toString()),
                            ReUsableRow(
                                title: 'Company (Name)',
                                value: snapshot.data![index].company!.name
                                    .toString()),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: ReUsableRow(
                                  title: 'Company(CatchPhrase)',
                                  value: "  " +
                                      snapshot.data![index].company!.catchPhrase
                                          .toString()),
                            ),
                            ReUsableRow(
                                title: 'Company (Bs)',
                                value: snapshot.data![index].company!.bs
                                    .toString()),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
            },
          ))
        ],
      ),
    );
  }
}

class ReUsableRow extends StatelessWidget {
  String title, value;

  ReUsableRow({Key? key, required this.title, required this.value})
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
