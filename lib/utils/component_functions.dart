import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

DateTimeRange findWeekForTripsThisWeek() {
  //function to return the timestamp range of the week of the current day
  final now = DateTime.now();
  final startOfWeek = now.subtract(Duration(days: now.weekday - 1));
  final endOfWeek = startOfWeek.add(Duration(days: 6));
  return DateTimeRange(start: startOfWeek, end: endOfWeek);
}

String regDashes(String origReg) {
  RegExp regExp = RegExp(r'(\d+)([A-Za-z]+)(\d+)');
  Match match = regExp.firstMatch(origReg)!;
  // Access the captured groups:
  String numbers1 = match.group(1)!;
  String letters = match.group(2)!;
  String numbers2 = match.group(3)!;
  return "$numbers1-$letters-$numbers2";
}

String addDashes(String plate) {
  if (plate.length <= 8) {
    // Format for year-county-number (e.g., 08-MH-1823)
    return '${plate.substring(0, 2)}-${plate.substring(2, 4)}-${plate.substring(4)}';
  } else {
    // Format for year-letter-number
    return '${plate.substring(0, 3)}-${plate.substring(3, 4)}-${plate.substring(4)}';
  }
}

String findCounty(String plate) {
  const countyTranslations = {
    'C': 'Corcaigh',
    'CE': 'An Clár',
    'CN': 'An Cabhán',
    'CW': 'Ceatharlach',
    'D': 'Baile Átha Cliath',
    'DL': 'Dún na nGall',
    'G': 'Gaillimh',
    'KE': 'Cill Dara',
    'KK': 'Cill Chainnigh',
    'KY': 'Ciarraí',
    'L': 'Luimneach',
    'LD': 'An Longfort',
    'LH': 'Lú',
    'LK': 'Luimneach',
    'LM': 'Liatroim',
    'LS': 'Laois',
    'MH': 'An Mhí',
    'MN': 'Muineachán',
    'MO': 'Maigh Eo',
    'OY': 'Uíbh Fhailí',
    'RN': 'Ros Comáin',
    'SO': 'Sligeach',
    'T': 'Tiobraid Árann',
    'W': 'Port Láirge',
    'WD': 'Port Láirge',
    'WH': 'An Iarmhí',
    'WX': 'Loch Garman',
    'WW': 'Cill Mhantáin',
  };

  String countyCode;
  if (plate.length <= 8) {
    countyCode = plate.substring(2, 4); // County code for year-county-number
  } else {
    countyCode = plate.substring(3, 4); // Single letter for year-letter-number
  }
  return countyTranslations[countyCode] ??
      "Unknown"; // Return the translated county name or "Unknown"
}

double getCurrentCharge(DateTime entryTime) {
  DateTime now = DateTime.now();
  Duration difference = now.difference(entryTime);
  int hoursParked = difference.inHours;
  print(entryTime);
  print(DateTime.now());
  // Calc cost (50 cents per hour)
  double totalCost = hoursParked * 0.50;
  return totalCost;
}

DateTime subDayFromOrigin() {
  // Get the current DateTime
  // Subtract one day using Duration
  final now = DateTime.now();
  final yesterday = now.subtract(const Duration(days: 1));
  return yesterday;
}

List<DateTime> generateHoursArray() {
  final now = DateTime.now();
  // maps hours of the day to a list for analytics
  // Create an empty list to store the DateTimes
  // Iterate backwards 24 times (for 24 hours)
  List<DateTime> hourlyDateTimes = [];

  for (int i = 0; i < 24; i++) {
    // Subtract 'i' hours from current time
    DateTime hourBefore = now.subtract(Duration(hours: i));
    hourlyDateTimes.add(hourBefore);
  }
  return hourlyDateTimes;
}

List<HistoricalsessionsRecord> newCustomFunction(
    List<HistoricalsessionsRecord> history) {
  history.removeLast();
  return history;
}
