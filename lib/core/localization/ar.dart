import 'package:eye_on_palestine/data/data_source/about_us_info.dart';

import '../../data/data_source/definition.dart';

Map<String, String> arabicKey = {
  //public word
  "Home": "الرئيسية",
  'Courses': 'الكورسات',
  'Events': 'الاحداث',
  'Hashemite': 'الهاشميون',
  'Feedbacks': 'التقييمات',
  'Admin': 'ادمن',
  "Episodes": "الحلقات",
  "Location": "الموقع",
  "My Profile": "ملفي الشخصي",
  "About Us": "من نحن",
  'Feedback': 'تقييم',
  "The Whole Story": "القصة كاملة",
  "The Story": "القصة",

  // ================== Start admin screens ====================

  //public
  "Add new one": "أضف واحد جديد",
  "Fill all of these field :": "املأ كل هذه الحقول :",
  "You can update it Or delete it :": "يمكنك تحديثه أو حذفه :",

  //feedbacks
  "You can show all of the feedbacks here": "يمكنك عرض جميع الردود هنا",

  //Hashemite
  'Upper text hashemite admin':
      "يمكنك إضافة وتحديث وحذف جميع معلومات الهاشميين هنا",
  "Add Achievement": "اضافة انجاز",
  "Enter the title of achievement in english": "ادخل عنوان الانجاز باللغة الانجليزية",
  "Title of achievement in english": "عنوان الانجاز باللغة الانجليزية",
  "Enter the title of achievement in arabic": "ادخل عنوان الانجاز باللغة العربية",
  "Title of achievement in arabic": "عنوان الانجاز باللغة العربية",
  "Enter the content in english": "ادخل المحتوى باللغة الانجليزية",
  "English Content": "المحتوى باللغة الانجليزية",
  "Enter the content in arabic": "ادخل المحتوى باللغة العربية",
  "Arabic Content": "المحتوى باللغة العربية",
  "Enter the image url": "ادخل رابط الصورة",
  "Image url": "رابط الصورة",
  "Update Or Delete Achievement": "تعديل او حذف الانجاز",
  "Update Achievement": "تحديث الانجاز",
  "Delete Achievement": "حذف الانجاز",
  "Enter the order of achievement" : "ادخل ترتيب الانجاز",
  "Achievement Order" : "ترتيب الانجاز",


  //Events
  'Upper text events admin': "يمكنك إضافة وتحديث وحذف جميع معلومات الاحداث هنا",
  "Enter the date of event": "ادخل تاريخ الحدث",
  "date of event": "تاريخ الحدث",
  "Add Event": "اضافة حدث",
  "Update Or Delete Event": "تحديث او حذف الحدث",
  "Update Event": "تحديث الحدث",
  "Delete Event": "حذف الحدث",

  //Courses
  'Upper text courses admin':
      "يمكنك إضافة وتحديث وحذف جميع معلومات الكورسات هنا",
  "Add Course": "اضافة كورس",
  "Enter the title of course in english": "ادخل عنوان الكورس باللغة الانجليزية",
  "Title of course in english": "عنوان الكورس باللغة الانجليزية",
  "Enter the title of course in arabic": "ادخل عنوان الكورس باللغة العربية",
  "Title of course in arabic": "عنوان الكورس باللغة العربية",
  "Enter the description in english": "ادخل الوصف باللغة الانجليزية",
  "English Description": "الوصف باللغة الانجليزية",
  "Enter the description in arabic": "ادخل الوصف باللغة العربية",
  "Arabic Description": "الوصف باللغة العربية",
  "Enter the duration of the course": "ادخل مدة الكورس",
  "Duration of the course": "مدة الكورس",
  "Update Or Delete Course": "تحديث او حذف الكورس",
  "Update Course": "تحديث الكورس",
  "Delete Course": "حذف الكورس",

  //Episodes
  "Add Episode": "اضافة حلقة",
  "Enter the title of episode in english":
      "ادخل عنوان الحلقة باللغة الانجليزية",
  "Title of episode in english": "عنوان الحلقة باللغة الانجليزية",
  "Enter the title of episode in arabic": "ادخل عنوان الحلقة باللغة العربية",
  "Title of episode in arabic": "عنوان الحلقة باللغة العربية",
  "Enter the url of the Episode": "ادخل رابط الحلقة",
  "Url of the episode": "رابط الحلقة",
  "Update Or Delete Episode": "تحديث او حذف الحلقة",
  "Update Episode": "تحديث الحلقة",
  "Delete Episode": "حذف الحلقة",
  "You can update it Or delete it episode :": "يمكنك تحديثها او حذفها",

  //story
  "Update Story": "تحديث القصة",

  // ================== End admin screens ======================

  // ================== Start user screens ======================

  //drawer
  "Hi,": "مرحبا , ",
  'Welcome back': 'اهلا بعودتك',
  "Logout": "تسجيل الخروج",

  //home
  "introduction home screen": homeAr,

  //Courses
  'Educational Courses': "الكورسات التعليمية",
  "introduction courses screen": courseAr,
  "Description :": "الوصف : ",
  "This course includes :": "هذا الكورس يتضمن : ",
  "Hours": "ساعات",
  "Go to this course": "الذهاب الى هذا الكورس",
  "Add this course": "اضافة هذا الكورس",
  "Episodess": "حلقات",

  //Location
  'title of location': "مسافتك عن المسجد الاقصى",
  "introduction location screen": locationAr,
  "Get your location": "الحصول على موقعك",
  "KM": "كم",
  "from Al-Aqsa Mosque": "من المسجد الاقصى",

  // Events
  "Events over Years": "احداث عبر السنين",
  "introduction events screen": eventsAr,
  'Back to up': 'الرجوع الى اعلى',

  //Hashemite
  "introduction Hashemite screen": hashemiteAr,

  //My Profile
  "My Account": "حسابي",
  "My Courses": "كورساتي",
  "Please enter your user name": "الرجاء ادخال اسم المستخدم",
  "Please enter your email": "الرجاء ادخال البريد الالكتروني",
  "Change Password": "تغيير كلمة السر",
  "Save": "حفظ",
  "Delete account": "حذف الحساب",
  'My Favorites': 'مفضلتي',
  'Completed Courses': 'الكورسات المكتملة',
  "Your Progress in this course": "تقدمك في هذا الكورس",

  //About us
  'about us 1': aboutUsInfoArabic1,
  'about us 2': aboutUsInfoArabic2,
  'about us 3': aboutUsInfoArabic3,

  //Feedback
  'introduction feedback screen':
      "ما رأيك في التطبيق ؟  \n الأشياء التي ترغب في تحسينها؟",
  "Enter Here": "ادخل هنا ...",
  "Submit": "ارسال",

  // ================== End user screens ======================

  // ================== Start Auth screens ======================

  // sign in
  "Eye on Palestine": "عين على فلسطين",
  "Email": "البريد الالكتروني",
  "Password": "كلمة السر",
  "Forgot password ?": "هل نسيت كلمة السر؟",
  "Sign in": "تسجيل الدخول",
  "Don’t have an account ?": "لا تملك حساب ؟ ",
  "Sign Up": "انشاء حساب",

  //sign up
  "User Name": "اسم المستخدم",
  "Already have an account ?": "هل لديك حساب ؟ ",

  //forget password
  "Please enter your email below to reset your password":
      "الرجاء إدخال بريدك الإلكتروني أدناه لإعادة تعيين كلمة المرور الخاصة بك",
  "Check Email": "فحص البريد الاكتروني",
  "Back to sign in": "العودة لتسجيل الدخول",

  // success forget password
  "msg success forget password":
      "نحن ارسلنا بريد الكتروني الى حسابك  \nيرجى التحقق من بريدك الإلكتروني لإعادة تعيين كلمة المرور الخاصة بك",
  "Go to sign in": "العودة لتسجيل الدخول",

  // success sign up
  "Successfull Sign Up": "تم انشاء الحساب بنجاح",
  "msg success sign up":
      "نحن ارسلنا رابط تفعيل حسابك الى بريدك الالكتروني \nالرجاء تفحص بريدك لتفعيل الحساب",

  // ================== End Auth screens ======================

  //validate
  "Please enter valid email": "الرجاء ادخال بريد الكتروني صحيح",
  "Please enter valid username": 'الرجاء ادخال اسم مستخدم صحيح',
  'Minimum 8 characters \nat least one uppercase letter \nat least one lowercase letter \nat least one number \nat least one special character':
      "اقل شيء 8 حروف \nيجب ان يحتوي على حرف كبير \nيجب ان يحتوي على حرف صغير \nيجب ان يحتوي على رقم \nيجب ان يحتوي على رمز",
  "Please enter valid url": "الرجاء ادخال رابط الكتروني صحيح",
  "Must be not empty": "يجب ان لا يكون فارغ",

  // bottom sheet
  "Library": "المعرض",
  "Camera": "الكاميرا",

  //dialogChangeLanguage
  "Choose Language:": "اختر اللغة:",
  "Arabic": "عربي",
  "English": "انجليزي",

  //dialogDeleteAccount
  "Are you sure to delete your account": "هل أنت متأكد من حذف حسابك",
  "Yes": "نعم",
  "No": "لا",

  //dialogOpenSettings
  "You must turn on\n your location": "يجب عليك \n تفعيل موقعك",
  "Open Settings": "فتح الاعدادات",

  //snackbarChangePass
  "We have sent reset email password to this email":
      "لقد ارسلنا بريد اعادة تعيين كلمة المرور الى هذا الحساب",

  //snackBarDenied
  "Open your settings": "فتح اعدادات الجهاز",
  "You must allow the application \nto access your location":
      "يجب عليك ان تسمح للتطبيق \nبالوصول الى موقعك",

  //snackbarShowError
  'Something error , try again later': 'خطأ ما ، حاول مرة أخرى في وقت لاحق',
  'The account already exists for that email.':
      'الحساب موجود بالفعل لهذا البريد الإلكتروني.',
  'Wrong password provided for that user.': 'كلمة السر خاطئة لهذا المستخدم.',
  'No user found for that email.':
      'لم يتم العثور على مستخدم لهذا البريد الإلكتروني.',
  'You must verify your email , go to your email to verify it':
      'يجب عليك التحقق من بريدك الإلكتروني ، انتقل إلى بريدك الإلكتروني للتحقق منه',

  //snackbarShowMsg
  'This course is deleted from your favorites':
      "تم حذف هذه الدورة التدريبية من المفضلة",
  'This course is added to your favorites': "تمت إضافة هذه الدورة إلى مفضلاتك",
  "The account has been updated successfully": "تم تحديث الحساب بنجاح",
  "The feedback has been sent successfully": "تم إرسال الملاحظات بنجاح",

  //No internet connection
  "No internet connection , please try again!":
      "لا يوجد اتصال بالإنترنت ، يرجى المحاولة مرة أخرى!",
  'Try again': 'حاول مرة اخرى',
};
