import 'package:cinepolis_app/widgets/bottom_nav.dart';
import 'package:cinepolis_app/widgets/carousel.dart';
import 'package:cinepolis_app/widgets/custom_list_view.dart';
import 'package:cinepolis_app/widgets/location_widget.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<String> imgLanskap = [
    'assets/img/petak_umpet_lanskap.jpg',
    'assets/img/bila_esok_lanskap.jpg',
    'assets/img/cinta_ikhlas_lanskap.jpg',
  ];
  List<String> imgPotrait = [
    'assets/img/wicked_potrait.jpg',
    'assets/img/nct_potrait.jpg',
    'assets/img/guna_potrait.jpg',
    'assets/img/heretic_potrait.jpg',

  ];
  List<String> upcomingPotrait = [
    'assets/img/mufasa_potrait.jpeg',
    'assets/img/sonic_potrait.jpeg',
    'assets/img/avatar_potrait.jpeg',
  ];
  List<String> imgPromo = [
    'assets/img/promo_allobank.jpg',
    'assets/img/promo_qris.jpg',
    'assets/img/promo_malam.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(left: 15,right: 15,top: 0,bottom: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LocationWidget(),
                    Row(
                      children: [
                        Icon(Icons.favorite_border_outlined,color: Colors.grey.shade800),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.notifications,color: Colors.grey.shade800),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.grey.shade800
                          ),
                          child: Icon(Icons.person,color: Colors.white,))
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Text('Hello,',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 21),),
                    SizedBox(width: 5,),
                    Text('Ryan',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 21))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                child: Row(
                  children: [
                    Text('Kamu mau nonton apa hari ini?',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16))
                  ],
                ),
              ),
               Container(
                child: CustomListView(
                  itemCount: imgLanskap.length,
                  itemWidth: MediaQuery.of(context).size.width * 0.9,
                  itemHeight: MediaQuery.of(context).size.height * 0.254,
                  scrollDirection: Axis.horizontal,
                  itemShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  itemBuilder: (context, index) {
                    return Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              imgLanskap[index],
                              fit: BoxFit.cover,
                              height: 180,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => Container(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15,right: 15,top: 5,bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Now Showing',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 21,color: Theme.of(context).primaryColor)),
                    Text('See All',style: TextStyle(fontWeight: FontWeight.normal,color: Theme.of(context).primaryColor))
                  ],
                ),
              ),
              CarouselDemo(imageList: imgPotrait,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Upcoming',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 21,color: Theme.of(context).primaryColor)),
                    Text('See All',style: TextStyle(fontWeight: FontWeight.normal,color: Theme.of(context).primaryColor))
                  ],
                ),
              ),
              Container(
                child: CustomListView(
                  itemCount: upcomingPotrait.length,
                  itemWidth: MediaQuery.of(context).size.width * 0.45,
                  itemHeight: MediaQuery.of(context).size.height * 0.3,
                  scrollDirection: Axis.horizontal,
                  itemShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  itemBuilder: (context, index) {
                    return Container(
                      width: MediaQuery.of(context).size.width * 0.45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              upcomingPotrait[index],
                              fit: BoxFit.cover,
                              height: 240,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => Container(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Promotion',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 21,color: Theme.of(context).primaryColor)),
                    Text('See All',style: TextStyle(fontWeight: FontWeight.normal,color: Theme.of(context).primaryColor))
                  ],
                ),
              ),
              Container(
                child: CustomListView(
                  itemCount: imgPromo.length,
                  itemWidth: MediaQuery.of(context).size.width * 0.9,
                  itemHeight: MediaQuery.of(context).size.height * 0.254,
                  scrollDirection: Axis.horizontal,
                  itemShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  itemBuilder: (context, index) {
                    return Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              imgPromo[index],
                              fit: BoxFit.cover,
                               width: MediaQuery.of(context).size.width * 0.9,
                              height: 180,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => Container(),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNav(page: 0),
      ),
    );
  }
}
