import 'package:freezed_annotation/freezed_annotation.dart';

part 'table_ui_state.freezed.dart';

@freezed
class TableUiState with _$TableUiState {
  const factory TableUiState.loading() = LoadingState;

  const factory TableUiState.success(Map tableData) = SuccessState;

  const factory TableUiState.error(String message) = ErrorState;
}
