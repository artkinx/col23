import 'package:flutter/material.dart';

const Color primaryColor = Color(0xFF7734CC);
const Color greyColor = Color(0xFFEFE7F9);
const Color greyColor2 = Color(0xFF8D8D8D);
const Color royalBlueColor = Color.fromRGBO(24, 2, 53, 0.9);

const String rememberMeText = "Remember Me";
const String forgotPassText = "Forgot Password";

enum UserPaths { login, signUp }

enum LoadingStates { idle, busy }

const String baseUrl = "https://klutherthon316.onrender.com";
Map<int, String> apiPaths = {
  0: "$baseUrl/api/login",
  1: "$baseUrl/api/signUp",
};

var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
