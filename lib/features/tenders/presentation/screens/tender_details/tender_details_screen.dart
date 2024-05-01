import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tenders_app/features/tenders/presentation/tenders.dart';

class TenderDetailsScreen extends StatefulWidget {
  final int tenderId;

  const TenderDetailsScreen({Key? key, required this.tenderId})
      : super(key: key);

  @override
  State<TenderDetailsScreen> createState() => _TenderDetailsScreenState();
}

class _TenderDetailsScreenState extends State<TenderDetailsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<TenderDetailsCubit>().fetchTenderDetails(widget.tenderId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tender Details"),
      ),
      body: BlocBuilder<TenderDetailsCubit, TenderDetailsState>(
        builder: (context, state) {
          if (state is TenderDetailsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TenderDetailsLoaded) {
            return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      state.tenderDetails.title,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      state.tenderDetails.description,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Published on: ${DateTime.parse(state.tenderDetails.date)}',
                    ),
                  ],
                ));
          } else if (state is TenderDetailsError) {
            return Center(child: Text(state.message));
          }
          return const Center(child: Text("Awaiting data..."));
        },
      ),
    );
  }
}
