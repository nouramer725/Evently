import 'package:flutter/cupertino.dart';
import '../Models/event_model.dart';
import '../l10n/app_localizations.dart';
import '../utils/firebase_utils.dart';

class AppFirebaseProvider extends ChangeNotifier {
  List<Event> eventList = [];
  List<Event> filterList = [];
  List<Event> favouriteList = [];
  int selectedIndex = 0;
  List<String> eventsNameList = [];

  List<String> getEventNameList(BuildContext context) {
    return eventsNameList = [
      AppLocalizations.of(context)!.all,
      AppLocalizations.of(context)!.sport,
      AppLocalizations.of(context)!.birthday,
      AppLocalizations.of(context)!.exhibition,
      AppLocalizations.of(context)!.meeting,
      AppLocalizations.of(context)!.book_club,
    ];
  }

  void getAllDataFromFireBase() async {
    var querySnapshot = await FirebaseUtils.getEventsCollections()
        .orderBy('eventDate')
        .get();
    eventList = querySnapshot.docs.map((doc) {
      return doc.data();
    }).toList();
    filterList = eventList;
    notifyListeners();
  }

  void getFilterEventsDataFromFireBase() async {
    var querySnapshot = await FirebaseUtils.getEventsCollections()
        .orderBy('eventDate')
        .where('eventName', isEqualTo: eventsNameList[selectedIndex])
        .get();
    filterList = querySnapshot.docs.map((doc) {
      return doc.data();
    }).toList();
    notifyListeners();
  }

  void changeIndex(int newIndex) {
    selectedIndex = newIndex;
    if (selectedIndex == 0) {
      getAllDataFromFireBase();
    } else {
      getFilterEventsDataFromFireBase();
    }
  }

  void updateIsFavourite(Event event) {
    FirebaseUtils.getEventsCollections()
        .doc(event.id)
        .update({'isFavourite': !event.isFavourite})
        .timeout(
          Duration(microseconds: 50),
          onTimeout: () {
            print('event updated successfully');
            selectedIndex == 0
                ? getAllDataFromFireBase()
                : getFilterEventsDataFromFireBase();
            getFavouriteEvents();
          },
        );
  }

  void getFavouriteEvents() async {
    var querySnapshot = await FirebaseUtils.getEventsCollections()
        .where('isFavourite', isEqualTo: true)
        .get();
    favouriteList = querySnapshot.docs.map((doc) {
      return doc.data();
    }).toList();
    notifyListeners();
  }
}
