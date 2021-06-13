import 'package:flutter/material.dart';
import 'package:flutter_social_login/exports.dart';

enum AuthType {
  kakao,
  facebook,
  naver,
}

extension AuthTypeExtension on AuthType {
  String get loginMessage {
    switch (this) {
      case AuthType.kakao:
        return S.current.loginKakao;
      case AuthType.facebook:
        return S.current.loginFacebook;
      case AuthType.naver:
        return S.current.loginNaver;
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
      case AuthType.naver:
        return Palettes.naverLoginMessageColor;
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
      case AuthType.naver:
        return Palettes.naverBrandColor;
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
      case AuthType.naver:
        return Assets.naverIcon;
      default:
        throw UnsupportedError('Invalid auth type.');
    }
  }
}
