import 'package:foody/data/repository/user_repo.dart';
import 'package:foody/models/response_model.dart';
import 'package:foody/models/user_model.dart';
import 'package:get/get.dart';

class UserController extends GetxController implements GetxService {
  final UserRepo userRepo;
  UserController({required this.userRepo});

  bool _isLoading = false;
  late UserModel _userModel;
  bool get isLoading => _isLoading;
  UserModel get userModel => _userModel;

  Future<ResponseModel> getUserInfo() async {
    // _isLoading = true;
    // update();
    Response response = await userRepo.getUserInfo();
    late ResponseModel responseModel;
    if (response.statusCode == 200) {
      _userModel = UserModel.fromJson(response.body);
      _isLoading = true;
      responseModel = ResponseModel(true, "successfully");
    } else {
      responseModel = ResponseModel(false, response.statusText!);
    }
    // _isLoading = false;
    // update();
    return responseModel;
  }

  // Future<ResponseModel> login(String email, String password) async {
  //   _isLoading = true;
  //   update();
  //   Response response = await authRepo.login(email, password);
  //   late ResponseModel responseModel;
  //   if (response.statusCode == 200) {
  //     authRepo.saveUserToken(response.body["tokens"]);
  //     responseModel = ResponseModel(true, response.body["token"]);
  //   } else {
  //     responseModel = ResponseModel(false, response.statusText!);
  //   }
  //   _isLoading = false;
  //   update();
  //   return responseModel;
  // }

  // void saveUserNumberAndPassword(String number, String password) async {
  //   {
  //     authRepo.saveUserNumberAndPassword(number, password);
  // //   }
  // }

  // bool userLoggedIn() {
  //   return authRepo.userLoggedIn();
  // }

  // bool clearSharedData() {
  //   return authRepo.clearSharedData();
  // }
}
