import 'package:get/get.dart';
import 'package:smart_city/view/screen/auth/login.dart';
import 'package:smart_city/view/screen/auth/signup.dart';
import 'package:smart_city/view/screen/onbaording.dart';
import 'package:smart_city/view/screen/pages/event/eventpage.dart';
import 'package:smart_city/view/screen/pages/homepage.dart';
import 'package:smart_city/view/screen/pages/hotel/hotel.dart';
import 'package:smart_city/view/screen/pages/hotel/hotel_details.dart';
import 'package:smart_city/view/screen/pages/mainPage.dart';
import 'package:smart_city/view/screen/pages/plan_page.dart';
import 'controller/auth/logincontroller.dart';
import 'controller/auth/signupcontroller.dart';
import 'controller/onbaordingcontroller.dart';
import 'core/constant/approutes.dart';
import 'core/middleware/Appmiddleware.dart';

List<GetPage<dynamic>>? getPages = [
  // GetPage(
  //     name: "/",
  //     page: () => VerifyCodeSignup(),
  //     binding: BindingsBuilder.put(() => VerifyCodeSignupController())),
  GetPage(
      name: "/",
      page: () => Onbaording(),
      binding: BindingsBuilder.put(() => OnbaordingController()),
      middlewares: [AppMiddleware()]),
  // GetPage(
  //     name: AppRoutes.onbaording,
  //     page: () => Onbaording(),
  //     binding: BindingsBuilder.put(() => OnbaordingController())),
  GetPage(
      name: AppRoutes.login,
      page: () => Login(),
      binding: BindingsBuilder.put(() => LoginController())),
  GetPage(
      name: AppRoutes.signup,
      page: () => SignUp(),
      binding: BindingsBuilder.put(() => SignUpController())),
  GetPage(name: AppRoutes.home, page: () => MainPage()),
  GetPage(name: AppRoutes.hotel,  page: () => HotelPage(),),
  GetPage(name: AppRoutes.event,  page: () => EventPage(),),
  GetPage(name: AppRoutes.hotelDetails,  page: () => HotelDetails(),),
  GetPage(name: AppRoutes.plan,  page: () => TripItineraryPage(),)
];
