import 'package:flutter/material.dart';

class PaginationScrollController {
  late ScrollController scrollController;
  bool isLoading = false;
  bool stopLoading = false;
  int currentPage = 1;
  double boundaryOffset = 0.5;
  late Function loadAction;

  void init({Function? initAction, required Function loadAction}) {
    if (initAction != null) {
      initAction();
    }

    this.loadAction = loadAction;
    scrollController = ScrollController();
    scrollController.addListener(_scrollListener);
  }

  void dispose() {
    scrollController.removeListener(_scrollListener);
    scrollController.dispose();
  }

  void _scrollListener() {
    if (!stopLoading) {
      if (scrollController.offset >=
              scrollController.position.maxScrollExtent * boundaryOffset &&
          !isLoading) {
        isLoading = true;
        loadAction().then((shouldStop) {
          isLoading = false;
          currentPage++;
          boundaryOffset = 1 - 1 / (currentPage * 2);
          if (shouldStop == true) {
            stopLoading = true;
          }
        });
      }
    }
  }
}
