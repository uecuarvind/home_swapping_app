import 'dart:io';
import 'dart:convert';
import 'package:home_swipping/app/data/api_models/add_availability_model.dart';
import 'package:home_swipping/app/data/api_models/get_all_house.dart';
import 'package:home_swipping/app/data/api_models/get_simple_response_model.dart';
import 'package:home_swipping/app/data/api_models/get_user_model.dart';
import 'package:home_swipping/app/data/api_models/my_house_model.dart';
import 'package:home_swipping/app/data/api_models/send_otp_model.dart';
import 'package:http/http.dart' as http;

import '../../../../common/http_methods.dart';
import '../api_constants/api_url_constants.dart';
import '../api_models/get_book_date_model.dart';
import '../api_models/get_booking_model.dart';
import '../api_models/get_house_detail.dart';
import '../api_models/login_model.dart';
import '../api_models/update_my_house_model.dart';


class ApiMethods{
  ///  Login api....
  static Future<Send0tpModel?> loginApi({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    Send0tpModel? send0tpModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
        url: ApiUrlConstants.endPointOfLogin,
      checkResponse: checkResponse,
    );
    if (response != null) {
      send0tpModel = Send0tpModel.fromJson(jsonDecode(response.body));
      return send0tpModel;
    }
    return null;
  }
  /// Forgot Password ...
 /* static Future<SendOtpModel?> forgotPasswordApi({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    SendOtpModel? sendOtpModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfForgotPassword,
      checkResponse: checkResponse,
    );
    if (response != null) {
      sendOtpModel = SendOtpModel.fromJson(jsonDecode(response.body));
      return sendOtpModel;
    }
    return null;
  }  */

/// Verify Otp for Login....
  static Future<UserModel?> verifyOtpApi({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    UserModel? signUpModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfVerifyOtp,
      checkResponse: checkResponse,
    );
    if (response != null) {
      print(response.body);
      signUpModel = UserModel.fromJson(jsonDecode(response.body));
      return signUpModel;
    }
    return null;
  }


  ///Add Personal Details api
  static Future<UserModel?> singUpApi({
    void Function(int)? checkResponse,
    Map<String, String>? bodyParams,
    File? image,
  }) async {
    UserModel? userModel;
    http.Response? response = await MyHttp.multipart(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfSignUp,
      image: image,
      imageKey: 'image',
      checkResponse: checkResponse,
    );
    if (response != null) {
      print('Response>>>${response.body}');
      userModel = UserModel.fromJson(jsonDecode(response.body));
      return userModel;
    }
    return null;
  }

  ///Add House api
  static Future<SimpleResponseModel?> addHouseApi({
    void Function(int)? checkResponse,
    Map<String, String>? bodyParams,
    List<File>? images
  }) async {
    SimpleResponseModel? simpleModel;
    http.Response? response = await MyHttp.multipart(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfAddHouse,

      images: images,
      imageKey: 'house_images',
      checkResponse: checkResponse,
    );
    if (response != null) {
      print('Response:-'+response.body.toString());
      simpleModel = SimpleResponseModel.fromJson(jsonDecode(response.body));
      return simpleModel;
    }
    return null;
  }

  static Future<AllHouseModel?> getAllHousesApi({
    void Function(int)? checkResponse,
  }) async {
    AllHouseModel? allHouseModel;
    http.Response? response = await MyHttp.getMethod(
      url: ApiUrlConstants.endPointOfGetHouses,
      checkResponse: checkResponse,
    );
    if (response != null) {
      allHouseModel = AllHouseModel.fromJson(jsonDecode(response.body));
      return allHouseModel;
    }
    return null;
  }

  /// Get My House api
  static Future<MyHouseModel?> getMyHousesApi({
    void Function(int)? checkResponse,
  }) async {
    MyHouseModel? myHouseModel;
    http.Response? response = await MyHttp.getMethod(
      url: ApiUrlConstants.endPointOfGetMyHouseDetails,
      checkResponse: checkResponse,
    );
    if (response != null) {
      myHouseModel = MyHouseModel.fromJson(jsonDecode(response.body));
      return myHouseModel;
    }
    return null;
  }

  /// Update My House Details api
  static Future<MyHouseModel?> updateHousesDetailApi({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    MyHouseModel? updateMyHouseModel;
    http.Response? response = await MyHttp.postMethod(
      url: ApiUrlConstants.endPointOfUpdateHouseDetails,
      bodyParams: bodyParams,
      checkResponse: checkResponse,
    );
    if (response != null) {
      updateMyHouseModel = MyHouseModel.fromJson(jsonDecode(response.body));
      return updateMyHouseModel;
    }
    return null;
  }

  /// Get User Profile api
  static Future<GetUserModel?> getUserProfileApi({
    void Function(int)? checkResponse,
  }) async {
    GetUserModel? getUserModel;
    http.Response? response = await MyHttp.getMethod(
      url: ApiUrlConstants.endPointOfGetUser,
      checkResponse: checkResponse,
    );
    if (response != null) {
      getUserModel = GetUserModel.fromJson(jsonDecode(response.body));
      return getUserModel;
    }
    return null;
  }
  /// Get House Owner Details api
  static Future<GetUserModel?> getHouseOwnerDetailsApi({
    void Function(int)? checkResponse,
    required String userId
  }) async {
    GetUserModel? getUserModel;
    http.Response? response = await MyHttp.getMethod(
      url: '${ApiUrlConstants.endPointOfGetUserById}/$userId',
      checkResponse: checkResponse,
    );
    if (response != null) {
      getUserModel = GetUserModel.fromJson(jsonDecode(response.body));
      return getUserModel;
    }
    return null;
  }

  /// Update User Details api
  static Future<GetUserModel?> updateUserDetailApi({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    GetUserModel? userModel;
    http.Response? response = await MyHttp.postMethod(
      url: ApiUrlConstants.endPointOfUpdateUserDetails,
      bodyParams: bodyParams,
      checkResponse: checkResponse,
    );
    if (response != null) {
      userModel = GetUserModel.fromJson(jsonDecode(response.body));
      return userModel;
    }
    return null;
  }


  ///Add Traveler Partner api
  static Future<SimpleResponseModel?> addTravelerPartnerApi({
    void Function(int)? checkResponse,
    Map<String, String>? bodyParams,
    File? image,
  }) async {
    SimpleResponseModel? simpleResponseModel;
    http.Response? response = await MyHttp.multipart(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfAddTravellerPartner,
      image: image,
      imageKey: 'image',
      checkResponse: checkResponse,
    );
    if (response != null) {
      print('Response>>>${response.body}');
      simpleResponseModel = SimpleResponseModel.fromJson(jsonDecode(response.body));
      return simpleResponseModel;
    }
    return null;
  }

  ///Update user profile image api
  static Future<GetUserModel?> updateUserProfileApi({
    void Function(int)? checkResponse,
    Map<String, String>? bodyParams,
    File? image,
  }) async {
    GetUserModel? userModel;
    http.Response? response = await MyHttp.multipart(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfEditProfile,
      image: image,
      imageKey: 'image',
      checkResponse: checkResponse,
    );
    if (response != null) {
      print('Response>>>${response.body}');
      userModel = GetUserModel.fromJson(jsonDecode(response.body));
      return userModel;
    }
    return null;
  }





  /// Get All Property api....
  static Future<AddAvailablityModel?> addAvailabilityApi({
    void Function(int)? checkResponse,
    required String houseId,
    Map<String, dynamic>? bodyParams,
  }) async {
    AddAvailablityModel? propertyModel;
    http.Response? response = await MyHttp.postMethod(
      url: '${ApiUrlConstants.endPointOfAddAvailableDate}/$houseId',
      bodyParams: bodyParams,
      checkResponse: checkResponse,
    );
    if (response != null) {
      propertyModel = AddAvailablityModel.fromJson(jsonDecode(response.body));
      return propertyModel;
    }
    return null;
  }

  /// Get All Property api....
  static Future<AddAvailablityModel?> getAvailabilityApi({
    void Function(int)? checkResponse,
    required String houseId,
  }) async {
    AddAvailablityModel? propertyModel;
    http.Response? response = await MyHttp.getMethod(
      url: '${ApiUrlConstants.endPointOfGetAvailability}/$houseId',
      checkResponse: checkResponse,
    );
    if (response != null) {
      propertyModel = AddAvailablityModel.fromJson(jsonDecode(response.body));
      return propertyModel;
    }
    return null;
  }

  /// Get House Booked Dates api....
  static Future<AddAvailablityModel?> getHouseBookedDatesApi({
    void Function(int)? checkResponse,
    required String houseId,
    required String month,
    required String year,
  }) async {
    AddAvailablityModel? propertyModel;
    http.Response? response = await MyHttp.getMethod(
      url: '${ApiUrlConstants.endPointOfGetHouseBooked}/$houseId/$month/$year',
      checkResponse: checkResponse,
    );
    if (response != null) {
      propertyModel = AddAvailablityModel.fromJson(jsonDecode(response.body));
      return propertyModel;
    }
    return null;
  }


  /// House details api....
  static Future<HouseDetailModel?> houseDetailsApi({
    void Function(int)? checkResponse,
    required String houseId,
  }) async {
    HouseDetailModel? houseDetailModel;
    http.Response? response = await MyHttp.getMethod(
      url: '${ApiUrlConstants.endPointOfHouseDetails}/$houseId',

      checkResponse: checkResponse,
    );
    if (response != null) {
      houseDetailModel = HouseDetailModel.fromJson(jsonDecode(response.body));
      return houseDetailModel;
    }
    return null;
  }


   /// Send SwapStay Request api....
  static Future<GetBookingModel?> sendStaySwapRequestApi({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
    required String houseId,
  }) async {
    GetBookingModel? getBookingModel;
    http.Response? response = await MyHttp.postMethod(
      url: '${ApiUrlConstants.endPointOfHouseBook}/$houseId',
      bodyParams: bodyParams,
      checkResponse: checkResponse,
    );
    if (response != null) {
      getBookingModel = GetBookingModel.fromJson(jsonDecode(response.body));
      return getBookingModel;
    }
    return null;
  }

  /// Send SwapStay Request api....
  static Future<SimpleResponseModel?> acceptRequestApi({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams
  }) async {
    SimpleResponseModel? simpleResponseModel;
    http.Response? response = await MyHttp.postMethod(
      url: ApiUrlConstants.endPointOfAcceptBookingRequest,
      bodyParams: bodyParams,
      checkResponse: checkResponse,
    );
    if (response != null) {
      simpleResponseModel = SimpleResponseModel.fromJson(jsonDecode(response.body));
      return simpleResponseModel;
    }
    return null;
  }

  ///Get Booking request api...
  static Future<GetBookingModel?> getHostingBookListApi({
    void Function(int)? checkResponse,
    Map<String, String>? bodyParams,
    File? image,
  }) async {
    GetBookingModel? simpleModel;
    http.Response? response = await MyHttp.getMethod(
      url: ApiUrlConstants.endPointOfGetBookingRequest,
      checkResponse: checkResponse,
    );
    if (response != null) {
      simpleModel = GetBookingModel.fromJson(jsonDecode(response.body));
      return simpleModel;
    }
    return null;
  }

  ///Get Your Booking request api...
  static Future<GetBookingModel?> getYourBookListApi({
    void Function(int)? checkResponse,

  }) async {
    GetBookingModel? getYourBookingModel;
    http.Response? response = await MyHttp.getMethod(
      url: ApiUrlConstants.endPointOfGetYourBookings,
      checkResponse: checkResponse,
    );
    if (response != null) {
      getYourBookingModel = GetBookingModel.fromJson(jsonDecode(response.body));
      return getYourBookingModel;
    }
    return null;
  }

  ///Get Your Booking request api...
  static Future<BookedDateModel?> getBookedDateApi({
    void Function(int)? checkResponse,
    required String houseId,
    required String month,
    required String year,
  }) async {
    BookedDateModel? bookedDateModel;
    http.Response? response = await MyHttp.getMethod(
      url: '${ApiUrlConstants.endPointOfGetHouseBookedDates}/$houseId/$month/$year',
      checkResponse: checkResponse,
    );
    if (response != null) {
      bookedDateModel = BookedDateModel.fromJson(jsonDecode(response.body));
      return bookedDateModel;
    }
    return null;
  }

  /// Get all expiring houses....
  static Future<AllHouseModel?> getAllExpiringHousesApi({
    void Function(int)? checkResponse,
  }) async {
    AllHouseModel? allHouseModel;
    http.Response? response = await MyHttp.getMethod(
      url: ApiUrlConstants.endPointOfGetExpiring,
      checkResponse: checkResponse,
    );
    if (response != null) {
      allHouseModel = AllHouseModel.fromJson(jsonDecode(response.body));
      return allHouseModel;
    }
    return null;
  }


}