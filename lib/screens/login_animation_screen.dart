import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_experiments/utils/data/constants.dart';
import 'package:flutter_experiments/utils/extensions/context_extension.dart';
import 'package:flutter_experiments/utils/extensions/num_extension.dart';
import 'package:rive/rive.dart';

class LoginAnimationScreen extends StatefulWidget {
  const LoginAnimationScreen({super.key});

  @override
  State<LoginAnimationScreen> createState() => _LoginAnimationScreenState();
}

class _LoginAnimationScreenState extends State<LoginAnimationScreen> {
  late final StateMachineController? _characterStateMachineController;
  late SMIBool check;
  late SMIBool handsUp;
  late SMINumber look;
  late SMITrigger success;
  late SMITrigger fail;

  Artboard? _characterBoard;
  bool isPassHidden = true;

  final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timestamp) async {
      await _configureCharacterBoard();
    });
  }

  _configureCharacterBoard() async {
    final ByteData characterByteData =
        await rootBundle.load('assets/rive/login_screen_character.riv');

    final RiveFile characterFile = RiveFile.import(characterByteData);

    final Artboard characterBoard = characterFile.mainArtboard;

    _characterStateMachineController =
        StateMachineController.fromArtboard(characterBoard, kMachineKey);

    if (_characterStateMachineController == null) return;

    characterBoard.addController(_characterStateMachineController);
    _characterBoard = characterBoard;
    check = _characterStateMachineController.findSMI(kCheckKey);
    handsUp = _characterStateMachineController.findSMI(kHandsUpKey);
    look = _characterStateMachineController.findSMI(kLookKey);
    success = _characterStateMachineController.findSMI(kSuccessKey);
    fail = _characterStateMachineController.findSMI(kFailKey);
    setState(() {});

    _emailController.addListener(() {
      look.change(_emailController.text.length.toDouble());
    });

    _passwordController.addListener(() {
      look.change(_passwordController.text.length.toDouble());
    });
  }

  @override
  Widget build(BuildContext context) {

    if (_characterBoard == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login animation'),
        backgroundColor: const Color(0xffa02d62),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: (20, 10).paddingSymmetric,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Login',
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                'to continue exploring the app.',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              20.verticalSpace,
              SizedBox(
                height: context.height * .3,
                child: Rive(
                  artboard: _characterBoard!,
                  fit: BoxFit.cover,
                ),
              ),
              20.verticalSpace,
              Form(
                key: _fromKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ..._buildEmailField(),
                    20.verticalSpace,
                    ..._buildPasswordField(),
                  ],
                ),
              ),
              30.verticalSpace,
              _buildSubmitButton(),
              20.verticalSpace
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildEmailField() {
    return [
      const Text('Email'),
      TextFormField(
        controller: _emailController,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'example@abc.com',
        ),
        onChanged: (value) {
          check.change(true);
          look.change(value.length.toDouble());
        },
        onTap: () {
          handsUp.change(false);
        },
        onTapOutside: (event) {
          check.change(false);
          FocusScope.of(context).unfocus();
        },
        onFieldSubmitted: (value) {
          check.change(false);
          FocusScope.of(context).unfocus();
        },
        onEditingComplete: () => check.change(false),
        validator: (value) {
          final RegExp emailReg = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

          if (value?.isEmpty ?? false) {
            return 'Email is required.';
          }

          if (!emailReg.hasMatch(value.toString())) {
            return 'Please enter valid email.';
          }

          return null;
        },
      )
    ];
  }

  List<Widget> _buildPasswordField() {
    return [
      const Text('Password'),
      TextFormField(
        controller: _passwordController,
        obscureText: isPassHidden,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: 'Enter password here',
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                isPassHidden = !isPassHidden;
                handsUp.change(true);
              });
            },
            icon: Icon(
              isPassHidden ? Icons.visibility_off : Icons.visibility,
            ),
          ),
        ),
        onTap: () {
          setState(() {
            handsUp.change(true);
          });
        },
        onTapOutside: (event) {
          handsUp.change(false);
          check.change(false);
          FocusScope.of(context).unfocus();
        },
        onChanged: (value) {
          check.change(true);
          look.change(value.length.toDouble());
        },
        onFieldSubmitted: (value) {
          check.change(false);
          FocusScope.of(context).unfocus();
        },
        onEditingComplete: () => check.change(false),
        validator: (value) {
          if (value?.isEmpty ?? false) {
            return 'password is required.';
          }

          if ((value?.length ?? 0) < 6) {
            return 'Password should be at least 6 characters.';
          }

          return null;
        },
      )
    ];
  }

  Widget _buildSubmitButton() {
    return ElevatedButton(
      onPressed: () {
        if (handsUp.value) {
          handsUp.change(false);
        }

        if (_fromKey.currentState?.validate() ?? false) {
          success.fire();
        } else {
          fail.fire();
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xffa02d62),
        foregroundColor: Colors.white,
        fixedSize: Size(MediaQuery.of(context).size.width, 55),
      ),
      child: const Text('Login'),
    );
  }
}
