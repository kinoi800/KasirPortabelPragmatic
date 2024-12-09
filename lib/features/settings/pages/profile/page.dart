import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pancong/core/core.dart';
import 'package:pancong/features/settings/settings.dart';

part 'sections/image_section.dart';
//halaman profile akun di Halaman settings
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  static const routeName = '/settings/profile';

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
//memyimpan inputan di halaman profile jika dibuka kembali
  @override
  void initState() {
    context.read<ProfileBloc>().add(GetProfileEvent());
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }
  //bloc listerner agar setelah disimpan balik kehalaman settings
  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state.status == Status.apply) {
          nameController.text = state.user?.name ?? '';
          emailController.text = state.user?.email ?? '';
          phoneController.text = state.user?.phoneNumber ?? '';
        }
        if (state.status == Status.success) {
          Navigator.pop(context);
        }
        if (state.status == Status.failure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error ?? 'Something Wrong!'),
            ),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Informasi Usaha')),
        body: ListView(
          padding: const EdgeInsets.all(Dimens.dp16),
          children: [
            const _ImageSection(),
            const Divider(),
            RegularTextInput(
              controller: nameController,
              label: 'Nama Bisnis',
              hintText: 'pancong',
            ),
            Dimens.dp24.height,
            RegularTextInput(
              controller: emailController,
              label: 'Email',
              hintText: 'pancong@gmail.com',
              keyboardType: TextInputType.emailAddress,
            ),
            Dimens.dp24.height,
            RegularTextInput(
              controller: phoneController,
              label: 'Phone Number',
              hintText: '08123456789',
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              keyboardType: TextInputType.phone,
            ),
          ],
        ),
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(Dimens.dp16),
            child: ElevatedButton(
              onPressed: () {
                context.read<ProfileBloc>().add(SubmitProfileEvent(
                      name: nameController.text,
                      email: emailController.text,
                      phoneNumber: phoneController.text,
                    ));
              },
              child: const Text('Simpan'),
            ),
          ),
        ),
      ),
    );
  }
}
