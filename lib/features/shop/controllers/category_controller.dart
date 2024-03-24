import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:tstore/data/repositories/categories/category_repository.dart';
import 'package:tstore/features/shop/models/category_model.dart';
import 'package:tstore/utils/snakBars/TLoders.dart';

class  CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final _categoryRepository = Get.put(CategoryRepository());
  final isLoading = false.obs;
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    fetchCategories();
    super.onInit();
  } 

  //! Load Category Data

  Future<void> fetchCategories () async {
    try {
      // show loader while loading categoreis

      isLoading.value = true;

      // Fetch categories from data Source (Firebase, API, etc..)
      final catagories = await _categoryRepository.getAllCategories();

      // Update the Categories List
      allCategories.assignAll(catagories);

      // Filter featured categories list
      featuredCategories.assignAll(allCategories.where((category) => category.isFeatured && category.parentId.isEmpty).take(8).toList());
      
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      // Remove Loader
      isLoading.value = false;
    }
  }


  //! Load Selected Category Data

  //! Get Category or Sub Category Products
}