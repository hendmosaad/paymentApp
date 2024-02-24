import 'package:flutter/material.dart';
import 'package:payment/core/utils/components.dart';
import 'package:payment/core/utils/styles.dart';
import 'package:payment/persentation/views/payment_details.dart';

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
  int isActiveIndex=0;
  @override
  Widget build(BuildContext context1) {
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
                        return  Padding(
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
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (BuildContext context, index) {
                                              return   Widgets.paymentLogo(
                                                onTap: () {
                                                  setState(() {
                                                    isActiveIndex = index;
                                                  });
                                                },
                                                  isActive: isActiveIndex == index,
                                                  imageUrl: '${images[index]!}',
                                                 );
                                            },
                                            separatorBuilder: (context, index) => SizedBox(
                                              width: 15,
                                            ),
                                            itemCount: 2),
                                      ),
                                    ),

                                    IconButton(onPressed: (){
                                      Navigator.pop(context);
                                    }, icon: Icon(Icons.cancel_outlined,size: 40,color: Colors.red,))
                                  ],
                                ),
                                Spacer(),
                                Widgets.Button(title: 'Continue')
                              ],
                            ),
                          ),
                        );
                      });
                }))
        ],
      ),
    );
  }

}
