import 'package:cinepolis_app/widgets/bottom_nav.dart';
import 'package:cinepolis_app/widgets/location_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CinemaScreen extends StatefulWidget {
  const CinemaScreen({super.key});

  @override
  State<CinemaScreen> createState() => _CinemaScreenState();
}

class _CinemaScreenState extends State<CinemaScreen>
    with SingleTickerProviderStateMixin {
  TextEditingController _searchController = TextEditingController();
  late TabController _tabController;

  final _tabs = [
    Tab(text: 'Movie'),
    Tab(text: 'Cinema'),
  ];

  final Map<String, Object> movie = {
    'Item 1': {
      'judul': 'GLADIATOR II',
      'genre': 'Action, Adventure',
      'rating': '9.5',
      'usia': 'D17+',
      'img': 'assets/img/gladiator_potrait.jpg',
    },
    'Item 2': {
      'judul': 'Wicked',
      'genre': 'Fantasi',
      'rating': '9.3',
      'usia': 'R13+',
      'img': 'assets/img/wicked_potrait.jpg',
    },
    'Item 3': {
      'judul': 'Moana 2',
      'genre': 'Animation',
      'rating': '9.1',
      'usia': 'SU',
      'img': 'assets/img/moana_potrait.jpg',
    },
  };

  final Map<String, Object> cinema = {
    'Item 1': {
      'nama': 'Malang Town Square',
      'jarak': '8.03 km',
      'tipe': 'Regular Luxe'
    },
    'Item 2': {
      'nama': 'Lippo Plaza Batu',
      'jarak': '11.23 km',
      'tipe': 'Regular'
    },
    'Item 3': {'nama': 'Araya Mall', 'jarak': '5.03 km', 'tipe': 'Premium'},
  };

  @override
  void initState() {
    _tabController =
        TabController(length: _tabs.length, vsync: this, initialIndex: 1);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> keys = movie.keys.toList();
    final List<String> keysc = cinema.keys.toList();
    final _selectedColor = Colors.blue;
    final _unselectedColor = Colors.blue.shade200;

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(120),
          child: Padding(
            padding: const EdgeInsets.symmetric( horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LocationWidget(),
                SizedBox(height: 10),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .9,
                  child: TextFormField(
                    controller: _searchController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.secondary,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.shade300,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: 'Cinema / Movie',
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey.shade300,
                      ),
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            TabBar(
              padding: EdgeInsets.symmetric(horizontal: 20),
              controller: _tabController,
              tabs: _tabs,
              labelColor: _selectedColor,
              indicatorColor: _selectedColor,
              unselectedLabelColor: _unselectedColor,
              indicatorSize: TabBarIndicatorSize.tab,
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  // Tab 1: Movie GridView
                  GridView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      childAspectRatio: 7 / 16,
                    ),
                    itemCount: keys.length,
                    itemBuilder: (context, index) {
                      final String key = keys[index];
                      final Map<String, Object> value =
                          movie[key] as Map<String, Object>;
                      return Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              child: Image.asset(
                                value['img'].toString(),
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    value['judul'].toString().toUpperCase(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    value['usia'].toString(),
                                    style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 12,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                Theme.of(context).primaryColor,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10))),
                                        onPressed: () {},
                                        child: Text(
                                          'Buy Now',
                                          style: TextStyle(color: Colors.white),
                                        )),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  // Tab 2: Cinema Placeholder
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.separated(
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) {
                                final String key = keysc[index];
                                final Map<String, Object> value =
                                    cinema[key] as Map<String, Object>;
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
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 5),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        value['nama'].toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.location_on_outlined,
                                            size: 16,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                              value['jarak'].toString() + ' away')
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          FaIcon(
                                            FontAwesomeIcons.film,
                                            size: 16,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(value['tipe']
                                              .toString()
                                              .toUpperCase())
                                        ],
                                      )
                                    ],
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) =>
                                  Divider(height: 10),
                              itemCount: cinema.length),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNav(page: 3),
      ),
    );
  }
}
