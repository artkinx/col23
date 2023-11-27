// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file:

part of 'sign_up_request.dart';

// **************************************************************************
// ReactiveFormsGenerator
// **************************************************************************

class ReactiveSignUpRequestFormConsumer extends StatelessWidget {
  const ReactiveSignUpRequestFormConsumer({
    Key? key,
    required this.builder,
    this.child,
  }) : super(key: key);

  final Widget? child;

  final Widget Function(
      BuildContext context, SignUpRequestForm formModel, Widget? child) builder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveSignUpRequestForm.of(context);

    if (formModel is! SignUpRequestForm) {
      throw FormControlParentNotFoundException(this);
    }
    return builder(context, formModel, child);
  }
}

class SignUpRequestFormInheritedStreamer extends InheritedStreamer<dynamic> {
  const SignUpRequestFormInheritedStreamer({
    Key? key,
    required this.form,
    required Stream<dynamic> stream,
    required Widget child,
  }) : super(
          stream,
          child,
          key: key,
        );

  final SignUpRequestForm form;
}

class ReactiveSignUpRequestForm extends StatelessWidget {
  const ReactiveSignUpRequestForm({
    Key? key,
    required this.form,
    required this.child,
    this.onWillPop,
  }) : super(key: key);

  final Widget child;

  final SignUpRequestForm form;

  final WillPopCallback? onWillPop;

  static SignUpRequestForm? of(
    BuildContext context, {
    bool listen = true,
  }) {
    if (listen) {
      return context
          .dependOnInheritedWidgetOfExactType<
              SignUpRequestFormInheritedStreamer>()
          ?.form;
    }

    final element = context.getElementForInheritedWidgetOfExactType<
        SignUpRequestFormInheritedStreamer>();
    return element == null
        ? null
        : (element.widget as SignUpRequestFormInheritedStreamer).form;
  }

  @override
  Widget build(BuildContext context) {
    return SignUpRequestFormInheritedStreamer(
      form: form,
      stream: form.form.statusChanged,
      child: WillPopScope(
        onWillPop: onWillPop,
        child: child,
      ),
    );
  }
}

class SignUpRequestFormBuilder extends StatefulWidget {
  const SignUpRequestFormBuilder({
    Key? key,
    this.model,
    this.child,
    this.onWillPop,
    required this.builder,
    this.initState,
  }) : super(key: key);

  final SignUpRequest? model;

  final Widget? child;

  final WillPopCallback? onWillPop;

  final Widget Function(
      BuildContext context, SignUpRequestForm formModel, Widget? child) builder;

  final void Function(BuildContext context, SignUpRequestForm formModel)?
      initState;

  @override
  _SignUpRequestFormBuilderState createState() =>
      _SignUpRequestFormBuilderState();
}

class _SignUpRequestFormBuilderState extends State<SignUpRequestFormBuilder> {
  late SignUpRequestForm _formModel;

  @override
  void initState() {
    _formModel =
        SignUpRequestForm(SignUpRequestForm.formElements(widget.model), null);

    if (_formModel.form.disabled) {
      _formModel.form.markAsDisabled();
    }

    widget.initState?.call(context, _formModel);

    super.initState();
  }

  @override
  void didUpdateWidget(covariant SignUpRequestFormBuilder oldWidget) {
    if (widget.model != oldWidget.model) {
      _formModel =
          SignUpRequestForm(SignUpRequestForm.formElements(widget.model), null);

      if (_formModel.form.disabled) {
        _formModel.form.markAsDisabled();
      }

      widget.initState?.call(context, _formModel);
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _formModel.form.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ReactiveSignUpRequestForm(
      key: ObjectKey(_formModel),
      form: _formModel,
      onWillPop: widget.onWillPop,
      child: ReactiveFormBuilder(
        form: () => _formModel.form,
        onWillPop: widget.onWillPop,
        builder: (context, formGroup, child) =>
            widget.builder(context, _formModel, widget.child),
        child: widget.child,
      ),
    );
  }
}

class SignUpRequestForm implements FormModel<SignUpRequest> {
  SignUpRequestForm(
    this.form,
    this.path,
  );

  static const String firstnameControlName = "firstname";

  static const String emailControlName = "email";

  static const String passwordControlName = "password";

  static const String confirmpasswordControlName = "confirmpassword";

  static const String lastnameControlName = "lastname";

  final FormGroup form;

  final String? path;

  String firstnameControlPath() => pathBuilder(firstnameControlName);

  String emailControlPath() => pathBuilder(emailControlName);

  String passwordControlPath() => pathBuilder(passwordControlName);

  String confirmpasswordControlPath() =>
      pathBuilder(confirmpasswordControlName);

  String lastnameControlPath() => pathBuilder(lastnameControlName);

  String? get _firstnameValue => firstnameControl?.value;

  String? get _emailValue => emailControl?.value;

  String? get _passwordValue => passwordControl?.value;

  String? get _confirmpasswordValue => confirmpasswordControl?.value;

  String? get _lastnameValue => lastnameControl?.value;

  bool get containsFirstname {
    try {
      form.control(firstnameControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsEmail {
    try {
      form.control(emailControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsPassword {
    try {
      form.control(passwordControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsConfirmpassword {
    try {
      form.control(confirmpasswordControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsLastname {
    try {
      form.control(lastnameControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  Object? get firstnameErrors => firstnameControl?.errors;

  Object? get emailErrors => emailControl?.errors;

  Object? get passwordErrors => passwordControl?.errors;

  Object? get confirmpasswordErrors => confirmpasswordControl?.errors;

  Object? get lastnameErrors => lastnameControl?.errors;

  void get firstnameFocus => form.focus(firstnameControlPath());

  void get emailFocus => form.focus(emailControlPath());

  void get passwordFocus => form.focus(passwordControlPath());

  void get confirmpasswordFocus => form.focus(confirmpasswordControlPath());

  void get lastnameFocus => form.focus(lastnameControlPath());

  void firstnameRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsFirstname) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          firstnameControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            firstnameControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void emailRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsEmail) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          emailControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            emailControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void passwordRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsPassword) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          passwordControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            passwordControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void confirmpasswordRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsConfirmpassword) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          confirmpasswordControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            confirmpasswordControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void lastnameRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsLastname) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          lastnameControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            lastnameControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void firstnameValueUpdate(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    firstnameControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void emailValueUpdate(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    emailControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void passwordValueUpdate(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    passwordControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void confirmpasswordValueUpdate(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    confirmpasswordControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void lastnameValueUpdate(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    lastnameControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void firstnameValuePatch(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    firstnameControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void emailValuePatch(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    emailControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void passwordValuePatch(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    passwordControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void confirmpasswordValuePatch(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    confirmpasswordControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void lastnameValuePatch(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    lastnameControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void firstnameValueReset(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      firstnameControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);

  void emailValueReset(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      emailControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);

  void passwordValueReset(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      passwordControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);

  void confirmpasswordValueReset(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      confirmpasswordControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);

  void lastnameValueReset(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      lastnameControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);

  FormControl<String>? get firstnameControl => containsFirstname
      ? form.control(firstnameControlPath()) as FormControl<String>?
      : null;

  FormControl<String>? get emailControl => containsEmail
      ? form.control(emailControlPath()) as FormControl<String>?
      : null;

  FormControl<String>? get passwordControl => containsPassword
      ? form.control(passwordControlPath()) as FormControl<String>?
      : null;

  FormControl<String>? get confirmpasswordControl => containsConfirmpassword
      ? form.control(confirmpasswordControlPath()) as FormControl<String>?
      : null;

  FormControl<String>? get lastnameControl => containsLastname
      ? form.control(lastnameControlPath()) as FormControl<String>?
      : null;

  void firstnameSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      firstnameControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      firstnameControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void emailSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      emailControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      emailControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void passwordSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      passwordControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      passwordControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void confirmpasswordSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      confirmpasswordControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      confirmpasswordControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void lastnameSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      lastnameControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      lastnameControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  @override
  SignUpRequest get model {
    if (!currentForm.valid) {
      debugPrint(
          '[${path ?? 'SignUpRequestForm'}]\n┗━ Avoid calling `model` on invalid form. Possible exceptions for non-nullable fields which should be guarded by `required` validator.');
    }
    return SignUpRequest(
        firstname: _firstnameValue,
        email: _emailValue,
        password: _passwordValue,
        confirmpassword: _confirmpasswordValue,
        lastname: _lastnameValue);
  }

  @override
  void submit({
    required void Function(SignUpRequest model) onValid,
    void Function()? onNotValid,
  }) {
    currentForm.markAllAsTouched();
    if (currentForm.valid) {
      onValid(model);
    } else {
      onNotValid?.call();
    }
  }

  AbstractControl<dynamic> get currentForm {
    return path == null ? form : form.control(path!);
  }

  @override
  void updateValue(
    SignUpRequest value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) =>
      form.updateValue(SignUpRequestForm.formElements(value).rawValue,
          updateParent: updateParent, emitEvent: emitEvent);

  @override
  void reset({
    SignUpRequest? value,
    bool updateParent = true,
    bool emitEvent = true,
  }) =>
      form.reset(
          value: value != null ? formElements(value).rawValue : null,
          updateParent: updateParent,
          emitEvent: emitEvent);

  String pathBuilder(String? pathItem) =>
      [path, pathItem].whereType<String>().join(".");

  static FormGroup formElements(SignUpRequest? signUpRequest) => FormGroup({
        firstnameControlName: FormControl<String>(
            value: signUpRequest?.firstname,
            validators: [RequiredValidator()],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        emailControlName: FormControl<String>(
            value: signUpRequest?.email,
            validators: [RequiredValidator(), EmailValidator()],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        passwordControlName: FormControl<String>(
            value: signUpRequest?.password,
            validators: [
              // CompareValidator(passwordControlName, confirmpasswordControlName,
              //     CompareOption.equal),
              RequiredValidator()
            ],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        confirmpasswordControlName: FormControl<String>(
            value: signUpRequest?.confirmpassword,
            validators: [
              // CompareValidator(confirmpasswordControlName, passwordControlName,
              //     CompareOption.equal),
              // MustMatchValidator('confirmpassword', "password", true),
              RequiredValidator(),
            ],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        lastnameControlName: FormControl<String>(
            value: signUpRequest?.lastname,
            validators: [
              RequiredValidator(),
            ],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false)
      },
          validators: [],
          asyncValidators: [],
          asyncValidatorsDebounceTime: 250,
          disabled: false);
}

class ReactiveSignUpRequestFormArrayBuilder<T> extends StatelessWidget {
  const ReactiveSignUpRequestFormArrayBuilder({
    Key? key,
    this.control,
    this.formControl,
    this.builder,
    required this.itemBuilder,
  })  : assert(control != null || formControl != null,
            "You have to specify `control` or `formControl`!"),
        super(key: key);

  final FormArray<T>? formControl;

  final FormArray<T>? Function(SignUpRequestForm formModel)? control;

  final Widget Function(BuildContext context, List<Widget> itemList,
      SignUpRequestForm formModel)? builder;

  final Widget Function(
          BuildContext context, int i, T? item, SignUpRequestForm formModel)
      itemBuilder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveSignUpRequestForm.of(context);

    if (formModel == null) {
      throw FormControlParentNotFoundException(this);
    }

    return ReactiveFormArray<T>(
      formArray: formControl ?? control?.call(formModel),
      builder: (context, formArray, child) {
        final itemList = (formArray.value ?? [])
            .asMap()
            .map((i, item) {
              return MapEntry(
                i,
                itemBuilder(
                  context,
                  i,
                  item,
                  formModel,
                ),
              );
            })
            .values
            .toList();

        return builder?.call(
              context,
              itemList,
              formModel,
            ) ??
            Column(children: itemList);
      },
    );
  }
}

class ReactiveSignUpRequestFormFormGroupArrayBuilder<T>
    extends StatelessWidget {
  const ReactiveSignUpRequestFormFormGroupArrayBuilder({
    Key? key,
    this.extended,
    this.getExtended,
    this.builder,
    required this.itemBuilder,
  })  : assert(extended != null || getExtended != null,
            "You have to specify `control` or `formControl`!"),
        super(key: key);

  final ExtendedControl<List<Map<String, Object?>?>, List<T>>? extended;

  final ExtendedControl<List<Map<String, Object?>?>, List<T>> Function(
      SignUpRequestForm formModel)? getExtended;

  final Widget Function(BuildContext context, List<Widget> itemList,
      SignUpRequestForm formModel)? builder;

  final Widget Function(
          BuildContext context, int i, T? item, SignUpRequestForm formModel)
      itemBuilder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveSignUpRequestForm.of(context);

    if (formModel == null) {
      throw FormControlParentNotFoundException(this);
    }

    final value = (extended ?? getExtended?.call(formModel))!;

    return StreamBuilder<List<Map<String, Object?>?>?>(
      stream: value.control.valueChanges,
      builder: (context, snapshot) {
        final itemList = (value.value() ?? <T>[])
            .asMap()
            .map((i, item) => MapEntry(
                  i,
                  itemBuilder(
                    context,
                    i,
                    item,
                    formModel,
                  ),
                ))
            .values
            .toList();

        return builder?.call(
              context,
              itemList,
              formModel,
            ) ??
            Column(children: itemList);
      },
    );
  }
}
