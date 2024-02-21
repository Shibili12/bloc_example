import 'package:bloc_example/favoriteapp_using_bloc/bloc/favourite_bloc.dart';
import 'package:bloc_example/favoriteapp_using_bloc/model/favitemmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<FavouriteBloc>().add(FetchFavouriteList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: const Text(
          "Favourite App",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        actions: [
          BlocBuilder<FavouriteBloc, FavouriteState>(
            builder: (context, state) {
              return Visibility(
                visible: state.temFavlist.isNotEmpty ? true : false,
                child: IconButton(
                    onPressed: () {
                      context.read<FavouriteBloc>().add(Deleteitem());
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    )),
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<FavouriteBloc, FavouriteState>(
        builder: (context, state) {
          switch (state.liststatus) {
            case Liststatus.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case Liststatus.failure:
              return const Center(
                child: Text("Error"),
              );
            case Liststatus.sucsess:
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ListView.builder(
                  itemCount: state.favitemlist.length,
                  itemBuilder: (context, index) {
                    final item = state.favitemlist[index];
                    return Card(
                      color: Colors.grey.shade200,
                      child: ListTile(
                        leading: Checkbox(
                          value: state.temFavlist.contains(item) ? true : false,
                          onChanged: (value) {
                            if (value!) {
                              context
                                  .read<FavouriteBloc>()
                                  .add(Selectitem(item: item));
                            } else {
                              context
                                  .read<FavouriteBloc>()
                                  .add(UnselectItem(item: item));
                            }
                          },
                        ),
                        title: Text(item.value),
                        trailing: IconButton(
                            onPressed: () {
                              FavitemModel itemModel = FavitemModel(
                                  id: item.id,
                                  value: item.value,
                                  isFavorite: item.isFavorite ? false : true);
                              context
                                  .read<FavouriteBloc>()
                                  .add(Favoriteitemselect(item: itemModel));
                            },
                            icon: Icon(
                              item.isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: Colors.red,
                            )),
                      ),
                    );
                  },
                ),
              );
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
