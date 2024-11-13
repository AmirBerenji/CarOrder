import 'package:car_order/globalvariable.dart';
import 'package:car_order/helper/request_helper.dart';
import 'package:geolocator/geolocator.dart';

class HelperMethods {
  static Future<String> findCordinateAddress(Position position) async {
    String palceAddress = '';

    String url =
        'https://geocode.maps.co/reverse?lat=${position.latitude}&lon=${position.longitude}&api_key=$addressKey';


    var res = await RequestHelper.getRequest(url);

    if(res != 'Error')
    {
      palceAddress =  res['display_name'].toString();
    }


    return palceAddress;
  }
}
