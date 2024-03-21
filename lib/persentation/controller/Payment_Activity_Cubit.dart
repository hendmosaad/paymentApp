import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/persentation/controller/Payment_Activity_State.dart';

class PaymentActivityCubit extends Cubit<PaymentActivityState>{
  PaymentActivityCubit() : super(InitialState());
  static PaymentActivityCubit get(context) => BlocProvider.of(context);

}