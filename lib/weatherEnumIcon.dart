

import 'package:flutter_svg/svg.dart';

import 'gen/assets/assets.gen.dart';



SvgPicture  IconName(int iconName,double heightIcon){
  switch(iconName){


    case 200:
    case 201:
    case 202:
    case 210:
    case 211:
    case 212:
    case 221:
    case 230:
    case 231:
    case 232:
      return Assets.icons.thunderstorm.svg(height: heightIcon);
      break;
    case 300:
    case 301:
    case 302:
    case 310:
    case 311:
    case 312:
    case 313:
    case 314:
    case 321:
      return  Assets.icons.rain.svg(height: heightIcon);
      break;
    case 500:
    case 501:
    case 502:
    case 503:
    case 504:
    case 511:
    case 520:
    case 521:
    case 522:
    case 531:
      return Assets.icons.rain.svg(height: heightIcon);
      break;
    case 600:
    case 601:
    case 602:
    case 611:
    case 612:
    case 613:
    case 615:
    case 616:
    case 620:
    case 621:
    case 622:
      return  Assets.icons.snow.svg(height: heightIcon);
      break;
    case 701:
    case 711:
    case 721:
    case 731:
    case 741:
    case 751:
    case 761:
    case 762:
    case 771:
    case 781:
      return Assets.icons.mist.svg(height: heightIcon);
      break;
    case 800:
      return   Assets.icons.sunny.svg(height: heightIcon);
      break;
    case 801:
      return Assets.icons.fewCloud.svg(height: heightIcon);
    case 802:
    case 803:
    return Assets.icons.mostlyClouds.svg(height: heightIcon);
    case 804:
      return  Assets.icons.cloudy.svg(height: heightIcon);
      break;
  }
  return  Assets.icons.cloudy.svg(height: heightIcon);
}
// enum IconName {
//
//   Thunderstorm,
//   Drizzle,
//   Rain,
//   Snow,
//
//   Mist,
//   Smoke,
//   Haze,
//   Dust,
//   Fog,
//   Sand,
//   Ash,
//   Squall,
//   Tornado,
//
//   Clear,
//   Clouds,
//
//
//
//
//
// }
// extension IconGet on IconName{
//   String get iconNameTitle{
//     switch(this){
//
//       case IconName.Thunderstorm:
//         return 'Thunderstorm';
//         break;
//       case IconName.Drizzle:
//         return 'Drizzle';
//         break;
//       case IconName.Rain:
//         return 'Rain';
//         break;
//       case IconName.Snow:
//         return 'Snow';
//         break;
//       case IconName.Mist:
//
//
//       case IconName.Smoke:
//
//       case IconName.Haze:
//
//       case IconName.Dust:
//
//       case IconName.Fog:
//
//       case IconName.Sand:
//
//       case IconName.Ash:
//
//       case IconName.Squall:
//
//       case IconName.Tornado:
//       return 'Mist';
//       case IconName.Clear:
//         return 'Clear';
//         break;
//       case IconName.Clouds:
//         return 'Clouds';
//         break;
//     }
//
//
//
//     }
//
//
//
//
//   SvgPicture  iconName(String iconName){
//    switch(this){
//
//
//      case IconName.Thunderstorm:
//       return Assets.icons.thunderstorm.svg(height: 50);
//        break;
//      case IconName.Drizzle:
//        return  Assets.icons.rain.svg(height: 50);
//        break;
//      case IconName.Rain:
//        return Assets.icons.rain.svg(height: 50);
//        break;
//      case IconName.Snow:
//        return  Assets.icons.snow.svg(height: 50);
//        break;
//      case IconName.Mist:
//
//      case IconName.Smoke:
//
//      case IconName.Haze:
//
//      case IconName.Dust:
//
//      case IconName.Fog:
//
//      case IconName.Sand:
//
//      case IconName.Ash:
//
//      case IconName.Squall:
//
//      case IconName.Tornado:
//      return Assets.icons.mist.svg(height: 50);
//      break;
//      case IconName.Clear:
//        return   Assets.icons.sunny.svg(height: 50);
//        break;
//      case IconName.Clouds:
//        return  Assets.icons.cloudy.svg(height: 50);
//        break;
//    }
//
//  }
// }