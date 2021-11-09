import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shopsy/components/category_widget.dart';
import 'package:shopsy/components/custom_action_bar.dart';
import 'package:shopsy/components/custom_type.dart';
import 'package:shopsy/model/user_model.dart';
import 'package:shopsy/screens/bestsellers.dart';
import 'package:shopsy/screens/chatbot.dart';
import 'package:shopsy/screens/crime.dart';
import 'package:shopsy/screens/fictional.dart';
import 'package:shopsy/screens/historical.dart';
import 'package:shopsy/screens/mythological.dart';
import 'package:shopsy/screens/popular_authors.dart';
import 'package:shopsy/screens/romantic.dart';

class HomeS extends StatefulWidget {
  CollectionReference _productRef =
      FirebaseFirestore.instance.collection("Products");

  HomeS({Key? key}) : super(key: key);

  @override
  State<HomeS> createState() => _HomeSState();
}

class _HomeSState extends State<HomeS> {
  int? selectedTab;
  Widget? myWidget;

  @override
  void initState() {
    selectedTab = 0;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.only(
              top: 170.0,
              bottom: 20.0,
              left: 20.0,
            ),
            children: [
              Container(
                child: Text(
                  'Romantic',
                  style: TextStyle(
                    fontSize: 19.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              CategoryWidget(
                categoryRef: 'Romantic',
              ),
              Container(
                child: Text(
                  'Crime',
                  style: TextStyle(
                    fontSize: 19.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              CategoryWidget(
                categoryRef: 'Crime',
              )
            ],
          ),
          Positioned(
            // left: MediaQuery.of(context).size.width - 60.0,
            bottom: 20.0,
            right: 20.0,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatBot(),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                height: 60.0,
                width: 60.0,
                child: Icon(
                  Icons.message,
                  size: 28.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Column(
            children: [
              Container(
                color: Colors.white,
                child: CustomActionBar(
                  hasBackArrow: false,
                  hasBackGround: true,
                  hasEditAction: false,
                  hasSave: false,
                  isLoading: false,
                  hasCart: true,
                  title: "Home",
                  hasTitle: true,
                  hasBackBtnAction: false,
                ),
              ),
              CustomType(
                onPressed: (value) {
                  setState(() {
                    selectedTab = value;
                  });
                  print("home page selected tab ${selectedTab}");
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
