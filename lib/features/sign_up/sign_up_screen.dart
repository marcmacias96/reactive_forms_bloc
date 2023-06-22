import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:reactive_forms_bloc/features/sign_up/bloc/sign_up_bloc.dart';

import '../../injection.dart';
import '../sign_in/bloc/login_bloc.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen
  ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up Screen'),
      ),
      body: BlocProvider(
        create: (context) => getIt<SignUpBloc>(),
        child: BlocBuilder<SignUpBloc, SignUpState>(
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
                     ReactiveTextField(
                      formControlName: 'confirmPassword',
                      obscureText: true,
                      decoration:  InputDecoration(
                        labelText: 'Confirm Password',
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
                                  context.read<SignUpBloc>().add(const SignUpEvent.signUp());
                                } : null,
                                child: form.status == ControlStatus.pending ?  Text('loading'):  Text('Sign Up'),
                              ),
                            ),
                          ],
                        );
                      },
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