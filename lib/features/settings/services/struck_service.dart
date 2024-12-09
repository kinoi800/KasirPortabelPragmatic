import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pancong/features/settings/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';
//struk service
class StruckService {
  StruckService._();

  static Future<StruckModel> insert(StruckModel user) async {
    try {
      final prefs = await SharedPreferences.getInstance();

      await prefs.setString('struck', jsonEncode(user.toJson()));

      return user;
    } catch (e) {
      throw ErrorDescription(e.toString());
    }
  }

  static Future<StruckModel?> get() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      final data = prefs.getString('struck');

      if (data != null) {
        return StruckModel.fromJson(jsonDecode(data));
      }

      return null;
    } catch (e) {
      throw ErrorDescription(e.toString());
    }
  }
}
