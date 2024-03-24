import 'package:consulta_cep/models/endereco_model.dart';

abstract class CepService {
  Future<EnderecoModel> getCep(String cep);
}
