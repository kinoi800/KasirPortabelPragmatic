//konfigurasi Tampilan Splash Pancong
import 'package:flutter/material.dart';
import 'package:pancong/core/core.dart';
import 'package:pancong/features/home/home.dart';
// SPLASH SCREEN
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

//konfigurasi waktu splash muncul berapa lama
class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then(
      (value) => Navigator.pushNamedAndRemoveUntil(
        context,
        //untuk menentukan page yang akan dituju setelah splash
        MainPage.routeName,
        (route) => false,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //Konfigurasi Input Gambar Splash Pancong
          children: [
           Image.asset(MainAssets.logo, 
           //besar gambar logo
           width: Dimens.width(context) / 2,
           ),
           //konfigurasi jarak logo dan text splash
           Dimens.defaultSize.height,
           //konfigurasi text headline splash
           HeadingText('BY PANCONG PRAGMATIC', style: TextStyle(
            color: context.theme.primaryColor,
            fontSize: Dimens.dp12,
           ),
           ),
          ],
        ),
      ),
    );
    
  }
}
