import 'package:bloc/bloc.dart';
import 'package:bloc_example/apicrud/model/productmodel.dart';
import 'package:bloc_example/apicrud/sevice/apiservice.dart';

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'fetch_event.dart';
part 'fetch_state.dart';

class FetchBloc extends Bloc<FetchEvent, FetchState> {
  FetchBloc() : super(FetchInitial(isLoading: false, data: [])) {
    on<FetchApi>((event, emit) async {
      emit(FetchState(isLoading: true, data: []));
      final data = await Apiservice().getProducts();

      emit(FetchState(isLoading: false, data: data));
    });

    on<Caltotal>((event, emit) {
      final total = event.qty * event.price;
      event.totalcontroller.text = total.toString();
    });
  }
}
