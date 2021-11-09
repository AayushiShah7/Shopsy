import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shopsy/screens/product_page.dart';

class CategoryWidget extends StatefulWidget {
  String categoryRef;
  CollectionReference<Map<String, dynamic>> _productRef =
      FirebaseFirestore.instance.collection('Products');
  CategoryWidget({Key? key, required this.categoryRef}) : super(key: key);

  @override
  _CategoryWidgetState createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
        future: widget._productRef
            .doc('Categories')
            .collection(widget.categoryRef)
            .get(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error : ${snapshot.error}'),
            );
          }

          if (snapshot.connectionState == ConnectionState.done) {
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  children: snapshot.data!.docs.map((document) {
                Map<String, dynamic> data = document.data();

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProductPage(
                                  productid: document.id,
                                  categoryRef: widget.categoryRef,
                                )));
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      top: 15.0,
                      right: 20.0,
                      bottom: 15.0,
                    ),
                    height: 180.0,
                    width: 250.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Image.network(
                            data['images'][0],
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          right: 0,
                          child: Container(
                            width: 220.0,
                            height: 180.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              gradient: LinearGradient(
                                colors: [
                                  Colors.white,
                                  Colors.white.withOpacity(0.5),
                                  Colors.white.withOpacity(0),
                                ],
                                begin: Alignment.centerRight,
                                end: Alignment.centerLeft,
                              ),
                            ),
                            child: Container(
                              padding: EdgeInsets.only(
                                left: 100.0,
                                top: 20.0,
                              ),
                              width: 50,
                              // height: 50,
                              // color: Colors.red,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                      top: 10.0,
                                    ),
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      data['name'],
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                      top: 10.0,
                                    ),
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      data['author'],
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black.withOpacity(0.6),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                      top: 10.0,
                                    ),
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Rs. ${data['price']}",
                                      style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList()),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
