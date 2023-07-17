// import 'dart:convert';

// import 'package:api_call_3/Models/products_model3.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class ExampleFive extends StatefulWidget {
//   const ExampleFive({super.key});

//   @override
//   State<ExampleFive> createState() => _ExampleFiveState();
// }

// class _ExampleFiveState extends State<ExampleFive> {
//   Future<ProductsModel> getProductsApi() async {
//     final response = await http.get(
//         Uri.parse('https://webhook.site/3e5d4d2a-b249-479c-821b-602498b1c3a1'));

//     var data = jsonDecode(response.body.toString());

//     if (response.statusCode == 200) {
//       return ProductsModel.fromJson(data);
//     } else {
//       return ProductsModel.fromJson(data);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("Get API Calling Last Example"),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(5.0),
//           child: Column(
//             children: [
//               Expanded(
//                 child: FutureBuilder<ProductsModel>(
//                   future: getProductsApi(),
//                   builder: (context, snapshot) {
//                     if (snapshot.hasData) {
//                       return ListView.builder(
//                         itemCount: snapshot.data!.data!.length,
//                         itemBuilder: (context, index) {
//                           return Column(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               ListTile(
//                                 title: Text(snapshot
//                                     .data!.data![index].shop!.name
//                                     .toString()),
//                                 subtitle: Text(snapshot
//                                     .data!.data![index].shop!.shopemail
//                                     .toString()),
//                                 trailing: CircleAvatar(
//                                     backgroundImage: NetworkImage(snapshot
//                                         .data!.data![index].shop!.image
//                                         .toString())),
//                               ),
//                               Container(
//                                 height: MediaQuery.of(context).size.height * .3,
//                                 width: MediaQuery.of(context).size.width * 1,
//                                 child: ListView.builder(
//                                   scrollDirection: Axis.horizontal,
//                                   itemCount: snapshot
//                                       .data!.data![index].images!.length,
//                                   itemBuilder: (context, position) {
//                                     return Padding(
//                                       padding: const EdgeInsets.only(left: 10),
//                                       child: Container(
//                                         height:
//                                             MediaQuery.of(context).size.height *
//                                                 .25,
//                                         width:
//                                             MediaQuery.of(context).size.width *
//                                                 .5,
//                                         decoration: BoxDecoration(
//                                             borderRadius:
//                                                 BorderRadius.circular(15),
//                                             image: DecorationImage(
//                                                 fit: BoxFit.cover,
//                                                 image: NetworkImage(snapshot
//                                                     .data!
//                                                     .data![index]
//                                                     .images![position]
//                                                     .url
//                                                     .toString()))),
//                                       ),
//                                     );
//                                   },
//                                 ),
//                               ),
//                               Icon(snapshot.data!.data![index].inWishlist! ==
//                                       true
//                                   ? Icons.favorite
//                                   : Icons.favorite_outline),
//                               SizedBox(
//                                 height: 8,
//                               )
//                             ],
//                           );
//                         },
//                       );
//                     } else {
//                       return Center(child: CircularProgressIndicator());
//                     }
//                   },
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:convert';

import 'package:api_call_3/Models/products_model3.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ExampleFive extends StatefulWidget {
  const ExampleFive({super.key});

  @override
  State<ExampleFive> createState() => _ExampleFiveState();
}

class _ExampleFiveState extends State<ExampleFive> {
  Future<ProductsModel> getPostApi() async {
    final response = await http.get(
        Uri.parse('https://webhook.site/3e5d4d2a-b249-479c-821b-602498b1c3a1'));

    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      return ProductsModel.fromJson(data);
    } else {
      return ProductsModel.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get API Calling Last Example'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<ProductsModel>(
              future: getPostApi(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.data!.length,
                    itemBuilder: (context, index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(snapshot
                                  .data!.data![index].shop!.image
                                  .toString()),
                            ),
                            title: Text(
                              snapshot.data!.data![index].shop!.name.toString(),
                            ),
                            subtitle: Text(snapshot
                                .data!.data![index].shop!.shopemail
                                .toString()),
                            trailing: Icon(
                                snapshot.data!.data![index].inWishlist == true
                                    ? Icons.favorite
                                    : Icons.favorite_outline),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * .3,
                            width: MediaQuery.of(context).size.width * 1,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount:
                                  snapshot.data!.data![index].images!.length,
                              itemBuilder: (context, position) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        .25,
                                    width:
                                        MediaQuery.of(context).size.width * .5,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(snapshot
                                                .data!
                                                .data![index]
                                                .images![position]
                                                .url
                                                .toString()))),
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          )
                        ],
                      );
                    },
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
