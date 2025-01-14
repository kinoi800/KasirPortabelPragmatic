part of '../page.dart';
//bagian Produk Info halaman tambah produk
class _InfoSection extends StatefulWidget {
  const _InfoSection({this.product});

  final ProductModel? product;

  @override
  State<_InfoSection> createState() => _InfoSectionState();
}

class _InfoSectionState extends State<_InfoSection> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descController = TextEditingController();

  @override
  void initState() {
    nameController.addListener(() {
      context
          .read<FormProductBloc>()
          .add(ChangeFormProductEvent(name: nameController.text));
    });
    descController.addListener(() {
      context
          .read<FormProductBloc>()
          .add(ChangeFormProductEvent(description: descController.text));
    });

    nameController.text = widget.product?.title ?? '';
    descController.text = widget.product?.desc ?? '';

    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimens.dp16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RegularText.semiBold('Produk Info'),
          Dimens.dp24.height,
          RegularTextInput(
            controller: nameController,
            label: 'Judul Produk',
            required: true,
            hintText: 'Masukkan Judul Produk',
          ),
          Dimens.dp24.height,
          RegularTextInput(
            controller: descController,
            label: 'Deskripsi',
            required: true,
            hintText: 'Masukkan Deskripsi Produk',
            minLines: 1,
            maxLines: 4,
          ),
          Dimens.dp24.height,
          const LabelInput(label: 'Media', required: true),
          Dimens.dp8.height,
          const RegularText(
            'Maks. ukuran 3 MB',
            style: TextStyle(fontSize: Dimens.dp12),
          ),
          Dimens.dp8.height,
          InkWell(
            onTap: () {
              context
                  .read<FormProductBloc>()
                  .add(ChangeImageFormProductEvent());
            },
            borderRadius: BorderRadius.circular(Dimens.dp8),
            child: BlocBuilder<FormProductBloc, FormProductState>(
              builder: (context, state) {
                if (state.image != null && state.image!.isNotEmpty) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(Dimens.dp8),
                    child: Image.memory(
                      ImageHelper.convertToUint8List(state.image!),
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                  );
                }
                return Container(
                  padding: const EdgeInsets.all(Dimens.dp16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimens.dp8),
                    border: Border.all(color: context.theme.dividerColor),
                  ),
                  child: Icon(
                    AppIcons.addPhotoAlternate,
                    color: context.theme.primaryColor,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
