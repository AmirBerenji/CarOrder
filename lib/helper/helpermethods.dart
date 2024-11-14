import 'package:car_order/dataprovider/appdata.dart';
import 'package:car_order/globalvariable.dart';
import 'package:car_order/helper/request_helper.dart';
import 'package:car_order/models/address.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

class HelperMethods {
  static Future<String> findCordinateAddress(Position position,context) async {
    String palceAddress = '';

    String url =
        'https://geocode.maps.co/reverse?lat=${position.latitude}&lon=${position.longitude}&api_key=$addressKey';


    var res = await RequestHelper.getRequest(url);

    if(res != 'Error')
    {
      palceAddress =  res['display_name'].toString();

      Address pickupAddress = new Address(
        placeName: res['display_name'].toString(), 
        latitude: position.latitude, 
        longitude: position.longitude, 
        placeId: res['place_id'].toString(), 
        placeFormattedAddress: res['display_name'].toString(), ); 

        Provider.of<AppData>(context,listen: false).updatePickupAddress(pickupAddress);
    }


    return palceAddress;
  }
}
