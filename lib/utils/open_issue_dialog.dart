import 'package:flutter/material.dart';

import 'package:fun_with_kanji/generated/l10n.dart';
import 'package:url_launcher/url_launcher.dart';

void showOpenIssueDialog(
  BuildContext context,
  Object error,
  StackTrace stackTrace,
) =>
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(L10n.of(context)!.oopsSomethignWentWrong),
        content: Text(L10n.of(context)!.errorDesc),
        actions: [
          TextButton(
            onPressed: Navigator.of(context).pop,
            child: Text(L10n.of(context)!.cancel),
          ),
          TextButton(
            onPressed: () => launchUrl(
              Uri(
                scheme: 'https',
                host: 'gitlab.com',
                path: '/KrilleFear/funny-kanji/-/issues/new',
                queryParameters: {
                  'issue[title]': 'Bugreport: ${error.toString()}',
                  'issue[description]': stackTrace.toString(),
                },
              ),
            ),
            child: Text(L10n.of(context)!.report),
          ),
        ],
      ),
    );
