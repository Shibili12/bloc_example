import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

part 'razorpay_event.dart';
part 'razorpay_state.dart';

class RazorpayBloc extends Bloc<RazorpayEvent, RazorpayState> {
  RazorpayBloc() : super(RazorpayInitial()) {
    final Razorpay razorpay = Razorpay();

    on<Payevent>((event, emit) {
      try {
        razorpay.open(event.option);
      } catch (e) {
        print(e.toString());
      }
    });
  }
}
