import 'package:flutter/material.dart';
import 'package:flutter_social_login/exports.dart';

enum AuthType {
  kakao,
}

extension AuthTypeExtension on AuthType {
  String get loginMessage {
    switch (this) {
      case AuthType.kakao:
        return S.current.loginKakao;
      default:
        throw UnsupportedError('Invalid auth type.');
    }
  }

  Color get loginMessageColor {
    switch (this) {
      case AuthType.kakao:
        return Palettes.kakaoLoginMessageColor;
      default:
        throw UnsupportedError('Invalid auth type.');
    }
  }

  Color get brandColor {
    switch (this) {
      case AuthType.kakao:
        return Palettes.kakaoBrandColor;
      default:
        throw UnsupportedError('Invalid auth type.');
    }
  }

  String get brandIcon {
    switch (this) {
      case AuthType.kakao:
        return Assets.kakaoIcon;
      default:
        throw UnsupportedError('Invalid auth type.');
    }
  }
}
