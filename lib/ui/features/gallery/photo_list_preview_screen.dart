import 'package:flutter/material.dart';
import 'package:mt_flutter_task/data/models/data_model.dart';
import 'package:mt_flutter_task/utils/constants.dart';
import 'package:photo_view/photo_view.dart';

class PhotoListPreviewScreen extends StatelessWidget {
  final List<Data> images;
  final int startingIndex;

  const PhotoListPreviewScreen(
      {super.key, required this.images, required this.startingIndex});

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController(initialPage: startingIndex);
    var topPadding =
        MediaQuery.of(context).size.height > MediaQuery.of(context).size.width
            ? MediaQuery.of(context).size.height / 1.4
            : MediaQuery.of(context).size.height / 2;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        toolbarHeight: 80,
        centerTitle: true,
        title: const SelectableText(
          cursorColor: primaryColor,
          "Preview",
          minLines: 1,
          maxLines: 2,
          style: TextStyle(color: Colors.white, fontSize: fontL),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: GestureDetector(
              onTap: () async {
                Navigator.pop(context); // Open drawer on tap
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                alignment: Alignment.center,
                decoration: const BoxDecoration(color: Colors.transparent),
                child: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.white,
                  size: 25,
                ),
              )),
        ),
      ),
      body: Stack(
        children: [
          PageView.builder(
            controller: pageController,
            itemCount: images.length,
            itemBuilder: (context, index) {
              return Center(
                child: Stack(
                  children: [
                    PhotoView(
                      imageProvider: NetworkImage(
                        "${images[index].url}",
                        scale: 0.5,
                      ),
                      backgroundDecoration: const BoxDecoration(
                        color: Colors.transparent,
                      ),
                      loadingBuilder: (context, event) {
                        return const Center(
                          child: CircularProgressIndicator.adaptive(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(primaryColor),
                            backgroundColor: Colors.transparent,
                          ),
                        );
                      },
                      minScale: PhotoViewComputedScale.contained * 0.8,
                      maxScale: PhotoViewComputedScale.covered * 2,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: topPadding, left: 20, right: 20, bottom: 10),
                      child: Center(
                        child: SelectableText(
                          cursorColor: primaryColor,
                          images[index].title.toString(),
                          maxLines: 5,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: fontL,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
