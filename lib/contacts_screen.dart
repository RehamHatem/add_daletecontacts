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
  var formKey = GlobalKey<FormState>();


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
      body: Form(
        key: formKey,
        child: Container(
          margin: const EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 10),
          child: Column(
            children: [
              TextFormField(
                controller: name,
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.isEmpty == true) {
                    return ("name can't be empty");
                  }
                  return null;
                },
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
              TextFormField(
                controller: number,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty == true) {
                    return ("number can't be empty");
                  }
                  return null;
                },
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
                        if (formKey.currentState!.validate()){
                          setState(() {
                            items.add(ItemData(
                                itemNum: number.text, itemName: name.text));
                            counter++;
                          });
                          name.clear();
                          number.clear();
                        }
                      },
                      child: const Text(
                        "Add",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                            color: Colors.black),
                      ),
                      style: ButtonStyle(
                        padding:
                            const MaterialStatePropertyAll(EdgeInsets.all(12)),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
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
                    onClick: () => onDeleteClick(i),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }

  onDeleteClick(int index) {
    setState(() {
      items.removeAt(index);
      counter--;
    });
    name.clear();
    number.clear();
  }
}
