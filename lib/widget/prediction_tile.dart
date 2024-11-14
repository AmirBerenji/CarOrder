import 'package:car_order/brand_colors.dart';
import 'package:car_order/models/prediction.dart';
import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

class PredictionTile extends StatelessWidget {
  const PredictionTile({
    super.key, required this.maintext, required this.secondaryText, required this.palceId
  });

  final String maintext;
  final String secondaryText;
  final String palceId; 

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 8,),
        Row(
          children: [
            const Icon(OMIcons.locationOn,color: BrandColors.colorDimText,),
            const SizedBox(width: 12,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(maintext,overflow: TextOverflow.ellipsis,maxLines: 1,style: TextStyle(fontSize: 16),),
                  const SizedBox(height: 2,),
                  Text(secondaryText,overflow: TextOverflow.ellipsis,maxLines: 2,style: TextStyle(fontSize: 12,color: BrandColors.colorDimText),),
                        
                ],
              ),
            )
          ],
        ),
        const SizedBox(height: 8,),
      ],
    );
  }
}
