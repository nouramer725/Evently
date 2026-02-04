import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/Models/my_user.dart';
import '../Models/event_model.dart';

class FirebaseUtils {
  static CollectionReference<Event> getEventsCollections(String uId) {
    return getUserCollections()
        .doc(uId)
        .collection(Event.eventsCollection)
        .withConverter<Event>(
          fromFirestore: (snapshot, _) => Event.fromFireStore(snapshot.data()!),
          toFirestore: (event, options) => event.toFireStore(),
        );
  }

  static CollectionReference<MyUser> getUserCollections() {
    return FirebaseFirestore.instance
        .collection(MyUser.collectionName)
        .withConverter<MyUser>(
          fromFirestore: (snapshot, _) =>
              MyUser.fromFireStore(snapshot.data()!),
          toFirestore: (myUser, options) => myUser.toFireStore(),
        );
  }

  static Future<void> addEventToFirestore(Event event, String uId) {
    CollectionReference<Event> collectionReference = getEventsCollections(uId);
    DocumentReference<Event> documentReference = collectionReference.doc();
    event.id = documentReference.id;
    return documentReference.set(event);
  }

  static Future<void> addUserToFirestore(MyUser myUser) {
    CollectionReference<MyUser> collectionReference = getUserCollections();

    return collectionReference.doc(myUser.id).set(myUser);
  }

  static Future<MyUser?> readUserFromFirestore(String uId) async {
    var querySnapshot = await getUserCollections().doc(uId).get();
    return querySnapshot.data();
  }
}
