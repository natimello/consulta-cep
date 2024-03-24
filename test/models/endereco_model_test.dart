import 'package:consulta_cep/models/endereco_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('EnderecoModel', () {
    final Map<String, dynamic> json = {
      "cep": "01001-000",
      "logradouro": "Praça da Sé",
      "complemento": "lado ímpar",
      "bairro": "Sé",
      "localidade": "São Paulo",
      "uf": "SP",
    };

    EnderecoModel enderecoModel = EnderecoModel(
      cep: "01001-000",
      logradouro: "Praça da Sé",
      complemento: "lado ímpar",
      bairro: "Sé",
      localidade: "São Paulo",
      uf: "SP",
    );

    test('fromJson deve retornar uma instância de EnderecoModel', () {
      final actual = EnderecoModel.fromJson(json);
      expect(actual, isInstanceOf<EnderecoModel>());
    });

    test('fromJson deve retornar um objeto igual a enderecoModel', () {
      final actual = EnderecoModel.fromJson(json);

      expect(actual.cep, enderecoModel.cep);
      expect(actual.logradouro, enderecoModel.logradouro);
      expect(actual.complemento, enderecoModel.complemento);
      expect(actual.bairro, enderecoModel.bairro);
      expect(actual.localidade, enderecoModel.localidade);
      expect(actual.uf, enderecoModel.uf);
    });
  });
}
