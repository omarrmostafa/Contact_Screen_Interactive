import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> addedElements = [];

  String name = "";
  String number = "";

  void addToContainer() {
    setState(() {
      if (name != "" && number != "") {
        addedElements.add("    $name   \n    $number");
        name = "";
        number = "";
        FocusScope.of(context).unfocus();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts Screen"),
      ),
      body: Container(
        color: Colors.blueGrey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 5, left: 5, top: 30),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  suffixIcon: Icon(
                    Icons.create,
                    color: Colors.cyan,
                  ),
                  hintText: "Enter your Name Here",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.transparent, width: 2),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 5, left: 5, top: 30),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    number = value;
                  });
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  suffixIcon: Icon(
                    Icons.call,
                    color: Colors.cyan,
                  ),
                  hintText: "Enter your Number Here",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.transparent, width: 2),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 44,
                      child: ElevatedButton(
                        onPressed: () {
                          addToContainer();
                        },
                        child: Text("Add"),
                        style: ElevatedButton.styleFrom(
                          elevation: 7,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      height: 44,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            if (addedElements.isNotEmpty) {
                              addedElements.removeLast();
                            }
                          });
                        },
                        child: Text("Delete"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          elevation: 7,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(15)),
                  child: ListView.builder(
                    itemCount: addedElements.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Container(
                              height: 70,
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text(addedElements[index])),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
