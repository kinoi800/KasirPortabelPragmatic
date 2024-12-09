import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pancong/features/home/home.dart';
import 'package:pancong/features/pos/pos.dart';
import 'package:pancong/features/product/product.dart';
import 'package:pancong/features/settings/pages/pages.dart';
import 'package:pancong/features/settings/settings.dart';
import 'package:pancong/features/transaction/pages/pages.dart';
//konfigurasi routes / rute jalannya aplikasi agar rapih
// awalnya konfigurasi ini ada di app.dart dipindahkan disini agar lebih rapih
Route<dynamic> routes(RouteSettings settings) {
   //konfigurasi nama route/untuk ke page home
  switch (settings.name) {
    case MainPage.routeName:
      return MaterialPageRoute(builder: (_) {
        return const MainPage();
      });
     //konfigurasi nama route/untuk masuk ke halaman tambah produk
    case ProductInputPage.routeName:
      return CupertinoPageRoute(builder: (_) {
        return ProductInputPage(
          product: settings.arguments as ProductModel?,
        );
      });
    case ProfilePage.routeName:
      return CupertinoPageRoute(builder: (_) {
        return const ProfilePage();
      });
    case XenditPage.routeName:
      return CupertinoPageRoute(builder: (_) {
        return const XenditPage();
      });
    case StruckPage.routeName:
      return CupertinoPageRoute(builder: (_) {
        return const StruckPage();
      });
    case ShowStruckPage.routeName:
      return CupertinoPageRoute(builder: (_) {
        return const ShowStruckPage();
      });
    case PrinterPage.routeName:
      return CupertinoPageRoute(builder: (_) {
        return const PrinterPage();
      });
    case POSOrderPage.routeName:
      return CupertinoPageRoute(builder: (_) {
        return const POSOrderPage();
      });
    case PaymentPage.routeName:
      return CupertinoPageRoute(builder: (_) {
        return PaymentPage(
          referenceId: settings.arguments as String?,
        );
      });
    case CashPage.routeName:
      return CupertinoPageRoute(builder: (_) {
        return CashPage(
          referenceId: settings.arguments as String?,
        );
      });
    case SuccessTransactionPage.routeName:
      return CupertinoPageRoute(builder: (_) {
        return SuccessTransactionPage(
          referenceId: settings.arguments as String,
        );
      });
    case TransactionDetailPage.routeName:
      return CupertinoPageRoute(builder: (_) {
        return TransactionDetailPage(
          referenceId: settings.arguments as String,
        );
      });
    case POSQrPage.routeName:
      return CupertinoPageRoute(builder: (_) {
        return const POSQrPage();
      });
    default:
      return MaterialPageRoute(builder: (_) {
        return const Scaffold(
          body: Center(child: Text('Page Not Found!')),
        );
      });
  }
}
