import 'dart:convert';
import 'package:consulta_cep/models/endereco_model.dart';
import 'package:consulta_cep/services/cep_service.dart';
import 'package:http/http.dart' as http;

class CepServiceImp implements CepService {
  final http.Client httpClient;

  CepServiceImp({required this.httpClient});

  @override
  Future<EnderecoModel> getCep(String cep) async {
    String url = 'https://viacep.com.br/ws/$cep/json/';
    final response = await httpClient.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final result = EnderecoModel.fromJson(jsonDecode(response.body));
      return result;
    } else {
      throw Exception('Falha ao consultar CEP.');
    }
  }
}
