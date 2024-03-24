import 'package:consulta_cep/controllers/cep_controller.dart';
import 'package:consulta_cep/pages/consulta_cep_view.dart';
import 'package:consulta_cep/services/cep_service_imp.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(
    home: ConsultaCepView(
      controller:
          CepController(service: CepServiceImp(httpClient: http.Client())),
    ),
    debugShowCheckedModeBanner: false,
  ));
}
