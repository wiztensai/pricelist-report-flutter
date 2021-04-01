import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:price_report/report_pdf.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => new _AccountPageState();
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

String nomor,
    tanggal,
    namaPT,
    npwp,
    picUser,
    picPosition,
    contact,
    email,
    billingPic,
    billingAddress,
    billingContact,
    billingEmail,
    totalEmployee,
    diskonEmployee,
    ket1,
    hargaTraining,
    diskonTraining,
    ket2,
    hargaImplementasi,
    diskonImplementasi,
    ket3,
    hargaModifikasi,
    diskonModifikasi,
    ket4,
    emailSales;

class _AccountPageState extends State<AccountPage> {
  int _currentStep = 0;
  bool complete = false;

  List<StepState> stepStates = [StepState.indexed,StepState.indexed,StepState.indexed,StepState.indexed,StepState.indexed,StepState.indexed,StepState.indexed];

  next() {
    _currentStep < 7 ? setState(() => _currentStep += 1) : null;
  }

  cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }

  goTo(int step) {
    setState(() => _currentStep = step);
  }

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    List<Step> steps = [
      Step(
          state: stepStates[0],
          isActive: _currentStep == 0,
          title: const Text("Perusahaan"),
          content: Form(
            key: formKeys[0],
            child: Column(
              children: <Widget>[
                TextFormField(
                    decoration: InputDecoration(labelText: 'Nomor'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }

                      nomor = value;
                    },
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ]),
                TextFormField(
                    decoration: InputDecoration(labelText: 'Tanggal'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }

                      tanggal = value;
                    }),
                TextFormField(
                    decoration: InputDecoration(labelText: 'Nama PT'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }

                      namaPT = value;
                    }),
                TextFormField(
                    decoration: InputDecoration(labelText: 'NPWP'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }

                      npwp = value;
                    },
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ]),
              ],
            ),
          )),
      Step(
          state: stepStates[1],
          isActive: _currentStep == 1,
          title: const Text('PIC '),
          content: Form(
            key: formKeys[1],
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: 'PIC User'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }

                    picUser = value;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'PIC Position'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }

                    picPosition = value;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Contact'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }

                    contact = value;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Email'),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }

                    email = value;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Billing PIC'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }

                    billingPic = value;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Billing Address'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }

                    billingAddress = value;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Billing Contact'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }

                    billingContact = value;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Billing Email'),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }

                    billingEmail = value;
                  },
                )
              ],
            ),
          )),
      Step(
          state: stepStates[2],
          isActive: _currentStep == 2,
          title: const Text('Karyawan'),
          content: Form(
            key: formKeys[2],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: 'Total Employee'),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }

                    totalEmployee = value;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Diskon'),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }

                    diskonEmployee = value;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Keterangan 1'),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 16, 0, 8),
                  child: Text("Harga: -", style: TextStyle()),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                  child: Text("Harga Perkaryawan: -"),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                  child: Text("Setelah Diskon: -"),
                ),
              ],
            ),
          )),
      Step(
          state: stepStates[3],
          isActive: _currentStep == 3,
          title: const Text('Training'),
          content: Form(
            key: formKeys[3],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: 'Harga Training'),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }

                    hargaTraining = value;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Diskon Training'),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }

                    diskonTraining = value;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Keterangan 2'),
                ),
                Padding(
                  child: Text("Total Harga Training: -"),
                  padding: EdgeInsets.fromLTRB(0, 16, 0, 8),
                )
              ],
            ),
          )),
      Step(
          state: stepStates[4],
          isActive: _currentStep == 4,
          title: const Text('Implementasi'),
          content: Form(
            key: formKeys[4],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: 'Harga Implementasi'),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }

                    hargaImplementasi = value;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Diskon Implementation'),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }

                    diskonImplementasi = value;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Keterangan 3'),
                ),
                Padding(
                  child: Text("Total Harga Implementasi: -"),
                  padding: EdgeInsets.fromLTRB(0, 16, 0, 8),
                )
              ],
            ),
          )),
      Step(
          state: stepStates[5],
          isActive: _currentStep == 5,
          title: const Text('Modifikasi'),
          content: Form(
            key: formKeys[5],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: 'Harga Modifikasi'),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }

                    hargaModifikasi = value;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Diskon Modifikasi'),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }

                    diskonModifikasi = value;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Keterangan 4'),
                ),
                Padding(
                  child: Text("Total Harga Modifikasi: -"),
                  padding: EdgeInsets.fromLTRB(0, 16, 0, 8),
                )
              ],
            ),
          )),
      Step(
          state: stepStates[6],
          isActive: _currentStep == 6,
          title: const Text('Email Sales'),
          content: Form(
            key: formKeys[6],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: 'Email Sales'),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }

                    emailSales = value;
                  },
                ),
              ],
            ),
          )),
    ];

    return new Scaffold(
      appBar: AppBar(
        title: Text('Pricelist'),
        actions: <Widget>[
          ElevatedButton(
              onPressed: (){
                reportView(context);
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
            onStepContinue: () {
              if (formKeys[_currentStep].currentState.validate()) {
                setState(() {
                  stepStates[_currentStep] = StepState.complete;
                });

                next();
              } else {
                setState(() {
                  stepStates[_currentStep] = StepState.indexed;
                });
              }
            },
            onStepTapped: (step) => goTo(step),
            onStepCancel: cancel,
          ),
        ),

        // ElevatedButton(onPressed: () {}, child: Text("tes"))
      ]),
    );
  }
}

void generatePDF() {

}
