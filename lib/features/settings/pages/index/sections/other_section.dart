part of '../page.dart';
//Info Lainnya section
class _OtherSection extends StatelessWidget {
  const _OtherSection();

_launchURL() async {
  const url = 'https://www.instagram.com/pancongpragmatic/';
  if (await launch(url)) {
    await canLaunch(url);
  } else {
    throw 'Could not launch $url';
  }
}

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(Dimens.dp16),
          child: RegularText.semiBold('Info Lainnya'),
        ),
         ItemMenuSetting(
          title: 'Social Media',
          icon: AppIcons.verified,
          onTap: () {
                _launchURL();
          },
          ),
        const Divider(height: 0,),
         const ItemMenuSetting(
          title: 'Versi Aplikasi',
          icon: AppIcons.star,
          subtitle: 'v 1.0.0',
          
          ),
      ],
    );
  }
}


