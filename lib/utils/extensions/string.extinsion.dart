import 'package:carbon/carbon.dart';
import 'package:flutter/material.dart';

extension StringExtension on String {
  CText h1({TextStyle style}) {
    return CText(data: this, textType: CTextType.h1, style: style);
  }

  CText h2({TextStyle style}) {
    return CText(data: this, textType: CTextType.h2, style: style);
  }

  CText h3({TextStyle style}) {
    return CText(data: this, textType: CTextType.h3, style: style);
  }

  CText h4({TextStyle style}) {
    return CText(data: this, textType: CTextType.h4, style: style);
  }

  CText h5({TextStyle style}) {
    return CText(data: this, textType: CTextType.h5, style: style);
  }

  CText h6({TextStyle style}) {
    return CText(data: this, textType: CTextType.h6, style: style);
  }

  CLink link(
    void Function(String url) onTap, {
    String caption,
    TextStyle style,
  }) {
    return CLink(
      url: this,
      onTap: onTap,
      caption: caption,
      style: style,
    );
  }
}
