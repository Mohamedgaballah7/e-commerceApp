
import 'package:e_commerceapproute/data/data_sources/remote/category_remote_data_source.dart';
import 'package:e_commerceapproute/domain/entities/response/category.dart';
import 'package:e_commerceapproute/domain/repository/category/category_repository.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: CategoryRepository)
class CategoryRepositoryImpl implements CategoryRepository{
  CategoryRemoteDataSource categoryRemoteDataSource;
  CategoryRepositoryImpl({required this.categoryRemoteDataSource});

  @override
  Future<List<Category>?> getAllCategories() {
   return categoryRemoteDataSource.getAllCategories();
  }

}