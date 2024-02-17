import 'package:messmatebot/domain/model/category/category.dart';

abstract class CategoryApi {
  Future getCategories();

  Future createNewCategoryUseCase({required Category category});

  Future updateCategoryUseCase({required Category category});

  Future deleteCategoryUseCase({required Category category});
}
