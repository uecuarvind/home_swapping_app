import 'package:get/get.dart';

import '../modules/all_amenities/bindings/all_amenities_binding.dart';
import '../modules/all_amenities/views/all_amenities_view.dart';
import '../modules/ary_passport/bindings/ary_passport_binding.dart';
import '../modules/ary_passport/views/ary_passport_view.dart';
import '../modules/credit_system/bindings/credit_system_binding.dart';
import '../modules/credit_system/views/credit_system_view.dart';
import '../modules/edit_about_me/bindings/edit_about_me_binding.dart';
import '../modules/edit_about_me/views/edit_about_me_view.dart';
import '../modules/edit_dream_destinations/bindings/edit_dream_destinations_binding.dart';
import '../modules/edit_dream_destinations/views/edit_dream_destinations_view.dart';
import '../modules/edit_favorite_destinations/bindings/edit_favorite_destinations_binding.dart';
import '../modules/edit_favorite_destinations/views/edit_favorite_destinations_view.dart';
import '../modules/edit_language/bindings/edit_language_binding.dart';
import '../modules/edit_language/views/edit_language_view.dart';
import '../modules/edit_my_profile/bindings/edit_my_profile_binding.dart';
import '../modules/edit_my_profile/views/edit_my_profile_view.dart';
import '../modules/edit_my_space_basic/bindings/edit_my_space_basic_binding.dart';
import '../modules/edit_my_space_basic/views/edit_my_space_basic_view.dart';
import '../modules/edit_my_space_essential/bindings/edit_my_space_essential_binding.dart';
import '../modules/edit_my_space_essential/views/edit_my_space_essential_view.dart';
import '../modules/edit_my_space_location/bindings/edit_my_space_location_binding.dart';
import '../modules/edit_my_space_location/views/edit_my_space_location_view.dart';
import '../modules/edit_my_space_question/bindings/edit_my_space_question_binding.dart';
import '../modules/edit_my_space_question/views/edit_my_space_question_view.dart';
import '../modules/edit_my_space_rules/bindings/edit_my_space_rules_binding.dart';
import '../modules/edit_my_space_rules/views/edit_my_space_rules_view.dart';
import '../modules/edit_pod/bindings/edit_pod_binding.dart';
import '../modules/edit_pod/views/edit_pod_view.dart';
import '../modules/edit_share_space_tape/bindings/edit_share_space_tape_binding.dart';
import '../modules/edit_share_space_tape/views/edit_share_space_tape_view.dart';
import '../modules/edit_travel_interest/bindings/edit_travel_interest_binding.dart';
import '../modules/edit_travel_interest/views/edit_travel_interest_view.dart';
import '../modules/edit_travel_question/bindings/edit_travel_question_binding.dart';
import '../modules/edit_travel_question/views/edit_travel_question_view.dart';
import '../modules/explore/bindings/explore_binding.dart';
import '../modules/explore/views/explore_view.dart';
import '../modules/finding_homes/bindings/finding_homes_binding.dart';
import '../modules/finding_homes/views/finding_homes_view.dart';
import '../modules/get_start/bindings/get_start_binding.dart';
import '../modules/get_start/views/get_start_view.dart';
import '../modules/highlight_select_edit/bindings/highlight_select_edit_binding.dart';
import '../modules/highlight_select_edit/views/highlight_select_edit_view.dart';
import '../modules/highlight_select_media/bindings/highlight_select_media_binding.dart';
import '../modules/highlight_select_media/views/highlight_select_media_view.dart';
import '../modules/highlighte_real/bindings/highlighte_real_binding.dart';
import '../modules/highlighte_real/views/highlighte_real_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/house_rule/bindings/house_rule_binding.dart';
import '../modules/house_rule/views/house_rule_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/my_space/bindings/my_space_binding.dart';
import '../modules/my_space/views/my_space_view.dart';
import '../modules/my_travel_plan/bindings/my_travel_plan_binding.dart';
import '../modules/my_travel_plan/views/my_travel_plan_view.dart';
import '../modules/nav_bar/bindings/nav_bar_binding.dart';
import '../modules/nav_bar/views/nav_bar_view.dart';
import '../modules/nextPage/bindings/next_page_binding.dart';
import '../modules/nextPage/views/next_page_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/profile_setting/bindings/profile_setting_binding.dart';
import '../modules/profile_setting/views/profile_setting_view.dart';
import '../modules/sample_video/bindings/sample_video_binding.dart';
import '../modules/sample_video/views/sample_video_view.dart';
import '../modules/select_location/bindings/select_location_binding.dart';
import '../modules/select_location/views/select_location_view.dart';
import '../modules/share_space_tape/bindings/share_space_tape_binding.dart';
import '../modules/share_space_tape/views/share_space_tape_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/swap_stays/bindings/swap_stays_binding.dart';
import '../modules/swap_stays/views/swap_stays_view.dart';
import '../modules/trip_request/bindings/trip_request_binding.dart';
import '../modules/trip_request/views/trip_request_view.dart';
import '../modules/trips/bindings/trips_binding.dart';
import '../modules/trips/views/trips_view.dart';
import '../modules/verification_code/bindings/verification_code_binding.dart';
import '../modules/verification_code/views/verification_code_view.dart';
import '../modules/welcome/bindings/welcome_binding.dart';
import '../modules/welcome/views/welcome_view.dart';
import '../modules/your_name/bindings/your_name_binding.dart';
import '../modules/your_name/views/your_name_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.GET_START,
      page: () => const GetStartView(),
      binding: GetStartBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.VERIFICATION_CODE,
      page: () => const VerificationCodeView(),
      binding: VerificationCodeBinding(),
    ),
    GetPage(
      name: _Paths.YOUR_NAME,
      page: () => const YourNameView(),
      binding: YourNameBinding(),
    ),
    GetPage(
      name: _Paths.ARY_PASSPORT,
      page: () => const AryPassportView(),
      binding: AryPassportBinding(),
    ),
    GetPage(
      name: _Paths.HIGHLIGHTE_REAL,
      page: () => const HighlighteRealView(),
      binding: HighlighteRealBinding(),
    ),
    GetPage(
      name: _Paths.HOUSE_RULE,
      page: () => const HouseRuleView(),
      binding: HouseRuleBinding(),
    ),
    GetPage(
      name: _Paths.HIGHLIGHT_SELECT_MEDIA,
      page: () => const HighlightSelectMediaView(),
      binding: HighlightSelectMediaBinding(),
    ),
    GetPage(
      name: _Paths.SHARE_SPACE_TAPE,
      page: () => const ShareSpaceTapeView(),
      binding: ShareSpaceTapeBinding(),
    ),
    GetPage(
      name: _Paths.HIGHLIGHT_SELECT_EDIT,
      page: () => const HighlightSelectEditView(),
      binding: HighlightSelectEditBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_SHARE_SPACE_TAPE,
      page: () => const EditShareSpaceTapeView(),
      binding: EditShareSpaceTapeBinding(),
    ),
    GetPage(
      name: _Paths.NAV_BAR,
      page: () => const NavBarView(),
      binding: NavBarBinding(),
    ),
    GetPage(
      name: _Paths.EXPLORE,
      page: () => const ExploreView(),
      binding: ExploreBinding(),
    ),
    GetPage(
      name: _Paths.TRIPS,
      page: () => const TripsView(),
      binding: TripsBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.WELCOME,
      page: () => const WelcomeView(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: _Paths.SWAP_STAYS,
      page: () => const SwapStaysView(),
      binding: SwapStaysBinding(),
    ),
    GetPage(
      name: _Paths.SELECT_LOCATION,
      page: () => const SelectLocationView(),
      binding: SelectLocationBinding(),
    ),
    GetPage(
      name: _Paths.CREDIT_SYSTEM,
      page: () => const CreditSystemView(),
      binding: CreditSystemBinding(),
    ),
    GetPage(
      name: _Paths.FINDING_HOMES,
      page: () => const FindingHomesView(),
      binding: FindingHomesBinding(),
    ),
    GetPage(
      name: _Paths.ALL_AMENITIES,
      page: () => const AllAmenitiesView(),
      binding: AllAmenitiesBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.NEXT_PAGE,
      page: () => const NextPageView(),
      binding: NextPageBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_SETTING,
      page: () => const ProfileSettingView(),
      binding: ProfileSettingBinding(),
    ),
    GetPage(
      name: _Paths.MY_TRAVEL_PLAN,
      page: () => const MyTravelPlanView(),
      binding: MyTravelPlanBinding(),
    ),
    GetPage(
      name: _Paths.MY_SPACE,
      page: () => const MySpaceView(),
      binding: MySpaceBinding(),
    ),
    GetPage(
      name: _Paths.SAMPLE_VIDEO,
      page: () => const SampleVideoView(),
      binding: SampleVideoBinding(),
    ),
    GetPage(
      name: _Paths.TRIP_REQUEST,
      page: () => const TripRequestView(),
      binding: TripRequestBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_MY_PROFILE,
      page: () => const EditMyProfileView(),
      binding: EditMyProfileBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_ABOUT_ME,
      page: () => const EditAboutMeView(),
      binding: EditAboutMeBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_POD,
      page: () => const EditPodView(),
      binding: EditPodBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_TRAVEL_QUESTION,
      page: () => const EditTravelQuestionView(),
      binding: EditTravelQuestionBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_TRAVEL_INTEREST,
      page: () => const EditTravelInterestView(),
      binding: EditTravelInterestBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_LANGUAGE,
      page: () => const EditLanguageView(),
      binding: EditLanguageBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_DREAM_DESTINATIONS,
      page: () => const EditDreamDestinationsView(),
      binding: EditDreamDestinationsBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_FAVORITE_DESTINATIONS,
      page: () => const EditFavoriteDestinationsView(),
      binding: EditFavoriteDestinationsBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_MY_SPACE_BASIC,
      page: () => const EditMySpaceBasicView(),
      binding: EditMySpaceBasicBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_MY_SPACE_ESSENTIAL,
      page: () => const EditMySpaceEssentialView(),
      binding: EditMySpaceEssentialBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_MY_SPACE_LOCATION,
      page: () => const EditMySpaceLocationView(),
      binding: EditMySpaceLocationBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_MY_SPACE_QUESTION,
      page: () => const EditMySpaceQuestionView(),
      binding: EditMySpaceQuestionBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_MY_SPACE_RULES,
      page: () => const EditMySpaceRulesView(),
      binding: EditMySpaceRulesBinding(),
    ),
  ];
}
