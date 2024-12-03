import 'package:cinepolis_app/widgets/bottom_nav.dart';
import 'package:flutter/material.dart';

class MybookingScreen extends StatefulWidget {
  const MybookingScreen({super.key});

  @override
  State<MybookingScreen> createState() => _MybookingScreenState();
}

class _MybookingScreenState extends State<MybookingScreen> {
  final Map<String, Object> booking = {
    'Item 1': {
      'judul': 'GLADIATOR II',
      'genre': 'Action, Adventure',
      'rating': '9.5',
      'usia': 'D17+',
      'img': 'assets/img/gladiator_potrait.jpg'
    },
    'Item 2': {
      'judul': 'Wicked',
      'genre': 'Fantasi',
      'rating': '9.3',
      'usia': 'R13+',
      'img': 'assets/img/wicked_potrait.jpg'
    },
    'Item 3': {
      'judul': 'Moana 2',
      'genre': 'Animation',
      'rating': '9.1',
      'usia': 'SU',
      'img': 'assets/img/moana_potrait.jpg'
    },
  };
  @override
  Widget build(BuildContext context) {
    final List<String> keys = booking.keys.toList();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'My Booking',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "There's no active booking!",
                style: TextStyle(fontSize: 14),
              )
            ],
          ),
          actions: [
            Icon(
              Icons.timer_outlined,
              size: 28,
            ),
            SizedBox(
              width: 12,
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: ListView.builder(
            itemCount: keys.length, // Total item dalam Map
            itemBuilder: (context, index) {
              final String key = keys[index];
              final Map<String, Object> value =
                  booking[key] as Map<String, Object>;
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 3,
                        spreadRadius: 0,
                        offset: Offset(0, 0),
                      ),
                    ]),
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius:
                          BorderRadius.horizontal(left: Radius.circular(15)),
                      child: Image.asset(
                        value['img'].toString(),
                        fit: BoxFit.cover,
                        width: 100,
                        height: 120,
                      ),
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          value['judul'].toString(),style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 2, horizontal: 4),
                              decoration:
                                  BoxDecoration(color:index == 0 ? Colors.red.shade50 :index == 1 ? Colors.grey.shade100 : Colors.green.shade50),
                              child: Text(value['usia'].toString(),style: TextStyle(color: index == 0 ? Colors.red : index == 1 ? Colors.black : Colors.green),),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(value['genre'].toString(),style: TextStyle(color: Colors.grey),)
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 18,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 18,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 18,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 18,
                            ),
                            Icon(
                              Icons.star_half,
                              color: Colors.amber,
                              size: 18,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              value['rating'].toString(),
                              style: TextStyle(color: Colors.amber),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        ),
        bottomNavigationBar: BottomNav(page: 1),
      ),
    );
  }
}
