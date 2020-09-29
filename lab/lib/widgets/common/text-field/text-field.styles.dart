import 'package:flutter/material.dart';
import 'package:stylex/stylex.dart';

final _textField = StyleX({
  'textfield-label-font-size': 14.0,
  'textfield-label-font-family': 'carbon-font-family',
  'textfield-text-font-size': 14.0,
  'textfield-text-font-family': 'carbon-font-family',
  'textfield-hint-font-size': 14.0,
  'textfield-hint-font-family': 'carbon-font-family',
  'textfield-description-font-size': 14.0,
  'textfield-description-font-family': 'carbon-font-family',
});

final textFieldG100 = StyleX({
  // cursor-color
  'textfield-cursor-color': '#FFFFFF',

  /// primary ///

  // label
  'textfield-primary-enabled-label-color': 'carbon-gray-30',
  'textfield-primary-focus-label-color': 'carbon-gray-30',
  'textfield-primary-disabled-label-color': 'carbon-gray-70',
  // hint
  'textfield-primary-enabled-hint-color': 'carbon-gray-60',
  'textfield-primary-focus-hint-color': 'carbon-gray-60',
  'textfield-primary-disabled-hint-color': 'carbon-gray-70',

  // text
  'textfield-primary-enabled-text-color': 'carbon-gray-10',
  'textfield-primary-focus-text-color': 'carbon-gray-10',
  'textfield-primary-disabled-text-color': 'carbon-gray-70',

  // description
  'textfield-primary-enabled-description-color': 'carbon-gray-30',
  'textfield-primary-focus-description-color': 'carbon-gray-30',
  'textfield-primary-disabled-description-color': 'carbon-gray-70',

  // background-color
  'textfield-primary-enabled-background-color': 'carbon-gray-90',
  'textfield-primary-focus-background-color': 'carbon-gray-90',
  'textfield-primary-disabled-background-color': 'carbon-gray-90',

  // border
  'textfield-primary-enabled-border': UnderlineInputBorder(
    borderRadius: BorderRadius.circular(0),
    borderSide: const BorderSide(color: Color(0xFF6F6F6F), width: 1),
  ),
  'textfield-primary-focus-border': OutlineInputBorder(
    borderRadius: BorderRadius.circular(0),
    borderSide: BorderSide(color: Colors.white, width: 2),
  ),
  'textfield-primary-disabled-border': UnderlineInputBorder(
    borderRadius: BorderRadius.circular(0),
    borderSide: const BorderSide(color: Colors.transparent, width: 0),
  ),
})
  ..inject(_textField);

// success, warning, danger
