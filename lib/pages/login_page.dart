import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  bool _isLoading = false;

  // Sabit kullanıcı bilgileri
  static const String fixedName = "Aysude TÜRKCAN";
  static const String fixedEmail = "aysude14@gmail.com";
  static const String fixedPassword = "144114";

  // Ad Soyad: sadece harf ve boşluk
  final _nameInputFormatter = FilteringTextInputFormatter.allow(
    RegExp(r"[a-zA-ZğüşöçıİĞÜŞÖÇ\s]"),
  );

  // Şifre: sadece rakam, 6 hane
  final _digitOnlyFormatter = FilteringTextInputFormatter.digitsOnly;

  String? _validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Ad Soyad zorunlu";
    }
    // Sayı içeriyorsa reddet
    if (RegExp(r"\d").hasMatch(value)) {
      return "Ad Soyad sadece harf ve boşluk içermeli";
    }
    // En az iki kelime (ad ve soyad)
    final parts = value.trim().split(RegExp(r"\s+"));
    if (parts.length < 2) {
      return "Lütfen ad ve soyad girin";
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "E-posta zorunlu";
    }
    final email = value.trim();
    // Basit e-posta kontrolü ve sadece gmail.com
    final emailRegex = RegExp(r"^[\w\.\-]+@gmail\.com$");
    if (!emailRegex.hasMatch(email)) {
      return "Sadece gmail.com uzantılı e-posta kabul edilir";
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Şifre zorunlu";
    }
    if (!RegExp(r"^\d{6}$").hasMatch(value)) {
      return "Şifre sadece rakam ve 6 haneli olmalı";
    }
    return null;
  }

  Future<void> _submit() async {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) return;

    setState(() => _isLoading = true);

    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final pass = _passController.text;

    // Sabit kimlik kontrolü
    if (name == fixedName && email == fixedEmail && pass == fixedPassword) {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const AnaSayfa()),
      );
    } else {
      // Hatalı giriş
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Bilgiler eşleşmiyor. Lütfen kontrol edin."),
        ),
      );
    }

    setState(() => _isLoading = false);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Giriş Yap")),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Dijital Kitaplığım",
                    style: theme.textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 16),

                  // Ad Soyad
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: "Ad Soyad",
                      hintText: "Örn: Ad SOYAD",
                      border: OutlineInputBorder(),
                    ),
                    inputFormatters: [_nameInputFormatter],
                    textInputAction: TextInputAction.next,
                    validator: _validateName,
                  ),
                  const SizedBox(height: 12),

                  // E-posta
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: "E-posta",
                      hintText: "Örn: example@gmail.com",
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    validator: _validateEmail,
                  ),
                  const SizedBox(height: 12),

                  // Şifre
                  TextFormField(
                    controller: _passController,
                    decoration: const InputDecoration(
                      labelText: "Şifre",
                      hintText: "6 haneli rakam",
                      border: OutlineInputBorder(),
                      counterText: "",
                    ),
                    obscureText: true,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      _digitOnlyFormatter,
                      LengthLimitingTextInputFormatter(6),
                    ],
                    validator: _validatePassword,
                  ),
                  const SizedBox(height: 20),

                  // Giriş butonu
                  ElevatedButton(
                    onPressed: _isLoading ? null : _submit,
                    child: _isLoading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Text("Giriş Yap"),
                  ),

                  const SizedBox(height: 8),
                  const Text(
                    "Not: Ad Soyad sadece harf ve boşluk; e-posta sadece gmail.com; şifre 6 haneli rakam olmalı.",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
