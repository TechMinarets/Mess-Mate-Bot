import 'package:messmatebot/data/datasource/remote/api/category_api.dart';
import 'package:messmatebot/domain/model/category/category.dart';
import 'package:messmatebot/domain/model/core/failure.dart';
import 'package:messmatebot/domain/model/core/result.dart';

class DeleteCategoryUseCase {
  final CategoryApi _categoryApi;

  DeleteCategoryUseCase({required CategoryApi categoryApi})
      : _categoryApi = categoryApi;

  Future<Result> call({required Category category}) async {
    return await _categoryApi
        .deleteCategoryUseCase(category: category)
        .then((_) => const Result.success(null))
        .onError((Failure failure, _) => Result.failure(failure));
  }
}
