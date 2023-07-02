import 'package:flutter/material.dart';
import 'package:gp_106_flutter_project/model/payment_method.dart';
import 'package:gp_106_flutter_project/widgets/app_text_filed.dart';
import 'package:gp_106_flutter_project/widgets/payment_method_card.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:material_dialogs/dialogs.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  final List<PaymentMethod> _paymentMethods = <PaymentMethod>[
    PaymentMethod.a(name: 'Visa Card', image: 'images/visa_card.png'),
    PaymentMethod.a(name: 'Master Card', image: 'images/master_card.png'),
    PaymentMethod.a(name: 'Bank Account', image: 'images/bank_account.png'),
    PaymentMethod.a(name: 'PayPal', image: 'images/paypal.png'),
  ];

  late TextEditingController paymentNameController;
  late TextEditingController cardNumberController;
  late TextEditingController expDateController;
  late TextEditingController cvvController;

  @override
  void initState() {
    super.initState();
    paymentNameController = TextEditingController();
    cardNumberController = TextEditingController();
    expDateController = TextEditingController();
    cvvController = TextEditingController();
  }

  @override
  void dispose() {
    paymentNameController.dispose();
    cardNumberController.dispose();
    expDateController.dispose();
    cvvController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Methods'),
        backgroundColor: HexColor('#4B989C'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: _paymentMethods.length,
            itemBuilder: (context, index) {
              return PaymentMethodCard(
                image: _paymentMethods[index].image,
                name: _paymentMethods[index].name,
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: ElevatedButton(
              onPressed: () => addPaymentDialog(),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(0, 50),
                backgroundColor: HexColor('#4B989C'),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Add New Payment',
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void addPaymentDialog() {
    Dialogs.materialDialog(
      dialogShape: Dialogs.dialogShape,
      title: 'Add Payment',
      msg: 'Add new payment method using \n credit card or bank account 😍',
      color: Colors.white,
      titleStyle: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      msgStyle: const TextStyle(fontSize: 17, fontFamily: 'Jannah'),
      context: context,
      actions: [
        SizedBox(
          height: 270,
          child: ListView(
            children: [
              AppTextFiled(
                controller: paymentNameController,
                icon: Icons.person,
                hint: 'Payment Name',
              ),
              const SizedBox(
                height: 20,
              ),
              AppTextFiled(
                controller: cardNumberController,
                type: TextInputType.number,
                icon: Icons.credit_card,
                hint: 'Card Number',
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: AppTextFiled(
                      controller: expDateController,
                      type: TextInputType.datetime,
                      hint: 'Exp. date',
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: AppTextFiled(
                      controller: cvvController,
                      type: TextInputType.number,
                      hint: 'CVV',
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    backgroundColor: HexColor('#4B989C'),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Save',
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
