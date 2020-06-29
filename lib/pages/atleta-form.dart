import 'package:flutter/material.dart';
import 'package:ifsports/classes/atleta.dart';
import 'package:ifsports/provider/atleta-provider.dart';
import 'package:provider/provider.dart';

class AtletaForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  void _loadFormData(Atleta atleta) {
    if (atleta != null) {
      _formData['id'] = atleta.id;
      _formData['name'] = atleta.name;
      _formData['modalidade'] = atleta.modalidade;
      _formData['avatarUrl'] = atleta.avatarUrl;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Atleta atleta = ModalRoute.of(context).settings.arguments;

    _loadFormData(atleta);

    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário atleta'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final isValid = _form.currentState.validate();
              if (isValid) {
                _form.currentState.save();

                Provider.of<AtletasProvider>(context, listen: false).put(
                  Atleta(
                    id: _formData['id'],
                    name: _formData['name'],
                    modalidade: _formData['modalidade'],
                    avatarUrl: _formData['avatarUrl'],
                  ),
                );
                Navigator.of(context).pop();
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: ListView(
            children: [
              Form(
            key: _form,
            child: Column(
              children: <Widget>[
                TextFormField(
                  keyboardType: TextInputType.text,
                  initialValue: _formData['name'],
                  autofocus: true,
                  onSaved: (value) => _formData['name'] = value,
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        value.trim().length < 3) {
                      return 'Nome inválido';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Nome',
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  initialValue: _formData['modalidade'],
                  autofocus: true,
                  onSaved: (value) => _formData['modalidade'] = value,
                  decoration: InputDecoration(
                    labelText: 'Modalidade',
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  initialValue: _formData['avatarUrl'],
                  autofocus: true,
                  onSaved: (value) => _formData['avatarUrl'] = value,
                  decoration: InputDecoration(
                    labelText: 'URL do Avatar',
                  ),
                ),
              ],
            ),
          ),
            ],
          ),
      ),   
    );
  }
}
