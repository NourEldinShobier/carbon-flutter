import 'package:flutter/material.dart';
import 'package:carbon/carbon.dart';

class CTextfieldExample extends StatelessWidget {
  const CTextfieldExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CColors.gray100,
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.4,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CTextField(
                label: 'Label',
                description: 'Description',
                prefixIcon: Icon(CIcons.portfolio, size: 17),
              ),
              const SizedBox(height: 16),
              CTextField(
                label: 'Label',
                description: 'Description',
                validator: (value) {
                  return CValidationResult(
                    type: CValidationResultType.error,
                    message: 'Your input is incorrect',
                  );
                },
              ),
              const SizedBox(height: 16),
              CTextField(
                label: 'Label',
                description: 'Description',
                validator: (value) {
                  return CValidationResult(
                    type: CValidationResultType.success,
                    message: 'Your input is correct.',
                  );
                },
              ),
              const SizedBox(height: 16),
              CTextField(
                label: 'Label',
                description: 'Description',
                validator: (value) {
                  return CValidationResult(
                    type: CValidationResultType.warning,
                    message: 'Your input is missing something.',
                  );
                },
              ),
              const SizedBox(height: 16),
              CTextField(
                label: 'Label',
                description: 'Description',
                validator: (value) {
                  return null;
                },
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
