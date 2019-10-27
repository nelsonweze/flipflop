import 'package:flutter/material.dart';
import 'color.dart' as colors;

class AppH2Text extends StatelessWidget {
  final text;
  final TextAlign align;
  final Color color;
  AppH2Text({Key key, this.align, this.text, this.color = colors.text,}) : super(key: key);

  @override
  Widget build(BuildContext context) => new Text(this.text,
      style: TextStyle(
          decoration: TextDecoration.none,
          color: this.color,
          fontSize: 28.0,
          fontWeight: FontWeight.w500),
      textAlign: this.align);
}

class AppH3Text extends StatelessWidget {
  final text;
  final TextAlign align;
  final color;

  AppH3Text({Key key, this.text, this.align,  this.color = colors.text,}) : super(key: key);

  @override
  Widget build(BuildContext context) => new Text(this.text,
      style: TextStyle(
          color: this.color,
          fontSize: 24.0,
          decoration: TextDecoration.none,
          fontWeight: FontWeight.w800),
      textAlign: this.align);
}

class BoldText extends StatelessWidget {
  final text;
  final TextAlign align;
  final color;
  final FontWeight weight;
  final double font;

  BoldText({Key key, this.text, this.align,  this.color = colors.text, this.font = 20, this.weight = FontWeight.w800}) : super(key: key);

  @override
  Widget build(BuildContext context) => new Text(this.text,
      style: TextStyle(
          color: this.color,
          fontSize: font,
          decoration: TextDecoration.none,
          fontWeight: weight),
      textAlign: this.align);
}

class AppH4Text extends StatelessWidget {
  final text;
  final TextAlign align;
  final color;
  final TextOverflow overflow;

  AppH4Text({Key key,  this.color = colors.text, this.text, this.align, this.overflow})
      : super(key: key);

  @override
  Widget build(BuildContext context) => new Text(this.text,
      style: TextStyle(
          decoration: TextDecoration.none,
          color: this.color,
          fontSize: 18.0,
          fontWeight: FontWeight.w600),
      overflow: overflow,
      textAlign: this.align);
}

class AppH5Text extends StatelessWidget {
  final text;
  final TextAlign align;
  final TextOverflow overflow;
  final color;

  AppH5Text({Key key, this.text, this.align, this.color, this.overflow})
      : super(key: key);

  @override
  Widget build(BuildContext context) => new Text(
        this.text,
        style: TextStyle(
            decoration: TextDecoration.none,
            color: this.color,
            fontSize: 16.0,
            fontWeight: FontWeight.w500),
        textAlign: this.align,
        overflow: overflow,
      );
}

class NormalText extends StatelessWidget {
  final text;
  final TextOverflow overflow;
  final TextAlign align;
  final color;
  final double height;
  final double font;
  final FontWeight weight;

  NormalText(
      {Key key,
      this.text,
      this.align,
      this.color = colors.text,
      this.overflow,
      this.height,
      this.weight,
      this.font = 15})
      : super(key: key);

  @override
  Widget build(BuildContext context) => new Text(
        this.text,
        style: TextStyle(
            decoration: TextDecoration.none,
            color: this.color,
            fontSize: font,
            letterSpacing: 0.2,
            height: height ?? 1.22,
            fontWeight: weight ?? FontWeight.w600),
        textAlign: this.align,
        overflow: overflow,
      );
}

class AppH6Text extends StatelessWidget {
  final text;
  final TextAlign align;
  final color;
  final TextOverflow overflow;
  final double font;
  final FontWeight weight;
  AppH6Text(
      {Key key,
      this.text,
      this.align,
      this.color,
      this.overflow,
      this.weight = FontWeight.w400,
      this.font = 14})
      : super(key: key);

  @override
  Widget build(BuildContext context) => new Text(this.text,
      overflow: this.overflow,
      style: TextStyle(
          decoration: TextDecoration.none,
          color: this.color,
          fontSize: font,
          letterSpacing: 0.2,
          height: 1.12,
          fontWeight: weight),
      textAlign: this.align);
}

class AppPText extends StatelessWidget {
  final text;
  final TextAlign align;
  final double font;
  final color;
  final TextOverflow overflow;
  final double height;

  AppPText(
      {Key key,
      this.text,
      this.color,
      this.height = 1.15,
      this.align,
      this.overflow,
      this.font = 12})
      : super(key: key);

  @override
  Widget build(BuildContext context) => new Text(
        this.text,
        style: TextStyle(
            decoration: TextDecoration.none,
            color: this.color,
            fontSize: font,
            height: height,
            letterSpacing: 0.2,
            fontWeight: FontWeight.w400),
        textAlign: this.align,
        overflow: overflow,
      );
}
