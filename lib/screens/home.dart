import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_login/exports.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 20.0,
        ),
        child: BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            if (state is AuthenticationSuccess) {
              Fluttertoast.showToast(msg: S.current.loginSuccess(state.userId));
            } else if (state is AuthenticationFailed) {
              Fluttertoast.showToast(msg: S.current.loginFailed);
            }
          },
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: AuthType.values
                .map((authType) => _buildLoginButton(context, authType))
                .toList(growable: false),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context, AuthType authType) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 3.0,
      ),
      child: ElevatedButton(
        onPressed: () {
          context.read<AuthenticationBloc>().requestAuthentication(authType);
        },
        style: ElevatedButton.styleFrom(
          primary: authType.brandColor,
          onPrimary: authType.loginMessageColor,
        ),
        child: Stack(
          children: [
            Center(child: Text(authType.loginMessage)),
            Align(
              alignment: Alignment.centerLeft,
              child: Image.asset(authType.brandIcon),
            ),
          ],
        ),
      ),
    );
  }
}
