/* import 'package:eagle_valet_parking_mobile/features/add_new_parking/controller/bloc/add_employers_bloc/employer_bloc.dart';
import 'package:eagle_valet_parking_mobile/features/add_new_parking/controller/bloc/add_employers_bloc/employer_states.dart';
import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../../../../../../../core/utils/values.dart';
import '../../../../../../../../generated/l10n.dart';
import '../../../../../controller/shared_pref_bloc/sharedpref_bloc.dart';

class Phone extends StatelessWidget {
  final TextEditingController controller;
  const Phone({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    // PhoneNumber number = PhoneNumber(isoCode: "eg",dialCode: "+02",phoneNumber:);
    return BlocBuilder<AddEmployersCubit, EmployerStates>(
      builder: (BuildContext context, EmployerStates state) =>
          InternationalPhoneNumberInput(
        locale: context.read<SharedPrefBloc>().lang,
        onInputChanged: (PhoneNumber number) {
          //print(number.phoneNumber);
        },
        onInputValidated: (bool value) {
          //print(value);
        },
        selectorConfig: const SelectorConfig(
            selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
            useBottomSheetSafeArea: true,
            setSelectorButtonAsPrefixIcon: true,
            leadingPadding: PaddingManager.pInternalPadding,
            trailingSpace: false),
        ignoreBlank: false,
        autoValidateMode: AutovalidateMode.onUserInteraction,
        selectorTextStyle: const TextStyle(color: Colors.black),
        spaceBetweenSelectorAndTextField: SizeManager.sSpace,
        inputDecoration: InputDecoration(
          label: Text(S.current.phoneNumber),
        ),
        initialValue: PhoneNumber(isoCode: "EG",phoneNumber: controller.text),
        textFieldController: controller,
        formatInput: true,
        textStyle: Theme.of(context).textTheme.bodyMedium,
        keyboardType:
            const TextInputType.numberWithOptions(signed: true, decimal: false),
        inputBorder: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(SizeManager.borderRadiusOfInputField),
        ),
        searchBoxDecoration: InputDecoration(
          label: Text(S.current.search),
          counterStyle: Theme.of(context).textTheme.bodyMedium,
          hintStyle: Theme.of(context).textTheme.bodyMedium,
          //floatingLabelStyle: Theme.of(context).textTheme.bodyMedium,
        ),
        onSaved: (PhoneNumber number) {
          //print('On Saved: $number');
        },
      ),
    );
  }
}
 */

import "package:flutter/material.dart";

import "../../../../../../../generated/l10n.dart";

class PhoneNumber extends StatelessWidget {
  const PhoneNumber({
    super.key, required this.controller
  });
 final TextEditingController controller ;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      style: Theme.of(context).textTheme.bodyMedium,
      validator: (value) {
        if (value!.isEmpty) {
          return S.current.requiredField;
        }if (value.length<8){
          return S.current.enterValidNumber;
        }
        if (value.contains(".")||value.contains("-")||value.contains(",")){
          return S.current.enterValidNumber;
        }
        return null;
      },
      decoration:  InputDecoration(
        labelText: S.current.phoneNumber,
       ),
    );
  }
}
