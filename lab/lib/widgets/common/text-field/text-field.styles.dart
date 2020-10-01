import 'package:flutter/material.dart';
import 'package:stylex/stylex.dart';

final _textField = StyleX({
  'textfield-label-font-size': 15.0,
  'textfield-label-font-family': 'carbon-font-family',
  'textfield-text-font-size': 16.0,
  'textfield-text-font-family': 'carbon-font-family',
  'textfield-hint-font-size': 16.0,
  'textfield-hint-font-family': 'carbon-font-family',
  'textfield-description-font-size': 15.0,
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

  /// success ///

  // label
  'textfield-success-enabled-label-color': 'carbon-gray-30',
  'textfield-success-focus-label-color': 'carbon-gray-30',
  'textfield-success-disabled-label-color': 'carbon-gray-70',

  // hint
  'textfield-success-enabled-hint-color': 'carbon-gray-60',
  'textfield-success-focus-hint-color': 'carbon-gray-60',
  'textfield-success-disabled-hint-color': 'carbon-gray-70',

  // text
  'textfield-success-enabled-text-color': 'carbon-gray-10',
  'textfield-success-focus-text-color': 'carbon-gray-10',
  'textfield-success-disabled-text-color': 'carbon-gray-70',

  // description
  'textfield-success-enabled-description-color': 'carbon-gray-30',
  'textfield-success-focus-description-color': 'carbon-green-30',
  'textfield-success-disabled-description-color': 'carbon-gray-70',

  // background-color
  'textfield-success-enabled-background-color': 'carbon-gray-90',
  'textfield-success-focus-background-color': 'carbon-gray-90',
  'textfield-success-disabled-background-color': 'carbon-gray-90',

  // border
  'textfield-success-enabled-border': UnderlineInputBorder(
    borderRadius: BorderRadius.circular(0),
    borderSide: const BorderSide(color: Color(0xFF6F6F6F), width: 1),
  ),
  'textfield-success-focus-border': OutlineInputBorder(
    borderRadius: BorderRadius.circular(0),
    borderSide: BorderSide(color: Color(0xFF42BE65), width: 2),
  ),
  'textfield-success-disabled-border': UnderlineInputBorder(
    borderRadius: BorderRadius.circular(0),
    borderSide: const BorderSide(color: Colors.transparent, width: 0),
  ),

  /// warning ///

  // label
  'textfield-warning-enabled-label-color': 'carbon-gray-30',
  'textfield-warning-focus-label-color': 'carbon-gray-30',
  'textfield-warning-disabled-label-color': 'carbon-gray-70',

  // hint
  'textfield-warning-enabled-hint-color': 'carbon-gray-60',
  'textfield-warning-focus-hint-color': 'carbon-gray-60',
  'textfield-warning-disabled-hint-color': 'carbon-gray-70',

  // text
  'textfield-warning-enabled-text-color': 'carbon-gray-10',
  'textfield-warning-focus-text-color': 'carbon-gray-10',
  'textfield-warning-disabled-text-color': 'carbon-gray-70',

  // description
  'textfield-warning-enabled-description-color': 'carbon-gray-30',
  'textfield-warning-focus-description-color': 'carbon-yellow-30',
  'textfield-warning-disabled-description-color': 'carbon-gray-70',

  // background-color
  'textfield-warning-enabled-background-color': 'carbon-gray-90',
  'textfield-warning-focus-background-color': 'carbon-gray-90',
  'textfield-warning-disabled-background-color': 'carbon-gray-90',

  // border
  'textfield-warning-enabled-border': UnderlineInputBorder(
    borderRadius: BorderRadius.circular(0),
    borderSide: const BorderSide(color: Color(0xFF6F6F6F), width: 1),
  ),
  'textfield-warning-focus-border': OutlineInputBorder(
    borderRadius: BorderRadius.circular(0),
    borderSide: BorderSide(color: Color(0xFFFDD13A), width: 2),
  ),
  'textfield-warning-disabled-border': UnderlineInputBorder(
    borderRadius: BorderRadius.circular(0),
    borderSide: const BorderSide(color: Colors.transparent, width: 0),
  ),

  /// danger ///

  // label
  'textfield-danger-enabled-label-color': 'carbon-gray-30',
  'textfield-danger-focus-label-color': 'carbon-gray-30',
  'textfield-danger-disabled-label-color': 'carbon-gray-70',

  // hint
  'textfield-danger-enabled-hint-color': 'carbon-gray-60',
  'textfield-danger-focus-hint-color': 'carbon-gray-60',
  'textfield-danger-disabled-hint-color': 'carbon-gray-70',

  // text
  'textfield-danger-enabled-text-color': 'carbon-gray-10',
  'textfield-danger-focus-text-color': 'carbon-gray-10',
  'textfield-danger-disabled-text-color': 'carbon-gray-70',

  // description
  'textfield-danger-enabled-description-color': 'carbon-gray-30',
  'textfield-danger-focus-description-color': 'carbon-red-40',
  'textfield-danger-disabled-description-color': 'carbon-gray-70',

  // background-color
  'textfield-danger-enabled-background-color': 'carbon-gray-90',
  'textfield-danger-focus-background-color': 'carbon-gray-90',
  'textfield-danger-disabled-background-color': 'carbon-gray-90',

  // border
  'textfield-danger-enabled-border': UnderlineInputBorder(
    borderRadius: BorderRadius.circular(0),
    borderSide: const BorderSide(color: Color(0xFF6F6F6F), width: 1),
  ),
  'textfield-danger-focus-border': OutlineInputBorder(
    borderRadius: BorderRadius.circular(0),
    borderSide: BorderSide(color: Color(0xFFFA4D56), width: 2),
  ),
  'textfield-danger-disabled-border': UnderlineInputBorder(
    borderRadius: BorderRadius.circular(0),
    borderSide: const BorderSide(color: Colors.transparent, width: 0),
  ),
})
  ..inject(_textField);

// success, warning, danger
