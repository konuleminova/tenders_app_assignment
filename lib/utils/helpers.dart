import 'package:flutter/material.dart';

class PaginationController {
  late ScrollController scrollController;
  bool isLoading = false;
  bool stopLoading = false;
  int currentPage = 1;
  late Function loadAction;

  /// [initAction] is an optional action to run during initialization.
  /// [loadAction] is required and is triggered when the end of the scroll boundary is reached.
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
    // Check if loading should continue and if the scroll position has reached the set boundary.
    if (!stopLoading) {
      if (scrollController.offset >=
              scrollController.position.maxScrollExtent &&
          !isLoading) {
        // Mark as loading to prevent duplicate fetches.
        isLoading = true;

        // Trigger the load action and handle its result.
        loadAction().then((shouldStop) {
          // Reset loading state once data is fetched.
          isLoading = false;

          // Increment page count, which alters the boundary offset for future loads.
          currentPage++;

          // If the load action indicates no more data to load, set stopLoading to true.
          if (shouldStop == true) {
            stopLoading = true;
          }
        });
      }
    }
  }
}
