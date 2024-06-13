import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tugas_akhir_app/common/loading_state.dart';
import 'package:tugas_akhir_app/model/store.dart';
import 'package:tugas_akhir_app/provider/employee_provider.dart';
import 'package:tugas_akhir_app/provider/store_provider.dart';
import 'package:tugas_akhir_app/screen/widgets/button.dart';
import 'package:tugas_akhir_app/screen/widgets/text_field.dart';
import 'package:tugas_akhir_app/screen/widgets/toast_message.dart';

class AddEmployeeScreen extends StatefulWidget {
  const AddEmployeeScreen({super.key});

  @override
  State<AddEmployeeScreen> createState() => _AddEmployeeScreenState();
}

class _AddEmployeeScreenState extends State<AddEmployeeScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  final _storeLocationController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  Store? dropdownValue;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    Future.microtask(() {
      context.read<StoreProvider>().getAllOwnerStore();
    });

    if (context.watch<StoreProvider>().stores.isNotEmpty) {
      dropdownValue = context.watch<StoreProvider>().stores.first;
    }
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _addressController.dispose();
    _storeLocationController.dispose();
    _phoneNumberController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Employee'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
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
                  hintText: 'Input employee name here',
                  labelText: 'Name',
                ),
                const SizedBox(height: 16),
                const Text(
                  'Address',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                CustomTextField(
                  controller: _addressController,
                  hintText: 'Input employee address here',
                  labelText: 'Address',
                ),
                const SizedBox(height: 16),
                const Text(
                  'Store Location',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey[200],
                  ),
                  child: DropdownButton<Store>(
                    value: dropdownValue,
                    isExpanded: true,
                    underline: const SizedBox(),
                    items: context.watch<StoreProvider>().stores.map((store) {
                      return DropdownMenuItem<Store>(
                        value: store,
                        child: Text('${store.name} - ${store.location}'),
                      );
                    }).toList(),
                    onChanged: (Store? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Phone Number',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                CustomTextField(
                  controller: _phoneNumberController,
                  hintText: 'Input employee phone number here',
                  labelText: 'Phone Number',
                ),
                const SizedBox(height: 16),
                const Text(
                  'Email',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                CustomTextField(
                  controller: _emailController,
                  hintText: 'Input employee email here',
                  labelText: 'Email',
                ),
                const SizedBox(height: 16),
                const Text(
                  'Password',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                CustomTextField(
                  controller: _passwordController,
                  hintText: 'Input employee password here',
                  labelText: 'Password',
                  isObscureText: true,
                  counter: true,
                ),
                const SizedBox(height: 16),
                const Text(
                  'Confirm Password',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                CustomTextField(
                  controller: _confirmPasswordController,
                  hintText: 'Input employee password here',
                  labelText: 'Confirm Password',
                  isObscureText: true,
                  counter: true,
                ),
                const SizedBox(height: 40),
                context.watch<EmployeeProvider>().loadingState ==
                        const LoadingState.loading()
                    ? const Center(child: CircularProgressIndicator())
                    : CustomButton(
                        function: () => _onSubmit(dropdownValue),
                        text: 'Submit'),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onSubmit(Store? dropdownValue) async {
    if (_formKey.currentState!.validate()) {
      final provider = context.read<EmployeeProvider>();

      final name = _nameController.text;
      final address = _addressController.text;
      final storeLocation = dropdownValue!.id;
      final phoneNumber = _phoneNumberController.text;
      final email = _emailController.text;
      final password = _passwordController.text;
      final confirmPassword = _confirmPasswordController.text;

      if (password != confirmPassword) {
        ToastMessage.show(context, 'Password and confirm password not match');
        return;
      }

      await provider.createEmployee(
        name,
        address,
        storeLocation,
        phoneNumber,
        email,
        password,
      );

      if (mounted) {
        if (provider.uploadResponse!.success) {
          provider.refreshEmployee();
          context.pop();
          ToastMessage.show(context, provider.uploadResponse!.message);
        } else {
          ToastMessage.show(context, provider.uploadResponse!.message);
        }
      }
    }
  }
}
