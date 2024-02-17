import 'package:firebase_auth/firebase_auth.dart';
import 'package:messmatebot/data/datasource/remote/api/category_api.dart';
import 'package:messmatebot/domain/model/category/category.dart';
import 'package:messmatebot/domain/model/core/failure.dart';
import 'package:messmatebot/domain/model/core/result.dart';

class GetCategoryUseCase {
  final CategoryApi _categoryApi;

  GetCategoryUseCase({required CategoryApi categoryApi})
      : _categoryApi = categoryApi;

  Future<Result<List<Category>>> call() async {
    return await _categoryApi.getCategories().then(
      (responseList) {
        List<Category> categoryList = [];
        for (var response in responseList) {
          categoryList.add(
            Category(
              id: response['id'],
              name: response['name'],
              table: null,
              user: FirebaseAuth.instance.currentUser!.uid,
              createdAt: response['created_at'],
              modifiedAt: response['modified_at'],
              messages: null,
            ),
          );
        }
        return Result.success(categoryList);
      },
    ).onError((Failure failure, _) => Result.failure(failure));
  }
}
