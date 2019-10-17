import 'package:flutter/material.dart';

void main() =>
    runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Simple Interest Calculator",
      home: SIForm(),
      theme:
      ThemeData(primaryColor: Colors.pink,
          accentColor: Colors.pinkAccent,
          brightness: Brightness.dark),
    ));

class SIForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SIFormState();
  }
}

class _SIFormState extends State<SIForm> {

  TextEditingController PrincipleController = TextEditingController();
  TextEditingController ROIController = TextEditingController();
  TextEditingController TermController = TextEditingController();
  String text = " ";
  var _formkey= GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      //backgroundColor: Colors.cyan[200],
      // resizeToAvoidBottomPadding: false,
      appBar: AppBar(title: Text("Simple Interest Calculator")),
      body: Center(
        child: Form(
          key: _formkey,
          //margin: EdgeInsets.fromLTRB(5.0, 20.5, 5.0, 5.0),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(5.0, 20.5, 5.0, 5.0),
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: CircleAvatar(
                    radius: 80,
                    child: Center(
                      child: Icon(
                        Icons.attach_money,
                        size: 150,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: PrincipleController,
                    validator: (String value){
                      if(value.isEmpty){
                        return "Please Enter Principle Amount";
                      }
                    },
                    decoration: InputDecoration(
                        labelText: "Principle",
                        hintText: "Enter Principle E.g 12500",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: ROIController,
                    validator: (String value){
                      if(value.isEmpty){
                        return "Please Enter ROI";
                      }
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Rate of interest",
                        hintText: "Enter ROI E.g 12",

                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          validator: (String value){
                            if(value.isEmpty){
                              return "Please Enter Term";
                            }
                          },
                          controller: TermController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(

                              labelText: "Term",
                              hintText: "Enter Term",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0))),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MaterialButton(
                          height: 58,
                          shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5)),
                          child: Text(
                            "RESET",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                          color: Colors.teal,
                          onPressed: () {
                            setState(() {
                              _reset();
                            });
                          },
                          elevation: 5.0,
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MaterialButton(
                    minWidth: double.infinity,
                    height: 58,
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      "CALCULATE",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    onPressed: () {

                      setState(() {
                        if(_formkey.currentState.validate()){
                          text=_calculateTotalReturns();
                        }

                      });
                    },

                    color: Colors.cyan,

                    elevation: 5.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(child: Text(text)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _calculateTotalReturns() {
    double principle = double.parse(PrincipleController.text);
    double roi = double.parse(ROIController.text);
    double term = double.parse(TermController.text);
    double si = (principle * roi * term) / 100;
    double amount = principle + si;
    String result = "Investment Worth \$ $amount \n Interest Amount : \$ $si";
    return result;
  }

  void _reset(){
    PrincipleController.text="";
    ROIController.text="";
    TermController.text="";
    text="";
  }
}

