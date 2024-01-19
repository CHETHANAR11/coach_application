import 'dart:ui';
import 'package:bounce_fit_coach/rive_app/on_boarding/sign_in.dart';
import 'package:bounce_fit_coach/rive_app/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:rive/rive.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key, this.closeModal}) : super(key: key);

  final Function? closeModal;

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView>
    with TickerProviderStateMixin {
  AnimationController? _signInAnimController;

  late RiveAnimationController _btnController;

  @override
  void initState() {
    super.initState();
    _signInAnimController = AnimationController(
        duration: const Duration(milliseconds: 350),
        upperBound: 1,
        vsync: this);

    _btnController = OneShotAnimation("active", autoplay: false);

    const springDesc = SpringDescription(
      mass: 0.1,
      stiffness: 40,
      damping: 5,
    );

    _btnController.isActiveChanged.addListener(() {
      if (!_btnController.isActive) {
        final springAnim = SpringSimulation(springDesc, 0, 1, 0);
        _signInAnimController?.animateWith(springAnim);
      }
    });
  }

  @override
  void dispose() {
    _signInAnimController?.dispose();
    _btnController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.transparent,
      body: Stack(children: [
        Center(
          child: OverflowBox(
            maxWidth: double.infinity,
            child: Transform.translate(
              offset: const Offset(0, 0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child:
                    Image.asset("assets/images/balls.jpg", fit: BoxFit.cover),
              ),
            ),
          ),
        ),
        AnimatedBuilder(
          animation: _signInAnimController!,
          builder: (context, child) {
            return Transform(
                transform: Matrix4.translationValues(
                    0, -50 * _signInAnimController!.value, 0),
                child: child);
          },
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(40, 20, 40, 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 260,
                            padding: const EdgeInsets.only(bottom: 16),
                            child: const Text(
                              "Unlock your Potentia",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Poppins",
                                  fontSize: 50),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 350),
                              child: Text(
                                "Elevate your skills and game IQ through this. Your journey to sports mastery starts here.",
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.9),
                                    fontFamily: "Inter",
                                    fontSize: 17),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // MouseRegion(
                  //   cursor: SystemMouseCursors.click,
                  //   child: Container(
                  //     width: 10,
                  //     height: 10,
                     
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(30),
                  //       boxShadow: [
                  //         BoxShadow(
                  //           color: Colors.black.withOpacity(0.3),
                  //           blurRadius: 10,
                  //           offset: const Offset(0, 10),
                  //         ),
                  //       ],
                  //     ),
                  //     child: ElevatedButton(
                  //       onPressed: () {
                  //         Navigator.push(
                  //             context,
                  //             MaterialPageRoute(
                  //                 builder: (context) =>
                  //                     SignIn(closeModal: widget.closeModal)));
                  //       },
                  //       style: ElevatedButton.styleFrom(
                  //         backgroundColor: Color.fromARGB(255, 241, 185, 172),
                  //         shape: RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.circular(30),
                  //         ),
                  //         elevation: 0,
                  //       ),
                  //       child: const Row(
                  //         mainAxisAlignment: MainAxisAlignment.center,
                  //         children: [
                  //           Icon(Icons.arrow_forward_rounded),
                  //           SizedBox(width: 4),
                  //           Text(
                  //             "Start Training",
                  //             style: TextStyle(
                  //               fontSize: 16,
                  //               color: Colors.black,
                  //               fontFamily: "Inter",
                  //               fontWeight: FontWeight.bold,
                  //             ),
                  //           )
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  GestureDetector(
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Container(
                        width: 236,
                        height: 64,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 10,
                              offset: const Offset(0, 10),
                            )
                          ],
                        ),
                        child: Stack(
                          children: [
                            RiveAnimation.asset(
                              'assets/rive/button.riv',
                              fit: BoxFit.cover,
                              controllers: [_btnController],
                            ),
                            Center(
                              child: Transform.translate(
                                offset: const Offset(4, 4),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(Icons.arrow_forward_rounded),
                                    SizedBox(width: 4),
                                    Text(
                                      "Start Training",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: "Inter",
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    onTap: () {
                      _btnController.isActive = true;
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        RepaintBoundary(
          child: AnimatedBuilder(
            animation: _signInAnimController!,
            builder: (context, child) {
              return Stack(
                children: [
                  Positioned(
                      top: 10,
                      right: 20,
                      child: SafeArea(
                        child: CupertinoButton(
                          alignment: Alignment.topRight,
                          padding: EdgeInsets.zero,
                          borderRadius: BorderRadius.circular(36 / 2),
                          minSize: 36,
                          child: Container(
                            width: 36,
                            height: 36,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(36 / 2),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
                                    blurRadius: 10,
                                    offset: const Offset(0, 10))
                              ],
                            ),
                            child: const Icon(
                              Icons.close,
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {
                            widget.closeModal!();
                          },
                        ),
                      )),
                  Positioned.fill(
                    child: IgnorePointer(
                      ignoring: true,
                      child: Opacity(
                        opacity: 0.4 * _signInAnimController!.value,
                        child: Container(color: RiveAppTheme.shadow),
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(
                      0,
                      -MediaQuery.of(context).size.height *
                          (1 - _signInAnimController!.value),
                    ),
                    child: child,
                  ),
                ],
              );
            },
            child: SignIn(
              closeModal: () {
                _signInAnimController?.reverse();
              },
            ),
          ),
        ),
      ]),
    );
  }
}
