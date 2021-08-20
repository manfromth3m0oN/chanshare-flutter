import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'thread.dart';

class BrowseScreen extends StatelessWidget {
  final String board;
  final int threadNo;
  BrowseScreen({Key? key, required this.board, required this.threadNo})
      : super(key: key);

  Future<List<String>> getMedia(String board, int threadNo) async {
    var media = <String>[];
    final String uri = 'https://a.4cdn.org/$board/thread/$threadNo.json';
    var thread = await fetchThreadJSON(uri);
    for (final post in thread.posts!) {
      if ((post.ext != null) && (post.tim != null)) {
        media.add("https://i.4cdn.org/$board/${post.tim}${post.ext}");
      }
    }
    return media;
  }

  Future<Thread> fetchThreadJSON(uri) async {
    final response = await http.get(Uri.parse(uri));
    if (response.statusCode == 200) {
      return Thread.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load thread');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getMedia(board, threadNo),
      builder: (context, AsyncSnapshot<List<String>> snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
              appBar: AppBar(
                title: Text('Chanshare $board/$threadNo'),
              ),
              body: ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return ListTile(title: Text(snapshot.data![index]));
                },
              ));
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
