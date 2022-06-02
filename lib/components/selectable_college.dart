// ignore_for_file: library_private_types_in_public_api, constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../style.dart';

class OptionContainer extends StatefulWidget {
  const OptionContainer(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.trailingText,
      required this.assetPath})
      : super(key: key);

  final String title;
  final String subtitle;
  final String trailingText;
  final String assetPath;

  @override
  State<OptionContainer> createState() => _OptionContainerState();
}
enum _Colleges {
  Bachelor_of_technology,
  Bachelor_of_architecture,
  Pharmacy,
  Law,
  Management
}

_Colleges selectedCollege = _Colleges.Bachelor_of_technology;
class _OptionContainerState extends State<OptionContainer> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: InkWell(
        onTap: () {
          showBottomSheetOptions(context);
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: SizedBox(
            height: 150,
            child: Stack(children: [
              //white background
              Container(
                color: Colors.white,
              ),
              // image background
              Image.asset(
                widget.assetPath,
                fit: BoxFit.cover,
              ),
              //left to right gradient
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  height: 150,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Colors.black87,
                        Colors.black45,
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
              //title and subtitle in top right corner
              Container(
                padding: const EdgeInsets.all(16.0),
                constraints: BoxConstraints(maxWidth: screenWidth * 0.66),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: GoogleFonts.lato(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        widget.subtitle,
                        maxLines: 6,
                        // textAlign: TextAlign.justify,
                        style: GoogleFonts.lato(
                          fontSize: 13,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // trailing text in the bottom right corner
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: RichText(
                    text: TextSpan(
                      text: "+",
                      style: GoogleFonts.lato(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: "${widget.trailingText.split(' ').first} ",
                          style: GoogleFonts.lato(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: widget.trailingText.split(' ').last,
                          style: GoogleFonts.lato(
                            fontSize: 10,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  void showBottomSheetOptions(context) {
//show bottom sheet with 5 different college options with radio buttons
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        context: context,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, setModalState) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 8.0),
                      child: Text("Sort by",
                          style: GoogleFonts.lato(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0, top: 8),
                      child: IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(
                            Icons.clear,
                            color: Colors.grey,
                          )),
                    )
                  ],
                ),
                const Divider(
                  endIndent: 20,
                  indent: 20,
                  thickness: 1,
                ),
                //engineering college
                ListTile(
                  leading: Image.asset("assets/icons/education.png"),
                  title: const Text("Bachelor of Technology"),
                  onTap: () {
                    setState(() {
                      selectedCollege = _Colleges.Bachelor_of_technology;
                    });
                    setModalState(() {});
                    Navigator.pop(context);
                  },
                  trailing: Radio(
                    value: _Colleges.Bachelor_of_technology,
                    activeColor: Style.primaryColor,
                    toggleable: true,
                    groupValue: selectedCollege,
                    onChanged: (value) {
                      setState(() {
                        selectedCollege = _Colleges.Bachelor_of_technology;
                      });
                      setModalState(() {});
                      Navigator.pop(context);
                    },
                  ),
                ),
                //architecture college
                ListTile(
                  leading: Image.asset("assets/icons/sketch.png"),
                  title: const Text("Bachelor of Architecture"),
                  onTap: () {
                    setState(() {
                      selectedCollege = _Colleges.Bachelor_of_architecture;
                    });
                    setModalState(() {});
                    Navigator.pop(context);
                  },
                  trailing: Radio(
                    value: _Colleges.Bachelor_of_architecture,
                    groupValue: selectedCollege,
                    toggleable: true,
                    onChanged: (value) {
                      setState(() {
                        selectedCollege = _Colleges.Bachelor_of_architecture;
                   
                      });
                      setModalState(() {});
                      Navigator.pop(context);
                    },
                  ),
                ),
                //Pharmacy college
                ListTile(
                  leading: Image.asset("assets/icons/pharmacy.png"),
                  title: const Text("Bachelor of Pharmacy"),
                  onTap: () {
                    setState(() {
                      selectedCollege = _Colleges.Pharmacy;
                    });
                    setModalState(() {});
                    Navigator.pop(context);
                  },
                  trailing: Radio(
                      value: _Colleges.Pharmacy,
                      groupValue: selectedCollege,
                      toggleable: true,
                      onChanged: (value) {
                        setState(() {
                          selectedCollege = _Colleges.Pharmacy;
                        });
                        setModalState(() {});
                        Navigator.pop(context);
                      }),
                ),
                //Law college
                ListTile(
                  onTap: () {
                    setState(() {
                      selectedCollege = _Colleges.Law;
                    });
                    setModalState(() {});
                    Navigator.pop(context);
                  },
                  leading: Image.asset("assets/icons/balance.png"),
                  title: const Text("Law"),
                  trailing: Radio(
                      value: _Colleges.Law,
                      groupValue: selectedCollege,
                      toggleable: true,
                      onChanged: (value) {
                        setState(() {
                          selectedCollege = _Colleges.Law;
                        });
                        setModalState(() {});
                        Navigator.pop(context);
                      }),
                ),
                //Management college
                ListTile(
                  onTap: () {
                    setState(() {
                      selectedCollege = _Colleges.Management;
                    });
                    setModalState(() {});
                    Navigator.pop(context);
                  },
                  leading: Image.asset("assets/icons/management.png"),
                  title: const Text("Management"),
                  trailing: Radio(
                      value: _Colleges.Management,
                      toggleable: true,
                      groupValue: selectedCollege,
                      onChanged: (value) {
                        setState(() {
                          selectedCollege = _Colleges.Management;
                        });
                        setModalState(() {});
                        Navigator.pop(context);
                      }),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            );
          });
        });
  }
}
