import 'package:flutter/cupertino.dart';
import '../Models/event_model.dart';
import '../utils/firebase_utils.dart';

class AppFirebaseProvider extends ChangeNotifier {
  List<Event> eventList = [];
  List<Event> filterList = [];
  int selectedIndex = 0;

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

  void getFilterEventsDataFromFireBase(List<String> eventNameList) async {
    var querySnapshot = await FirebaseUtils.getEventsCollections()
        .orderBy('eventDate')
        .where('eventName', isEqualTo: eventNameList[selectedIndex])
        .get();
    filterList = querySnapshot.docs.map((doc) {
      return doc.data();
    }).toList();
    notifyListeners();
  }

  void changeIndex(int newIndex, List<String> eventNameList) {
    selectedIndex = newIndex;
    if (selectedIndex == 0) {
      getAllDataFromFireBase();
    } else {
      getFilterEventsDataFromFireBase(eventNameList);
    }
  }
}
