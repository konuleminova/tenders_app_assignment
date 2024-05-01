import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tenders_app/features/tenders/domain/models/tender.dart';
import 'package:tenders_app/features/tenders/domain/repositories/tenders_repository.dart';
import 'package:tenders_app/features/tenders/presentation/screens/tender_details/tender_details_screen.dart';
import 'package:tenders_app/features/tenders/presentation/tenders.dart';

class TenderItem extends StatelessWidget {
  final Tender tender;
  final int index;

  const TenderItem({
    super.key,
    required this.tender,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: CircleAvatar(
          child: Text('${index + 1}'),
        ),
        title: Text(tender.title),
        subtitle: Text(
          'ID: ${tender.id}\nDate: ${tender.date}',
        ),
        isThreeLine: true,
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => TenderDetailsScreen(
                tenderId: int.parse(tender.id),
              ),
            ),
          );
        },
      ),
    );
  }
}
