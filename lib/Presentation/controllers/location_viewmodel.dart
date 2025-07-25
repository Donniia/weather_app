import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/Core/result.dart';
import 'package:weather_app/Domain/Entities/location.dart';
import 'package:weather_app/Domain/usecase/location_usecase.dart';

class LocationViewModel extends Cubit<LocationState> {
  LocationUseCase useCase;
  LocationViewModel(this.useCase) : super(LocationLoadingState());
  void getLocationData(Position position, String date) async {
    emit(LocationLoadingState());
    var result = await useCase.invoke(position, date);
    switch (result) {
      case Success<Location>():
        {
          emit(LocationSuccessState(result.data));
        }

      case Error<Location>():
        {
          emit(LocationErrorState(result.errorMsg));
        }
    }
  }
}

sealed class LocationState {}

class LocationLoadingState extends LocationState {}

class LocationErrorState extends LocationState {
  String? errorMsg;
  LocationErrorState(this.errorMsg);
}

class LocationSuccessState extends LocationState {
  Location location;
  LocationSuccessState(this.location);
}
