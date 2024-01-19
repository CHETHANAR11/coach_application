import 'package:bounce_fit_coach/rive_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:rive/rive.dart' hide LinearGradient;

class SignIn extends StatefulWidget {
  const SignIn({Key? key, this.closeModal}) : super(key: key);

  final Function? closeModal;

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  late SMITrigger _successA;
  late SMITrigger _errorA;
  late SMITrigger _confettA;

  bool _isloading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
  }

  void _onCheck(Artboard artboard) {
    final controller =
        StateMachineController.fromArtboard(artboard, "State Machine 1");
    artboard.addController(controller!);
    _successA = controller.findInput<bool>("Check") as SMITrigger;
    _errorA = controller.findInput<bool>("Error") as SMITrigger;
  }

  void _onCon(Artboard artboard) {
    final controller =
        StateMachineController.fromArtboard(artboard, 'State Machine 1');
    artboard.addController(controller!);
    _confettA = controller.findInput<bool>("Trigger explosion") as SMITrigger;
  }

  void login() {
    setState(() {
      _isloading = true;
    });

    bool isEmailV = _emailController.text.trim().isNotEmpty;
    bool isPassV = _passController.text.trim().isNotEmpty;
    bool isValid = isEmailV && isPassV;

    Future.delayed(const Duration(seconds: 1), () {
      isValid ? _successA.fire() : _errorA.fire();
    });

    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _isloading = false;
      });
      if (isValid) _confettA.fire();
    });

    if (isValid) {
      Future.delayed(const Duration(seconds: 4), () {
        widget.closeModal!();
        _emailController.text = "";
        _passController.text = "";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Stack(children: [
            Container(
              constraints: const BoxConstraints(maxWidth: 600),
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(1),
             
              child: Container(
                padding: const EdgeInsets.all(29),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: RiveAppTheme.shadow.withOpacity(0.3),
                      offset: const Offset(1, 3),
                      blurRadius: 5,
                    ),
                    BoxShadow(
                        color: RiveAppTheme.shadow.withOpacity(0.3),
                        offset: const Offset(0, 30),
                        blurRadius: 30),
                  ],
                  color: CupertinoColors.secondarySystemBackground,
                  backgroundBlendMode: BlendMode.luminosity,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Sign_in",
                      style: TextStyle(fontFamily: "Poppins", fontSize: 34),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      "Unlock your coaching journey with Player Coach App, where expertise meets play.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: "Inter",
                          fontSize: 17,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Email",
                        style: TextStyle(
                          color: CupertinoColors.secondaryLabel,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    TextField(
                      decoration: authInputStyle("email"),
                      controller: _emailController,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Password",
                        style: TextStyle(
                          color: CupertinoColors.secondaryLabel,
                          fontSize: 15,
                          fontFamily: "Inter",
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextField(
                      obscureText: true,
                      decoration: authInputStyle("password"),
                      controller: _passController,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 164, 163, 163)
                              .withOpacity(0.5),
                          offset: const Offset(0, 10),
                          blurRadius: 20,
                        )
                      ]),
                      child: CupertinoButton(
                        padding: const EdgeInsets.all(20),
                        color: Color.fromARGB(255, 184, 31, 31),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                        child: Row(
                          children: const [
                            Icon(Icons.arrow_forward_rounded),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              'Sign In',
                              style: TextStyle(
                                  fontSize: 17,
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                        onPressed: () {
                          if (!_isloading) login();
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24.0),
                      child: Row(
                        children: [
                          const Expanded(child: Divider()),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              "OR",
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.3),
                                  fontSize: 15,
                                  fontFamily: "Inter"),
                            ),
                          ),
                          const Expanded(child: Divider()),
                        ],
                      ),
                    ),
                    const Text(
                      "Sign up with Google",
                      style: TextStyle(
                        color: CupertinoColors.secondaryLabel,
                        fontFamily: "Inter",
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    // Row(
                    //  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    Center(child: Image.asset("assets/signpic/google.png")),
                    //Image.asset("assets/signpic/embl1.png"),

                    //],
                    //)
                  ],
                ),
              ),
            ),
            Positioned.fill(
                child: IgnorePointer(
              ignoring: true,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  if (_isloading)
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: RiveAnimation.asset(
                        "assets/rive/check.riv",
                        onInit: _onCheck,
                      ),
                    ),
                  Positioned.fill(
                      child: SizedBox(
                    width: 500,
                    height: 500,
                    child: Transform.scale(
                      scale: 3,
                      child: RiveAnimation.asset(
                        "assets/rive/confetti.riv",
                        onInit: _onCon,
                      ),
                    ),
                  ))
                ],
              ),
            )),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Align(
                alignment: Alignment.center,
                child: CupertinoButton(
                  padding: EdgeInsets.zero,
                  borderRadius: BorderRadius.circular(36 / 2),
                  minSize: 36,
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(36 / 2),
                        boxShadow: [
                          BoxShadow(
                            color: RiveAppTheme.shadow.withOpacity(0.3),
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          )
                        ]),
                    child: const Icon(
                      Icons.close,
                      color: Colors.black,
                    ),
                  ),
                  onPressed: () {
                    widget.closeModal!();
                  },
                ),
              ),
            )
          ]),
        ),
      )),
    );
  }
}

InputDecoration authInputStyle(String iconName) {
  return InputDecoration(
    filled: true,
    fillColor: Colors.white,
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.black.withOpacity(0.1))),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.black.withOpacity(0.1))),
    contentPadding: const EdgeInsets.all(15),
    prefixIcon: Padding(
      padding: const EdgeInsets.only(left: 4),
      // Adjust the scale factor as needed to reduce the size
      child: Image.asset("assets/signpic/$iconName.png"),
    ),
  );
}


