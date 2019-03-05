import 'package:flutter/material.dart';

class QueryForm extends StatefulWidget {
  @override
  _QueryFormState createState() => _QueryFormState();
}

class _QueryFormState extends State<QueryForm> {
  final _cityFormKey = GlobalKey<FormState>();
  final _stateFormKey = GlobalKey<FormState>();
  final _nameFormKey = GlobalKey<FormState>();
  final _typeFormKey = GlobalKey<FormState>();

  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final nameController = TextEditingController();
  final typeController = TextEditingController();


  @override
  void dispose(){
    cityController.dispose();
    stateController.dispose();
    nameController.dispose();
    typeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          queryForm(_cityFormKey, "City", Icons.location_city, cityController),
          queryForm(_stateFormKey, "State", Icons.location_city, stateController),
          queryForm(_nameFormKey, "Name", Icons.search, nameController),
          queryForm(_typeFormKey, "Type", Icons.search, typeController),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: RaisedButton(
                onPressed: null
            ),
          ),
        ],
      ),
    );
  }

  Widget queryForm(Key formKey, String hintText, IconData formIcon, TextEditingController formController){
    return Container(
      padding: EdgeInsets.only(top: 20.0, left: 42.0, right: 42.0),
      child: Form(
        key: formKey,
        child: TextFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: hintText,
            hintStyle: TextStyle(
                fontStyle: FontStyle.italic,
                color: Theme.of(context).hintColor,
                fontFamily: 'Roboto'
            ),
            prefixIcon: Icon(formIcon,
              color: Theme.of(context).hintColor,
            ),
          ),
          textAlign: TextAlign.center,
          validator: (value) => value.isEmpty ? "Needs Input" : null,
          controller: formController,
//                autocorrect: true,
          textCapitalization: TextCapitalization.sentences,
//                onSaved: (value) => this._userInput = value,
        ),
      ),
    );
  }
}
