// import 'package:alexnahai/assets_helper/app_colors.dart';
// import 'package:alexnahai/assets_helper/app_fonts.dart';
// import 'package:alexnahai/assets_helper/app_icons.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// class CustomDropdownWidgets extends StatefulWidget {
//   final List<String> items;
//   final String? initialValue;
//   final Function(String)? onChanged;

//   const CustomDropdownWidgets({
//     super.key,
//     required this.items,
//     this.initialValue,
//     this.onChanged,
//   });

//   @override
//   // ignore: library_private_types_in_public_api
//   _CustomDropdownWidgetsState createState() => _CustomDropdownWidgetsState();
// }

// class _CustomDropdownWidgetsState extends State<CustomDropdownWidgets> {
//   late String selectedValue;

//   @override
//   void initState() {
//     super.initState();
//     selectedValue = widget.initialValue ?? widget.items.first;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       padding: EdgeInsets.symmetric(horizontal: 16),
//       decoration: BoxDecoration(
//         color: AppColor.cFFFFFF,
//         border: Border.all(color: Colors.grey.shade300),
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: DropdownButtonHideUnderline(
//         child: DropdownButton<String>(
//           value: selectedValue,
//           icon: SvgPicture.asset(AppIcons.arrowdown),
//           style: TextStyle(color: Colors.black, fontSize: 16),
//           onChanged: (String? newValue) {
//             if (newValue != null) {
//               setState(() {
//                 selectedValue = newValue;
//               });
//               if (widget.onChanged != null) {
//                 widget.onChanged!(newValue);
//               }
//             }
//           },
//           items: widget.items.map<DropdownMenuItem<String>>((String value) {
//             return DropdownMenuItem<String>(
//               value: value,
//               child: Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 10.0),
//                 child: Text(
//                   value,
//                   style: TextFontStyle.textStyle13PoppinsW400,
//                 ),
//               ),
//             );
//           }).toList(),
//         ),
//       ),
//     );
//   }
// }
