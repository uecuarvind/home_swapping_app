class ApiUrlConstants  {

  static const String defaultUserProfile = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZ0OTAqC4xVoXNE8eLYie4DDjlLgZZrwj2cB64su1Z9f5YuarNKHYM8WoOrdFxTqoYjVE&usqp=CAU';
  static const String errorImage = 'https://demofree.sirv.com/nope-not-here.jpg';
  static const String baseUrl = 'http://157.173.222.27:4000/api/v1/';
  static const String webSocket = 'ws://157.173.222.27:3008';
  //static const String baseUrlForGetMethodParams = 'server-php-8-2.technorizen.com';
  static const String baseUrlForGetMethodParams = '157.173.222.27:4000';
  static const String endPointOfLogin = '${baseUrl}user/auth/login';
  static const String endPointOfVerifyOtp = '${baseUrl}user/verify-otp';
  static const String endPointOfSignUp = '${baseUrl}user/auth/signup';
  static const String endPointOfAddHouse = '${baseUrl}house/add-house';
  static const String endPointOfGetHouses = '${baseUrl}house/get-all-houses';
  static const String endPointOfGetMyHouseDetails = '${baseUrl}house/get-house-details';
  static const String endPointOfUpdateHouseDetails = '${baseUrl}house/update-house-details';
  static const String endPointOfGetUser = '${baseUrl}user/';//get-user
  static const String endPointOfGetUserById = '${baseUrl}user/get-user-by-id';//get-user
  static const String endPointOfUpdateUserDetails = '${baseUrl}user/complete-profile';
  static const String endPointOfEditProfile = '${baseUrl}user/edit-profile';
  static const String endPointOfAddTravellerPartner = '${baseUrl}travelling-partner/add-partner';
  static const String endPointOfAddAvailableDate = '${baseUrl}house/add-available-date';
  static const String endPointOfGetAvailability = '${baseUrl}house/get-availability';
  static const String endPointOfGetHouseBooked = '${baseUrl}get-house-booked-dates';
  static const String endPointOfHouseDetails = '${baseUrl}house/house-details';
  static const String endPointOfHouseBook = '${baseUrl}house/book';
  static const String endPointOfAcceptBookingRequest = '${baseUrl}house/accept-booking-request';
  static const String endPointOfGetBookingRequest = '${baseUrl}house/get-booking-requests';
  static const String endPointOfGetYourBookings = '${baseUrl}house/get-your-bookings';
  static const String endPointOfGetHouseBookedDates = '${baseUrl}house/get-house-booked-dates';
  static const String endPointOfGetExpiring = '${baseUrl}house/get-expiring-houses';
}