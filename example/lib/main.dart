import 'package:flutter/material.dart';
import 'package:passive_face_liveness/address_check.dart';
import 'package:passive_face_liveness/android/address.dart';
import 'package:passive_face_liveness/result/address_check_failure.dart';
import 'package:passive_face_liveness/result/address_check_result.dart';
import 'package:passive_face_liveness/result/address_check_success.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:passive_face_liveness_example/resultPage.dart';

void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final CountryNameController = TextEditingController(text: "Brasil");
  final CountryCodeController = TextEditingController(text: "BR");
  final AdminAreaController = TextEditingController(text: "Rio Grande do Sul");
  final SubAdminAreaController = TextEditingController(text: "Porto Alegre");
  final LocalityController = TextEditingController(text: "Porto Alegre");
  final SubLocalityController = TextEditingController(text: "Azenha");
  final ThoroughfareController = TextEditingController(text: "Av. Azenha");
  final SubThoroughfareController = TextEditingController(text: "200");
  final PostalCodeController = TextEditingController(text: "51110-100");
  var postalCodeMaskFormatter = new MaskTextInputFormatter(
      mask: '#####-###', filter: {"#": RegExp(r'[0-9]')});
  var countryCodeMaskFormatter =
      new MaskTextInputFormatter(mask: '##', filter: {"#": RegExp(r'[A-Z]')});
  String _result = "";
  String _description = "";

  String mobileToken =
      "";
  @override
  void initState() {
    super.initState();

    requestPermissions();
  }

  void requestPermissions() async {
    await [
      Permission.camera,
      Permission.storage,
    ].request();
  }

  void startAddressCheck(Address address) async {
    String result = "";
    String description = "";
    String cpf = "02801389030";

    AddressCheck addressCheck = new AddressCheck(mobileToken: mobileToken);

    addressCheck.setAddress(address);

    AddressCheckResult addressCheckResult = await addressCheck.start();

    Navigator.push(
        context, new MaterialPageRoute(builder: (context) => ResultPage(cpf)));

    setState(() {
      _result = result;
      _description = description;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text('AddressCheck plugin example'),
            ),
            body: Container(
                margin: const EdgeInsets.all(20.0),
                child: ListView(
                  children: <Widget>[
                    TextFormField(
                      controller: CountryNameController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelText: "Country Name",
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          )),
                      style: TextStyle(fontSize: 20),
                    ),
                    TextFormField(
                      controller: CountryCodeController,
                      inputFormatters: [countryCodeMaskFormatter],
                      decoration: InputDecoration(
                          labelText: "Country Code",
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          )),
                      style: TextStyle(fontSize: 20),
                    ),
                    TextFormField(
                      controller: AdminAreaController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelText: "Admin Area",
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          )),
                      style: TextStyle(fontSize: 20),
                    ),
                    TextFormField(
                      controller: SubAdminAreaController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelText: "Sub Admin Area",
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          )),
                      style: TextStyle(fontSize: 20),
                    ),
                    TextFormField(
                      controller: LocalityController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelText: "Locality",
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          )),
                      style: TextStyle(fontSize: 20),
                    ),
                    TextFormField(
                      controller: SubLocalityController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelText: "Sub Locality",
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          )),
                      style: TextStyle(fontSize: 20),
                    ),
                    TextFormField(
                      controller: ThoroughfareController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelText: "Thoroughfare",
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          )),
                      style: TextStyle(fontSize: 20),
                    ),
                    TextFormField(
                      controller: SubThoroughfareController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelText: "Sub Thoroughfare",
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          )),
                      style: TextStyle(fontSize: 20),
                    ),
                    TextFormField(
                      controller: PostalCodeController,
                      inputFormatters: [postalCodeMaskFormatter],
                      decoration: InputDecoration(
                          labelText: "PostalCode",
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          )),
                      style: TextStyle(fontSize: 20),
                    ),
                    ElevatedButton(
                      child: Text('Start AddressCheck'),
                      onPressed: () async {
                        Address address =
                            new Address(locale: new Locale("pt", "BR"));
                        address.setCountryName(CountryNameController.text);
                        address.setCountryCode(CountryCodeController.text);
                        address.setAdminArea(AdminAreaController.text);
                        address.setSubAdminArea(SubAdminAreaController.text);
                        address.setLocality(LocalityController.text);
                        address.setSubLocality(SubLocalityController.text);
                        address.setThoroughfare(ThoroughfareController.text);
                        address
                            .setSubThoroughfare(SubThoroughfareController.text);
                        address.setPostalCode(PostalCodeController.text);
                        startAddressCheck(address);
                      },
                    ),
                  ],
                ))));
  }
}
