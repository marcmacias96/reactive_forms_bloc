import 'package:go_router/go_router.dart';
import 'package:reactive_forms_bloc/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'bloc/login_bloc.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
      ),
      body: BlocProvider(
        create: (context) => getIt<LoginBloc>(),
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            final form = state.form;

            return SingleChildScrollView(
                child: ReactiveForm(
              formGroup: form,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(

                  children: [
                    ReactiveTextField(
                      formControlName: 'email',
                      decoration:  InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(20),
                        ),
                        

                      ),
                      autocorrect: false,
                    ),
                    const SizedBox(height: 40,),
                    ReactiveTextField(
                      formControlName: 'password',
                      obscureText: true,
                      decoration:  InputDecoration(
                        labelText: 'Password',
                         border: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),

                    ReactiveFormConsumer(
                      builder: (context, form, child) {
                        return Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: form.valid ? () {
                                  context.read<LoginBloc>().add(const LoginEvent.signIn());
                                } : null,
                                child: const Text('Sign In'),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                     const SizedBox(height: 20,),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              GoRouter.of(context).go('/sign_up');
                            },
                            child: const Text('Sign Up'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ));
          },
        ),
      ),
    );
  }
}
