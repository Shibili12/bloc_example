import 'package:bloc_example/apicrud/bloc/cart_bloc.dart';
import 'package:bloc_example/apicrud/bloc/fetch_bloc.dart';
import 'package:bloc_example/apicrud/pages/cartpage.dart';
import 'package:bloc_example/apicrud/pages/curd_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePAge extends StatelessWidget {
  const HomePAge({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<FetchBloc, FetchState>(
          builder: (context, state) {
            return state.isLoading == true
                ? CircularProgressIndicator()
                : GridView.builder(
                    itemCount: state.data.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemBuilder: ((context, index) {
                      return GestureDetector(
                        onTap: () {
                          popup(
                              state.data[index].title,
                              state.data[index].price,
                              context,
                              state.data[index].image);
                        },
                        child: Card(
                          child: Column(
                            children: [
                              Image.network(state.data[index].image!,
                                  fit: BoxFit.cover, height: 100),
                              Text(
                                state.data[index].title ?? "",
                                maxLines: 2,
                              ),
                              Text(state.data[index].price.toString() ?? "")
                            ],
                          ),
                        ),
                      );
                    }));
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton.extended(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => CurdPage()));
              },
              label: Text("next page")),
          FloatingActionButton.extended(
              onPressed: () {
                context.read<FetchBloc>().add(FetchApi());
              },
              label: Text("Load")),
          FloatingActionButton.extended(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => CartPage()));
              },
              label: Text("Cart page")),
        ],
      ),
    );
  }

  popup(String? title, double? price, BuildContext context, String? image) {
    final qtycontroller = TextEditingController();
    final totalcontroller = TextEditingController();
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Container(
              height: 400,
              child: Column(
                children: [
                  const Text(
                    "Product Name",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    title!,
                    maxLines: 2,
                    style: const TextStyle(fontSize: 15),
                  ),
                  const Text(
                    "Product Price",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(price.toString()),
                  const Text(
                    "Enter Qty",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: qtycontroller,
                      decoration: InputDecoration(border: OutlineInputBorder()),
                      onChanged: (value) {
                        context.read<FetchBloc>().add(Caltotal(
                            qty: int.parse(value),
                            price: price!,
                            totalcontroller: totalcontroller));
                      },
                    ),
                  ),
                  const Text(
                    "Total  Amount",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: totalcontroller,
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        context.read<CartBloc>().add(AddtoCart(
                            image: image!,
                            name: title,
                            price: price!,
                            qty: int.parse(qtycontroller.text)));
                        Navigator.of(context).pop();
                      },
                      child: Text("Add to Cart")),
                ],
              ),
            ),
          );
        });
  }
}
