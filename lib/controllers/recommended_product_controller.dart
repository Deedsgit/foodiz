// import 'package:foody/data/repository/popular_product_repo.dart';
import 'package:foody/data/repository/recoommended_product_repo.dart';
// import 'package:foody/models/cart_model.dart';
import 'package:foody/models/products_model.dart';
import 'package:get/get.dart';

class RecommendedProductController extends GetxController {
  final RecommendedProductRepo recommendedProductRepo;
  RecommendedProductController({required this.recommendedProductRepo});
  List<dynamic> _recommendedProductlist = [];
  List<dynamic> get recommendedProductList => _recommendedProductlist;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getRecommendedProductList() async {
    Response response =
        await recommendedProductRepo.getRecommendedProductList();
    if (response.statusCode == 200) {
      _recommendedProductlist = [];
      _recommendedProductlist.addAll(Product.fromJson(response.body).products);
      print("got recommended product");
      _isLoaded = true;
      update();
    } else {
      print("could not get products recommended");
    }
  }
}
