import 'package:flutter/material.dart';

class VipBadge extends StatelessWidget {
  @override Widget build(BuildContext context) {
    return Container(padding: EdgeInsets.all(6), decoration: BoxDecoration(color: Colors.amber, borderRadius: BorderRadius.circular(8)), child: Row(children: [Icon(Icons.star, size:16), SizedBox(width:6), Text('VIP', style: TextStyle(fontWeight: FontWeight.bold))],),);
  }
}