import 'package:carbon/carbon.dart';
import 'package:flutter/material.dart';

extension StringExtension on String {
  CText h1({TextStyle style}) {
    return CText(
      props: {'value': this, 'textType': TextType.h1, 'style': style},
    );
  }

  CText h2({TextStyle style}) {
    return CText(
      props: {'value': this, 'textType': TextType.h2, 'style': style},
    );
  }

  CText h3({TextStyle style}) {
    return CText(
      props: {'value': this, 'textType': TextType.h3, 'style': style},
    );
  }

  CText h4({TextStyle style}) {
    return CText(
      props: {'value': this, 'textType': TextType.h4, 'style': style},
    );
  }

  CText h5({TextStyle style}) {
    return CText(
      props: {'value': this, 'textType': TextType.h5, 'style': style},
    );
  }

  CText h6({TextStyle style}) {
    return CText(
      props: {'value': this, 'textType': TextType.h6, 'style': style},
    );
  }

  CLink link(String caption, {TextStyle style}) {
    return CLink(
      props: {
        'url': this,
        'caption': caption,
        'style': style,
      },
    );
  }
}
