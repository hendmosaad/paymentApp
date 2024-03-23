import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:payment/core/utils/components.dart';
import 'package:payment/core/utils/styles.dart';
import 'package:payment/persentation/controller/Payment_Activity_Cubit.dart';
import 'package:payment/persentation/controller/Payment_Activity_State.dart';
import 'package:payment/persentation/views/payment_details.dart';
import 'package:payment/persentation/views/thank_you.dart';

class CheckOut extends StatefulWidget {
  CheckOut({super.key});

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  List<String> images = [
    'assets/Groupcredit1.png',
    'assets/GroupPayPal.png',
    'assets/SVGRepo_iconCarrier.png'
  ];

  @override
  Widget build(BuildContext context1) {
    final cubit = PaymentActivityCubit.get(context1);
    return BlocConsumer<PaymentActivityCubit, PaymentActivityState>(
      listener: (context, state) {
        if (state is IntentLoading ||
            state is InitSheetLoading ||
            state is PresentSheetLoading) {
          cubit.isLoading = true;
        } else {
          if (state is PresentSheetSuccess) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => ThankYouView()));
          }
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: Widgets.appBar(screenTitle: 'my cart'),
          body: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Expanded(child: Image(image: AssetImage('assets/Group 6.png'))),
              SizedBox(
                height: 20,
              ),
              Widgets.orderInfo1(title: 'order subtotal', value: r'42$'),
              Widgets.orderInfo1(title: 'Discount', value: r'0$'),
              Widgets.orderInfo1(title: 'Shipping', value: r'4$'),
              Widgets.Divider(),
              Widgets.orderInfo2(),
              Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Widgets.Button(
                      title: 'Complete payment',
                      onTap: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>PaymentDetails()));
                        showModalBottomSheet(
                            isDismissible: false,
                            context: context1,
                            builder: (BuildContext context) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  padding: const EdgeInsets.all(15.0),
                                  height: 180,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              height: 70,
                                              child: ListView.separated(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          index) {
                                                    return Widgets.paymentLogo(
                                                      onTap: () async {
                                                        await cubit
                                                            .changeIsActiveIndex(
                                                                index);
                                                      },
                                                      isActive:
                                                          cubit.isActiveIndex ==
                                                              index,
                                                      imageUrl:
                                                          '${images[index]!}',
                                                    );
                                                  },
                                                  separatorBuilder:
                                                      (context, index) =>
                                                          SizedBox(
                                                            width: 15,
                                                          ),
                                                  itemCount: 2),
                                            ),
                                          ),
                                          IconButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              icon: Icon(
                                                Icons.cancel_outlined,
                                                size: 40,
                                                color: Colors.red,
                                              ))
                                        ],
                                      ),
                                      Spacer(),
                                      Widgets.Button(
                                          isLoading: cubit.isLoading,
                                          title: 'Continue',
                                          onTap: () async {
                                            if (cubit.isActiveIndex == 0) {
                                              await cubit.createPayment();
                                            } else if (cubit.isActiveIndex ==
                                                1) {
                                              Navigator.of(context)
                                                  .push(MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        PaypalCheckoutView(
                                                  sandboxMode: true,
                                                  clientId: "YOUR CLIENT ID",
                                                  secretKey: "YOUR SECRET KEY",
                                                  transactions: const [
                                                    {
                                                      "amount": {
                                                        "total": '100',
                                                        "currency": "USD",
                                                        "details": {
                                                          "subtotal": '100',
                                                          "shipping": '0',
                                                          "shipping_discount": 0
                                                        }
                                                      },
                                                      "item_list": {
                                                        "items": [
                                                          {
                                                            "name": "Apple",
                                                            "quantity": 4,
                                                            "price": '10',
                                                            "currency": "USD"
                                                          },
                                                          {
                                                            "name": "Pineapple",
                                                            "quantity": 5,
                                                            "price": '12',
                                                            "currency": "USD"
                                                          }
                                                        ],
                                                        "shipping_address": {
                                                          "recipient_name":
                                                              "Tharwat samy",
                                                          "line1": "tharwat",
                                                          "line2": "",
                                                          "city": "tharwat",
                                                          "country_code": "EG",
                                                          "postal_code":
                                                              "25025",
                                                          "phone": "+00000000",
                                                          "state": "ALex"
                                                        },
                                                      }
                                                    }
                                                  ],
                                                  note:
                                                      "Contact us for any questions on your order.",
                                                  onSuccess:
                                                      (Map params) async {
                                                    log("onSuccess: $params");
                                                    Navigator.pop(context);
                                                  },
                                                  onError: (error) {
                                                    log("onError: $error");
                                                    Navigator.pop(context);
                                                  },
                                                  onCancel: () {
                                                    print('cancelled:');
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                              ));
                                            }
                                          })
                                    ],
                                  ),
                                ),
                              );
                            });
                      }))
            ],
          ),
        );
      },
    );
  }
}
