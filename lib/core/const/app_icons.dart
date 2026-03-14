import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

abstract class AppIcons {
  static const String _basePath = 'assets/icons';

  static const String banner = '$_basePath/banner.svg';
  static const String comment = '$_basePath/comment.svg';
  static const String homeFilled = '$_basePath/home_filled.svg';
  static const String like = '$_basePath/like.svg';
  static const String likeFilled = '$_basePath/like_filled.svg';
  static const String profile = '$_basePath/profile.svg';
  static const String reel = '$_basePath/reel.svg';
  static const String save = '$_basePath/save.svg';

  static const String search = '$_basePath/search.svg';
  static const String share = '$_basePath/share.svg';
  static const String chevron = '$_basePath/chevron.svg';

  static Widget svg(String asset, {double size = 24, Color? color}) {
    return SvgPicture.asset(
      asset,
      width: size,
      height: size,
      colorFilter: color != null
          ? ColorFilter.mode(color, BlendMode.srcIn)
          : null,
    );
  }
}
