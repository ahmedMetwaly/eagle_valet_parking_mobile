import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../generated/l10n.dart';
import '../../../core/constants/values_manager.dart';
import '../../auth/controller/shared_pref_bloc/sharedpref_bloc.dart';
import '../../auth/controller/shared_pref_bloc/sharedpref_state.dart';

class ChangeLanguageWidget extends StatelessWidget {
  const ChangeLanguageWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SharedPrefBloc, SettingsStates>(
        builder: (context, state) => ListTile(
              onTap: () {
                changeLanguage(context);
              },
              contentPadding: const EdgeInsets.all(0),
              title: Text(
                S.current.language,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: Theme.of(context).colorScheme.primary),
              ),
              subtitle: Text(
                Intl.getCurrentLocale() == "en"
                    ? S.current.enLang
                    : S.current.arLang,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
            ),
        listener: (context, state) {
          if (state is LoadingSettings) {
            showDialog(
              context: context,
              barrierDismissible:
                  false, // Prevent user from dismissing the dialog
              builder: (context) => const Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (state is SettingsLoadedSuccessfully) {
            Navigator.of(context).pop();
          }
        });
  }

  Future<dynamic> changeLanguage(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      useSafeArea: true,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.4,
        width: double.infinity,
        padding: const EdgeInsets.all(PaddingManager.pInternalPadding),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(SizeManager.bottomSheetRadius),
              topRight: Radius.circular(SizeManager.bottomSheetRadius)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: SizeManager.sSpace,
            ),
            Center(
              child: Text(
                S.current.selectLanguage,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            Divider(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.4),
            ),
            ListTile(
              onTap: () {
                context.read<SharedPrefBloc>().changeLang("en");
                Navigator.pop(context);
              },
              title: Text(S.current.enLang,
                  style: const TextStyle(fontWeight: FontWeight.w600)),
            ),
            Divider(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.4),
            ),
            ListTile(
              onTap: () {
                context.read<SharedPrefBloc>().changeLang("ar");
                Navigator.pop(context);
              },
              title: const Text(
                "العربية",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
