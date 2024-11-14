import 'package:car_order/models/address.dart';
import 'package:flutter/material.dart';

class AppData extends ChangeNotifier{
  Address? pickupAddress;

  void updatePickupAddress(Address pickup)
  {
    pickupAddress = pickup;
    notifyListeners();
  }
}