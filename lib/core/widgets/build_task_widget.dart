import 'package:flutter/material.dart';
import 'package:to_do_app/core/utils/app_strings.dart';
import 'package:to_do_app/core/widgets/custom_elevated_button.dart';

import '../utils/app_colors.dart';

class BuildTaskWidget extends StatelessWidget {
  const BuildTaskWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
            context: context,
            builder: (context) {
              return Container(
                padding: const EdgeInsets.all(24),
                height: 240,
                color: AppColors.deepGrey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 48,
                      width: double.infinity,
                      child: CustomElevatedButton(
                        onPressed: () {},
                        title: AppString.doneTask,
                      ),
                    ),
                    SizedBox(
                      height: 48,
                      width: double.infinity,
                      child: CustomElevatedButton(
                        backgroundColor: AppColors.red,
                        onPressed: () {},
                        title: AppString.deletedTask,
                      ),
                    ),
                    SizedBox(
                      height: 48,
                      width: double.infinity,
                      child: CustomElevatedButton(
                        onPressed: () {},
                        title: AppString.cancelTask,
                      ),
                    ),
                  ],
                ),
              );
            });
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.only(bottom: 16),
        height: 160,
        decoration: BoxDecoration(
          color: AppColors.red,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Task 1',
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(fontSize: 24)),
            Row(
              children: [
                const Icon(
                  Icons.timer_outlined,
                  color: AppColors.white,
                ),
                const SizedBox(width: 8.0),
                Text(
                  '09:33 PM - 09:48 PM',
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(color: AppColors.white),
                ),
                const Spacer(),
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  height: 60,
                  width: 02,
                  color: AppColors.white.withOpacity(0.7),
                ),
                RotatedBox(
                  quarterTurns: 3,
                  child: Text('ToDo',
                      style: Theme.of(context).textTheme.displayMedium),
                )
              ],
            ),
            Text(
              'Learn Flutter',
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ],
        ),
      ),
    );
  }
}
