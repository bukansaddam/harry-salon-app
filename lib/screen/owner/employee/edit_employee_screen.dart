import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tugas_akhir_app/model/store_owner.dart';
import 'package:tugas_akhir_app/provider/employee_detail_provider.dart';
import 'package:tugas_akhir_app/provider/employee_provider.dart';
import 'package:tugas_akhir_app/provider/store_provider.dart';
import 'package:tugas_akhir_app/screen/widgets/toast_message.dart';

class EditEmployeeScreen extends StatefulWidget {
  const EditEmployeeScreen({super.key, required this.id});

  final String id;

  @override
  State<EditEmployeeScreen> createState() => _EditEmployeeScreenState();
}

class _EditEmployeeScreenState extends State<EditEmployeeScreen> {
  final _storeLocationController = TextEditingController();

  StoreOwner? dropdownValue;
  StoreProvider? storeProvider;
  EmployeeProvider? employeeProvider;
  EmployeeDetailProvider? employeeDetailProvider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    storeProvider = Provider.of<StoreProvider>(context, listen: false);
    employeeProvider = Provider.of<EmployeeProvider>(context, listen: false);

    Future.microtask(() async {
      await storeProvider!.getAllOwnerStore();
      if (storeProvider!.stores.isNotEmpty) {
        setState(() {
          dropdownValue = storeProvider!.stores.first;
        });
      }
    });
  }

  @override
  void dispose() {
    _storeLocationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Store'),
        actions: [
          IconButton(
            onPressed: () {
              employeeProvider!
                  .changeStoreEmployee(widget.id, dropdownValue!.id)
                  .then((value) {
                if (employeeProvider!.uploadResponse!.success) {
                  context.pop();
                  ToastMessage.show(context, 'Store Changed');
                }
              }).catchError((error) {
                ToastMessage.show(context, error.toString());
              });
            },
            icon: const Icon(Icons.done),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Store Location',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 4),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey[200],
              ),
              child: DropdownButton<StoreOwner>(
                value: dropdownValue,
                isExpanded: true,
                underline: const SizedBox(),
                items: storeProvider!.stores.map((store) {
                  return DropdownMenuItem<StoreOwner>(
                    value: store,
                    child: Text('${store.name} - ${store.location}'),
                  );
                }).toList(),
                onChanged: (StoreOwner? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
