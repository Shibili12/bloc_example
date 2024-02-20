part of 'slider_bloc.dart';

@immutable
sealed class SliderEvent {}

class Sliderchangevent extends SliderEvent {
  double value;
  Sliderchangevent({required this.value});
}
