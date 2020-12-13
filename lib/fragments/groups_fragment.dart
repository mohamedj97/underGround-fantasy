import 'dart:convert';

import 'package:animations/animations.dart';
import 'package:fantasy/models/group_model.dart';
import 'package:fantasy/utilities/constants.dart';
import 'package:fantasy/widgets/create_or_add_group.dart';
import 'package:fantasy/widgets/group_item_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

const double _fabDimension = 56.0;

class GroupsFragment extends StatefulWidget {
  @override
  _GroupsFragmentState createState() => _GroupsFragmentState();
}

class _GroupsFragmentState extends State<GroupsFragment> {
  ContainerTransitionType _transitionType = ContainerTransitionType.fade;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  String token;

  List<GroupModel> groupsList = [];

  Future<List<GroupModel>> getGroups() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    token = sharedPreferences.getString("token");
    final Map<String, String> headers = {
      "Content-Type": 'application/json',
      "authToken": token
    };
    Map<String, dynamic> responseData;
    final http.Response response =
        await http.get('$BASE_URL' 'group/getGroups', headers: headers);
    responseData = json.decode(response.body);
    List<dynamic> data = responseData["groups"];
    Map<String, dynamic> owners;
    int m = 0;
    for (var item in data) {
      owners = data[m]["owner"];
      m++;
      final groups = GroupModel(
          ownerName: owners["name"], name: item["name"], code: item["code"]);
      if (groups.name != null) groupsList.add(groups);
    }
    return groupsList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getGroups(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return GroupItemList(
                      snapshot.data[index].name,
                      'by: ${snapshot.data[index].ownerName}',
                      snapshot.data[index].code);
                });
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: OpenContainer(
        transitionType: _transitionType,
        openBuilder: (BuildContext context, VoidCallback _) {
          timeDilation = 3;
          return const CreatingOrAddingGroup(
            includeMarkAsDoneButton: false,
          );
        },
        closedElevation: 6.0,
        closedShape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(_fabDimension / 2),
          ),
        ),
        closedColor: Theme.of(context).colorScheme.secondary,
        closedBuilder: (BuildContext context, VoidCallback openContainer) {
          return SizedBox(
            height: _fabDimension,
            width: _fabDimension,
            child: Center(
              child: Icon(
                Icons.add,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
          );
        },
      ),
    );
  }
}
