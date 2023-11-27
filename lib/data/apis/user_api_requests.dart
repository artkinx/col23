import 'package:klusterthon/core/helper/constant_var_helper.dart';
import 'package:klusterthon/data/apis/base_api_client.dart';
import 'package:klusterthon/data/requests/sign_up_request.dart';

class UserApiRequests extends BaseApiClient {
  Future loginAsync() async {}

  Future<bool> signUpAsync(SignUpRequest request) async {
    var url = apiPaths[UserPaths.signUp.index];
    var resp = await makePostRequest(url!, request.toJson());

    if (resp == null) {
      return false;
    }

    if (resp.statusCode != 200) {
      return false;
    }

    return true;
  }
}
