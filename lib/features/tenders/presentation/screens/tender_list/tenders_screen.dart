import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tenders_app/features/tenders/presentation/tenders.dart';
import 'package:tenders_app/features/tenders/presentation/widgets/tender_item.dart';

class TendersScreen extends StatelessWidget {
  const TendersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TendersCubit, TendersState>(listener: (context, state) {
      if (state is TendersDataError) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(state.error)));
      }
    }, builder: (context, state) {
      if (state is TendersLoading && state.tenders.isEmpty) {
        return const Center(child: CircularProgressIndicator());
      }
      return Stack(children: [
        ListView.builder(
          controller: state.pageController.scrollController,
          itemCount: state.tenders.length,
          itemBuilder: (context, index) {
            return TenderItem(
              tender: state.tenders[index],
              index: index,
            );
          },
        ),
        if (state.pageController.isLoading)
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: CircularProgressIndicator(),
            ),
          )
      ]);
    });
  }
}
