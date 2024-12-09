part of '../page.dart';
//Profil section
class _ProfileSection extends StatelessWidget {
  const _ProfileSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimens.dp16),
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          return Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(Dimens.dp50),
                  child: state.user?.image != null && state.user!.image.isNotEmpty
                        ? Image.memory(
                        ImageHelper.convertToUint8List(state.user!.image),
                        width: 64,
                        height: 64,
                        fit: BoxFit.cover,
                      )
                        :Image.network(
                        'https://qph.cf2.quoracdn.net/main-qimg-afe557f78b90646327d49be066bc49fd-lq',
                        width: 64,
                        height: 64,
                        fit: BoxFit.cover,
                  ),
                ),
                Dimens.dp16.width,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RegularText.semiBold(
                      state.user?.name == null || state.user!.name.isEmpty
                          ? 'Pancong'
                          : state.user!.name,
                    ),
                      Dimens.dp4.height,
                      RegularText(
                      state.user?.email == null || state.user!.email.isEmpty
                          ? 'pancong@gmail.com'
                          : state.user!.email,
                      style: const TextStyle(fontSize: Dimens.dp12),
                    ),
                       Dimens.dp4.height,
                      RegularText(
                      state.user?.phoneNumber == null ||
                              state.user!.phoneNumber.isEmpty
                          ? '+6282117499922'
                          : state.user!.phoneNumber,
                      style: const TextStyle(fontSize: Dimens.dp12),
                    ),
                       Dimens.dp4.height,
                    ],
                  ),
                ),
               IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, ProfilePage.routeName);
                },
                icon: const Icon(AppIcons.edit),
                color: context.theme.primaryColor,
              ),
              ],
            );
        },
      ),
    );
  }
}
