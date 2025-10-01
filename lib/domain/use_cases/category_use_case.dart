
import 'package:e_commerceapproute/domain/entities/response/category.dart';
import 'package:e_commerceapproute/domain/repository/category/category_repository.dart';
import 'package:injectable/injectable.dart';
@injectable
class CategoryUseCase{
  CategoryRepository categoryRepository;
  // todo: constructor injection
  CategoryUseCase({required this.categoryRepository});
  Future<List<Category>?> invoke(){
    return categoryRepository.getAllCategories();
  }
}