import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:group_radio_button/group_radio_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // TODO: completar todo lo necesario
  String currentRadio = "Amazing (20%)";
  List<String> radioList = ["Amazing (20%)", "Good (18%)", "Okay (15%)"];

  bool roundTip = false;
  double amount = 0.0;
  double tip = 0.0;

  var control = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tip time'),
      ),
      body: ListView(
        children: [
          SizedBox(height: 14),
          ListTile(
            leading: Icon(Icons.room_service),
            title: Padding(
              padding: EdgeInsets.only(right: 24),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Cost of service',
                ),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                controller: control, // Only numbers can be entered
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.dinner_dining),
            title: Text("How was the service?"),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50.00),
            child: RadioGroup<String>.builder(
              groupValue: currentRadio,
              onChanged: (value) => setState(() {
                currentRadio = value!;
              }),
              items: radioList,
              itemBuilder: (item) => RadioButtonBuilder(
                item,
              ),
            ),
          ),

          Row(
            
            children: [
              Padding(
                padding: const EdgeInsets.all(23.0),
                child: Icon(Icons.credit_card, color: Colors.grey),
              ),
              Text("Round up tip", style: TextStyle(fontSize: 16),),
              Switch(
              
              value: roundTip,
              onChanged: (bool value) {
                setState(() {
                  roundTip = value;
                });
              }),
            ],
          ),          
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: MaterialButton(
              onPressed: _tipCalculation,
              child: Text("CALCULATE",style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18)),
              color: Colors.green,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                
                padding: const EdgeInsets.all(10.0),
                child: Text("Tip amount: \$$tip"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _tipCalculation() {
    // TODO: completar
    amount = double.parse(control.text);
    if (currentRadio == radioList[0]) {
      tip = amount * 0.20;
    } else if (currentRadio == radioList[1]) {
      tip = amount * 0.18;
    } else if (currentRadio == radioList[2]) {
      tip = amount * 0.15;
    }

    if(roundTip == true) {
      int roundUp = tip.ceil(); 
      tip = roundUp.toDouble();
    }

    setState(() {});
  }
}
