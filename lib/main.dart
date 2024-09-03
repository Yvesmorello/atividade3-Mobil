import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicação Bancária',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TelaPrincipal(),
    );
  }
}

class TelaPrincipal extends StatefulWidget {
  @override
  TelaPrincipalState createState() => TelaPrincipalState();
}

class TelaPrincipalState extends State<TelaPrincipal> {
  final List<String> transacoes = [];
  final TextEditingController quantidadeController = TextEditingController();
  final TextEditingController descricaoController = TextEditingController();

  void addTransacao() {
    final descricao = descricaoController.text;
    final quantidade = quantidadeController.text;
    

    if (quantidade.isEmpty || descricao.isEmpty) {
      return;
    }

    setState(() {
      transacoes.add('$quantidade: $descricao');
    });

    quantidadeController.clear();
    descricaoController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aplicação Bancária'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
                child: Column(
                  children: [
                    TextField(
                      controller: quantidadeController,
                      decoration: InputDecoration(labelText: 'Descrição'),
                      keyboardType: TextInputType.text,
                    ),
                    TextField(
                      controller: descricaoController,
                      decoration: InputDecoration(labelText: 'Valor'),
                    ),
                    ElevatedButton(
                      onPressed: addTransacao,
                      child: Text('Adicionar Transação'),
                    ),
                  ],
                ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: transacoes.length,
              itemBuilder: (ctx, index) {
                return ListTile(
                  title: Text(transacoes[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
