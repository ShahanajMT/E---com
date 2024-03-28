import 'package:get/get.dart';
import 'package:tstore/data/repositories/Banners/banner_rep.dart';
import 'package:tstore/features/shop/models/banner_model.dart';

import '../../../utils/snakBars/TLoders.dart';

class BannerController extends GetxController {
  // Variable
  final isLoading = false.obs;
  final carouselCurrentIndex = 0.obs;
  final RxList<BannerModel> banners = <BannerModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    fetchBanners();
    super.onInit();
  }


  // update Page Navigational Dots
  void updatePageIndicator(index) {
    carouselCurrentIndex.value = index;
  }

  // Fetch Banners
  Future<void> fetchBanners () async {
    try {
      // show loader while loading categoreis

      isLoading.value = true;

      // Fetch Banners
      final bannerRepo = Get.put(BannerRepository());
      final banners = await bannerRepo.fetchBanners();

      // Assign Banners
      this.banners.assignAll(banners);

      
      
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      // Remove Loader
      isLoading.value = false;
    }
  }

}
