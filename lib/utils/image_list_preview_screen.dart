// import 'package:eBazar/data/models/invoice_item_model.dart';
// import 'package:eBazar/ui/features/home/widgets/app_background.dart';
// import 'package:eBazar/utils/config.dart';
// import 'package:eBazar/utils/constants.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:photo_view/photo_view.dart';
//
// class ImageListPreviewScreen extends StatelessWidget {
//   final List<InvoiceItem> images;
//   final String imageType;
//   final int startingIndex;
//
//   ImageListPreviewScreen(
//       {required this.images,
//       required this.imageType,
//       required this.startingIndex});
//
//   @override
//   Widget build(BuildContext context) {
//     PageController pageController = PageController(initialPage: startingIndex);
//
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: primaryDarkColor,
//         elevation: 0,
//         toolbarHeight: 80,
//         centerTitle: true,
//         title: Text(
//           '$imageType Preview',
//           style: const TextStyle(color: Colors.white, fontSize: 18),
//         ),
//         leading: GestureDetector(
//           onTap: () {
//             Navigator.pop(context);
//           },
//           child: Container(
//             margin: const EdgeInsets.all(10),
//             alignment: Alignment.center,
//             decoration: const BoxDecoration(color: Colors.transparent),
//             child: SvgPicture.asset(
//               "assets/icons/ic_back_button.svg",
//               height: 23,
//               width: 17,
//             ),
//           ),
//         ),
//       ),
//       body: Stack(
//         children: [
//           const AppBackground(imgBgUrl: "assets/images/app_bg_2.png"),
//           PageView.builder(
//             controller: pageController,
//             itemCount: images.length,
//             itemBuilder: (context, index) {
//               return Center(
//                 child: PhotoView(
//                   imageProvider: NetworkImage(
//                     "${getBaseUrl()}/cds/image/ebazar/getInvoices/${images[index].image}",
//                     scale: 0.5,
//                   ),
//                   backgroundDecoration: const BoxDecoration(
//                     color: Colors.transparent,
//                   ),
//                   loadingBuilder: (context, event) {
//                     return const Center(
//                       child: CircularProgressIndicator.adaptive(
//                         valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
//                         backgroundColor: Colors.transparent,
//                       ),
//                     );
//                   },
//                   minScale: PhotoViewComputedScale.contained * 0.8,
//                   maxScale: PhotoViewComputedScale.covered * 2,
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
