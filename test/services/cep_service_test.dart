import 'package:consulta_cep/models/endereco_model.dart';
import 'package:consulta_cep/services/cep_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'cep_service_test.mocks.dart';

@GenerateMocks([CepService])
void main() {
  test('CepService: getCep deve retornar um objeto EnderecoModel', () async {
    final cepServiceMock = MockCepService();
    EnderecoModel enderecoModel = EnderecoModel(
      cep: "01001-000",
      logradouro: "Praça da Sé",
      complemento: "lado ímpar",
      bairro: "Sé",
      localidade: "São Paulo",
      uf: "SP",
    );

    when(cepServiceMock.getCep('01001000'))
        .thenAnswer((_) async => enderecoModel);

    final response = await cepServiceMock.getCep('01001000');

    expect(response.cep, '01001-000');
    expect(response.logradouro, 'Praça da Sé');
    expect(response.complemento, 'lado ímpar');
    expect(response.bairro, 'Sé');
    expect(response.localidade, 'São Paulo');
    expect(response.uf, 'SP');
  });

  test('CepService: getCep deve retornar erro ao receber um valor inválido',
      () async {
    final cepServiceMock = MockCepService();

    when(cepServiceMock.getCep('01001-000'))
        .thenThrow(Exception('Erro ao obter CEP.'));

    expect(
        () async => await cepServiceMock.getCep('01001-000'), throwsException);
  });
}
