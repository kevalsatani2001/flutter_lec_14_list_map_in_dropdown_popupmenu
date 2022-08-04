import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ListMap extends StatefulWidget {
  const ListMap({Key? key}) : super(key: key);

  @override
  State<ListMap> createState() => _ListMapState();
}

class _ListMapState extends State<ListMap> {
  var _gender = 1;
  var roll;

  List<Map<String, dynamic>> users = [
    {'roll': 1, 'name': "Rohan"},
    {'roll': 2, 'name': "Raju"},
    {'roll': 3, 'name': "Pinku"}
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        title: const Center(child: Text("Silection")),
        actions: [
          Column(
            children: [
              PopupMenuButton(
                  child: const Icon(Icons.more_vert_rounded),
                  onSelected: (v) {
                    print(v);
                    Switch(v) {}
                  },
                  itemBuilder: (context) => users
                      .map((item) => PopupMenuItem(
                            value: item['roll'],
                            child: Text(item['name']),
                          ))
                      .toList()),
            ],
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 10),
            DropdownButton(
              value: roll,
              items: users
                  .map(
                    (usr) => DropdownMenuItem(
                      child: Text("${usr['name']}"),
                      value: usr['roll'],
                    ),
                  )
                  .toList(),
              onChanged: (v) {
                setState(() {
                  roll = v!;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
