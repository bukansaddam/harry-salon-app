import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tugas_akhir_app/model/employee.dart';
import 'package:tugas_akhir_app/provider/employee_provider.dart';
import 'package:tugas_akhir_app/provider/payslip_provider.dart';
import 'package:tugas_akhir_app/screen/widgets/button.dart';
import 'package:tugas_akhir_app/screen/widgets/text_field.dart';
import 'package:tugas_akhir_app/screen/widgets/toast_message.dart';

class AddPayslipScreen extends StatefulWidget {
  const AddPayslipScreen({super.key});

  @override
  State<AddPayslipScreen> createState() => _AddPayslipScreenState();
}

class _AddPayslipScreenState extends State<AddPayslipScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _dateController = TextEditingController();

  DateTime _selectedDate = DateTime.now();

  late PayslipProvider _payslipProvider;

  Employee? dropdownValue;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _payslipProvider = Provider.of<PayslipProvider>(context, listen: false);

    _dateController.text =
        DateFormat('EEEE, dd MMMM yyyy').format(_selectedDate);

    Future.microtask(() {
      context.read<EmployeeProvider>().getAllEmployee();
    });

    if (context.watch<EmployeeProvider>().employees.isNotEmpty) {
      dropdownValue = context.watch<EmployeeProvider>().employees.first;
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _dateController.dispose();
    _payslipProvider.clearImage();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<PayslipProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Payslip'),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Title',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    CustomTextField(
                      controller: _titleController,
                      labelText: 'Title',
                      hintText: 'Input payslip title here',
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Employee',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    _buildEmployeeDropdown(),
                    const SizedBox(height: 16),
                    const Text(
                      'Date',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    InkWell(
                      onTap: () async {
                        showDatePicker(
                          context: context,
                          firstDate: DateTime(2000),
                          lastDate: DateTime.now(),
                          initialDate: _selectedDate,
                        ).then(
                          (value) {
                            if (value != null) {
                              _selectedDate = value;
                              _dateController.text =
                                  DateFormat('EEEE, dd MMMM yyyy')
                                      .format(value);
                            }
                          },
                        );
                      },
                      child: CustomTextField(
                        controller: _dateController,
                        hintText: 'Choose Date',
                        labelText: 'Date',
                        enabled: false,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildEarningSection(context),
                    const SizedBox(height: 16),
                    _buildDeductionSection(context),
                    const SizedBox(height: 16),
                    const Text(
                      'Attachment',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    _buildImage(context),
                    const SizedBox(height: 170),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.all(16),
              height: 150,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 14,
                    offset: const Offset(0, -1),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    NumberFormat.currency(
                      locale: 'id',
                      symbol: 'Total : Rp ',
                      decimalDigits: 0,
                    ).format(provider.totalPayslip),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  context.watch<PayslipProvider>().loadingState.when(
                      initial: () => CustomButton(
                            function: () {
                              _onSubmit(provider);
                            },
                            text: 'Submit',
                            width: double.infinity,
                          ),
                      loading: () => const Center(
                            child: CircularProgressIndicator(),
                          ),
                      loaded: () => CustomButton(
                            function: () {
                              _onSubmit(provider);
                            },
                            text: 'Submit',
                            width: double.infinity,
                          ),
                      error: (message) => CustomButton(
                            function: () {
                              _onSubmit(provider);
                            },
                            text: 'Submit',
                            width: double.infinity,
                          )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    final provider = context.watch<PayslipProvider>();
    return provider.imageUrls.isNotEmpty
        ? SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: provider.imageUrls.length + 1,
              itemBuilder: (context, index) {
                if (index == provider.imageUrls.length) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: InkWell(
                      onTap: () {
                        _buildBottomSheet(context);
                      },
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.add,
                          size: 50,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: InkWell(
                      onLongPress: () {
                        showDialog(
                          context: context,
                          builder: (_) {
                            return AlertDialog(
                              title: const Text('Delete Image'),
                              content: const Text(
                                  'Are you sure want to delete this image?'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('No'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    provider.removeImage(index);
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Yes'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.file(
                          File(provider.imageUrls[index]),
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
          )
        : InkWell(
            onTap: () {
              _buildBottomSheet(context);
            },
            child: Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: Icon(
                  Icons.image_outlined,
                  size: 50,
                  color: Colors.grey,
                ),
              ),
            ),
          );
  }

  Future<void> _buildBottomSheet(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      builder: (context) {
        return SizedBox(
          height: 200,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 16.0, top: 16),
                child: Text(
                  'Add Image',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.camera),
                title: const Text('Camera'),
                onTap: () {
                  _onCameraView();
                },
              ),
              ListTile(
                leading: const Icon(Icons.image),
                title: const Text('Gallery'),
                onTap: () {
                  _onGalleryView();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _onCameraView() async {
    final provider = context.read<PayslipProvider>();

    final isMacOS = defaultTargetPlatform == TargetPlatform.macOS;
    final isLinux = defaultTargetPlatform == TargetPlatform.linux;
    if (isMacOS || isLinux) return;

    final ImagePicker picker = ImagePicker();

    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      if (!mounted) return;
      if (provider.imageUrls.isNotEmpty) {
        provider.addImage(pickedFile);
      }
      provider.setImages([pickedFile]);
      ToastMessage.show(context, 'Image added');
    }
  }

  void _onGalleryView() async {
    final provider = context.read<PayslipProvider>();

    final isMacOS = defaultTargetPlatform == TargetPlatform.macOS;
    final isLinux = defaultTargetPlatform == TargetPlatform.linux;
    if (isMacOS || isLinux) return;

    final ImagePicker picker = ImagePicker();

    final List<XFile> pickedFiles = await picker.pickMultiImage();

    if (pickedFiles.isNotEmpty && mounted) {
      if (provider.imageUrls.isNotEmpty) {
        provider.addImages(pickedFiles);
      } else {
        provider.setImages(pickedFiles);
      }
      ToastMessage.show(context, 'Image added');
    }

    if (mounted) {
      context.pop();
    }
  }

  Widget _buildEarningSection(BuildContext context) {
    final provider = context.watch<PayslipProvider>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Earnings',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 4),
        _buildListEarnings(context),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomButton(
              function: () {
                context.goNamed('add_earning');
              },
              text: 'Add Earnings',
              width: 190,
              height: 30,
            ),
            provider.totalEarning == 0
                ? const SizedBox.shrink()
                : Text(
                    NumberFormat.currency(
                      locale: 'id',
                      symbol: 'Total : Rp ',
                      decimalDigits: 0,
                    ).format(provider.totalEarning),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ],
        ),
      ],
    );
  }

  Widget _buildDeductionSection(BuildContext context) {
    final provider = context.watch<PayslipProvider>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Deductions',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 4),
        _buildListDeductions(context),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomButton(
              function: () {
                context.goNamed('add_deduction');
              },
              text: 'Add Deductions',
              width: 190,
              height: 30,
            ),
            provider.totalDeduction == 0
                ? const SizedBox.shrink()
                : Text(
                    NumberFormat.currency(
                      locale: 'id',
                      symbol: 'Total : - Rp ',
                      decimalDigits: 0,
                    ).format(provider.totalDeduction),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ],
        ),
      ],
    );
  }

  Widget _buildListEarnings(BuildContext context) {
    final provider = context.watch<PayslipProvider>();

    if (provider.earnings.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Text('No Earnings Added Yet'),
        ),
      );
    } else {
      return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: provider.earnings.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 8,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(provider.earnings[index].name),
                Row(
                  children: [
                    Text(
                      NumberFormat.currency(
                        locale: 'id',
                        symbol: 'Rp ',
                        decimalDigits: 0,
                      ).format(provider.earnings[index].amount),
                    ),
                    IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Delete Earning'),
                              content: const Text(
                                  'Are you sure want to delete this earning ?'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('No'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    provider.removeEarning(index);
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Yes'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      icon: const Icon(Icons.close),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      );
    }
  }

  Widget _buildListDeductions(BuildContext context) {
    final provider = context.watch<PayslipProvider>();

    if (provider.deductions.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Text('No Deductions Added Yet'),
        ),
      );
    } else {
      return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: provider.deductions.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 8,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(provider.deductions[index].name),
                Row(
                  children: [
                    Text(
                      NumberFormat.currency(
                        locale: 'id',
                        symbol: '- Rp ',
                        decimalDigits: 0,
                      ).format(provider.deductions[index].amount),
                    ),
                    IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Delete Deduction'),
                              content: const Text(
                                  'Are you sure want to delete this deduction ?'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('No'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    provider.removeDeduction(index);
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Yes'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      icon: const Icon(Icons.close),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      );
    }
  }

  void _onSubmit(PayslipProvider value) async {
    final provider = context.read<PayslipProvider>();

    if (_formKey.currentState!.validate()) {
      final name = _titleController.text;
      final employeeId = dropdownValue!.id;
      final total = provider.totalPayslip;
      final earnings = provider.earnings;
      final deductions = provider.deductions;

      if (earnings.isEmpty) {
        ToastMessage.show(context, 'Earnings must be filled');
        return;
      }

      await provider.createPayslip(
          name, employeeId, total, earnings, deductions);

      if (mounted) {
        if (provider.uploadResponse!.success) {
          provider.refreshPayslip();
          context.pop();
          ToastMessage.show(context, provider.uploadResponse!.message);
        } else {
          ToastMessage.show(context, provider.uploadResponse!.message);
        }
      }
    }
  }

  Widget _buildEmployeeDropdown() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey[200],
      ),
      child: dropdownValue != null
          ? DropdownButton<Employee>(
              value: dropdownValue,
              icon: const Icon(Icons.arrow_drop_down),
              iconSize: 24,
              elevation: 16,
              isExpanded: true,
              underline: const SizedBox(),
              onChanged: (Employee? newValue) {
                setState(() {
                  dropdownValue = newValue;
                });
              },
              items: context.watch<EmployeeProvider>().employees.map(
                (Employee value) {
                  return DropdownMenuItem<Employee>(
                    value: value,
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 15,
                          backgroundImage: NetworkImage(value.avatar),
                        ),
                        const SizedBox(width: 8),
                        Text(value.name),
                      ],
                    ),
                  );
                },
              ).toList(),
            )
          : DropdownButton(
              value: dropdownValue,
              icon: const Icon(Icons.arrow_drop_down),
              iconSize: 24,
              elevation: 16,
              isExpanded: true,
              underline: const SizedBox(),
              onChanged: (value) {},
              items: const [
                DropdownMenuItem(
                  value: null,
                  child: Text('No Employee Found'),
                ),
              ],
            ),
    );
  }
}
