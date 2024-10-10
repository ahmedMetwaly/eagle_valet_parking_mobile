import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../generated/l10n.dart';
import '../../controller/bloc/add_employers_bloc/employer_bloc.dart';

class DeleteEmployerBtn extends StatelessWidget {
  const DeleteEmployerBtn({
    super.key,
    this.index,
    this.function,
  });
  final int? index;
  final Function? function;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton.icon(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                        title: Text(S.of(context).delete),
                        content: Text(S.of(context).delete_employer_message),
                        actions: [
                          TextButton(
                            onPressed: () {
                              if (index != null) {
                                context
                                    .read<AddEmployersCubit>()
                                    .deleteEmployerCubit(index: index!);
                              } else {
                                if (function != null) {
                                  function!();
                                }
                              }

                              Navigator.of(context).pop();
                            },
                            child: Text(S.of(context).ok),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(S.of(context).cancel),
                          ),
                        ]));
          },
          icon: const Icon(Icons.person_remove_alt_1_rounded),
          label: Text(S.current.delete)),
    );
  }
}
