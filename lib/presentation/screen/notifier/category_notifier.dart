import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:messmatebot/domain/model/category/category.dart';
import 'package:messmatebot/domain/usecase/category/create_new_category_use_case.dart';
import 'package:messmatebot/domain/usecase/category/delete_category_use_case.dart';
import 'package:messmatebot/domain/usecase/category/get_category_use_case.dart';
import 'package:messmatebot/domain/usecase/category/update_category_use_case.dart';
import 'package:messmatebot/injection_container/injection_container.dart';
import 'package:messmatebot/presentation/screen/state/category_ui_state.dart';

class CategoryNotifier extends StateNotifier<CategoryUiState> {
  CategoryNotifier() : super(const CategoryUiState.loading()) {
    fetchCategoryList();
  }

  void fetchCategoryList() async {
    state = const CategoryUiState.loading();
    try {
      final useCase = getIt<GetCategoryUseCase>();
      final result = await useCase();

      state = result.when(
        success: (categoryList) => CategoryUiState.success(categoryList),
        failure: (failure) => CategoryUiState.error(failure.message),
      );
    } catch (e) {
      state = CategoryUiState.error(e.toString());
    }
  }

  Future<void> createCategory({required String name}) async {
    try {
      final useCase = getIt<CreateNewCategoryUseCase>();
      final result = await useCase(
        category: Category(
          id: 0,
          name: name,
          table: null,
          createdAt: DateTime.now().toString(),
          modifiedAt: DateTime.now().toString(),
          user: FirebaseAuth.instance.currentUser!.uid,
        ),
      );

      result.when(
        success: (categoryList) {
          fetchCategoryList();
        },
        failure: (failure) {
          state = CategoryUiState.error(failure.message);
        },
      );
    } catch (e) {
      state = CategoryUiState.error(e.toString());
    }
  }

  Future<void> editCategory({required Category category}) async {
    try {
      final useCase = getIt<UpdateCategoryUseCase>();
      final result = await useCase(category: category);

      result.when(
        success: (categoryList) {
          fetchCategoryList();
        },
        failure: (failure) {
          state = CategoryUiState.error(failure.message);
        },
      );
    } catch (e) {
      state = CategoryUiState.error(e.toString());
    }
  }

  Future<void> deleteCategory({required Category category}) async {
    try {
      final useCase = getIt<DeleteCategoryUseCase>();
      final result = await useCase(category: category);

      result.when(
        success: (categoryList) {
          fetchCategoryList();
        },
        failure: (failure) {
          state = CategoryUiState.error(failure.message);
        },
      );
    } catch (e) {
      state = CategoryUiState.error(e.toString());
    }
  }
}

final categoryNotifierProvider =
    StateNotifierProvider<CategoryNotifier, CategoryUiState>((ref) {
  return CategoryNotifier();
});
