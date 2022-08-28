class TextInputComponent {
  String text;
  String? errorMessage;

  TextInputComponent({this.errorMessage = '', this.text = ''});

  bool isValid() => errorMessage == null;
}
