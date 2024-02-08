part of 'razorpay_bloc.dart';

class RazorpayState {}

final class RazorpayInitial extends RazorpayState {
  final Razorpay razorpay = Razorpay();

  RazorpayInitial() {
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlerpaymentsuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlerpaymenterror);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handlerexternalwallet);
  }

  handlerpaymentsuccess() {
    print("handlerpaymentsuccess");
  }

  handlerpaymenterror() {
    print("handlerpaymenterror");
  }

  handlerexternalwallet() {
    print("handlerexternalwallet");
  }
}
