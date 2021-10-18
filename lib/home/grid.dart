import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Needs extends StatefulWidget {
  @override
  _NeedsState createState() => _NeedsState();
}

class AddIcons {
  String? name;
  String? icon;

  AddIcons({this.name, this.icon});
}

class _NeedsState extends State<Needs> {
  int selected = -1;
  List<AddIcons> listIcons = [
    AddIcons(
        name: "Diagnostic", icon: "assets\ambulance-transport-svgrepo-com.svg"),
    AddIcons(name: "Consulatoin", icon: "assets\icons\nurse.svg"),
    AddIcons(name: "Nurse", icon: "assets\icons\nurse.svg"),
    AddIcons(name: "Ambulance", icon: "assets\icons\nurse.svg"),
    AddIcons(name: "Lab Work", icon: "assets\icons\nurse.svg"),
    AddIcons(name: "Medicine", icon: "assets\icons\nurse.svg"),
  ];

  @override
  Widget build(BuildContext context) {
    var textColor = Color.fromRGBO(80, 76, 76, 1);

    return Expanded(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: Align(
            heightFactor: 0.1,
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(""),
                Text(
                  "What do you need?",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: textColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 100.0,
            child: GridView.count(
              crossAxisCount: 3,
              mainAxisSpacing: 1.0,
              crossAxisSpacing: 1.0,
              children: List.generate(6, (index) {
                AddIcons list = listIcons[index];

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      // ontap of each card, set the defined int to the grid view index
                      selected = index;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.all(9.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                        color: selected == index
                            ? Color.fromRGBO(202, 73, 229, 1)
                            : Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset(0, 2),
                          )
                        ]),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(18.0),
                            child: SvgPicture.asset(
                              list.icon.toString(),
                              placeholderBuilder: (context) =>
                                  CircularProgressIndicator(),
                              height: 128.0,
                            ),
                          ),
                          Text(
                            list.name.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16.0,
                              color:
                                  selected == index ? Colors.white : textColor,
                            ),
                          ),
                        ]),
                  ),
                );
              }),
            ),
          ),
        ),
      ]),
    );
  }
}
