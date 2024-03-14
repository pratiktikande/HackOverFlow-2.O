
import 'package:flutter/material.dart';

import 'package:lawtrix/router/router.dart' as route;


class ClientRegister extends StatefulWidget {
  const ClientRegister({super.key});

  @override
  State<ClientRegister> createState() => _ClientRegisterState();
}

final url = Uri.parse("https://lawtrix-backend-server.onrender.com/user/signup");

class _ClientRegisterState extends State<ClientRegister> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();



  // void selectImage() async {
  //   try {
  //     XFile img = await pickImage(ImageSource.gallery);
  //     setState(() {
  //       _path = img.path;
  //     });
  //   } catch (er) {
  //     const SnackBar(content: Text("No Image selected"));
  //   }
  // }

  // _register() async {
  //   var data = {
  //     'name': nameController.text,
  //     'email': emailController.text,
  //     'password': passwordController.text,
  //   };
  //   var res = await Callapi().postSignupData(data, 'register');
  //   //:w
  //   var body = json.decode(res.body);
  //   if (body['sucess']) {
  //     var nav = Navigator.pushNamed(context, route.loginPage);
  //     print(body['id']);
  //     nav;
  //   } else {
  //     const AlertDialog(
  //       content: Text("Please recheck your details...."),
  //       title: Text("Error"),
  //     );
  //   }
  // }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                  gradient:
                  LinearGradient(colors: [Colors.purple, Colors.black87])),
              child: const Padding(
                padding: EdgeInsets.only(top: 60.0, left: 22),
                child: Text(
                  'Create\n a New Account',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 200.0),
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Spacer(),
                      // Stack(
                      //   children: [
                      //     _path != null
                      //         ? CircleAvatar(
                      //             radius: 60,
                      //             backgroundImage: FileImage(File(_path!)),
                      //           )
                      //         : const CircleAvatar(
                      //             radius: 60,
                      //             backgroundImage:
                      //                 AssetImage("./assets/images/logo.png")),
                      //     Positioned(
                      //       bottom: -10,
                      //       left: 80,
                      //       child: IconButton(
                      //           onPressed: () {
                      //             // selectImage();
                      //           },
                      //           icon: const Icon(Icons.add_a_photo)),
                      //     )
                      //   ],
                      // ),
                      TextField(
                        decoration: const InputDecoration(
                            suffixIcon:
                            Icon(Icons.account_circle, color: Colors.grey),
                            label: Text(
                              "Name",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                        controller: nameController,
                      ),
                      TextField(
                        controller: emailController,
                        decoration: const InputDecoration(
                            suffixIcon: Icon(Icons.email, color: Colors.grey),
                            label: Text(
                              "Email",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                      ),
                      TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                            suffixIcon:
                            Icon(Icons.visibility_off, color: Colors.grey),
                            label: Text(
                              "Password",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                      ),
                      const Spacer(),
                      FilledButton(
                        style: FilledButton.styleFrom(
                            minimumSize: const Size(400, 50)),
                        onPressed: () {
                          // Navigator.popAndPushNamed(context, route.homePage);
                          // _register();
                          // Navigator.of(context).push(
                          //     MaterialPageRoute(
                          //         builder: (context)=> ImageUpload()
                          //     )
                          // );
                          // upload(File(_path!));
                        },
                        child: const Text("Sign up"),
                      ),
                      const Spacer(),
                      const Align(
                        alignment: Alignment.center,
                        child: Text("Already Have an account ?",
                            style: TextStyle()),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.popAndPushNamed(context, route.cregister);
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.primary),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Client Register",
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
