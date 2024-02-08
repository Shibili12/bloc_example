part of 'razorpay_bloc.dart';

@immutable
sealed class RazorpayEvent {}

class Payevent extends RazorpayEvent {
  var option;
  Payevent({required this.option});
}
