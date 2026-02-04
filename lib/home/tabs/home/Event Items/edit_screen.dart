import 'package:evently_app/utils/custom_flutter_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../../Models/event_model.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../provider/app_firebase_provider.dart';
import '../../../../provider/app_theme_provider.dart';
import '../../../../utils/app_assets.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_routes.dart';
import '../../../../utils/app_text.dart';
import '../../../../utils/responsive.dart';
import '../../../../widgets/custom_elevated_button_widget.dart';
import '../../../../widgets/custom_text_form_field_widget.dart';
import '../../../AddEvent/row_widget.dart';
import '../AppBarWidget 1/tab_item.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({super.key});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final formKey = GlobalKey<FormState>();
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  int selectedIndex = 0;
  String formatDate = '';

  late TextEditingController titleController;
  late TextEditingController descriptionController;

  late Event event;

  late List<String> eventNameList;
  late List<String> eventImagesLightList;
  late List<String> eventImagesDarkList;
  late List<IconData> eventIconList;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final args = ModalRoute.of(context)!.settings.arguments;
      final eventProvider = Provider.of<AppFirebaseProvider>(
        context,
        listen: false,
      );

      event = eventProvider.eventList.firstWhere(
        (element) => element.id == args,
      );

      eventNameList = [
        AppLocalizations.of(context)!.sport,
        AppLocalizations.of(context)!.birthday,
        AppLocalizations.of(context)!.exhibition,
        AppLocalizations.of(context)!.meeting,
        AppLocalizations.of(context)!.book_club,
      ];

      eventIconList = [
        Icons.directions_bike,
        Icons.cake,
        Icons.museum,
        Icons.groups,
        Icons.menu_book,
      ];

      eventImagesLightList = [
        AppAssets.sport,
        AppAssets.birthday,
        AppAssets.exhibition,
        AppAssets.meeting,
        AppAssets.bookClub,
      ];

      eventImagesDarkList = [
        AppAssets.sportDark,
        AppAssets.birthdayDark,
        AppAssets.exhibitionDark,
        AppAssets.meetingDark,
        AppAssets.bookClubDark,
      ];

      selectedIndex = eventNameList.indexOf(event.eventName);

      titleController = TextEditingController(text: event.eventTitle);
      descriptionController = TextEditingController(
        text: event.eventDescription,
      );

      setState(() {});
    });
  }

  String get currentEventImage {
    final themeProvider = Provider.of<AppThemeProvider>(context, listen: false);
    return themeProvider.isDarkTheme()
        ? eventImagesDarkList[selectedIndex]
        : eventImagesLightList[selectedIndex];
  }

  String get currentEventName => eventNameList[selectedIndex];

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<AppThemeProvider>(context);
    final eventProvider = Provider.of<AppFirebaseProvider>(context);

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
          AppLocalizations.of(context)!.edit_event,
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
                Image.asset(
                  currentEventImage,
                  fit: BoxFit.fill,
                  height: h(193),
                ),

                DefaultTabController(
                  length: eventNameList.length,
                  initialIndex: selectedIndex,
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
                  controller: titleController,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return AppLocalizations.of(
                        context,
                      )!.please_enter_event_title;
                    }
                    return null;
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
                  controller: descriptionController,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return AppLocalizations.of(
                        context,
                      )!.please_enter_event_description;
                    }
                    return null;
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
                  chooseText: selectedDate == null
                      ? DateFormat('MMM d, yyyy').format(event.eventDate)
                      : DateFormat('MMM d, yyyy').format(selectedDate!),
                  onPressed: chooseDate,
                  icon: Icons.date_range_outlined,
                ),

                RowWidget(
                  text: AppLocalizations.of(context)!.event_time,
                  chooseText: selectedTime != null
                      ? selectedTime!.format(context)
                      : event.eventTime,
                  onPressed: chooseTime,
                  icon: Icons.access_time_outlined,
                ),

                CustomElevatedButtonWidget(
                  widget: Text(AppLocalizations.of(context)!.update_event),
                  onPressed: () async {
                    final user = FirebaseAuth.instance.currentUser;
                    if (user == null) return;
                    final uId = user.uid;

                    await eventProvider.updateEventData(
                      Event(
                        id: event.id,
                        eventTitle: titleController.text,
                        eventDescription: descriptionController.text,
                        eventDate: selectedDate ?? event.eventDate,
                        eventTime: selectedTime != null
                            ? selectedTime!.format(context)
                            : event.eventTime,
                        eventName: currentEventName,
                        eventImage: currentEventImage,
                      ),
                      uId,
                    );

                    CustomFlutterToast.successToast(
                      context,
                      themeProvider.isDarkTheme()
                          ? AppColors.mainColorDark
                          : AppColors.mainColorLight,
                      AppColors.white,
                      ToastGravity.TOP,
                      AppLocalizations.of(context)!.event_updated_successfully,
                    );

                    eventProvider.changeIndex(0,uId);

                    await eventProvider.getAllDataFromFireBase(uId);

                    formKey.currentState!.reset();
                    setState(() {});

                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      AppRoutes.homeScreenName,
                      (route) => false,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void chooseDate() async {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    var chooseDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 1000)),
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
    final picked = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
    );

    if (picked != null) {
      setState(() {
        selectedTime = picked;
      });
    }
  }
}
