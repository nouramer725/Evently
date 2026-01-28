class Event {
  ///Event Collection
  static const String eventsCollection = 'Events';

  ///attributes
  String id;
  String eventImage;
  String eventName;
  String eventTitle;
  String eventDescription;
  DateTime eventDate;
  String eventTime;
  bool isFavourite;

  ///Constructor
  Event({
    this.id = '',
    required this.eventImage,
    required this.eventName,
    required this.eventTitle,
    required this.eventDescription,
    required this.eventDate,
    required this.eventTime,
    this.isFavourite = false,
  });

  /// json => object
  Event.fromFireStore(Map<String, dynamic> data)
    : this(
        id: data['id'],
        eventImage: data['eventImage'],
        eventName: data['eventName'],
        eventTitle: data['eventTitle'],
        eventDescription: data['eventDescription'],
        eventDate: DateTime.fromMillisecondsSinceEpoch(data['eventDate']),
        eventTime: data['eventTime'],
        isFavourite: data['isFavourite'],
      );

  /// object => json
  Map<String, dynamic> toFireStore() {
    return {
      'id': id,
      'eventImage': eventImage,
      'eventName': eventName,
      'eventTitle': eventTitle,
      'eventDescription': eventDescription,
      'eventDate': eventDate.millisecondsSinceEpoch,
      'eventTime': eventTime,
      'isFavourite': isFavourite,
    };
  }
}
