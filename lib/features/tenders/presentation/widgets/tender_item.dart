import 'package:flutter/material.dart';
import 'package:tenders_app/features/tenders/domain/models/tender.dart';
import 'package:tenders_app/features/tenders/presentation/screens/tender_details/tender_details_screen.dart';

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
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: ListTile(
        leading: _buildLeading(index),
        title: Text('ID: ${tender.id}\nDate: ${tender.date}'),
        subtitle: Text(tender.title),
        isThreeLine: true,
        onTap: () => _navigateToDetails(context, tender.id),
      ),
    );
  }

  Widget _buildLeading(int index) {
    return CircleAvatar(
      backgroundColor: Colors.lightBlue,
      child: Text('${index + 1}'),
    );
  }

  void _navigateToDetails(BuildContext context, String tenderId) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
            TenderDetailsScreen(tenderId: int.parse(tenderId)),
      ),
    );
  }
}
