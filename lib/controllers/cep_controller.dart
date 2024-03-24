import 'package:consulta_cep/models/endereco_model.dart';
import 'package:consulta_cep/services/cep_service.dart';

class CepController {
  final CepService service;

  CepController({required this.service});

  Future<EnderecoModel> getCep(String cep) async {
    try {
      EnderecoModel result = await service.getCep(cep);
      return result;
    } catch (e) {
      rethrow;
    }
  }
}
