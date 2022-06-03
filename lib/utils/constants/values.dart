import 'package:travel_app/utils/constants/images.dart';

String handleIataCodes(String cityName) {
  switch (cityName) {
    case 'Paris':
      return 'PAR';
    case 'Nice':
      return 'NCE';
    case 'Rome':
      return 'ROM';
    case 'Tunis':
      return 'TUN';
    case 'Amsterdam':
      return 'AMS';
    case 'Madrid':
      return 'MAD';
    case 'Bucharest':
      return 'BUH';
    case 'Barcelona':
      return 'BCN';
    case 'Athens':
      return 'ATH';
    case 'Porto':
      return 'OPO';
    case 'Berlin':
      return 'BER';
    case 'Naples':
      return 'NAP';
    case 'Milan':
      return 'MXP';
    case 'Venice':
      return 'VCE';
    case 'Prague':
      return 'PRG';
    case 'Budapest':
      return 'BUD';
    case 'Sofia':
      return 'SOF';
    case 'Istanbul':
      return 'IST';
    case 'Dubai':
      return 'DXB';
    case 'Ankara':
      return 'ESB';
    case 'Konya':
      return 'KYA';
    default:
      return "BER";
  }
}

String returnIcon(String cityName) {
  switch (cityName) {
    case 'Paris':
      return kParisImage;
    case 'Rome':
      return kRomeImage;
    case 'Tunis':
      return kTunisImage;
    case 'Amsterdam':
      return kAmsterdamImage;
    case 'Madrid':
      return kMadridImage;
    case 'Bucharest':
      return kBucharestImage;
    case 'Barcelona':
      return kBarcelonaImage;
    case 'Athens':
      return kAthensImage;
    case 'Porto':
      return kPortoImage;
    case 'Berlin':
      return kBerlinImage;
    case 'Milan':
      return kMilanImage;
    case 'Venice':
      return kVeniceImage;
    case 'Prague':
      return kPragueImage;
    case 'Sofia':
      return kSofiaImage;
    case 'Istanbul':
      return kIstanbulImage;
    case 'Dubai':
      return kDubaiImage;
    default:
      return kCityWidgetImage;
  }
}
