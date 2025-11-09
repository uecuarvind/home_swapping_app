import 'package:get/get.dart';

import '../../common/sharedAxisAnimation.dart';
import '../modules/all_amenities/bindings/all_amenities_binding.dart';
import '../modules/all_amenities/views/all_amenities_view.dart';
import '../modules/ary_passport/bindings/ary_passport_binding.dart';
import '../modules/ary_passport/views/ary_passport_view.dart';
import '../modules/booked_details/bindings/booked_details_binding.dart';
import '../modules/booked_details/views/booked_details_view.dart';
import '../modules/credit_system/bindings/credit_system_binding.dart';
import '../modules/credit_system/views/credit_system_view.dart';
import '../modules/credits/bindings/credits_binding.dart';
import '../modules/credits/views/credits_view.dart';
import '../modules/decribe_your_space/bindings/decribe_your_space_binding.dart';
import '../modules/decribe_your_space/views/decribe_your_space_view.dart';
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
import '../modules/features_space_have/bindings/features_space_have_binding.dart';
import '../modules/features_space_have/views/features_space_have_view.dart';
import '../modules/finding_homes/bindings/finding_homes_binding.dart';
import '../modules/finding_homes/views/finding_homes_view.dart';
import '../modules/first_like/bindings/first_like_binding.dart';
import '../modules/first_like/views/first_like_view.dart';
import '../modules/get_start/bindings/get_start_binding.dart';
import '../modules/get_start/views/get_start_view.dart';
import '../modules/have_safety_items/bindings/have_safety_items_binding.dart';
import '../modules/have_safety_items/views/have_safety_items_view.dart';
import '../modules/highlight_select_edit/bindings/highlight_select_edit_binding.dart';
import '../modules/highlight_select_edit/views/highlight_select_edit_view.dart';
import '../modules/highlight_select_media/bindings/highlight_select_media_binding.dart';
import '../modules/highlight_select_media/views/highlight_select_media_view.dart';
import '../modules/highlighte_real/bindings/highlighte_real_binding.dart';
import '../modules/highlighte_real/views/highlighte_real_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/host_review_request/bindings/host_review_request_binding.dart';
import '../modules/host_review_request/views/host_review_request_view.dart';
import '../modules/house_owner_details/bindings/house_owner_details_binding.dart';
import '../modules/house_owner_details/views/house_owner_details_view.dart';
import '../modules/house_rule/bindings/house_rule_binding.dart';
import '../modules/house_rule/views/house_rule_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/match_screen/bindings/match_screen_binding.dart';
import '../modules/match_screen/views/match_screen_view.dart';
import '../modules/my_space/bindings/my_space_binding.dart';
import '../modules/my_space/views/my_space_view.dart';
import '../modules/my_space_add_amenities/bindings/my_space_add_amenities_binding.dart';
import '../modules/my_space_add_amenities/views/my_space_add_amenities_view.dart';
import '../modules/my_space_add_features/bindings/my_space_add_features_binding.dart';
import '../modules/my_space_add_features/views/my_space_add_features_view.dart';
import '../modules/my_space_add_home_care/bindings/my_space_add_home_care_binding.dart';
import '../modules/my_space_add_home_care/views/my_space_add_home_care_view.dart';
import '../modules/my_space_add_house_rules/bindings/my_space_add_house_rules_binding.dart';
import '../modules/my_space_add_house_rules/views/my_space_add_house_rules_view.dart';
import '../modules/my_space_add_location/bindings/my_space_add_location_binding.dart';
import '../modules/my_space_add_location/views/my_space_add_location_view.dart';
import '../modules/my_space_add_question/bindings/my_space_add_question_binding.dart';
import '../modules/my_space_add_question/views/my_space_add_question_view.dart';
import '../modules/my_space_add_ready_to_travel/bindings/my_space_add_ready_to_travel_binding.dart';
import '../modules/my_space_add_ready_to_travel/views/my_space_add_ready_to_travel_view.dart';
import '../modules/my_travel_plan/bindings/my_travel_plan_binding.dart';
import '../modules/my_travel_plan/views/my_travel_plan_view.dart';
import '../modules/name_would_you_call/bindings/name_would_you_call_binding.dart';
import '../modules/name_would_you_call/views/name_would_you_call_view.dart';
import '../modules/nav_bar/bindings/nav_bar_binding.dart';
import '../modules/nav_bar/views/nav_bar_view.dart';
import '../modules/nextPage/bindings/next_page_binding.dart';
import '../modules/nextPage/views/next_page_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/profile_percentage/bindings/profile_percentage_binding.dart';
import '../modules/profile_percentage/views/profile_percentage_view.dart';
import '../modules/profile_setting/bindings/profile_setting_binding.dart';
import '../modules/profile_setting/views/profile_setting_view.dart';
import '../modules/request_accept/bindings/request_accept_binding.dart';
import '../modules/request_accept/views/request_accept_view.dart';
import '../modules/request_chat/bindings/request_chat_binding.dart';
import '../modules/request_chat/views/request_chat_view.dart';
import '../modules/request_details/bindings/request_details_binding.dart';
import '../modules/request_details/views/request_details_view.dart';
import '../modules/review_your_send_request/bindings/review_your_send_request_binding.dart';
import '../modules/review_your_send_request/views/review_your_send_request_view.dart';
import '../modules/sample_video/bindings/sample_video_binding.dart';
import '../modules/sample_video/views/sample_video_view.dart';
import '../modules/search_location/bindings/search_location_binding.dart';
import '../modules/search_location/views/search_location_view.dart';
import '../modules/select_location/bindings/select_location_binding.dart';
import '../modules/select_location/views/select_location_view.dart';
import '../modules/send_swap_offer/bindings/send_swap_offer_binding.dart';
import '../modules/send_swap_offer/views/send_swap_offer_view.dart';
import '../modules/send_swap_requesting/bindings/send_swap_requesting_binding.dart';
import '../modules/send_swap_requesting/views/send_swap_requesting_view.dart';
import '../modules/setting/bindings/setting_binding.dart';
import '../modules/setting/views/setting_view.dart';
import '../modules/share_space_tape/bindings/share_space_tape_binding.dart';
import '../modules/share_space_tape/views/share_space_tape_view.dart';
import '../modules/space_tape/bindings/space_tape_binding.dart';
import '../modules/space_tape/views/space_tape_view.dart';
import '../modules/space_tape_edit/bindings/space_tape_edit_binding.dart';
import '../modules/space_tape_edit/views/space_tape_edit_view.dart';
import '../modules/spaces_style/bindings/spaces_style_binding.dart';
import '../modules/spaces_style/views/spaces_style_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/spport_team/bindings/spport_team_binding.dart';
import '../modules/spport_team/views/spport_team_view.dart';
import '../modules/swap_stays/bindings/swap_stays_binding.dart';
import '../modules/swap_stays/views/swap_stays_view.dart';
import '../modules/tell_about_sapce/bindings/tell_about_sapce_binding.dart';
import '../modules/tell_about_sapce/views/tell_about_sapce_view.dart';
import '../modules/that_it/bindings/that_it_binding.dart';
import '../modules/that_it/views/that_it_view.dart';
import '../modules/traveler_profile_aboutUs/bindings/traveler_profile_about_us_binding.dart';
import '../modules/traveler_profile_aboutUs/views/traveler_profile_about_us_view.dart';
import '../modules/traveler_profile_complete/bindings/traveler_profile_complete_binding.dart';
import '../modules/traveler_profile_complete/views/traveler_profile_complete_view.dart';
import '../modules/traveler_profile_congratulation/bindings/traveler_profile_congratulation_binding.dart';
import '../modules/traveler_profile_congratulation/views/traveler_profile_congratulation_view.dart';
import '../modules/traveler_profile_dreamingGo/bindings/traveler_profile_dreaming_go_binding.dart';
import '../modules/traveler_profile_dreamingGo/views/traveler_profile_dreaming_go_view.dart';
import '../modules/traveler_profile_favorite_place/bindings/traveler_profile_favorite_place_binding.dart';
import '../modules/traveler_profile_favorite_place/views/traveler_profile_favorite_place_view.dart';
import '../modules/traveler_profile_language/bindings/traveler_profile_language_binding.dart';
import '../modules/traveler_profile_language/views/traveler_profile_language_view.dart';
import '../modules/traveler_profile_photo/bindings/traveler_profile_photo_binding.dart';
import '../modules/traveler_profile_photo/views/traveler_profile_photo_view.dart';
import '../modules/traveler_profile_pod/bindings/traveler_profile_pod_binding.dart';
import '../modules/traveler_profile_pod/views/traveler_profile_pod_view.dart';
import '../modules/traveler_profile_questions/bindings/traveler_profile_questions_binding.dart';
import '../modules/traveler_profile_questions/views/traveler_profile_questions_view.dart';
import '../modules/traveler_profile_travel_love/bindings/traveler_profile_travel_love_binding.dart';
import '../modules/traveler_profile_travel_love/views/traveler_profile_travel_love_view.dart';
import '../modules/trip/bindings/trip_binding.dart';
import '../modules/trip/views/trip_view.dart';
import '../modules/trip_request/bindings/trip_request_binding.dart';
import '../modules/trip_request/views/trip_request_view.dart';
import '../modules/trips/bindings/trips_binding.dart';
import '../modules/trips/views/trips_view.dart';
import '../modules/verification_code/bindings/verification_code_binding.dart';
import '../modules/verification_code/views/verification_code_view.dart';
import '../modules/want_to_share_space/bindings/want_to_share_space_binding.dart';
import '../modules/want_to_share_space/views/want_to_share_space_view.dart';
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
    GetPage(
      name: _Paths.DECRIBE_YOUR_SPACE,
      page: () => const DecribeYourSpaceView(),
      binding: DecribeYourSpaceBinding(),
    ),
    GetPage(
      name: _Paths.WANT_TO_SHARE_SPACE,
      page: () => const WantToShareSpaceView(),
      binding: WantToShareSpaceBinding(),
    ),
    GetPage(
      name: _Paths.TELL_ABOUT_SAPCE,
      page: () => const TellAboutSapceView(),
      binding: TellAboutSapceBinding(),
      //transition: Transition.downToUp,
      // transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: _Paths.FEATURES_SPACE_HAVE,
      page: () => const FeaturesSpaceHaveView(),
      binding: FeaturesSpaceHaveBinding(),
    ),
    GetPage(
      name: _Paths.HAVE_SAFETY_ITEMS,
      page: () => const HaveSafetyItemsView(),
      binding: HaveSafetyItemsBinding(),
    ),
    GetPage(
      name: _Paths.SPACES_STYLE,
      page: () => const SpacesStyleView(),
      binding: SpacesStyleBinding(),
    ),
    GetPage(
      name: _Paths.MY_SPACE_ADD_LOCATION,
      page: () => const MySpaceAddLocationView(),
      binding: MySpaceAddLocationBinding(),
    ),
    GetPage(
      name: _Paths.MY_SPACE_ADD_QUESTION,
      page: () => const MySpaceAddQuestionView(),
      binding: MySpaceAddQuestionBinding(),
    ),
    GetPage(
      name: _Paths.MY_SPACE_ADD_AMENITIES,
      page: () => const MySpaceAddAmenitiesView(),
      binding: MySpaceAddAmenitiesBinding(),
    ),
    GetPage(
      name: _Paths.MY_SPACE_ADD_HOUSE_RULES,
      page: () => const MySpaceAddHouseRulesView(),
      binding: MySpaceAddHouseRulesBinding(),
    ),
    GetPage(
      name: _Paths.MY_SPACE_ADD_HOME_CARE,
      page: () => const MySpaceAddHomeCareView(),
      binding: MySpaceAddHomeCareBinding(),
    ),
    GetPage(
      name: _Paths.SETTING,
      page: () => const SettingView(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: _Paths.MY_SPACE_ADD_READY_TO_TRAVEL,
      page: () => const MySpaceAddReadyToTravelView(),
      binding: MySpaceAddReadyToTravelBinding(),
    ),
    GetPage(
      name: _Paths.SPPORT_TEAM,
      page: () => const SpportTeamView(),
      binding: SpportTeamBinding(),
    ),
    GetPage(
      name: _Paths.FIRST_LIKE,
      page: () => const FirstLikeView(),
      binding: FirstLikeBinding(),
    ),
    GetPage(
      name: _Paths.MATCH_SCREEN,
      page: () => const MatchScreenView(),
      binding: MatchScreenBinding(),
    ),
    GetPage(
      name: _Paths.SEND_SWAP_OFFER,
      page: () => const SendSwapOfferView(),
      binding: SendSwapOfferBinding(),
    ),
    GetPage(
      name: _Paths.TRAVELER_PROFILE_PHOTO,
      page: () => const TravelerProfilePhotoView(),
      binding: TravelerProfilePhotoBinding(),
    ),
    GetPage(
      name: _Paths.TRAVELER_PROFILE_POD,
      page: () => const TravelerProfilePodView(),
      binding: TravelerProfilePodBinding(),
    ),
    GetPage(
      name: _Paths.SEND_SWAP_REQUESTING,
      page: () => const SendSwapRequestingView(),
      binding: SendSwapRequestingBinding(),
    ),
    GetPage(
      name: _Paths.REQUEST_ACCEPT,
      page: () => const RequestAcceptView(),
      binding: RequestAcceptBinding(),
    ),
    GetPage(
      name: _Paths.REQUEST_DETAILS,
      page: () => const RequestDetailsView(),
      binding: RequestDetailsBinding(),
    ),
    GetPage(
      name: _Paths.REQUEST_CHAT,
      page: () => const RequestChatView(),
      binding: RequestChatBinding(),
    ),
    GetPage(
      name: _Paths.TRAVELER_PROFILE_ABOUT_US,
      page: () => const TravelerProfileAboutUsView(),
      binding: TravelerProfileAboutUsBinding(),
    ),
    GetPage(
      name: _Paths.TRAVELER_PROFILE_QUESTIONS,
      page: () => const TravelerProfileQuestionsView(),
      binding: TravelerProfileQuestionsBinding(),
    ),
    GetPage(
      name: _Paths.TRAVELER_PROFILE_TRAVEL_LOVE,
      page: () => const TravelerProfileTravelLoveView(),
      binding: TravelerProfileTravelLoveBinding(),
    ),
    GetPage(
      name: _Paths.TRAVELER_PROFILE_LANGUAGE,
      page: () => const TravelerProfileLanguageView(),
      binding: TravelerProfileLanguageBinding(),
    ),
    GetPage(
      name: _Paths.TRAVELER_PROFILE_DREAMING_GO,
      page: () => const TravelerProfileDreamingGoView(),
      binding: TravelerProfileDreamingGoBinding(),
    ),
    GetPage(
      name: _Paths.TRAVELER_PROFILE_COMPLETE,
      page: () => const TravelerProfileCompleteView(),
      binding: TravelerProfileCompleteBinding(),
    ),
    GetPage(
      name: _Paths.TRAVELER_PROFILE_CONGRATULATION,
      page: () => const TravelerProfileCongratulationView(),
      binding: TravelerProfileCongratulationBinding(),
    ),
    GetPage(
      name: _Paths.TRAVELER_PROFILE_FAVORITE_PLACE,
      page: () => const TravelerProfileFavoritePlaceView(),
      binding: TravelerProfileFavoritePlaceBinding(),
    ),
    GetPage(
      name: _Paths.REVIEW_YOUR_SEND_REQUEST,
      page: () => const ReviewYourSendRequestView(),
      binding: ReviewYourSendRequestBinding(),
    ),
    GetPage(
      name: _Paths.CREDITS,
      page: () => const CreditsView(),
      binding: CreditsBinding(),
    ),
    GetPage(
      name: _Paths.SPACE_TAPE,
      page: () => const SpaceTapeView(),
      binding: SpaceTapeBinding(),
    ),
    GetPage(
      name: _Paths.SPACE_TAPE_EDIT,
      page: () => const SpaceTapeEditView(),
      binding: SpaceTapeEditBinding(),
    ),
    GetPage(
      name: _Paths.HOUSE_OWNER_DETAILS,
      page: () => const HouseOwnerDetailsView(),
      binding: HouseOwnerDetailsBinding(),
    ),
    GetPage(
      name: _Paths.HOST_REVIEW_REQUEST,
      page: () => const HostReviewRequestView(),
      binding: HostReviewRequestBinding(),
    ),
    GetPage(
      name: _Paths.BOOKED_DETAILS,
      page: () => const BookedDetailsView(),
      binding: BookedDetailsBinding(),
    ),
    GetPage(
      name: _Paths.TRIP,
      page: () => const TripView(),
      binding: TripBinding(),
    ),
    GetPage(
      name: _Paths.NAME_WOULD_YOU_CALL,
      page: () => const NameWouldYouCallView(),
      binding: NameWouldYouCallBinding(),
      transition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: _Paths.MY_SPACE_ADD_FEATURES,
      page: () => const MySpaceAddFeaturesView(),
      binding: MySpaceAddFeaturesBinding(),
      customTransition: SharedAxisCustomTransition(),
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: _Paths.THAT_IT,
      page: () => const ThatItView(),
      binding: ThatItBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_PERCENTAGE,
      page: () => const ProfilePercentageView(),
      binding: ProfilePercentageBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH_LOCATION,
      page: () => const SearchLocationView(),
      binding: SearchLocationBinding(),
    ),
  ];
}
