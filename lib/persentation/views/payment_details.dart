import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:payment/core/utils/components.dart';
import 'package:payment/persentation/views/thank_you.dart';

class PaymentDetails extends StatefulWidget {
  PaymentDetails({super.key});

  @override
  State<PaymentDetails> createState() => _PaymentDetailsState();
}

class _PaymentDetailsState extends State<PaymentDetails> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool showBackView = true;
  int isActiveIndex = 0;
  List<String> images = [
    'assets/Groupcredit1.png',
    'assets/GroupPayPal.png',
    'assets/SVGRepo_iconCarrier.png'
  ];
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode=AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Widgets.appBar(screenTitle: 'Payment Details'),
      body: CustomScrollView(

        key: GlobalKey(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsetsDirectional.only(start: 20, end: 20),
                  height: 70,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Widgets.paymentLogo(
                          isActive: isActiveIndex == index,
                          imageUrl: '${images[index]!}',
                          onTap: () {
                            setState(() {
                              isActiveIndex = index;
                              print(index);
                            });
                          }),
                      separatorBuilder: (context, index) => SizedBox(
                            width: 15,
                          ),
                      itemCount: 2),
                ),
                SizedBox(
                  height: 10,
                  ),
                Widgets.CustomCriedtCard(
                  cardHolderValidator: (cardHolderName){
                    return 'enter card Holder Name';
                  },
                  cardNumber: cardNumber,
                  expiryDate: expiryDate,
                  cardHolderName: cardHolderName,
                  cvvCode: cvvCode,
                  formKey: formKey,
                  onCreditCardWidgetChange: (onCreditCardWidgetChange) {},
                  onCreditCardModelChange: (creditCardModel) {
                    setState(() {
                      cardNumber = creditCardModel.cardNumber;
                      cardHolderName = creditCardModel.cardHolderName;
                      expiryDate = creditCardModel.expiryDate;
                      cvvCode = creditCardModel.cvvCode;
                      showBackView = creditCardModel.isCvvFocused;
                    });
                  },
                  autovalidateMode:autovalidateMode ,
                ),
              ],
            ),
          ),
          SliverFillRemaining(
             hasScrollBody: false,
            child: Align(
              alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Widgets.Button(title: 'Payment', onTap: () {
                      if(formKey.currentState!.validate()){
                        formKey.currentState!.save();
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ThankYouView()));
                        print('payment');
                        setState(() {});

                      }else{
                        autovalidateMode=AutovalidateMode.always;
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ThankYouView()));

                        setState(() {});

                      }
                      setState(() {});

                    }),
                    SizedBox(height: 20,)
                  ],
                )),
          )
        ],
      ),
      //),
    );
  }
}
