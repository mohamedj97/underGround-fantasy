import 'package:flutter/material.dart';

class RuleListTile extends StatelessWidget {
  const RuleListTile({
    this.onTap,
    this.title,
  });

  final GestureTapCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 15.0,
      ),
      leading: Container(
        width: 40.0,
        height: 40.0,
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(
            color: Colors.blue,
          ),
        ),
        child: const Icon(
          Icons.description,
          size: 35,
        ),
      ),
      onTap: onTap,
      title: Text(title,style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        fontFamily: 'Pacifico',
      ),),
    );
  }
}