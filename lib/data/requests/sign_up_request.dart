import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

part 'sign_up_request.gform.dart';

@Rf()
class SignUpRequest {
  String? firstname;
  String? lastname;
  String? email;
  String? password;
  String? confirmpassword;

  SignUpRequest(
      {@RfControl(validators: [RequiredValidator()]) this.firstname = '',
      @RfControl(validators: [RequiredValidator(), EmailValidator()])
      this.email = '',
      @RfControl(validators: [RequiredValidator()]) this.password = '',
      @RfControl(validators: [
        RequiredValidator(),
      ])
      this.confirmpassword = '',
      @RfControl(validators: [RequiredValidator()]) this.lastname = ''});

  SignUpRequest.fromJson(Map<String, dynamic> json) {
    firstname = json['fullname'];
    email = json['email'];
    password = json['password'];
    confirmpassword = json['confirmpassword'];
    lastname = json['lastname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fullname'] = "$lastname $firstname";
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}
