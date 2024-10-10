import "package:flutter/material.dart";

import "../../../../../../../generated/l10n.dart";

class NationalId extends StatefulWidget {
  const NationalId({super.key, required this.controller, this.onChange});
  final TextEditingController controller;
  final Function? onChange;
  @override
  State<NationalId> createState() => _NationalIdState();
}

class _NationalIdState extends State<NationalId> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: TextInputType.number,
      maxLines: 1,
      style: Theme.of(context).textTheme.bodyMedium,
       onChanged: (value) {
        setState(() {
          widget.onChange!(value);
        });
      },
      validator: (value) {
        if (value!.isEmpty) {
          return S.current.requiredField;
        } else {
          if (value.contains(",") ||
              value.contains("-") ||
              value.contains(".")) {
            return S.of(context).nationalIdError;
          }
          if (value.trim().length != 14) {
            return S.of(context).enterValidNationalId;
          }
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: S.current.nationalId,
      ),
    );
  }
}
