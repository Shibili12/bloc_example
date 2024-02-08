import 'package:bloc_example/payment_integration/bloc/razorpay_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Paymentscreen extends StatelessWidget {
  Paymentscreen({super.key});

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.green.shade100,
                  prefixIcon: Icon(
                    Icons.attach_money_outlined,
                    color: Colors.green[900],
                  ),
                  hintText: "Enter Amount to pay",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  )),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 10, right: 10),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  if (controller.text.isNotEmpty) {
                    var options = {
                      "key": "rzp_test_kTaZxLvL6vJ98a",
                      "amount": num.parse(controller.text) * 100,
                      "name": "my test Projects",
                      "description": "payment for our work",
                      "prefill": {
                        "contact": "8848555711",
                        "email": "shibiliazwin23@gmail.com"
                      },
                      "external": {
                        "wallets": ["paytm"]
                      },
                    };
                    context.read<RazorpayBloc>().add(Payevent(option: options));
                  }
                },
                child: Text("PAY"),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[900],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25))),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
