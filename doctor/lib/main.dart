// ignore_for_file: sort_child_properties_last, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, sized_box_for_whitespace, avoid_types_as_parameter_names, non_constant_identifier_names

import 'dart:ui';
import 'package:doctor/booking.dart';
import 'package:doctor/doctor_details.dart';
import 'package:doctor/favourite_doctors.dart';
import 'package:doctor/find_doctors.dart';
import 'package:doctor/login.dart';
import 'package:doctor/main_page.dart';
import 'package:doctor/my_doctors.dart';
import 'package:doctor/popular_doctors.dart';
import 'package:doctor/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'live_page.dart';

//TODO  add fontfamily rubik add indexd package
//overflow when use sized container

void main() => runApp(MaterialApp(home: MyDoctors()));
