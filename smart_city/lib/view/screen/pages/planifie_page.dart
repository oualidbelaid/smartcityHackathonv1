import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:intl/intl.dart';
import 'package:smart_city/core/constant/appcolor.dart';

import '../../../controller/booking_controller.dart';

class BookingPage extends StatelessWidget {
  BookingPage({Key? key}) : super(key: key);

  final BookingPageController controller = Get.put(BookingPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInputField(
              label: 'Destination',
              hint: 'Enter destination',
              onChanged: controller.updateDestination,
            ),
            const SizedBox(height: 16),
            _buildInputField(
              label: 'Budget',
              hint: 'Enter budget',
              keyboardType: TextInputType.number,

              onChanged: (value) {
                controller.updateBudget(double.tryParse(value) ?? 0.0);
              },
            ),
            const SizedBox(height: 16),
            Obx(() => _buildDatePicker(
              context: context,
              label: 'Start Date',
              selectedDate: controller.startDate.value,
              onDateSelected: controller.updateStartDate,
            )),
            const SizedBox(height: 16),
            Obx(() => _buildDatePicker(
              context: context,
              label: 'Return Date',
              selectedDate: controller.returnDate.value,
              onDateSelected: controller.updateReturnDate,
            )),
            const SizedBox(height: 16),
            _buildActivityTypesCheckboxes(),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.primary,
                  padding:
                  const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                ),
                onPressed: () {
                  controller.planVacation();
                },
                child: const Text('Plan Vacation', style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField({
    required String label,
    required String hint,
    TextInputType? keyboardType,
    required Function(String) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        TextField(
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColor.primary),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
          onChanged: onChanged,
        ),
      ],
    );
  }

  Widget _buildDatePicker({
    required BuildContext context,
    required String label,
    required DateTime? selectedDate,
    required Function(DateTime?) onDateSelected,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        InkWell(
          onTap: () async {
            final pickedDate = await showDatePicker(
              context: context,
              initialDate: selectedDate ?? DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime.now().add(const Duration(days: 365)),
              builder: (BuildContext context, Widget? child) {
                return Theme(
                  data: ThemeData.light().copyWith(
                    colorScheme: ColorScheme.light(
                      primary: AppColor.primary,
                    ),
                  ),
                  child: child!,
                );
              },
            );
            onDateSelected(pickedDate);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  selectedDate == null
                      ? 'Select Date'
                      : DateFormat('yyyy-MM-dd').format(selectedDate),
                  style: const TextStyle(fontSize: 16),
                ),
                const Icon(Icons.calendar_today, color: Colors.grey),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildActivityTypesCheckboxes() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Activity Types',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Obx(() => Wrap(
          spacing: 8.0,
          runSpacing: 4.0,
          children: controller.availableActivityTypes.map((type) {
            return FilterChip(
              backgroundColor: AppColor.white,
              selectedColor: AppColor.primary,
              checkmarkColor: Colors.white,
              label: Text(type,style: TextStyle(color: controller.activityTypes.contains(type)?Colors.white :AppColor.blackShade1),),

              selected: controller.activityTypes.contains(type),
              onSelected: (isSelected) {
                controller.toggleActivityType(type);
              },
            );
          }).toList(),
        )),
      ],
    );
  }
}