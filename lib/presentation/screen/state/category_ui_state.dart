import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:messmatebot/domain/model/category/category.dart';

part 'category_ui_state.freezed.dart';

@freezed
class CategoryUiState with _$CategoryUiState {
  const factory CategoryUiState.loading() = LoadingState;

  const factory CategoryUiState.success(List<Category> categoryList) =
      SuccessState;

  const factory CategoryUiState.error(String message) = ErrorState;
}
