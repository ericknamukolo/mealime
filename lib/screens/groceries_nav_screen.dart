import 'package:flutter/material.dart';
import 'package:mealime/constants/colors.dart';
import 'package:mealime/constants/constants.dart';
import 'package:mealime/providers/groceries.dart';
import 'package:mealime/widgets/grocery_item.dart';
import 'package:provider/provider.dart';

class GroceriesNavScreen extends StatelessWidget {
  const GroceriesNavScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final groceriesData = Provider.of<Groceries>(context).groceries;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
            width: 130,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Icon(Icons.local_shipping_rounded),
                Text(
                  'Shop Online',
                  style: kBodyTextStyleWhite.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Groceries',
              style: kTitleTextStyle,
            ),
            const Text(
              'PRODUCE',
              style: kBodyTextStyleGrey,
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => GroceryItem(
                  id: groceriesData[index].id,
                  ingredient: groceriesData[index].ingredient,
                  quantity: groceriesData[index].quantity,
                  isChecked: groceriesData[index].isChecked,
                ),
                itemCount: groceriesData.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
