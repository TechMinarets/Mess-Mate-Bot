import 'package:firebase_auth/firebase_auth.dart';
import 'package:messmatebot/data/datasource/remote/api/category_api.dart';
import 'package:messmatebot/data/datasource/remote/utils/api_client.dart';
import 'package:messmatebot/domain/model/category/category.dart';

class CategoryApiImpl implements CategoryApi {
  final ApiClient _client;

  static const String getCategoryApi = '/account/user/<uuid>/categories/';
  static const String createNewCategoryApi = 'category/categories/';
  static const String updateCategoryApi = 'category/categories/';

  CategoryApiImpl({required ApiClient client}) : _client = client;

  @override
  Future getCategories() async {
    return await _client.get(
      path: getCategoryApi.replaceFirst(
          '<uuid>', FirebaseAuth.instance.currentUser!.uid),
      converter: (json) => json,
    );
  }

  @override
  Future createNewCategoryUseCase({required Category category}) async {
    return await _client.post(
      path: createNewCategoryApi,
      data: category.toJson(),
      converter: (json) => json,
    );
  }

  @override
  Future updateCategoryUseCase({required Category category}) async {
    return await _client.patch(
      path: '$updateCategoryApi/${category.id}/',
      data: {
        'id': category.id,
        'name': category.name,
      },
      converter: (json) => json,
    );
  }

  @override
  Future deleteCategoryUseCase({required Category category}) async {
    return await _client.delete(
      path: '$updateCategoryApi/${category.id}/',
      converter: (json) => json,
    );
  }
}
