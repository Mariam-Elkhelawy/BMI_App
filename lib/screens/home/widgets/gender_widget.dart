import 'package:flutter/material.dart';

class GenderWidget extends StatefulWidget {
  GenderWidget({super.key, required this.gender});
  String gender;
  @override
  State<GenderWidget> createState() => _GenderWidgetState();
}

class _GenderWidgetState extends State<GenderWidget> {
  bool isSelectMale = true;
  bool isSelectFemale = false;
  static bool isSelected = true;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          setState(() {
            isSelected = (widget.gender == 'male') ? true : false;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: (isSelected && widget.gender == 'male') ||
                    (!isSelected && widget.gender == 'female')
                ? Colors.teal
                : Colors.blueGrey,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(widget.gender == 'male' ? Icons.male : Icons.female,
                  size: 90),
              const SizedBox(height: 15),
              Text(
                widget.gender == 'male' ? 'Male' : 'Female',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ),
    );

    //   Expanded(
    //   child: InkWell(
    //     onTap: () {
    //       setState(() {
    //         isSelected = widget.gender == 'male'? true : false;
    //       });
    //     },
    //     child: Container(
    //       decoration: BoxDecoration(
    //         borderRadius: BorderRadius.circular(10),
    //         color: (isSelected && widget.gender == 'male') ||
    //                 (!isSelected && widget.gender == 'female')
    //             ? Colors.teal
    //             : Colors.blueGrey,
    //       ),
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           Icon(widget.gender == 'male' ? Icons.male : Icons.female,
    //               size: 90),
    //           const SizedBox(height: 15),
    //           Text(
    //             widget.gender == 'male' ? 'Male' : 'Female',
    //             style: Theme.of(context).textTheme.bodyMedium,
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
