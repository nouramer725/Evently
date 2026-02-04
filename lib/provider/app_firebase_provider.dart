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

  Future<void> getAllDataFromFireBase(String uId) async {
    var querySnapshot = await FirebaseUtils.getEventsCollections(
      uId,
    ).orderBy('eventDate').get();

    eventList = querySnapshot.docs.map((doc) => doc.data()).toList();
    filterList = eventList;
    notifyListeners();
  }

  Future<void> getFilterEventsDataFromFireBase(String uId) async {
    var querySnapshot = await FirebaseUtils.getEventsCollections(uId)
        .orderBy('eventDate')
        .where('eventName', isEqualTo: eventsNameList[selectedIndex])
        .get();
    filterList = querySnapshot.docs.map((doc) {
      return doc.data();
    }).toList();
    notifyListeners();
  }

  void changeIndex(int newIndex, String uId) {
    selectedIndex = newIndex;
    if (selectedIndex == 0) {
      getAllDataFromFireBase(uId);
    } else {
      getFilterEventsDataFromFireBase(uId);
    }
  }

  void updateIsFavourite(Event event, String uId) {
    FirebaseUtils.getEventsCollections(uId)
        .doc(event.id)
        .update({'isFavourite': !event.isFavourite})
        .timeout(
          Duration(microseconds: 50),
          onTimeout: () {
            print('event updated successfully');
            selectedIndex == 0
                ? getAllDataFromFireBase(uId)
                : getFilterEventsDataFromFireBase(uId);
            getFavouriteEvents(uId);
          },
        );
  }

  void getFavouriteEvents(String uId) async {
    var querySnapshot = await FirebaseUtils.getEventsCollections(
      uId,
    ).where('isFavourite', isEqualTo: true).get();
    favouriteList = querySnapshot.docs.map((doc) {
      return doc.data();
    }).toList();
    selectedIndex = 0;
    getFavouriteEvents(uId);
    notifyListeners();
  }

  Future<void> updateEventData(Event event, String uId) async {
    try {
      await FirebaseUtils.getEventsCollections(uId).doc(event.id).update({
        'eventTitle': event.eventTitle,
        'eventDescription': event.eventDescription,
        'eventDate': event.eventDate,
        'eventTime': event.eventTime,
        'eventName': event.eventName,
        'eventImage': event.eventImage,
      });

      print('Event updated successfully');

      selectedIndex == 0
          ? getAllDataFromFireBase(uId)
          : getFilterEventsDataFromFireBase(uId);
    } catch (e) {
      print('Error updating event: $e');
    }
  }

  Future<void> deleteEventData(Event event, String uId) async {
    try {
      await FirebaseUtils.getEventsCollections(uId).doc(event.id).delete();
      print('Event deleted successfully');
      selectedIndex == 0
          ? getAllDataFromFireBase(uId)
          : getFilterEventsDataFromFireBase(uId);
      getFavouriteEvents(uId);
    } catch (e) {
      print('Error deleting event: $e');
      selectedIndex == 0
          ? getAllDataFromFireBase(uId)
          : getFilterEventsDataFromFireBase(uId);
    }
  }
}
