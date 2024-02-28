import 'package:flutter/material.dart';

import 'item_model.dart';

class Item extends StatelessWidget {
  ItemData data;
  bool isVisible;
  Function onClick;

  Item({required this.onClick,required this.isVisible, required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: Row(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: 35),
              padding:
                  EdgeInsets.only(top: 20, bottom: 20, left: 40, right: 20),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(40)),
              child: Row(
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Text("Name: ${data.itemName}",
                              style: TextStyle(fontSize: 30, color: Colors.black)),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(children: [
                        Text("Phone: ${data.itemNum}",
                            style: TextStyle(
                              fontSize: 30,
                            )),
                      ]),
                    ],
                  ),
                  Spacer(),
                  IconButton(onPressed: ()=> onClick()
                  , icon:Icon(Icons.delete),color: Colors.red,iconSize: 40,)
                ],
              ),
            ),
          ),



        ],
      ),
    );
  }
}
