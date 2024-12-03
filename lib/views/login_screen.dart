import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool isChecked = false; // Status awal checkbox
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(  
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(230), // Tinggi AppBar
          child: AppBar(
              flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(204, 224, 255, 1),
                  Colors.white,
                ], // Warna gradient
                begin: Alignment.topCenter, // Awal gradient
                end: Alignment.bottomCenter, // Akhir gradient
              ),
            ),
            child: Center(
              child: Image.asset(
                'assets/img/icon-login.png',
                fit: BoxFit.cover,
                width: 200,
              ),
            ),
          )),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hai Moviegoers!',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.secondary),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Sudah siap merasakan pengalaman menonton yang tidak terlupakan?',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.secondary),
                ),
                SizedBox(
                  height: 20,
                ),
                Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Email or WhatsApp Number'),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .9,
                          child: TextFormField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          Theme.of(context).colorScheme.secondary,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(10)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Theme.of(context).primaryColor,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(10)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade300,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(10)),
                                hintText: 'Masukkan email atau nomor whatsapp',
                                hintStyle: TextStyle(
                                    color: Colors.grey.shade400,
                                    fontWeight: FontWeight.normal)),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Email tidak boleh kosong';
                              }
                              // Menggunakan RegExp untuk validasi email
                              if (!RegExp(
                                      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$')
                                  .hasMatch(value)) {
                                return 'Masukkan email yang valid';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text('Password'),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * .9,
                            child: TextFormField(
                              validator: (value) => value!.length < 8
                                  ? "Password minimal memiliki 8 karakter."
                                  : null,
                              controller: _passwordController,
                              obscureText: _obscureText,
                              decoration: InputDecoration(
                                  errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(10)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Theme.of(context).primaryColor,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(10)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.grey.shade300,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(10)),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  hintText: 'Masukkan password',
                                  hintStyle: TextStyle(
                                      color: Colors.grey.shade400,
                                      fontWeight: FontWeight.normal),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _obscureText = !_obscureText;
                                      });
                                    },
                                    icon: _obscureText
                                        ? Icon(Icons.visibility_off)
                                        : Icon(Icons.visibility),
                                    color: Theme.of(context).primaryColor,
                                  )),
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Checkbox(
                              activeColor: Colors.transparent,
                              checkColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              side: WidgetStateBorderSide.resolveWith(
                                  (Set<MaterialState> states) {
                                if (states.contains(MaterialState.selected)) {
                                  // Saat dicentang, border biru tetap ada
                                  return BorderSide(color: Colors.blue, width: 2);
                                }
                                // Saat tidak dicentang, border tetap biru
                                return BorderSide(color: Colors.blue, width: 2);
                              }), // Border berwarna biru
                              value: isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value ?? false;
                                });
                              },
                            ),
                            Expanded(
                                child: Text(
                                    'Ya, saya menerima syarat dan ketentuan yang berlaku')),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Forgot Password',
                                  style: TextStyle(
                                      color:
                                          Theme.of(context).colorScheme.secondary,
                                      fontWeight: FontWeight.normal),
                                ))
                          ],
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * .9,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadiusDirectional.circular(
                                                    10))),
                                    backgroundColor: isChecked == true ? WidgetStateProperty.all(
                                        Theme.of(context).primaryColor) : WidgetStatePropertyAll(Colors.grey.shade300)),
                                onPressed: () async {
                                  if (formKey.currentState?.validate() == true &&
                                      isChecked == true) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            margin: EdgeInsets.only(
                                                bottom: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    .9,
                                                left: 20,
                                                right: 20),
                                            behavior: SnackBarBehavior.floating,
                                            content: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Masuk ke halaman dashboard',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                            backgroundColor: Colors.green));
                                    showDialog(
                                      context: context,
                                      barrierDismissible: false,
                                      builder: (BuildContext context) {
                                        return Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      },
                                    );
      
                                    // Tambahkan jeda waktu 2 detik
                                    await Future.delayed(Duration(seconds: 2));
      
                                    // Tutup dialog
                                    Navigator.pop(context);
                                    Navigator.pushReplacementNamed(
                                        context, '/dashboard');
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            margin: EdgeInsets.only(
                                                bottom: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    .9,
                                                left: 20,
                                                right: 20),
                                            behavior: SnackBarBehavior.floating,
                                            content: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Silakan coba lagi atau daftarkan akun baru',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                            backgroundColor: Colors.red));
                                  }
                                },
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900),
                                ))),
                      ],
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Belum punya akun?'),
                    SizedBox(
                      width: 10,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Daftar di sini',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
