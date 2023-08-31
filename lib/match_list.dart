import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_sample02/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MatchList extends StatefulWidget {
  const MatchList({Key? key}) : super(key: key);

  @override
  State<MatchList> createState() => _MatchListState();
}

class _MatchListState extends State<MatchList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Match List'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('football').snapshots(),
        builder: (context, snapshot) {
          final matches = snapshot.data!.docs;
          return ListView.builder(
            itemCount: matches.length,
            itemBuilder: (context, index) {
              final match = matches[index];
              final matchName = match.get('match_name');

              return Card(
                elevation: 6,
                child: ListTile(
                  title: Text(matchName),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Get.to(HomeScreen(
                        matchdocid: match.id,
                        match: matchName,
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
