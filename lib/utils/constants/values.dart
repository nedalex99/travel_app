
String handleIataCodes(String cityName){
  switch(cityName){
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
    default:
      return "BER";
  }
}