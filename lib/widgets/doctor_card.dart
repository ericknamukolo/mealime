import 'package:flutter/material.dart';
import 'package:mealime/constants/constants.dart';
import 'package:mealime/screens/doctor_screen.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) => const DoctorScreen(),
          isScrollControlled: true,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: const DecorationImage(
                    image: AssetImage('assets/doc.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Dr Grace Banda', style: kBodyTextStyleBlack),
                  Text('Nutrition Specialist', style: kBodyTextStyleGrey),
                  Text('UTH - Lusaka', style: kBodyTextStyleGrey),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
