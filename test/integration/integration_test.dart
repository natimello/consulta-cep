import 'package:consulta_cep/controllers/cep_controller.dart';
import 'package:consulta_cep/models/endereco_model.dart';
import 'package:consulta_cep/services/cep_service.dart';
import 'package:consulta_cep/services/cep_service_imp.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

void main() {
  group('Teste de integração', () {
    late CepController controller;
    late CepService service;
    late EnderecoModel enderecoModel;

    setUp(() {
      service = CepServiceImp(httpClient: http.Client()); // Use o serviço real
      controller = CepController(service: service);
      enderecoModel = EnderecoModel(
        cep: "01001-000",
        logradouro: "Praça da Sé",
        complemento: "lado ímpar",
        bairro: "Sé",
        localidade: "São Paulo",
        uf: "SP",
      );
    });

    test('getCep deve retornar um objeto EnderecoModel', () async {
      final response = await controller.getCep('01001000');

      expect(response.cep, enderecoModel.cep);
      expect(response.logradouro, enderecoModel.logradouro);
      expect(response.complemento, enderecoModel.complemento);
      expect(response.bairro, enderecoModel.bairro);
      expect(response.localidade, enderecoModel.localidade);
      expect(response.uf, enderecoModel.uf);
    });

    test('getCep deve retornar erro ao receber um valor inválido', () async {
      expect(() async => await controller.getCep('99010119'),
          throwsA(isA<TypeError>()));
    });
  });
}
