import "package:flutter/material.dart";

import "../../generated/l10n.dart";



class InputNumber extends StatelessWidget {
  const InputNumber({
    super.key, required this.controller, required this.label
  });
 final TextEditingController controller ;
 final String label;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      style: Theme.of(context).textTheme.bodyMedium,
      validator: (value) {
        if (value!.isEmpty) {
          return S.current.requiredField;
        }
        return null;
      },
      decoration:  InputDecoration(
        labelText: label,
       ),
    );
  }
}
