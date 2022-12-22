import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sozEBay/core/init/theme/dark/color_scheme_dark.dart';
import '../../../core/base/view/base_view.dart';
import '../viewmodel/splash_viewmodel.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<SplashViewModel>(
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      viewModel: SplashViewModel(),
      onPageBuilder: (context, value) {
        return ChangeNotifierProvider(
          create: (context) => value,
          builder: (context, child) {
            return Scaffold(
              backgroundColor: ColorSchemeDark.instance?.shark,
              body: _body(context),
            );
          },
        );
      },
    );
  }

  Widget _body(BuildContext context) {
    double devHeight = MediaQuery.of(context).size.height;
    return TweenAnimationBuilder(
        tween: Tween<double>(begin: 1, end: devHeight / 3),
        duration: const Duration(seconds: 2),
        curve: Curves.bounceOut,
        builder: (BuildContext context, double val, child) {
          return Padding(
            padding: EdgeInsets.only(top: val),
            child: child,
          );
        },
        child: ListView(
          children: [
            Center(
              child: SvgPicture.asset(
                "assets/icons/logo.svg",
                width: 200,
                height: 200,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                "SozEBay",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      );
  }
}
