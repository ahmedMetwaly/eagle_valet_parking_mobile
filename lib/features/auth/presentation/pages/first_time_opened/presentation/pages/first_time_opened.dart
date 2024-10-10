import "package:eagle_valet_parking_mobile/core/utils/media_query_utils.dart";
import "package:flutter/material.dart";
import "../../../../../../../core/utils/image_manager.dart";
import "../../../../../../../../core/utils/values.dart";
import "../../../../../../../../generated/l10n.dart";

import "../widgets/select_language.dart";

class AppStarts extends StatelessWidget {
  const AppStarts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQueryUtils.getHeightPercentage(context, 0.3),
            ),
            Expanded(
              flex: 2,
              child: Image.asset(
                ImageManager.splash,
              ),
            ),
            const SizedBox(height: SizeManager.sSpace16),
            Text(
              S.current.selectLanguage,
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: Theme.of(context).colorScheme.primary),
            ),
            const SizedBox(height: SizeManager.sSpace),
            const Expanded(
                flex: 4,
                child: Column(
                  children: [
                     MyToggleButtons(),
                  ],
                )),
          ]),
    );
  }
}
