import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:tenders_app/features/tenders/domain/models/tender.dart';
import 'package:tenders_app/features/tenders/presentation/tenders.dart';

class TenderDetailsScreen extends StatelessWidget {
  final int tenderId;

  const TenderDetailsScreen({
    super.key,
    required this.tenderId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Tender Details",
        ),
      ),
      body: BlocProvider<TenderDetailsCubit>(
        create: (_) => GetIt.I<TenderDetailsCubit>(param1: tenderId),
        child: BlocConsumer<TenderDetailsCubit, TenderDetailsState>(
          listener: (context, state) {
            if (state is TenderDetailsError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is TenderDetailsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is TenderDetailsLoaded) {
              return _TenderDetails(state.tenderDetails!);
            }
            return const Center(child: Text("Awaiting data..."));
          },
        ),
      ),
    );
  }
}

class _TenderDetails extends StatelessWidget {
  final Tender tenderDetails;

  const _TenderDetails(this.tenderDetails);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('ID: ${tenderDetails.id}',
              style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Text('Published on: ${tenderDetails.date}',
              style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Text('Title: ${tenderDetails.title}'),
          const SizedBox(height: 10),
          Text('Description: ${tenderDetails.description}'),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
