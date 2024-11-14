import 'package:car_order/brand_colors.dart';
import 'package:car_order/dataprovider/appdata.dart';
import 'package:car_order/globalvariable.dart';
import 'package:car_order/helper/request_helper.dart';
import 'package:car_order/models/prediction.dart';
import 'package:car_order/widget/brand_devider.dart';
import 'package:car_order/widget/prediction_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController pickupController = TextEditingController();
  final TextEditingController destinationController = TextEditingController();

  var focuseDestination = FocusNode();

  bool focused = false;

  void setFocuse() {
    if (!focused) {
      FocusScope.of(context).requestFocus(focuseDestination);
      focused = true;
    }
  }

  List<Feature> destinationPredictionList = [];
  void searchPlace(String placeName) async {
    if (placeName.length > 2) {
      String url =
          'https://api.geoapify.com/v1/geocode/autocomplete?text=${placeName}&apiKey=$autocompleteKey';
      var res = await RequestHelper.getRequest(url);
      if (res == 'Error') {
        return;
      }

      var prediction = Prediction.fromJson(res);

      setState(() {
        destinationPredictionList = prediction.features!.toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    setFocuse();
    String address =
        Provider.of<AppData>(context).pickupAddress!.placeName.toString();
    pickupController.text = address;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Set Destination'),
        centerTitle: true,
      ),
      body: ListView(
        children: [Column(
          children: [
            Container(
              height: 160,
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5.0,
                    spreadRadius: 0.5,
                    offset: Offset(0.7, 0.7))
              ]),
              child: Padding(
                padding:
                    EdgeInsets.only(left: 24, right: 24, bottom: 20, top: 10),
                child: Column(
                  children: [
                    SizedBox(
                      height: 18,
                      width: double.infinity,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'images/pickicon.png',
                          height: 16,
                          width: 16,
                        ),
                        SizedBox(
                          width: 18,
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                color: BrandColors.colorLightGrayFair,
                                borderRadius: BorderRadius.circular(4)),
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: TextField(
                                controller: pickupController,
                                decoration: InputDecoration(
                                    hintText: 'Pickup location',
                                    fillColor: BrandColors.colorLightGrayFair,
                                    filled: true,
                                    border: InputBorder.none,
                                    isDense: true,
                                    contentPadding: EdgeInsets.only(
                                        left: 10, top: 8, bottom: 8)),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'images/desticon.png',
                          height: 16,
                          width: 16,
                        ),
                        SizedBox(
                          width: 18,
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                color: BrandColors.colorLightGrayFair,
                                borderRadius: BorderRadius.circular(4)),
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: TextField(
                                onChanged: (value) {
                                  searchPlace(value);
                                },
                                focusNode: focuseDestination,
                                controller: destinationController,
                                decoration: InputDecoration(
                                    hintText: 'Where to?',
                                    fillColor: BrandColors.colorLightGrayFair,
                                    filled: true,
                                    border: InputBorder.none,
                                    isDense: true,
                                    contentPadding: EdgeInsets.only(
                                        left: 10, top: 8, bottom: 8)),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            
        
            (destinationPredictionList.isNotEmpty)?
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 16),
              child: ListView.separated(
                padding: const EdgeInsets.all(0),
                itemBuilder: (context,index){
                  var val = destinationPredictionList[index];
                   return PredictionTile(
                        maintext: val.properties!.addressLine1.toString(),
                        secondaryText: val.properties!.addressLine2.toString(),
                        palceId: val.properties!.placeId.toString(),
                      );
                },
                separatorBuilder: (BuildContext context,int index) => BrandDevider() ,
                itemCount: destinationPredictionList.length,
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                ),
            )
              :
              Container()
            
        
        
          ],
        ),
      ]),
    );
  }
}
