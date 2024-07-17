import 'dart:async';


import 'package:assignment/core/app_string.dart';
import 'package:assignment/network_services/repository/copartner_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/service_locator.dart';
import '../model/copartner_model.dart';


part 'copartner_state.dart';

class CopartnerCubit extends Cubit<CopartnerState> {
  CopartnerCubit() : super(CopartnerInitial()){
    fetchCoPartnerData();
  }
  final _coPartnerRepo = getIt<CopartnerRepo>();

  List<CopartnerList>? copartnerList;
  List<CopartnerList>? filterList;

  String selectedCategory=AppString.options;

  Future<void> fetchCoPartnerData() async {
    emit(LoadingState());
    var response = await _coPartnerRepo.getAllCopartner("c541a503-d267-4652-ceb8-08dca55ffcba");
    response.fold((error) {
       emit(ErrorState(error.message));
    }, (model) {
      if (model.isSuccess ?? false) {
        copartnerList=model.data??[];
        filterList=copartnerList!.where((o) => o.serviceType == "3").toList();
       // emit(ErrorState("Some Thing Went wrong"));
        emit(LoadedState());
        return;
      } else {
        emit(ErrorState(model.errorMessages));
      }
    });
  }

  filterListData(String category){
     selectedCategory=category;
    if(category==AppString.options)
      {
        filterList=copartnerList!.where((o) => o.serviceType == "3").toList();
        emit(LoadedState());
        return;
      }
    if(category==AppString.equity)
      {
        filterList=copartnerList!.where((o) => o.serviceType == "2").toList();
        emit(LoadedState());
        return;
      }
    if(category==AppString.commodity)
      {
        filterList=copartnerList!.where((o) => o.serviceType == "1").toList();
        emit(LoadedState());
        return;
      }
  }
  String getPercentage(double totalPrice,double discountPrice){
    double percentage=  (discountPrice*100)/totalPrice;
    return (100.0-percentage).toStringAsFixed(1);
  }

}
