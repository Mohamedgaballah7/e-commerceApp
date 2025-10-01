import 'package:bloc/bloc.dart';
import 'package:e_commerceapproute/features/ui/home/cubit/home_screen_states.dart';
import 'package:e_commerceapproute/features/ui/home/tabs/favourite/search_tab.dart';
import 'package:e_commerceapproute/features/ui/home/tabs/home/home_tab.dart';
import 'package:e_commerceapproute/features/ui/home/tabs/product/product_tab.dart';
import 'package:e_commerceapproute/features/ui/home/tabs/profile/profile_tab.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
@injectable
class HomeScreenViewModel extends Cubit<HomeScreenStates>{
  HomeScreenViewModel():super(HomeScreenInitialState());
  int selectedIndex = 0;
  final List<Widget> tabs = [
    HomeTab(),
    ProductTab(),
    FavouriteTab(),
    ProfileTab(),
  ];
  void changeSelectedIndex(index){
    selectedIndex=index;
    emit(HomeScreenChangeIndexState());
  }
}