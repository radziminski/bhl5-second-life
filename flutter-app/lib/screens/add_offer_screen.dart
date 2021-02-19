import 'package:SecondLife/locator.dart';
import 'package:SecondLife/state/location_model.dart';
import 'package:SecondLife/state/offers_model.dart';
import 'package:SecondLife/state/auth_model.dart';
import 'package:SecondLife/widgets/BigButton.dart';
import 'package:SecondLife/widgets/DefaultAppBar.dart';
import 'package:SecondLife/widgets/DefaultBottomNavBar.dart';
import 'package:SecondLife/widgets/TextInput.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import 'package:multi_image_picker/multi_image_picker.dart';

const kPriceValues = [
  'super cheap',
  'cheap',
  'custom',
  'expensive',
  'super expensive'
];

const kCatValues = [
  'sport',
  'electronics',
  'furnitures',
  'toys',
  'other',
];

class AddOfferScreen extends StatefulWidget {
  @override
  _AddOfferScreenState createState() => _AddOfferScreenState();
}

class _AddOfferScreenState extends State<AddOfferScreen> {
  final OffersModel offersModel = locator<OffersModel>();
  final AuthModel authModel = locator<AuthModel>();
  final LocationModel locationModel = locator<LocationModel>();

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  String selectedPriceCat = kPriceValues[0];
  String selectedTypeCat = kCatValues[0];
  List<Asset> images = List<Asset>();

  Future onSend() async {
    final location = await locationModel.getLocation();
    if (location == null) {
      location['longitude'] = 0;
      location['latitude'] = 0;
    }
    await offersModel.createOffer(
      title: titleController.text,
      description: descriptionController.text,
      owner: authModel.username,
      longitude: location['longitude'],
      latitude: location['latitude'],
      imageUrls: [],
      priceCategory: kPriceValues.indexOf(selectedPriceCat),
      itemCategories: [kPriceValues.indexOf(selectedPriceCat)],
    );
  }

  Future<void> getImages() async {
    setState(() {
      images = List<Asset>();
    });

    List<Asset> resultList;

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 300,
      );
    } on Exception catch (e) {}

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      images = resultList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildDefaultAppBar(context, 'Add New Offer'),
      bottomNavigationBar: buildDefaultBottomNavBar(context, 1),
      body: SafeArea(
        child: Center(
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.82,
            child: ListView(
              children: [
                SizedBox(height: 10),
                TextInput(titleController, 'Offer Title'),
                SizedBox(height: 30),
                TextInput(descriptionController, 'Offer Description'),
                SizedBox(height: 50),
                Container(
                  width: MediaQuery.of(context).size.width * 0.82,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              'Price category',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(height: 10),
                          DropdownButton<String>(
                            value: selectedPriceCat,
                            icon: Icon(Icons.arrow_downward),
                            iconSize: 24,
                            elevation: 0,
                            style: GoogleFonts.poppins(color: Colors.white),
                            underline: Container(
                              height: 0,
                              color: Colors.white,
                            ),
                            onChanged: (String newValue) {
                              setState(() {
                                selectedPriceCat = newValue;
                              });
                            },
                            items: kPriceValues
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            child: Text(
                              'Item category',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(height: 10),
                          DropdownButton<String>(
                            value: selectedTypeCat,
                            icon: Icon(Icons.arrow_downward),
                            iconSize: 24,
                            elevation: 0,
                            style: GoogleFonts.poppins(color: Colors.white),
                            underline: Container(
                              height: 0,
                              color: Colors.white,
                            ),
                            onChanged: (String newValue) {
                              setState(() {
                                selectedTypeCat = newValue;
                                print(newValue);
                              });
                            },
                            items: kCatValues
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40),
                Container(
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          'Upload Images:',
                          style: GoogleFonts.poppins(color: Colors.white),
                        ),
                        IconButton(
                          onPressed: () {
                            getImages();
                          },
                          icon: Icon(
                            Icons.upload_file,
                            color: Colors.white,
                            size: 34,
                          ),
                        ),
                        Text(
                          images == null || images.isEmpty
                              ? ''
                              : 'Selected ${images.length} image${images.length == 1 ? '' : 's'}.',
                          style: GoogleFonts.poppins(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(height: 70),
                BigButton('Send!', onSend),
                SizedBox(height: 20)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
