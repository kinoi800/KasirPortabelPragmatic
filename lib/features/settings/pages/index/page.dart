import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pancong/core/core.dart';
import 'package:pancong/features/settings/settings.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
part 'sections/profile_section.dart';
part 'sections/account_section.dart';
part 'sections/device_section.dart';
part 'sections/other_section.dart';

//HALAMAN Lainnya
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(title: const Text('Lainnya')),
     body : ListView(
      children:   [
        const _ProfileSection(),
        const Divider(thickness: Dimens.dp8,),
        const _AccountSection(),
        const Divider(thickness: Dimens.dp8,),
       const _DeviceSection(),
        const Divider(thickness: Dimens.dp8,),
       const _OtherSection(),
        Padding(
            padding: const EdgeInsets.all(Dimens.dp16),
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                foregroundColor: context.theme.colorScheme.error,
                side: BorderSide(color: context.theme.colorScheme.error),
              ),
              onPressed: () {
              SystemNavigator.pop();
              },
              child: const Text('Keluar'),
            ),
          ),
      ],
     )
    );
  }
}



