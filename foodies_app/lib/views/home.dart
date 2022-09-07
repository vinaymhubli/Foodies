import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodies_app/constant/colors.dart';
import 'package:foodies_app/models/hotel.dart';
import 'package:foodies_app/models/royalorchid.dart';
import 'package:foodies_app/models/trebotrend.dart';
import 'package:foodies_app/widget/widgets.dart';
import 'package:google_fonts/google_fonts.dart';



class FoodHome extends StatefulWidget {
late   final bool isLoading;

  @override
  State<FoodHome> createState() => _FoodHomeState();
}

class _FoodHomeState extends State<FoodHome> {
  final GlobalKey<ScaffoldState>_globalKey=GlobalKey<ScaffoldState>();
  DateTime press_back= DateTime.now();
 
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop:()async{
      final timeGap= DateTime.now().difference(press_back);
      final cantExist=timeGap>=Duration(seconds: 2);
      press_back=DateTime.now();
      if(cantExist){
      final snack=SnackBar(content: Text('Press Back Button To Exit'),
      duration: Duration(seconds: 2),
      );
      ScaffoldMessenger.of(context).showSnackBar(snack);
        return false;
      }else{
        return true;
      }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: Text("foodies",style: GoogleFonts.acme(color: Colors.black,fontSize: 50),),
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarIconBrightness: Brightness.dark),
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  color: Colors.grey,
                  size: 30,
                ))
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 17.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        " Grab Special !..",
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 10.0),
                      Container(
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25)),
                                color: greenBtn,
                              ),
                              child: Center(
                                  child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.shopping_basket_outlined,
                                      color: Colors.white, size: 20),
                                  Text(" CART",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300))
                                ],
                              )),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 15),
                  Text("Find Out What's New !...",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 25,
                          fontStyle: FontStyle.normal)),
                  SizedBox(height: 15),
                  SingleChildScrollView(
                    padding: EdgeInsets.only(bottom: 25),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width * 0.55,
                            height: 350,
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 40),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                color: Color.fromARGB(255, 18, 86, 143),
                                boxShadow: [
                                  BoxShadow(
                                      spreadRadius: 0,
                                      offset: Offset(0, 10),
                                      blurRadius: 0,
                                      color: Color.fromARGB(255, 18, 86, 143)
                                          .withOpacity(0.4))
                                ]),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/images/food1.png"))),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    " Snacks ",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.orange,
                                        size: 17,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.orange,
                                        size: 17,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.orange,
                                        size: 17,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.orange,
                                        size: 17,
                                      ),
                                      HalfFilledIcon(
                                          icon: Icons.star,
                                          size: 17,
                                          color: Colors.orange),
                                      Text(
                                        " 250 Ratings",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 10),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Enjoy highly pleasant to the taste",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 13),
                                  )
                                ])),
                        SizedBox(width: 10),
                        Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.35,
                              height: 165,
                              padding: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 20),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                  color: Color.fromARGB(255, 186, 52, 52),
                                  boxShadow: [
                                    BoxShadow(
                                        spreadRadius: 0,
                                        offset: Offset(0, 10),
                                        blurRadius: 0,
                                        color: black.withOpacity(0.4))
                                  ]),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/images/food2.png"))),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "Cheese Pizza",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.orange,
                                        size: 14,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.orange,
                                        size: 14,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.orange,
                                        size: 14,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.orange,
                                        size: 14,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.orange,
                                        size: 14,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Column(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.35,
                                  height: 165,
                                  padding: EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 20),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30)),
                                      color: Color.fromARGB(255, 197, 62, 62),
                                      boxShadow: [
                                        BoxShadow(
                                            spreadRadius: 0,
                                            offset: Offset(0, 10),
                                            blurRadius: 0,
                                            color: black.withOpacity(0.4))
                                      ]),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      "assets/images/food3.png"))),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        "Waldorf salad",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.orange,
                                            size: 14,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.orange,
                                            size: 14,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.orange,
                                            size: 14,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.orange,
                                            size: 14,
                                          ),
                                          HalfFilledIcon(
                                              icon: Icons.star_half,
                                              size: 14,
                                              color: Colors.orange),
                                          SizedBox(
                                            height: 10,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Places",
                        style:
                            TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          height: 0.5,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  placesWidget("hotel1", "The Leela Palace Bangalore",
                      "Enjoy a drink in our spacious lounge bar, is a truly enjoyable experience"),
                  SizedBox(
                    height: 20,
                  ),
                  placesWidget2("hotel2", "Treebo Trend  Near Lalbagh",
                      "eating occasion that takes place at a certain time and includes prepared food"),
                  SizedBox(
                    height: 20,
                  ),
                  placesWidget3("hotel3", "royal orchid Bengaluru",
                      "Hotel Royal Orchid, Bangalore thrives to make your stay the most comfortable one"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row placesWidget(String img, String name, String desc) {
    return Row(
      children: [
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
              image:
                  DecorationImage(image: AssetImage("assets/images/$img.png"))),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$name",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    size: 20,
                    color: Colors.orange,
                  ),
                  Icon(
                    Icons.star,
                    size: 20,
                    color: Colors.orange,
                  ),
                  Icon(
                    Icons.star,
                    size: 20,
                    color: Colors.orange,
                  ),
                  Icon(
                    Icons.star,
                    size: 20,
                    color: Colors.orange,
                  ),
                  Icon(
                    Icons.star,
                    size: 20,
                    color: Colors.orange,
                  ),
                ],
              ),
              Text(
                "$desc",
                style: TextStyle(fontSize: 12),
              )
            ],
          ),
        ),
        InkWell(
          onTap: openHotelPage,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(40)),
                color: greenBtn),
            child: Text(
              "Order Now",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w700),
            ),
          ),
        )
      ],
    );
  }

  Row placesWidget2(String img, String name, String desc) {
    return Row(
      children: [
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
              image:
                  DecorationImage(image: AssetImage("assets/images/$img.png"))),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$name",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    size: 20,
                    color: Colors.orange,
                  ),
                  Icon(
                    Icons.star,
                    size: 20,
                    color: Colors.orange,
                  ),
                  Icon(
                    Icons.star,
                    size: 20,
                    color: Colors.orange,
                  ),
                  Icon(
                    Icons.star,
                    size: 20,
                    color: Colors.orange,
                  ),
                  Icon(
                    Icons.star,
                    size: 20,
                    color: Colors.orange,
                  ),
                ],
              ),
              Text(
                "$desc",
                style: TextStyle(fontSize: 12),
              )
            ],
          ),
        ),
        InkWell(
          onTap: openTreboTrendPage,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(40)),
                color: greenBtn),
            child: Text(
              "Order Now",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w700),
            ),
          ),
        )
      ],
    );
  }

  Row placesWidget3(String img, String name, String desc) {
    return Row(
      children: [
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
              image:
                  DecorationImage(image: AssetImage("assets/images/$img.png"))),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$name",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    size: 20,
                    color: Colors.orange,
                  ),
                  Icon(
                    Icons.star,
                    size: 20,
                    color: Colors.orange,
                  ),
                  Icon(
                    Icons.star,
                    size: 20,
                    color: Colors.orange,
                  ),
                  Icon(
                    Icons.star,
                    size: 20,
                    color: Colors.orange,
                  ),
                  Icon(
                    Icons.star,
                    size: 20,
                    color: Colors.orange,
                  ),
                ],
              ),
              Text(
                "$desc",
                style: TextStyle(fontSize: 12),
              ),
              SizedBox(height: 20.0)
            ],
          ),
        ),
        InkWell(
          onTap: openRoyalOrchidPage,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(40)),
                color: greenBtn),
            child: Text(
              "Order Now",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w700),
            ),
          ),
        )
      ],
    );
  }

  void openHotelPage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HotelPage()));
  }

  void openTreboTrendPage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => TreboTrend()));
  }

  void openRoyalOrchidPage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => RoyalOrchid()));
  }

}