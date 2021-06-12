import 'package:flutter/material.dart';
import 'package:flutter_social_login/exports.dart';

enum AuthType {
  kakao,
  facebook,
}

extension AuthTypeExtension on AuthType {
  String get loginMessage {
    switch (this) {
      case AuthType.kakao:
        return S.current.loginKakao;
      case AuthType.facebook:
        return S.current.loginFacebook;
      default:
        throw UnsupportedError('Invalid auth type.');
    }
  }

  Color get loginMessageColor {
    switch (this) {
      case AuthType.kakao:
        return Palettes.kakaoLoginMessageColor;
      case AuthType.facebook:
        return Palettes.facebookLoginMessageColor;
      default:
        throw UnsupportedError('Invalid auth type.');
    }
  }

  Color get brandColor {
    switch (this) {
      case AuthType.kakao:
        return Palettes.kakaoBrandColor;
      case AuthType.facebook:
        return Palettes.facebookBrandColor;
      default:
        throw UnsupportedError('Invalid auth type.');
    }
  }

  String get brandIcon {
    switch (this) {
      case AuthType.kakao:
        return Assets.kakaoIcon;
      case AuthType.facebook:
        return Assets.facebookIcon;
      default:
        throw UnsupportedError('Invalid auth type.');
    }
  }
}
