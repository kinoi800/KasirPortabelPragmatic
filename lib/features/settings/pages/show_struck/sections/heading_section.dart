part of '../page.dart';

class _HeadingSection extends StatelessWidget {
  const _HeadingSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimens.dp16),
      child: Column(
        children: [
          const SubtitleText(
            'PancongPragmatic',
            align: TextAlign.center,
          ),
          Dimens.dp14.height,
          const RegularText(
            'Instagram : @pancongpragmatic',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
