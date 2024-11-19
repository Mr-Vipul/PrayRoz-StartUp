import 'package:flutter/cupertino.dart';
import 'package:prayroz/utils/constants/colors.dart';
import '../curved_edges/curved_edges_widgets.dart';
import 'circular_container.dart';

class TPrimaryHeaderContainer extends StatelessWidget {
  const TPrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TCurvedEdgeWidgets(
      child: Container(
        color: TColors.primary,
        padding: const EdgeInsets.all(0),
        child: SizedBox(
          // height: 340,
          child: Stack(
            children: [
              Positioned(top: -150,right: -250,child: TCircularContainer(backgroundColor: TColors.textWhite.withOpacity(0.1), ),),
              Positioned(top: 100, right: -300,child: TCircularContainer(backgroundColor: TColors.textWhite.withOpacity(0.1),),),
              child, // Ensure the child is visible
            ],
          ),
        ),
      ),
    );
  }
}



















// class TPrimaryHeaderContainer extends StatelessWidget {
//   const TPrimaryHeaderContainer({
//     super.key,
//     required this.child,
//   });

//   final Widget child;

//   @override
//   Widget build(BuildContext context) {
//     return TCurvedEdgeWidgets(
//       child: Container(
//         color: TColors.primary,
//         padding: const EdgeInsets.all(0),
//         child: SizedBox(
//           height: 340,
//           child: Stack(
//             children: [
//               Positioned(top: -150,right: -250,child: TCircularContainer(backgroundColor: TColors.textWhite.withOpacity(0.1), ),),
//               Positioned(top: 100, right: -300,child: TCircularContainer(backgroundColor: TColors.textWhite.withOpacity(0.1),),),
//               child, // Ensure the child is visible
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
