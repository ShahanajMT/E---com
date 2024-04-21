import 'package:get/get.dart';
import 'package:tstore/features/shop/models/product_model.dart';
import 'package:tstore/utils/snakBars/TLoders.dart';

import '../../../data/repositories/product/product_repo.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  final isLoading = false.obs;
  final productRepository = Get.put(ProductRepository());
  RxList<ProductModel> fetchProducts = <ProductModel>[].obs;


  @override
  void onInit() {
    // TODO: implement onInit
    fetchFeatureProducts();
    super.onInit();
  }

  void fetchFeatureProducts () async {
    try {
      // start Loding
      isLoading.value = true;

      // Fetch Products
      final products = await ProductRepository.instance.getFeaturedProducts();

      // Assign Products
      fetchProducts.assignAll(products);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      // Stop Loding
      isLoading.value = false;
    }
  }
}