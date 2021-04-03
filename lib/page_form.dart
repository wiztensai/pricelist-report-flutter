import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'file:///C:/Users/jetwiz/Documents/Flutter%20Project/price_report/lib/helper/helper_formula.dart';
import 'package:price_report/mpdf/report_pdf.dart';
import 'package:price_report/model_pricedata.dart';
import 'package:price_report/dialog_finish.dart';
import 'package:intl/intl.dart';
import 'helper/currency_input_formatter.dart';
import 'helper/discount_input_formatter.dart';

class PageForm extends StatefulWidget {
  @override
  _PageFormState createState() => new _PageFormState();
}

List<GlobalKey<FormState>> formKeys = [
  GlobalKey<FormState>(),
  GlobalKey<FormState>(),
  GlobalKey<FormState>(),
  GlobalKey<FormState>(),
  GlobalKey<FormState>(),
  GlobalKey<FormState>(),
  GlobalKey<FormState>()
];

var priceData = ModelPriceData();

class _PageFormState extends State<PageForm> {
  int _currentStep = 0;
  bool complete = false;
  static const String _currency = "IDR. ";

  List<Map<String, StepState>> stepStates = [
    {"Perusahaan": StepState.indexed},
    {"PIC": StepState.indexed},
    {"Karyawan": StepState.indexed},
    {"Training": StepState.indexed},
    {"Implementasi": StepState.indexed},
    {"Modifikasi": StepState.indexed},
    {"Email Sales": StepState.indexed}
  ];

  next() {
    _currentStep < 7 ? setState(() => _currentStep += 1) : null;
  }

  cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }

  goTo(int step) {
    setState(() => _currentStep = step);
  }

  TextEditingController totalEmployeeController = TextEditingController(text: notNull_Int(priceData.totalEmployee));

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Step> steps = [
      Step(
          state: stepStates[0].values.single,
          isActive: _currentStep == 0,
          title: const Text("Perusahaan"),
          content: Form(
            key: formKeys[0],
            child: Column(
              children: <Widget>[
                TextFormField(
                    initialValue: priceData.nomor,
                    decoration: InputDecoration(labelText: 'Nomor'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }

                      priceData.nomor = value;
                    },
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ]),
                TextFormField(
                    initialValue: priceData.tanggal,
                    decoration: InputDecoration(labelText: 'Tanggal'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }

                      priceData.tanggal = value;
                    }),
                TextFormField(
                    initialValue: priceData.namaPT,
                    decoration: InputDecoration(labelText: 'Nama PT'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }

                      priceData.namaPT = value;
                    }),
                TextFormField(
                    initialValue: priceData.npwp,
                    decoration: InputDecoration(labelText: 'NPWP'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }

                      priceData.npwp = value;
                    },
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ]),
              ],
            ),
          )),
      Step(
          state: stepStates[1].values.single,
          isActive: _currentStep == 1,
          title: const Text('PIC '),
          content: Form(
            key: formKeys[1],
            child: Column(
              children: <Widget>[
                TextFormField(
                  initialValue: priceData.picUser,
                  decoration: InputDecoration(labelText: 'PIC User'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }

                    priceData.picUser = value;
                  },
                ),
                TextFormField(
                  initialValue: priceData.picPosition,
                  decoration: InputDecoration(labelText: 'PIC Position'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }

                    priceData.picPosition = value;
                  },
                ),
                TextFormField(
                  initialValue: priceData.contact,
                  decoration: InputDecoration(labelText: 'Contact'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }

                    priceData.contact = value;
                  },
                ),
                TextFormField(
                  initialValue: priceData.email,
                  decoration: InputDecoration(labelText: 'Email'),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }

                    priceData.email = value;
                  },
                ),
                TextFormField(
                  initialValue: priceData.billingPic,
                  decoration: InputDecoration(labelText: 'Billing PIC'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }

                    priceData.billingPic = value;
                  },
                ),
                TextFormField(
                  initialValue: priceData.billingAddress,
                  decoration: InputDecoration(labelText: 'Billing Address'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }

                    priceData.billingAddress = value;
                  },
                ),
                TextFormField(
                  initialValue: priceData.billingContact,
                  decoration: InputDecoration(labelText: 'Billing Contact'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }

                    priceData.billingContact = value;
                  },
                ),
                TextFormField(
                  initialValue: priceData.billingEmail,
                  decoration: InputDecoration(labelText: 'Billing Email'),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }

                    priceData.billingEmail = value;
                  },
                )
              ],
            ),
          )),
      Step(
          state: stepStates[2].values.single,
          isActive: _currentStep == 2,
          title: const Text('Karyawan'),
          content: Form(
            key: formKeys[2],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  controller: totalEmployeeController,
                  decoration: InputDecoration(labelText: 'Total Employee'),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                    CurrencyInputFormatter(),
                  ],
                  validator: (value) {
                    if(value == null || value.isEmpty) {

                      setState(() {
                        totalEmployeeController.text = "25";
                        priceData.totalEmployee = 25;

                        priceData.pricePerEmployee = totalPerkaryawan(priceData.totalEmployee);
                        priceData.allEmployeePrice = priceData.totalEmployee * priceData.pricePerEmployee;
                      });

                      return 'Minimal 25 total karyawan';
                    } else {
                      int _value = clearCurrencyFormat(value);
                      if(_value < 25) {
                        setState(() {
                          totalEmployeeController.text = "25"; // force text
                        });
                        priceData.totalEmployee = 25;
                      } else {
                        priceData.totalEmployee = _value;
                      }

                      setState(() {
                        priceData.pricePerEmployee = totalPerkaryawan(priceData.totalEmployee);
                        priceData.allEmployeePrice = priceData.totalEmployee * priceData.pricePerEmployee;
                      });
                    }
                  },
                ),
                TextFormField(
                  initialValue: notNull_Int(priceData.diskonEmployee),
                  decoration: InputDecoration(labelText: 'Diskon Karyawan', suffixText: "%"),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                    DiscountInputFormatter()
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      priceData.diskonEmployee = 0;
                    } else {
                      priceData.diskonEmployee = int.parse(value);
                    }

                    setState(() {
                      priceData.afterDiscEmployee = finalPrice(priceData.allEmployeePrice, priceData.diskonEmployee);
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Keterangan 1'),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 16, 0, 8),
                  child: Text("Harga: ${currencyFormat(priceData.allEmployeePrice)}", style: TextStyle()),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                  child: Text("Harga Perkaryawan: ${currencyFormat(priceData.pricePerEmployee)}"),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                  child: Text("Setelah Diskon: ${currencyFormat(priceData.afterDiscEmployee)}"),
                ),
              ],
            ),
          )),
      Step(
          state: stepStates[3].values.single,
          isActive: _currentStep == 3,
          title: const Text('Training'),
          content: Form(
            key: formKeys[3],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  initialValue: notNull_Int(priceData.hargaTraining),
                  decoration: InputDecoration(labelText: 'Harga Training', prefixText: "IDR. "),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                    CurrencyInputFormatter(),
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      priceData.hargaTraining = null;
                      return 'Please enter some text';
                    }

                    priceData.hargaTraining = clearCurrencyFormat(value);
                  },
                ),
                TextFormField(
                  initialValue: notNull_Int(priceData.diskonTraining),
                  decoration: InputDecoration(labelText: 'Diskon Training', suffixText: "%"),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                    DiscountInputFormatter()
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      priceData.diskonTraining = 0;
                    } else {
                      priceData.diskonTraining = int.parse(value);
                    }

                    setState(() {
                      priceData.afterDiscTraining = finalPrice(priceData.hargaTraining, priceData.diskonTraining);
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Keterangan 2'),
                ),
                Padding(
                  child: Text("Total Harga Training: ${currencyFormat(priceData.afterDiscTraining)}"),
                  padding: EdgeInsets.fromLTRB(0, 16, 0, 8),
                )
              ],
            ),
          )),
      Step(
          state: stepStates[4].values.single,
          isActive: _currentStep == 4,
          title: const Text('Implementasi'),
          content: Form(
            key: formKeys[4],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  initialValue: notNull_Int(priceData.hargaImplementasi),
                  decoration: InputDecoration(labelText: 'Harga Implementasi', prefixText: "IDR. "),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                    CurrencyInputFormatter()
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      priceData.hargaImplementasi = null;
                      return 'Please enter some text';
                    }

                    priceData.hargaImplementasi = clearCurrencyFormat(value);
                  },
                ),
                TextFormField(
                  initialValue: notNull_Int(priceData.diskonImplementasi),
                  decoration:
                      InputDecoration(labelText: 'Diskon Implementation', suffixText: "%"),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                    DiscountInputFormatter()
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      priceData.diskonImplementasi = 0;
                    } else {
                      priceData.diskonImplementasi = int.parse(value);
                    }

                    setState(() {
                      priceData.afterDiscImplementasi = finalPrice(priceData.hargaImplementasi, priceData.diskonImplementasi);
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Keterangan 3'),
                ),
                Padding(
                  child: Text("Total Harga Implementasi: ${currencyFormat(priceData.afterDiscImplementasi)}"),
                  padding: EdgeInsets.fromLTRB(0, 16, 0, 8),
                )
              ],
            ),
          )),
      Step(
          state: stepStates[5].values.single,
          isActive: _currentStep == 5,
          title: const Text('Modifikasi'),
          content: Form(
            key: formKeys[5],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  initialValue: notNull_Int(priceData.hargaModifikasi),
                  decoration: InputDecoration(labelText: 'Harga Modifikasi', prefixText: "IDR. "),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                    CurrencyInputFormatter()
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      priceData.hargaModifikasi = null;
                      return 'Please enter some text';
                    }

                    priceData.hargaModifikasi = clearCurrencyFormat(value);
                  },
                ),
                TextFormField(
                  initialValue: notNull_Int(priceData.diskonModifikasi),
                  decoration: InputDecoration(labelText: 'Diskon Modifikasi', suffixText: '%'),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                    DiscountInputFormatter()
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      priceData.diskonModifikasi = 0;
                    } else {
                      priceData.diskonModifikasi = int.parse(value);
                    }

                    setState(() {
                      priceData.afterDiscModifikasi = finalPrice(priceData.hargaModifikasi, priceData.diskonModifikasi);
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Keterangan 4'),
                ),
                Padding(
                  child: Text("Total Harga Modifikasi: ${currencyFormat(priceData.afterDiscModifikasi)}"),
                  padding: EdgeInsets.fromLTRB(0, 16, 0, 8),
                )
              ],
            ),
          )),
      Step(
          state: stepStates[6].values.single,
          isActive: _currentStep == 6,
          title: const Text('Email Sales'),
          content: Form(
            key: formKeys[6],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  initialValue: priceData.emailSales,
                  decoration: InputDecoration(labelText: 'Email Sales'),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }

                    priceData.emailSales = value;
                  },
                ),
              ],
            ),
          )),
    ];

    _onStepContinue() {
      if (formKeys[_currentStep].currentState.validate()) {
        setState(() {
          stepStates[_currentStep][stepStates[_currentStep].keys.single] =
              StepState.complete;
        });

        next();
      } else {
        setState(() {
          stepStates[_currentStep][stepStates[_currentStep].keys.single] =
              StepState.indexed;
        });
      }
    }

    _onLastStep() {
      if (formKeys[_currentStep].currentState.validate()) {
        setState(() {
          stepStates[_currentStep][stepStates[_currentStep].keys.single] =
              StepState.complete;
        });
      } else {
        setState(() {
          stepStates[_currentStep][stepStates[_currentStep].keys.single] =
              StepState.indexed;
        });
      }
    }

    return new Scaffold(
      appBar: AppBar(
        title: Text('Pricelist'),
        actions: <Widget>[
          ElevatedButton(
              onPressed: () {
                List<Map<String, StepState>> notFinishForm = [];

                stepStates.forEach((t) {
                  if (t.values.single == StepState.indexed) {
                    notFinishForm.add(t);
                  }
                });

                DialogUtils.showCustomDialog(context, notFinishForm,
                    onSubmit: () {
                  reportView(context, priceData);
                });
              },
              style: ElevatedButton.styleFrom(shadowColor: Colors.transparent),
              child: Text("FINISH"))
        ],
      ),
      body: Column(children: <Widget>[
        Expanded(
          child: Stepper(
            steps: steps,
            type: StepperType.vertical,
            currentStep: _currentStep,
            onStepTapped: (step) => goTo(step),
            controlsBuilder: (BuildContext context,
                {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
              if (_currentStep == steps.length - 1 || _currentStep == 0) {
                return Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 16),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_currentStep == steps.length - 1) {
                            _onLastStep();
                            return;
                          }

                          _onStepContinue();
                        },
                        child: Text("Save"),
                      ),
                    ),
                  ],
                );
              } else if( _currentStep >= 2 &&  _currentStep <= 5) {
                return Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(right: 8, top: 16),
                      child: ElevatedButton(
                        onPressed: () {
                          cancel();
                        },
                        child: Text("Previous"),
                        style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.all(Colors.grey)),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 8, top: 16),
                      child: ElevatedButton(
                        onPressed: () {
                          _onLastStep();
                        },
                        child: Text("Calculate"),
                        style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.all(Colors.green)),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 16),
                      child: ElevatedButton(
                        onPressed: () {
                          _onStepContinue();
                        },
                        child: Text("Next"),
                      ),
                    ),
                  ],
                );
              } else {
                return Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(right: 8, top: 16),
                      child: ElevatedButton(
                        onPressed: () {
                          cancel();
                        },
                        child: Text("Previous"),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.grey)),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 16),
                      child: ElevatedButton(
                        onPressed: () {
                          _onStepContinue();
                        },
                        child: Text("Save"),
                      ),
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ]),
    );
  }
}

void generatePDF() {}
