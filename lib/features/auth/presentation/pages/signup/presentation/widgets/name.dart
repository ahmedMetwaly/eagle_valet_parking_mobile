import 'package:flutter/material.dart';
import '../../../../../../../../generated/l10n.dart';

class Name extends StatefulWidget {
  const Name({
    super.key,
    required this.nameController,
    required this.title,
    this.readOnly,
    this.maxLines,
    this.onChange,
  });

  final TextEditingController nameController;
  final String title;
  final bool? readOnly;
  final int? maxLines;
  final Function? onChange;

  @override
  State<Name> createState() => _NameState();
}

class _NameState extends State<Name> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.nameController,
      readOnly: widget.readOnly ?? false,
      maxLines: widget.maxLines,
      onChanged: (value) {
        setState(() {
          widget.onChange!(value);
        });
      },
      validator: (value) {
        if (widget.readOnly == null) {
          if (value!.isEmpty) {
            return S.current.requiredField;
          } else if (value.contains("[0-9]")) {
            //print(value);
            return S.current.notValidName;
          }
        }

        return null;
      },
      style: widget.readOnly == null
          ? Theme.of(context).textTheme.bodyMedium
          : Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: Theme.of(context).colorScheme.outline),
      decoration: InputDecoration(
        labelText: widget.title,
      ),
    );
  }
}
