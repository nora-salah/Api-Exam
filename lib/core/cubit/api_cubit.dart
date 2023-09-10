import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../dio/dio_helper.dart';
import '../model/album_model.dart';

part 'api_state.dart';

class ApiCubit extends Cubit<ApiState> {
  ApiCubit() : super(ApiInitial());
  static ApiCubit get(context)=>BlocProvider.of(context);
  List <AlbumModel> data1=[];


  void getData()async{
    emit(DataLoadingState());

    var data=[];
  await  Dio().get('https://api.thecatapi.com/v1/images/search?limit=80&mime_types=0&order=Random&size=small&page=3&sub_id=demo-ce06ee').then((value) {
     // print(value.data[0]['height']);
      data=value.data;
      data1 = data.map((e) => AlbumModel.fromJson(e)).toList();

      print(data1[0].id);
      emit(DataSucessState());

    } )
        .catchError((e) {
      print(e.toString());
      emit(DataErrorState());

    });
  }
}
