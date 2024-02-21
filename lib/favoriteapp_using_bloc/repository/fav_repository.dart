import 'package:bloc_example/favoriteapp_using_bloc/model/favitemmodel.dart';

class FavouriteRepository {
  Future<List<FavitemModel>> fetchItem() async {
    await Future.delayed(Duration(seconds: 3));
    return List.from(_genarateList(10));
  }

  List<FavitemModel> _genarateList(int length) {
    return List.generate(length,
        (index) => FavitemModel(id: index.toString(), value: 'item $index'));
  }
}
