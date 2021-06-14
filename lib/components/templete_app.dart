import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Template extends StatelessWidget {
  final bool logo;
  final bool back;
  final bool drawer;
  final Widget? child;
  final Widget? bottomNavigationBar;
  final bool lang;
  bool backButtonAble;

  Template({
    @required this.child,
    this.drawer = true,
    this.logo = true,
    this.bottomNavigationBar,
    this.back = false,
    this.backButtonAble = true,
    this.lang = true,
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return backButtonAble;
      },
      child: SafeArea(
        child: Scaffold(
          // backgroundColor: Constant.colorGrey,
          bottomNavigationBar: bottomNavigationBar,
          body: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 60,
                // decoration: BoxDecoration(
                //   image: DecorationImage(
                //     image: AssetImage("assets/images/login/ic_head_login.jpg"),
                //     fit: BoxFit.cover,
                //   ),
                // ),
                child: Stack(
                  children: [
                    if (drawer)
                      Positioned(
                        left: 8,
                        top: 0,
                        bottom: 0,
                        child: GestureDetector(
                          onTap: () {
                            // _viewModel.openDrawer();
                          },
                          child: Container(
                            width: 30,
                            height: 30,
                            child: Center(
                              child:
                                  Image.asset("assets/images/main/ic_menu.png"),
                            ),
                          ),
                        ),
                      ),
                    if (back)
                      Positioned(
                        left: 8,
                        top: 0,
                        bottom: 0,
                        child: GestureDetector(
                          onTap: () {
                            // Routes.pop(context);
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  // color: Constant.colorPrimary.withOpacity(.85),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.keyboard_arrow_left,
                                    color: Colors.white,
                                    size: 30.0,
                                  ),
                                ),
                              ),
                              Text('app_back'),
                              // TextLang(
                              //   keyField: "app_back",
                              //   textSize: TextSize.smaller,
                              //   color: Colors.white,
                              // ),
                            ],
                          ),
                        ),
                      ),
                    Positioned(
                      left: 0,
                      top: 0,
                      right: 0,
                      bottom: 0,
                      child: _buildLogo(context),
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      bottom: 0,
                      child: GestureDetector(
                        onTap: () {
                          // Provider.of<MainViewModel>(context, listen: false)
                          //     .changeLanguage();
                        },
                        child: !lang
                            ? Container()
                            : Container(
                                height: double.infinity,
                                color: Colors.transparent,
                                child: Center(
                                  child: Wrap(
                                    crossAxisAlignment:
                                        WrapCrossAlignment.center,
                                    children: [
                                      // Consumer<MainViewModel>(
                                      //   builder: (_, vm, child) {
                                      //     return Image.asset(
                                      //       "assets/images/ic_flag${vm.thai ? "" : "_th"}.jpg",
                                      //       height: 12,
                                      //     );
                                      //   },
                                      // ),
                                      // SizedBox(width: 2),
                                      // Consumer<MainViewModel>(
                                      //   builder: (_, vm, child) {
                                      //     return TextLang(
                                      //       keyField: vm.thai
                                      //           ? "login_en"
                                      //           : "login_th",
                                      //       color: Colors.white,
                                      //       bold: true,
                                      //     );
                                      //   },
                                      // ),
                                      // SizedBox(width: 8)
                                    ],
                                  ),
                                ),
                              ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: child ?? Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogo(context) {
    if (!logo) return Container();

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 40,
            child: Image.asset(
              "assets/images/ic_logo_ev_v2_transparent.png", //ic_logo_ev_v2_transparent,ic_logo_ev.png
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
