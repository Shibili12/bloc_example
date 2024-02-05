part of 'notification_bloc.dart';

class NotificationState {
  List<String> messages;

  NotificationState(this.messages);
}

class NotificationInitial extends NotificationState {
  final NotificationServices notificationServices = NotificationServices();

  NotificationInitial() : super([]) {
    Firebase.initializeApp();
    init();
    notificationServices.getToken();
  }
  init() async {
    messages = await notificationServices.initilize();
  }
}
