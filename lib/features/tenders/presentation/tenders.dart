library tenders;

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:tenders_app/features/tenders/domain/models/tender.dart';
import 'package:tenders_app/features/tenders/domain/repositories/tenders_repository.dart';
import 'package:tenders_app/utils/helpers.dart';

part 'screens/tender_list/tenders_cubit.dart';

part 'screens/tender_list/tenders_state.dart';

part 'screens/tender_details/tender_details_cubit.dart';

part 'screens/tender_details/tender_details_state.dart';
