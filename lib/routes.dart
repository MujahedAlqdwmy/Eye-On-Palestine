import 'package:eye_on_palestine/view/screens/admin/courses/add_course_screen.dart';
import 'package:eye_on_palestine/view/screens/admin/courses/add_episode_screen.dart';
import 'package:eye_on_palestine/view/screens/admin/courses/courses_admin_screen.dart';
import 'package:eye_on_palestine/view/screens/admin/courses/update_delete_course_screen.dart';
import 'package:eye_on_palestine/view/screens/admin/courses/update_delete_episode_screen.dart';
import 'package:eye_on_palestine/view/screens/admin/events/add_event_screen.dart';
import 'package:eye_on_palestine/view/screens/admin/events/events_admin_screen.dart';
import 'package:eye_on_palestine/view/screens/admin/events/update_delete_event_screen.dart';
import 'package:eye_on_palestine/view/screens/admin/story_admin_screen.dart';
import 'package:eye_on_palestine/view/screens/no_internet_screen.dart';
import 'package:eye_on_palestine/view/screens/splash_screen.dart';
import 'package:get/get.dart';

import 'package:eye_on_palestine/view/screens/admin/admin_screen.dart';
import 'package:eye_on_palestine/view/screens/admin/feedbacks_admin_screen.dart';
import 'package:eye_on_palestine/view/screens/admin/hashemite/add_king_screen.dart';
import 'package:eye_on_palestine/view/screens/admin/hashemite/hashemite_admin_screen.dart';
import 'package:eye_on_palestine/view/screens/admin/hashemite/update_delete_king_screen.dart';
import 'package:eye_on_palestine/view/screens/courses/course_episods_screen.dart';
import 'package:eye_on_palestine/view/screens/courses/course_screen.dart';
import 'package:eye_on_palestine/view/screens/courses/episode_screen.dart';
import 'package:eye_on_palestine/view/screens/hashemite/hashemite_king_screen.dart';
import 'package:eye_on_palestine/view/screens/profile/my_account_screen.dart';
import 'package:eye_on_palestine/view/screens/profile/my_courses_screen.dart';
import 'package:eye_on_palestine/core/constants/app_routs.dart';
import 'package:eye_on_palestine/core/middleware/log_in_middleware.dart';
import 'package:eye_on_palestine/view/screens/auth/forget_password.dart';
import 'package:eye_on_palestine/view/screens/auth/sign_in.dart';
import 'package:eye_on_palestine/view/screens/auth/sign_up.dart';
import 'package:eye_on_palestine/view/screens/auth/success_forget_pass.dart';
import 'package:eye_on_palestine/view/screens/auth/success_sign_up.dart';
import 'package:eye_on_palestine/view/screens/home_screen.dart';

List<GetPage<dynamic>>? routs = [
  GetPage(
    name: '/',
    page: () => const SplashScreen(),
  ),

  GetPage(
    name: AppRouts.noInternetScreen,
    page: () => const NoInternetScreen(),
  ),

  GetPage(
    name: AppRouts.signIn,
    page: () => const SignIn(),
    middlewares: [LogInMeddleware()],
  ),
  GetPage(name: AppRouts.signUp, page: () => const SignUp()),
  GetPage(name: AppRouts.successSignUp, page: () => const SuccessSignUp()),
  GetPage(name: AppRouts.forgetPassword, page: () => const ForgetPassword()),
  GetPage(
    name: AppRouts.successForgetPassword,
    page: () => const SuccessForgetPassword(),
  ),
  GetPage(name: AppRouts.homeScreen, page: () => const HomeScreen()),
  // GetPage(name: AppRouts.eventsScreen, page: () => const EventsScreen()),
  // GetPage(name: AppRouts.locationScreen, page: () => const LocationScreen()),
  // GetPage(name: AppRouts.hashmiteScreen, page: () => const HashmiteScreen()),
  // GetPage(name: AppRouts.profileScreen, page: () => const ProfileScreen()),
  // GetPage(name: AppRouts.aboutUsScreen, page: () => const AboutUsScreen()),
  GetPage(name: AppRouts.myAccountScreen, page: () => const MyAccountScreen()),
  // GetPage(name: AppRouts.feedbackScreen, page: () => const FeedbackScreen()),
  //GetPage(name: AppRouts.coursesScreen, page: () => const CoursesScreen()),
  GetPage(name: AppRouts.courseScreen, page: () => const CourseScreen()),
  GetPage(
    name: AppRouts.courseEpisodsScreen,
    page: () => const CourseEpisodsScreen(),
  ),
  GetPage(name: AppRouts.episodeScreen, page: () => const EpisodeScreen()),
  GetPage(name: AppRouts.myCoursesScreen, page: () => const MyCoursesScreen()),
  GetPage(
      name: AppRouts.hashemiteKingScreen,
      page: () => const HashemiteKingScreen()),

  //admin
  GetPage(
    name: AppRouts.adminScreen,
    page: () => const AdminScreen(),
  ),
  GetPage(
    name: AppRouts.feedBacksAdminScreen,
    page: () => const FeedBacksAdminScreen(),
  ),
  GetPage(
    name: AppRouts.hashemiteAdminScreen,
    page: () => const HashemiteAdminScreen(),
  ),
  GetPage(
    name: AppRouts.addKingScreen,
    page: () => const AddKingScreen(),
  ),
  GetPage(
    name: AppRouts.updateDeleteKingScreen,
    page: () => const UpdateDeleteKingScreen(),
  ),
  GetPage(
    name: AppRouts.eventsAdminScreen,
    page: () => const EventsAdminScreen(),
  ),

  GetPage(
    name: AppRouts.addEventScreen,
    page: () => const AddEventScreen(),
  ),

  GetPage(
    name: AppRouts.updateDeleteEventScreen,
    page: () => const UpdateDeleteEventScreen(),
  ),

  GetPage(
    name: AppRouts.coursesAdminScreen,
    page: () => const CoursesAdminScreen(),
  ),

  GetPage(
    name: AppRouts.addCourseScreen,
    page: () => const AddCourseScreen(),
  ),

  GetPage(
    name: AppRouts.updateDeleteCourseScreen,
    page: () => const UpdateDeleteCourseScreen(),
  ),

  GetPage(
    name: AppRouts.addEpisodeScreen,
    page: () => const AddEpisodeScreen(),
  ),

  GetPage(
    name: AppRouts.updateDeleteEpisodeScreen,
    page: () => const UpdateDeleteEpisodeScreen(),
  ),

  GetPage(
    name: AppRouts.storyAdminScreen,
    page: () => const StoryAdminScreen(),
  ),
];
