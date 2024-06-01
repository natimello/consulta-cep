import 'package:consulta_cep/pages/widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../models/endereco_model.dart';

class ResultadoView extends StatefulWidget {
  final EnderecoModel endereco;

  const ResultadoView({super.key, required this.endereco});

  @override
  State<ResultadoView> createState() => _ResultadoViewState();
}

class _ResultadoViewState extends State<ResultadoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                'Resultado encontrado',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 10),
              StaggeredGrid.count(
                crossAxisCount: 6,
                mainAxisSpacing: 6,
                crossAxisSpacing: 6,
                children: [
                  StaggeredGridTile.count(
                    crossAxisCellCount: 6,
                    mainAxisCellCount: 1,
                    child:
                        CustomCard(title: 'CEP', subtitle: widget.endereco.cep),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount: 3,
                    mainAxisCellCount: 1,
                    child: CustomCard(
                        title: 'Logradouro',
                        subtitle: widget.endereco.logradouro),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount: 3,
                    mainAxisCellCount: 1,
                    child: CustomCard(
                        title: 'Complemento',
                        subtitle: widget.endereco.complemento),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount: 3,
                    mainAxisCellCount: 1,
                    child: CustomCard(
                        title: 'Bairro', subtitle: widget.endereco.bairro),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount: 3,
                    mainAxisCellCount: 1,
                    child: CustomCard(
                        title: 'Localidade',
                        subtitle: widget.endereco.localidade),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount: 6,
                    mainAxisCellCount: 1,
                    child:
                        CustomCard(title: 'UF', subtitle: widget.endereco.uf),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
