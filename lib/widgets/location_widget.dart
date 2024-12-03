import 'package:flutter/material.dart';

class LocationWidget extends StatefulWidget {
  const LocationWidget({super.key});

  @override
  State<LocationWidget> createState() => _LocationWidgetState();
}

class _LocationWidgetState extends State<LocationWidget> {
  String selectedValue = 'Malang';

  // Daftar pilihan untuk dropdown
  List<String> items = ['Malang', 'Surabaya', 'Bali', 'Makassar'];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            blurRadius: 3,
            spreadRadius: 0,
            color: Colors.grey,
            offset: Offset(0, 0)
          )
        ]
        ),
      child: DropdownButton<String>(
        underline: Container(
          height: 0,
          color: Colors.transparent,
        ),
        borderRadius: BorderRadius.circular(15),
        icon: Icon(Icons.arrow_drop_down,color: Colors.black,),
          value: selectedValue, // Menentukan nilai yang dipilih
          hint: Text(
              selectedValue), // Teks saat tidak ada pilihan yang dipilih
          onChanged: (String? newValue) {
            setState(() {
              selectedValue = newValue!; // Mengupdate nilai yang dipilih
            });
          },
          items: items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Row(children: [
                Icon(Icons.location_on),
                SizedBox(width: 10,),
                Text(value)
              ],),
            );
          }).toList()),
    );
  }
}
