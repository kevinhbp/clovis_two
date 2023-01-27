class InputValidator {
  const InputValidator(this.name, this.message, this.regex);

  final String name;
  final String message;
  final RegExp regex;

  bool isValidInput(String input) => regex.hasMatch(input);
}