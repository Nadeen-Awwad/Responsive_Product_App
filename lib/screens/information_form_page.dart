import 'package:first_app/constants/colors.dart';
import 'package:first_app/googleSheet/models/sheets_column.dart';
import 'package:first_app/messages_manager/messages_manager.dart';
import 'package:flutter/material.dart';
import '../googleSheet/controllers/googleSheets.dart';

class InformationFormPage extends StatefulWidget {
  const InformationFormPage({super.key, required this.size});

  final Size size;

  @override
  _InformationFormPageState createState() => _InformationFormPageState();
}

class _InformationFormPageState extends State<InformationFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _mobileController = TextEditingController();
  final _locationController = TextEditingController();

  bool _isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _mobileController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _nameController.addListener(_clearValidationErrors);
    _mobileController.addListener(_clearValidationErrors);
    _locationController.addListener(_clearValidationErrors);
  }

  // Clears error validation when user interacts with the fields
  void _clearValidationErrors() {
    setState(() {
      _formKey.currentState?.validate();
    });
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _isLoading = true;
      });

      final requestInfo = {
        SheetsColumn.name: _nameController.text.trim(),
        SheetsColumn.phone: _mobileController.text.trim(),
        SheetsColumn.address: _locationController.text.trim(),
      };

      await Future.delayed(Duration(seconds: 2)); // Simulate delay

      // Uncomment to insert data to Google Sheets
      // await SheetFlutter.insert(requestInfo);

      setState(() {
        _isLoading = false;
      });

      // Show success dialog
      MessagesManager.showSuccessDialog(
        context,
        title: 'Request Added Successfully',
        desc: 'We will contact you as soon as possible',
      );
    }
  }

  // Reusable widget for text form fields
  Widget _buildTextFormField({
    required TextEditingController controller,
    required String labelText,
    required TextInputType keyboardType,
    required String? Function(String?) validator,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        fillColor: Palette.lightGrey,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(color: Palette.lightOrange, width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(color: Palette.lightOrange, width: 2.0),
        ),
        labelStyle:
            TextStyle(color: Palette.lightOrange, fontWeight: FontWeight.w600),
      ),
      keyboardType: keyboardType,
      validator: validator,
    );
  }

  // Reusable button widget
  Widget _buildButton({
    required String text,
    required Color backgroundColor,
    required VoidCallback onPressed,
    bool isLoading = false,
  }) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(16),
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        shadowColor: Colors.orange.withOpacity(0.5),
        elevation: 5,
      ),
      onPressed: isLoading ? null : onPressed,
      child: isLoading
          ? CircularProgressIndicator(color: Palette.milkColor)
          : Text(
              text,
              style: TextStyle(
                  color: Palette.milkColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isMobile = widget.size.width < 500;
    final double formWidth =
        isMobile ? widget.size.width * 0.8 : widget.size.width * 0.6;
    final double formHeight =
        isMobile ? widget.size.height * 0.5 : widget.size.height * 0.7;

    // List of buttons with their respective data
    final actionButtons = [
      {
        'text': 'Submit Request Now',
        'backgroundColor': Palette.lightOrange,
        'onPressed': _submitForm,
      },
      {
        'text': 'Cancel',
        'backgroundColor': Palette.milkColor,
        'onPressed': () {},
      },
    ];

    return Container(
      width: formWidth,
      height: formHeight,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 10,
              offset: Offset(0, 4))
        ],
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Enter Your Information',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Palette.lightOrange),
                ),
                SizedBox(height: 20),
                _buildTextFormField(
                  controller: _nameController,
                  labelText: 'Name',
                  keyboardType: TextInputType.name,
                  validator: (value) =>
                      value?.isEmpty ?? true ? 'Please enter your name' : null,
                ),
                SizedBox(height: 20),
                _buildTextFormField(
                  controller: _mobileController,
                  labelText: 'Phone Number',
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value?.isEmpty ?? true)
                      return 'Please enter your phone number';
                    if ((value?.length ?? 0) < 10)
                      return 'Please enter a valid phone number';
                    return null;
                  },
                ),
                SizedBox(height: 20),
                _buildTextFormField(
                  controller: _locationController,
                  labelText: 'Address',
                  keyboardType: TextInputType.text,
                  validator: (value) => value?.isEmpty ?? true
                      ? 'Please enter your address'
                      : null,
                ),
                SizedBox(height: 30),
                _buildActionButtons(isMobile, actionButtons),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildActionButtons(
      bool isMobile, List<Map<String, dynamic>> buttons) {
    return isMobile
        ? Column(
            children: buttons.map((button) {
              return _buildButton(
                text: button['text'],
                backgroundColor: button['backgroundColor'],
                onPressed: button['onPressed'],
                isLoading: _isLoading,
              );
            }).toList(),
          )
        : Row(
            children: buttons.map((button) {
              return Padding(
                padding: const EdgeInsets.only(right: 20),
                child: _buildButton(
                  text: button['text'],
                  backgroundColor: button['backgroundColor'],
                  onPressed: button['onPressed'],
                  isLoading: _isLoading,
                ),
              );
            }).toList(),
          );
  }
}
