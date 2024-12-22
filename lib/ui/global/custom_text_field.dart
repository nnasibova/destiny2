import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CustomTextField extends StatefulWidget {
  final String question;
  final bool? readOnly;
  final String text;
  final TextInputType? inputType;

  final IconData? suffixIcon;
  final String? Function(String?)? validator;

  final TextEditingController controller;
  const CustomTextField({
    Key? key,
    required this.question,
    this.readOnly,
    required this.text,
    this.inputType,
    this.suffixIcon,
    this.validator,
    required this.controller,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.question,
          style: TextStyle(color: Colors.grey.shade50, fontSize: 16),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          onTap: () {
            widget.text == 'birthOfDate'.tr
                ? datePicker(context)
                : widget.text == 'time'.tr
                    ? timePicker()
                    : null;
          },
          readOnly: widget.readOnly ?? false,
          validator: widget.validator,
          keyboardType: widget.inputType ?? TextInputType.name,
          controller: widget.controller,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            suffixIcon:
                widget.suffixIcon == null ? null : Icon(widget.suffixIcon,color: Colors.white54,),
            contentPadding:
                const EdgeInsets.only(left: 12, right: 12, top: 15, bottom: 15),
            labelText: widget.text,
            labelStyle: const TextStyle(color: Colors.grey),
            filled: true,
            fillColor: Colors.black,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(10.0),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        const SizedBox(
          height: 24,
        ),
      ],
    );
  }

  datePicker(context) async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1920),
        lastDate: DateTime.now());
    if (pickedDate != null) {
      String formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate);
      setState(() {
        widget.controller.text = formattedDate;
      });
    }
  }

  timePicker() async {
    DatePicker.showTimePicker(context,
        showSecondsColumn: false,
        showTitleActions: true,
        onChanged: (date) {}, onConfirm: (date) {
      setState(() {
        widget.controller.text = DateFormat.Hm().format(date);
      });
    }, locale: LocaleType.en);
  }
}
