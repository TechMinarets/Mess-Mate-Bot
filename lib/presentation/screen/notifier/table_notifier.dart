import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:messmatebot/domain/usecase/chatbot/get_table_data_use_case.dart';
import 'package:messmatebot/injection_container/injection_container.dart';
import 'package:messmatebot/presentation/screen/state/table_ui_state.dart';

class TableNotifier extends StateNotifier<TableUiState> {
  TableNotifier() : super(const TableUiState.loading());

  Future<void> fetchTableData(
      {required int categoryId, bool isThisFirstCall = false}) async {
    if (isThisFirstCall && state != const TableUiState.loading()) {
      return;
    }

    try {
      final useCase = getIt<GetTableDataUseCase>();
      final response = await useCase(categoryId: categoryId);

      state = response.when(
        success: (categoryList) => TableUiState.success(categoryList),
        failure: (failure) => TableUiState.error(failure.message),
      );
    } catch (e) {
      state = TableUiState.error(e.toString());
    }
  }

  void clearTableData() {
    if (state != null || state != const TableUiState.loading()) {
      state = const TableUiState.loading();
    }
  }
}

final tableNotifierProvider =
    StateNotifierProvider<TableNotifier, TableUiState>(
  (ref) => TableNotifier(),
);
