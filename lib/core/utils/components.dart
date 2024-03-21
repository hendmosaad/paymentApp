import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:payment/core/utils/styles.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class Widgets {
  static AppBar appBar({ String? screenTitle}) => AppBar(
        leading: Icon(
          Icons.arrow_back,
          size: 30,
        ),
        centerTitle: true,
        title: Text(
          '$screenTitle'??'',
          textAlign: TextAlign.center,
          style: styles.style25,
        ),
      );
  static Widget Button({void Function()? onTap, required String title,bool isLoading =false}) =>
      GestureDetector(
        onTap: onTap,
        child: Container(
          height: 65,
          width: 350,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child:isLoading?CircularProgressIndicator():Text(
              '$title',
              style: styles.style25,
            ),
          ),
        ),
      );
  static Widget orderInfo1({required String title, required String value}) =>
      Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Padding(
            padding:
                const EdgeInsetsDirectional.only(start: 20, end: 20, top: 3),
            child: Row(
              children: [
                Text(
                  '$title',
                  style: styles.style20,
                ),
                Spacer(),
                Text(
                  '$value',
                  style: styles.style20,
                ),
              ],
            ),
          )
        ],
      );
  static Widget orderInfo2() => Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Padding(
            padding:
                const EdgeInsetsDirectional.only(start: 20, end: 20, top: 3),
            child: Row(
              children: [
                Text(
                  'Total',
                  style: styles.style25,
                ),
                Spacer(),
                Text(
                  r'60$',
                  style: styles.style25,
                ),
              ],
            ),
          )
        ],
      );
  static Widget Divider() => Padding(
        padding: const EdgeInsetsDirectional.only(start: 20, end: 20, top: 20),
        child: Container(
          height: 2,
          width: double.infinity,
          color: Colors.blueGrey,
        ),
      );
  static Widget paymentLogo(
          {required imageUrl,
          void Function()? onTap,
          required bool isActive}) =>
      AnimatedContainer(
        duration: Duration(milliseconds: 800),
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            height: 65,
            width: 120,
            decoration: BoxDecoration(
                border: Border.all(
                    color: isActive ? Colors.green : Colors.grey[400]!,
                    width: 3),
                borderRadius: BorderRadius.circular(20)),
            child: Image(image: AssetImage('$imageUrl')),
          ),
        ),
      );
  static Widget CustomCriedtCard({
    required String cardNumber,
    required String expiryDate,
    required String cardHolderName,
    required String cvvCode,
    bool showBackView = true,
    required void Function(CreditCardBrand) onCreditCardWidgetChange,
    required void Function(CreditCardModel) onCreditCardModelChange,
    required GlobalKey<FormState> formKey,
    required AutovalidateMode autovalidateMode,
    required String Function(String?) cardHolderValidator,
  }) =>
      Column(
        children: [
          CreditCardWidget(
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            showBackView: false,
            isHolderNameVisible: true,
            onCreditCardWidgetChange: onCreditCardWidgetChange,

            // Callback for anytime credit card brand is changed
          ),
          CreditCardForm(
            autovalidateMode: autovalidateMode,
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            onCreditCardModelChange: onCreditCardModelChange,
            formKey: formKey,
            cardHolderValidator: cardHolderValidator,
          ),
        ],
      );

  static Widget thankYouViewBody(context) => Padding(
        padding: const EdgeInsetsDirectional.only(top: 50.0,start: 20,end: 20,bottom: 20),
    child: Stack(
           clipBehavior: Clip.none,
          alignment: Alignment.topCenter,
          children: [
            Container(
            width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(20)
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height*.2,
              left: -20,
                child:
                CircleAvatar(backgroundColor: Colors.white,),

            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height*.2,
              right: -20,
                child:
                CircleAvatar(backgroundColor: Colors.white,),

            ),
            Positioned(
              left: 0,
              right:0 ,
              top: -40,
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey[300],
                child: CircleAvatar(
                  backgroundColor: Colors.green,
                  radius: 40,
                  child: Icon(Icons.check,color: Colors.white,size: 50,),),
              ),
            ),
            Positioned(
              left: 0+20+16,
              right:0+20+16 ,
              bottom: MediaQuery.of(context).size.height*.2+20,
              child:Row(
                children:
                  List.generate(40, (index) => Expanded(child: Padding(
                    padding: EdgeInsets.all(2),
                      child: Container(color: Color(0xffB8B8B8),height: 2,))))

              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(top: 60),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Thank You',style: styles.style25,textAlign: TextAlign.center,),
                  Text('Your transaction was successful',style: styles.style20,textAlign: TextAlign.center,),
                  SizedBox(height: 20,),
                  Widgets.ItemInfoRow(title1: 'Date',title2:'20/6/2024' ),
                  Widgets.ItemInfoRow(title1:'time' ,title2: '10:14'),
                  Widgets.ItemInfoRow(title1:'to' ,title2: 'sam louis'),
                  Widgets.Divider(),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Text('Total',style: styles.style25,),
                        Spacer(),
                        Text(r'60$',style: styles.style25,)
                      ],
                    ),
                  ),
                  Widgets.creditContainer(),
                  Spacer(),
                  Positioned(
                      bottom:( MediaQuery.of(context).size.height*.2)/2-20,

                      child: Widgets.tradeSign(context)),

                ],
              ),
            )

          ],
        ),
      );
  static Widget ItemInfoRow({required String title1,required String title2})=>
     Padding(
       padding: const EdgeInsets.all(15),
       child: Row(
         children: [
           Text('${title1}',style: styles.style18,),
           Spacer(),
           Text('${title2}',style: styles.styleBold22),
           SizedBox(height: 20,)
         ],
       ),
     );
  static Widget creditContainer()=>
      Padding(
          padding: EdgeInsets.all( 20),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30,vertical: 30),
          decoration: BoxDecoration(
            color: Colors.white,
                borderRadius: BorderRadius.circular(15)
          ),
          child: Row(
            children: [
              Image(image: AssetImage('assets/logo.png')),
              SizedBox(width: 30,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Credit card',style: styles.styleBold22,),
                  Text('Mastercard **89',style: styles.style20,),
                ],
              )
            ],
          ),
        ),
      );
  static Widget tradeSign(context)=>
  Padding(
    padding: const EdgeInsetsDirectional.only(start: 20.0,end: 20,bottom: 40,top: 30),
    child: Row(
      children: [
        Image(image: AssetImage('assets/SVGRepo_iconCarrier2.png')),
        Spacer(),
        Container(
          height: 70,
          width: 100,
          child: Center(child: Text('PAID',style: styles.style30.copyWith(color: Colors.green))),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.green,width: 2,)

          ),
        )
      ],
    ),
  )
  ;
}
