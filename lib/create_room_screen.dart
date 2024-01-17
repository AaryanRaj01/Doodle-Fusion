import 'package:flutter/material.dart';
import 'package:mutliplayer_game/paint_screen.dart';
import 'package:mutliplayer_game/widget/custom_text_widget.dart';

class CreateRoomScreen extends StatefulWidget {
  const CreateRoomScreen({super.key});

  @override
  State<CreateRoomScreen> createState() => _CreateRoomScreenState();
}

class _CreateRoomScreenState extends State<CreateRoomScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _roomNameController = TextEditingController();
  late String? _maxRooundValues;
  late String? _roomSizedValues;

  void createRoom() {
    //validation check
    //name controller is the name i provide
    if (_nameController.text.isNotEmpty &&
        _roomNameController.text.isNotEmpty &&
        _maxRooundValues != null &&
        _roomSizedValues != null) {
      //pushing the data into paintscreen
      Map<String,String> data = {
        "nickname": _nameController.text,
        "name": _roomNameController.text,
        "occupancy": _maxRooundValues!,
        "maxRounds": _roomSizedValues!
      };
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => PaintScreen(data: data ,screenFrom : 'createRoom')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Create Room",
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.08),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomTextField(
              controller: _nameController,
              hintText: "Enter your name",
            ),
          ),
          SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomTextField(
              controller: _roomNameController,
              hintText: "Enter Room Name",
            ),
          ),
          SizedBox(height: 20),
          DropdownButton<String>(
            focusColor: Color(0xffF5F6FA),
            items: <String>["2", "3", "10", "15"]
                .map<DropdownMenuItem<String>>(
                    (String value) => DropdownMenuItem(
                          value: value,
                          child: Text(
                            value,
                            style: const TextStyle(color: Colors.black),
                          ),
                        ))
                .toList(),
            hint: const Text(
              'Select Max Rounds',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            onChanged: (String? value) {
              setState(() {
                _maxRooundValues = value;
              });
            },
          ),
          const SizedBox(
            height: 20,
          ),
          DropdownButton<String>(
            focusColor: Color(0xffF5F6FA),
            items: <String>[
              "2",
              "3",
              "4",
              "5",
              "6",
              "7",
            ]
                .map<DropdownMenuItem<String>>(
                    (String value) => DropdownMenuItem(
                          value: value,
                          child: Text(
                            value,
                            style: const TextStyle(color: Colors.black),
                          ),
                        ))
                .toList(),
            hint: const Text(
              'Select Room Size',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            onChanged: (String? value) {
              setState(() {
                _roomSizedValues = value;
              });
            },
          ),
          const SizedBox(
            height: 40,
          ),
          ElevatedButton(
              onPressed: createRoom,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
                textStyle:
                    MaterialStateProperty.all(TextStyle(color: Colors.white)),
                minimumSize: MaterialStateProperty.all(
                    Size(MediaQuery.of(context).size.width / 2.5, 50)),
              ),
              child: const Text(
                "Create",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ))
        ],
      ),
    );
  }
}
