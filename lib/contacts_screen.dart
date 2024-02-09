import 'package:flutter/material.dart';
import 'item.dart';
import 'item_model.dart';

class Contacts extends StatefulWidget {
  static const String routeName = "contact";

  @override
  State<Contacts> createState() => _ContactsState();
}


class _ContactsState extends State<Contacts> {
  TextEditingController name = TextEditingController();
  TextEditingController number = TextEditingController();

  // bool visible = false;
  int counter = 0;
  List<ItemData> items = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: const Text(

          "Contacts Screen",
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 10),
        child: Column(
          children: [
            TextField(
              controller: name,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  label: const Text("Name",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 25,
                      )),
                  hintText: "Enter Your Name Here",
                  hintStyle: const TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                  suffix: const Icon(Icons.edit, color: Colors.blue),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(color: Colors.transparent)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50))),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: number,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  label: const Text("Phone",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 25,
                      )),
                  hintText: "Enter Your Number Here",
                  hintStyle: const TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                  suffix: const Icon(Icons.call, color: Colors.blue),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(color: Colors.transparent)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50))),
            ),
            const SizedBox(height: 35),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // ItemData item = ItemData(
                      //   itemName: name.text,
                      //   itemNum: number.text,
                      // );

                      setState(() {
                        items.add(ItemData(
                            itemNum: number.text, itemName: name.text));
                        counter++;
                      });
                      name.clear();
                      number.clear();
                    },
                    child: const Text(
                      "Add",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                    style: ButtonStyle(
                      padding: const MaterialStatePropertyAll(EdgeInsets.all(12)),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        items.removeLast();
                        counter--;
                      });
                      name.clear();
                      number.clear();
                    },
                    child: const Text(
                      "Delete",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                    style: ButtonStyle(
                      padding: const MaterialStatePropertyAll(EdgeInsets.all(12)),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                      backgroundColor: const MaterialStatePropertyAll(Colors.red),
                    ),
                  ),
                ),
              ],
            ),
            for (int i = 0; i < items.length; i++)
              Visibility(
                visible: i < counter,
                child: Item(
                  data: ItemData(
                      itemName: items[i].itemName, itemNum: items[i].itemNum),
                  isVisible: true,
                ),
              )
          ],
        ),
      ),
    );
  }
}
