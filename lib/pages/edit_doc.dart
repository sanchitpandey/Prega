import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EditDoc extends StatefulWidget {
  const EditDoc({Key? key}) : super(key: key);

  // final String userID;
  // const EditDoc(this.userID, {Key? key, required userId}) : super(key: key);

  @override
  State<EditDoc> createState() => _EditDocState();
}

class _EditDocState extends State<EditDoc> {
  final _formkey = GlobalKey<FormState>();
  late var isChecked = false;
  final changeDate = TextEditingController();
  final changeType = TextEditingController();
  final changeDoctorName = TextEditingController();
  final changeDescription = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
          child: Column(
        children: [
          const SizedBox(
            height: 55,
          ),
          Row(
            children: [
              const SizedBox(
                width: 15,
              ),
              Image.asset(
                'assets/icons/icon.png',
                height: 45,
                width: 45,
              ),
              const SizedBox(
                width: 15,
              ),
              const Text(
                "Edit Doc",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 47, 46, 65),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Image.asset("assets/images/editDoc.png"),
          const SizedBox(
            height: 13,
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Form(
              key: _formkey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextFormField(
                      controller: changeDate,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        labelText: 'Date',
                        hintText: 'Date',
                        border: OutlineInputBorder(),
                      ),
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101));
                        if (pickedDate != null) {
                          setState(() {
                            changeDate.text =
                                DateFormat("yyyy-MM-dd").format(pickedDate);
                          });
                        }
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: changeDoctorName,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        labelText: 'Doc Type',
                        hintText: 'Doc Type',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: changeDoctorName,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        labelText: "Doctor Name",
                        hintText: "Doctor's Name",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: changeDescription,
                      keyboardType: TextInputType.multiline,
                      maxLines: 5,
                      decoration: const InputDecoration(
                        labelText: "Description",
                        hintText: "Enter short discription",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Checkbox(
                          checkColor: Colors.white,
                          value: isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value!;
                            });
                          },
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        const Text(
                          'Visiblity',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: Color.fromARGB(255, 47, 46, 65),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(33, 178, 187, 0.51),
                                blurRadius: 5,
                                offset: Offset(-5, -5),
                              ),
                              BoxShadow(
                                color: Color.fromRGBO(33, 178, 187, 0.51),
                                blurRadius: 5,
                                offset: Offset(5, 5),
                              ),
                            ]),
                        width: double.infinity,
                        height: 50,
                        child: Center(
                          child: Text(
                            "Submit",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      onTap: () {
                        // createUser();
                        // final user = FirebaseAuth.instance.currentUser!;
                        // final user1 = FirebaseFirestore.instance
                        //     .collection('user/${user.uid}/documents');
                        // user1.doc(user1.)

                        // Navigator.pop(context);
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
