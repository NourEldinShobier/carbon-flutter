import 'package:flutter/material.dart';
import 'package:carbon/carbon.dart';

class CFormExample extends StatelessWidget {
  const CFormExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CColors.gray100,
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.4,
          child: CForm(
            type: CFormType.group,
            title: 'Hello World',
            description: 'This is my description',
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CTextField(
                  label: 'Label',
                  description: 'Description',
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
      ),
    );
  }
}
