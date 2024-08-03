import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tugas_akhir_app/provider/payslip_provider.dart';
import 'package:tugas_akhir_app/screen/widgets/button.dart';
import 'package:tugas_akhir_app/screen/widgets/text_field.dart';

class AddEarningScreen extends StatefulWidget {
  const AddEarningScreen({super.key});

  @override
  State<AddEarningScreen> createState() => _AddEarningScreenState();
}

class _AddEarningScreenState extends State<AddEarningScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _amountController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Earning'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Name',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  CustomTextField(
                    controller: _nameController,
                    labelText: 'Name',
                    hintText: 'Input earning name here',
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Amount',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  CustomTextField(
                    controller: _amountController,
                    labelText: 'Amount',
                    hintText: 'Input earning amount here',
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                _onSubmit(context),
                const SizedBox(height: 40),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _onSubmit(BuildContext context) {
    return CustomButton(
      function: () {
        if (_formKey.currentState!.validate()) {
          final name = _nameController.text;
          final amount = int.parse(_amountController.text);

          context.read<PayslipProvider>().addEarning(name, amount);
          context.pop();
        }
      },
      text: 'Submit',
    );
  }
}
