import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tugas_akhir_app/provider/user_provider.dart';
import 'package:tugas_akhir_app/screen/widgets/button.dart';
import 'package:tugas_akhir_app/screen/widgets/text_field.dart';
import 'package:tugas_akhir_app/screen/widgets/toast_message.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key, required this.title, required this.user});

  final String title;
  final String user;

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _dataController = TextEditingController();
  final _key = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _dataController.text = widget.user;
  }

  @override
  void dispose() {
    super.dispose();
    _dataController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit ${widget.title}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 4),
              CustomTextField(
                controller: _dataController,
                hintText: 'Input ${widget.title} here',
                labelText: widget.title,
                keyboardType: widget.title == 'Phone'
                    ? TextInputType.number
                    : TextInputType.text,
                inputFormatters: [
                  if (widget.title == 'Phone')
                    FilteringTextInputFormatter.digitsOnly,
                ],
              ),
              const SizedBox(height: 24),
              Consumer<UserProvider>(
                builder: (context, userProvider, child) {
                  final state = userProvider.loadingState;
                  return state.when(
                    initial: () => _onSubmit(userProvider),
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    loaded: () => _onSubmit(userProvider),
                    error: (error) => Center(child: Text(error.toString())),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _onSubmit(UserProvider userProvider) {
    return CustomButton(
        function: () async {
          if (_key.currentState!.validate()) {
            if (widget.title == 'Phone') {
              if (_dataController.text.length < 10) {
                ToastMessage.show(context, 'Phone number must be 10 or more');
                return;
              } else if (_dataController.text.length > 15) {
                ToastMessage.show(context, 'Phone number must be 15 or less');
                return;
              }
            }

            await userProvider.updateProfile(
              data: _dataController.text,
              title: widget.title,
            );

            if (mounted) {
              if (userProvider.uploadResponse!.success) {
                ToastMessage.show(context, 'Success update ${widget.title}');
                context.pop();
                userProvider.getDetailUser();
              }
            }
          }
        },
        text: 'Submit');
  }
}
