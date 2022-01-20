import 'package:flutter/material.dart';

class Formulario extends StatelessWidget {
  final formkey = GlobalKey<FormState>();
  final _controler = TextEditingController();

  var value;

  Formulario({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário'),
      ),
      body: Form(
        key: formkey,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                    controller: _controler,
                    validator: (value) {
                      //restrição de preenchimento
                      if (value!.isEmpty) {
                        return 'Preenchimento obrigatorio!';
                      }
                    }),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (formkey.currentState?.validate() == true) {
                      Navigator.of(context).pop(_controler
                          .text); // validação do button + retorno, falta fazer o text voltar
                    }
                  },
                  child: const Text('Salvar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

