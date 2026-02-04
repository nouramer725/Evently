import 'package:evently_app/Models/event_model.dart';
import 'package:evently_app/home/AddEvent/row_widget.dart';
import 'package:evently_app/utils/app_assets.dart';
import 'package:evently_app/utils/firebase_utils.dart';
import 'package:evently_app/widgets/custom_elevated_button_widget.dart';
import 'package:evently_app/widgets/custom_text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../l10n/app_localizations.dart';
import '../../provider/app_firebase_provider.dart';
import '../../provider/app_theme_provider.dart';
import '../../provider/user_provider.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_text.dart';
import '../../utils/responsive.dart';
import '../tabs/home/AppBarWidget 1/tab_item.dart';

class AddEventScreen extends StatefulWidget {
  const AddEventScreen({super.key});

  @override
  State<AddEventScreen> createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  int selectedIndex = 0;
  String title = '';
  String description = '';
  var formKey = GlobalKey<FormState>();
  DateTime? selectedDate;
  String formatDate = '';
  TimeOfDay? selectedTime;
  String formatTime = '';
  String eventImage = '';
  String eventName = '';
  String? dateError;
  String? timeError;
  late AppFirebaseProvider eventProvider;
  late UserProvider userProvider;

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_) {
      eventProvider.getAllDataFromFireBase(userProvider.currentUser!.id);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);
    eventProvider = Provider.of<AppFirebaseProvider>(context);

    List<String> eventNameList = [
      AppLocalizations.of(context)!.sport,
      AppLocalizations.of(context)!.birthday,
      AppLocalizations.of(context)!.exhibition,
      AppLocalizations.of(context)!.meeting,
      AppLocalizations.of(context)!.book_club,
    ];

    List<IconData> eventIconList = [
      Icons.directions_bike,
      Icons.cake,
      Icons.museum,
      Icons.groups,
      Icons.menu_book,
    ];

    List<String> eventImagesLightList = [
      AppAssets.sport,
      AppAssets.birthday,
      AppAssets.exhibition,
      AppAssets.meeting,
      AppAssets.bookClub,
    ];

    List<String> eventImagesDarkList = [
      AppAssets.sportDark,
      AppAssets.birthdayDark,
      AppAssets.exhibitionDark,
      AppAssets.meetingDark,
      AppAssets.bookClubDark,
    ];

    eventImage = themeProvider.isDarkTheme()
        ? eventImagesDarkList[selectedIndex]
        : eventImagesLightList[selectedIndex];
    eventName = eventNameList[selectedIndex];

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: w(7), vertical: h(8)),
            decoration: BoxDecoration(
              color: themeProvider.isDarkTheme()
                  ? AppColors.transparentColor
                  : AppColors.white,
              border: Border.all(
                color: themeProvider.isDarkTheme()
                    ? AppColors.strokeColorDark
                    : AppColors.strokeColorLight,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              Icons.arrow_back_ios_sharp,
              color: themeProvider.isDarkTheme()
                  ? AppColors.white
                  : AppColors.mainColorLight,
            ),
          ),
        ),
        title: Text(
          AppLocalizations.of(context)!.add_event,
          style: AppText.mediumText(
            color: themeProvider.isDarkTheme()
                ? AppColors.white
                : AppColors.mainTextColorLight,
            fontSize: 18,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: w(16), vertical: h(16)),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: h(15),
              children: [
                Image(
                  image: AssetImage(eventImage),
                  fit: BoxFit.fill,
                  height: h(193),
                ),
                DefaultTabController(
                  length: eventNameList.length,
                  child: TabBar(
                    onTap: (index) {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    isScrollable: true,
                    dividerColor: AppColors.transparentColor,
                    indicatorColor: AppColors.transparentColor,
                    padding: EdgeInsets.zero,
                    tabAlignment: TabAlignment.start,
                    labelPadding: EdgeInsets.symmetric(horizontal: w(5)),
                    tabs: List.generate(eventNameList.length, (index) {
                      return TabItem(
                        widget: eventIconList[index],
                        text: eventNameList[index],
                        isSelected: selectedIndex == index,
                      );
                    }),
                  ),
                ),
                Text(
                  AppLocalizations.of(context)!.title,
                  style: AppText.mediumText(
                    color: themeProvider.isDarkTheme()
                        ? AppColors.mainTextColorDark
                        : AppColors.mainTextColorLight,
                    fontSize: 16,
                  ),
                ),
                CustomTextFormFieldWidget(
                  filled: true,
                  onChanged: (newValue) {
                    title = newValue;
                  },
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return AppLocalizations.of(
                        context,
                      )!.please_enter_event_title;
                    } else {
                      return null;
                    }
                  },
                  fillColor: themeProvider.isDarkTheme()
                      ? AppColors.inputsColorDark
                      : AppColors.inputsColorLight,
                  hintText: AppLocalizations.of(context)!.event_title,
                  hintStyle: AppText.regularText(
                    color: themeProvider.isDarkTheme()
                        ? AppColors.secTextColorDark
                        : AppColors.secTextColorLight,
                    fontSize: 14,
                  ),
                  borderColor: themeProvider.isDarkTheme()
                      ? AppColors.strokeColorDark
                      : AppColors.strokeColorLight,
                  borderWidth: 2,
                ),
                Text(
                  AppLocalizations.of(context)!.description,
                  style: AppText.mediumText(
                    color: themeProvider.isDarkTheme()
                        ? AppColors.mainTextColorDark
                        : AppColors.mainTextColorLight,
                    fontSize: 16,
                  ),
                ),
                CustomTextFormFieldWidget(
                  filled: true,
                  maxLines: 5,
                  onChanged: (newValue) {
                    description = newValue;
                  },
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return AppLocalizations.of(
                        context,
                      )!.please_enter_event_description;
                    } else {
                      return null;
                    }
                  },
                  fillColor: themeProvider.isDarkTheme()
                      ? AppColors.inputsColorDark
                      : AppColors.inputsColorLight,
                  hintText: AppLocalizations.of(context)!.event_details,
                  hintStyle: AppText.regularText(
                    color: themeProvider.isDarkTheme()
                        ? AppColors.secTextColorDark
                        : AppColors.secTextColorLight,
                    fontSize: 14,
                  ),
                  borderColor: themeProvider.isDarkTheme()
                      ? AppColors.strokeColorDark
                      : AppColors.strokeColorLight,
                  borderWidth: 2,
                ),
                RowWidget(
                  text: AppLocalizations.of(context)!.event_date,
                  errorText: dateError,
                  chooseText: selectedDate == null
                      ? AppLocalizations.of(context)!.choose_date
                      : formatDate,
                  onPressed: () {
                    chooseDate();
                  },
                  icon: Icons.date_range_outlined,
                ),
                RowWidget(
                  text: AppLocalizations.of(context)!.event_time,
                  chooseText: selectedTime == null
                      ? AppLocalizations.of(context)!.choose_time
                      : formatTime,
                  onPressed: () {
                    chooseTime();
                  },
                  errorText: timeError,
                  icon: Icons.access_time_outlined,
                ),
                CustomElevatedButtonWidget(
                  widget: Text(AppLocalizations.of(context)!.add_event),
                  onPressed: () {
                    addEvent(themeProvider);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// try easy date picker
  void chooseDate() async {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    var chooseDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 1000)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            textTheme: TextTheme(
              bodyMedium: AppText.mediumText(
                color: isDark
                    ? AppColors.mainTextColorDark
                    : AppColors.mainTextColorLight,
                fontSize: 14,
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    selectedDate = chooseDate;
    if (selectedDate != null) {
      formatDate = DateFormat('MMM d, yyyy').format(selectedDate!);
    }
    setState(() {});
  }

  Future<void> chooseTime() async {
    var chooseTime = showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    selectedTime = await chooseTime;
    if (selectedTime != null) {
      formatTime = selectedTime!.format(context);
    }
    setState(() {});
  }

  void addEvent(AppThemeProvider themeProvider) async {
    dateError = null;
    timeError = null;

    bool hasError = false;

    if (!formKey.currentState!.validate()) {
      hasError = true;
    }

    if (title.trim().isEmpty) {
      hasError = true;
    }

    if (description.trim().isEmpty) {
      hasError = true;
    }

    if (selectedDate == null) {
      dateError = AppLocalizations.of(context)!.please_enter_event_date;
      hasError = true;
    }

    if (selectedTime == null) {
      timeError = AppLocalizations.of(context)!.please_enter_event_time;
      hasError = true;
    }

    if (hasError) {
      setState(() {});
      return;
    }

    try {
      Event event = Event(
        eventImage: eventImage,
        eventName: eventName,
        eventTitle: title,
        eventDescription: description,
        eventDate: selectedDate!,
        eventTime: formatTime,
      );

      var userProvider = Provider.of<UserProvider>(context, listen: false);

      await FirebaseUtils.addEventToFirestore(
        event,
        userProvider.currentUser!.id,
      );

      Fluttertoast.showToast(
        msg: AppLocalizations.of(context)!.event_added_successfully,
        backgroundColor: themeProvider.isDarkTheme()
            ? AppColors.mainColorDark
            : AppColors.mainColorLight,
        textColor: AppColors.white,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
      );

      eventProvider.changeIndex(0, userProvider.currentUser!.id);

      await eventProvider.getAllDataFromFireBase(userProvider.currentUser!.id);
      formKey.currentState!.reset();
      setState(() {});
      Navigator.pop(context);
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Failed to add event ❌",
        backgroundColor: Colors.red,
      );
      print(e);
    }
  }
}
