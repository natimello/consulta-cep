class Utils {
  String validaCep(String? value) {
    RegExp exp = RegExp(r'\d{2}\.\d{3}\-\d{3}');
    if (value == null || !exp.hasMatch(value)) {
      return 'Número de CEP inválido!';
    }
    return '';
  }

  String removeCaracteresEspeciais(String value) {
    return value.replaceAll(RegExp(r'[^0-9]'), '');
  }
}
