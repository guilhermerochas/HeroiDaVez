class TextInputComponent {
  String text;
  String? errorMessage;
  bool Function(TextInputComponent textInputComponent)? validator;

  TextInputComponent({this.errorMessage = '', this.text = '', this.validator});

  bool isValid() {
    if (validator == null) {
      return errorMessage == null;
    }

    return validator!(this);
  }
}
