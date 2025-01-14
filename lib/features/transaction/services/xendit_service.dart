import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pancong/core/core.dart';
//service api qris xendit

class XenditService {
  XenditService._();

  static Dio get dio {
    return Dio()
      ..interceptors.addAll([
        LogInterceptor(
          requestBody: true,
          responseBody: true,
        ),
      ])
      ..options = BaseOptions(headers: {
        'Content-Type': 'application/json',
        'api-version': '2022-07-31',
        'Authorization': 'Basic ${base64Encode(
          utf8.encode(
            'xnd_development_ykH5FOscuRmEeQgCZYGE0gmhsizK1LxFzhSgg6GAQZ4XPHwVcvKlUcsFk22yII4p:',
          ),
        )}',
      });
  }

  static Future<(String qrId, String qrString)> createQr({
    required String referenceId,
    required num amount,
  }) async {
    try {
      final response = await dio.post(
        'https://api.xendit.co/qr_codes',
        data: {
          "reference_id": referenceId,
          "type": "DYNAMIC",
          "currency": "IDR",
          "amount": amount
        },
      );

      return (
        response.data['id'] as String,
        response.data['qr_string'] as String,
      );
    } catch (e) {
      throw ErrorDescription(e.toString());
    }
  }

  static Future<TypeEnum> cekQr(
    String qrId,
  ) async {
    try {
      final response = await dio.get(
        'https://api.xendit.co/qr_codes/$qrId/payments',
      );

      final data = List.from(response.data['data']);

      final isAvailable = data
          .where(
            (e) => e['status'] == 'COMPLETED' || e['status'] == 'SUCCEEDED',
          )
          .isNotEmpty;

      if (isAvailable) {
        return TypeEnum.paid;
      } else {
        return TypeEnum.unpaid;
      }
    } catch (e) {
      throw ErrorDescription(e.toString());
    }
  }
}
