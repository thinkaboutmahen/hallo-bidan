import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildHeader(context),
              SizedBox(height: 20),
              _buildEmailInstruction(context),
              _buildEmailForm(context),
              SizedBox(height: 20),
              _buildSubmitButton(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
            padding: EdgeInsets.zero,
            alignment: Alignment.centerLeft,
          ),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              "Lupa Kata Sandi",
              style: Theme.of(context).textTheme.headline6,
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmailInstruction(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Text(
        "Masukkan email Anda untuk \nmengatur ulang kata sandi",
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }

  Widget _buildEmailForm(BuildContext context) {
    return TextFormField(
      controller: _emailController,
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Masukkan email Anda",
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.email),
      ),
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
    );
  }

  Widget _buildSubmitButton(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () => _handlePasswordReset(context),
        child: Text('Kirim Permintaan'),
        style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 50), // makes it stretch
        ),
      ),
    );
  }

  void _handlePasswordReset(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      // Simulate password reset functionality
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Permintaan reset kata sandi telah dikirim ke ${_emailController.text}"),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }
}

