import 'package:flutter/material.dart';
import 'package:themoviedb/widgets/theme/button_style.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({super.key});

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class AuthFormModel extends ChangeNotifier {
  String _authText = 'admin';
  String _passwordText = 'admin';
  String? _errorText;

  String get authText => _authText;
  String get passwordText => _passwordText;
  String? get errorText => _errorText;

  void setAuthText(String text) {
    _authText = text;
    notifyListeners();
  }

  void setPasswordText(String text) {
    _passwordText = text;
    notifyListeners();
  }

  void setErrorText(String? text) {
    _errorText = text;
    notifyListeners();
  }
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login to your account",
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: ListView(
        children: [
          _HeaderWidget(),
        ],
      ),
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textstyle = const TextStyle(
      color: Colors.black,
      fontSize: 16,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 25,
          ),
          _FormWidget(),
          SizedBox(
            height: 25,
          ),
          Text(
            'Чтобы пользоваться правкой и возможностями рейтинга TMDB, а также получить персональные рекомендации, необходимо войти в свою учётную запись. Если у вас нет учётной записи, её регистрация является бесплатной и простой. Нажмите здесь, чтобы начать.',
            style: textstyle,
          ),
          SizedBox(
            height: 5,
          ),
          TextButton(
            onPressed: () {},
            child: Text('Зарегестрироваться'),
            style: AppButtonStyle.linkButton,
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            'Если Вы зарегистрировались, но не получили письмо для подтверждения, нажмите здесь, чтобы отправить письмо повторно.',
            style: textstyle,
          ),
          SizedBox(
            height: 5,
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Отправить письмо повторно',
            ),
            style: AppButtonStyle.linkButton,
          ),
        ],
      ),
    );
  }
}

class _FormWidget extends StatefulWidget {
  const _FormWidget({super.key});

  @override
  State<_FormWidget> createState() => __FormWidgetState();
}

class __FormWidgetState extends State<_FormWidget> {
  final _formData = AuthFormModel();
  void _auth() {
    final login = _formData.authText;
    final password = _formData.passwordText;
    if (login == 'admin' && password == 'admin') {
      _formData.setErrorText(null);
      print('open app');
      Navigator.of(context).pushNamed('/main_screen');
    } else {
      _formData.setErrorText('Неправильный логин или пароль');
      print('show error');
    }
  }

  String? errorText = null;

  void _resetPassword() {
    print('reset password');
  }

  @override
  Widget build(BuildContext context) {
    final textstyle = const TextStyle(
      color: Color(0xFF212529),
      fontSize: 16,
    );
    final color = const Color(0xFF01B4E4);
    final textfielddecoration = const InputDecoration(
      border: OutlineInputBorder(),
      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      isCollapsed: true,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (_formData.errorText != null) ...[
          Text(
            '${_formData.errorText}',
            style: TextStyle(color: Colors.red),
          ),
          SizedBox(height: 20),
        ],
        Text(
          'Username',
          style: textstyle,
        ),
        SizedBox(
          height: 5,
        ),
        TextField(
          decoration: textfielddecoration,
          controller: TextEditingController(text: _formData.authText),
          onChanged: _formData.setAuthText,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'Password',
          style: textstyle,
        ),
        SizedBox(
          height: 5,
        ),
        TextField(
          controller: TextEditingController(text: _formData.passwordText),
          decoration: textfielddecoration,
          obscureText: true,
          onChanged: _formData.setPasswordText,
        ),
        Row(
          children: [
            SizedBox(height: 60),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(color),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                textStyle: MaterialStateProperty.all(
                    TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
              ),
              onPressed: _auth,
              child: Text('Login'),
            ),
            SizedBox(
              width: 15,
              height: 20,
            ),
            TextButton(
              onPressed: _resetPassword,
              child: Text("Reset Password"),
              style: AppButtonStyle.linkButton,
            ),
          ],
        )
      ],
    );
  }
}
