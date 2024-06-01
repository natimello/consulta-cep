import 'package:brasil_fields/brasil_fields.dart';
import 'package:consulta_cep/controllers/cep_controller.dart';
import 'package:consulta_cep/models/endereco_model.dart';
import 'package:consulta_cep/pages/resultado_view.dart';
import 'package:consulta_cep/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ConsultaCepView extends StatefulWidget {
  final CepController controller;
  const ConsultaCepView({super.key, required this.controller});

  @override
  State<ConsultaCepView> createState() => _ConsultaCepViewState();
}

class _ConsultaCepViewState extends State<ConsultaCepView> {
  final TextEditingController cepController = TextEditingController();
  EnderecoModel? _endereco;
  late Utils utils;

  @override
  void initState() {
    super.initState();
    utils = Utils();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consulta de CEP'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: cepController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'CEP',
                hintText: 'Digite o CEP',
              ),
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                CepInputFormatter(),
              ],
              validator: (value) => utils.validaCep(value),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                String cep =
                    utils.removeCaracteresEspeciais(cepController.text);
                try {
                  EnderecoModel endereco = await widget.controller.getCep(cep);
                  setState(() {
                    _endereco = endereco;
                  });

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultadoView(
                              endereco: _endereco!,
                            )),
                  );
                } catch (e) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Erro'),
                        content: const Text(
                            'Erro ao consultar CEP. Verifique se o CEP que você digitou está correto.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: const Text('Consultar'),
            ),
          ],
        ),
      ),
    );
  }
}
