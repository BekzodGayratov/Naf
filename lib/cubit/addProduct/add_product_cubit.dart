part of 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit() : super(AddProductInitialState());

  // Logic here ...
  // To add new product
  TextEditingController productNameController = TextEditingController();
  TextEditingController productDescController = TextEditingController();
  TextEditingController productCostController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void addProductImage(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) =>
          const ImagePickerWidget(imageCategoryPath: "products"),
    );
  }

  void writeData() async {
    if (formKey.currentState!.validate()) {
      emit(AddProductLoadingState());
      await FirestoreService.writeData(
          productName: productNameController.text,
          productDesc: productDescController.text,
          productCost: productCostController.text,
          productImagePath: FirebaseStorageService.uploadedFilePath);

      emit(AddProductCompleteState());
    }
  }
}
