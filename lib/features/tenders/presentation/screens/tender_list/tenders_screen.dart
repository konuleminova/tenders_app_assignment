import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tenders_app/features/tenders/presentation/tenders.dart';
import 'package:tenders_app/features/tenders/presentation/widgets/tender_item.dart';
import 'package:tenders_app/utils/helpers.dart';

class TendersScreen extends StatefulWidget {
  const TendersScreen({Key? key}) : super(key: key);

  @override
  State<TendersScreen> createState() => _TendersScreenState();
}

class _TendersScreenState extends State<TendersScreen> {
  final PaginationScrollController paginationScrollController =
      PaginationScrollController();

  @override
  void initState() {
    paginationScrollController.init(
        initAction: () => context.read<TendersCubit>().fetchTenders(),
        loadAction: () => context.read<TendersCubit>().fetchTenders());
    super.initState();
  }

  @override
  void dispose() {
    paginationScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TendersCubit, TendersState>(
      listener: (context, state) {
        if (state is TendersDataError) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.error)));
        }
      },
      builder: (context, state) {
        if (state is TendersLoading && state.tenders.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is TendersDataLoaded ||
            (state is TendersLoading && state.tenders.isNotEmpty)) {
          return ListView.builder(
              controller: paginationScrollController.scrollController,
              itemCount: state.tenders.length,
              itemBuilder: (context, index) {
                return TenderItem(
                  tender: state.tenders[index],
                  index: index,
                );
              });
        } else if (state is TendersDataError) {
          return Center(child: Text('Error: ${state.error}'));
        }
        return const Center(child: Text('No Data Available'));
      },
    );
  }
}
