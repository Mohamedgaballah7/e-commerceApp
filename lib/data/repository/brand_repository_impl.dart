
import 'package:e_commerceapproute/data/data_sources/remote/brand_remote_data_source.dart';
import 'package:e_commerceapproute/domain/entities/response/category.dart';
import 'package:e_commerceapproute/domain/repository/brands/brand_repository.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: BrandRepository)
class BrandRepositoryImpl implements BrandRepository{
  BrandRemoteDataSource brandRemoteDataSource;
  BrandRepositoryImpl({required this.brandRemoteDataSource});

  @override
  Future<List<Category>?> getAllBrands() {
    return brandRemoteDataSource.getAllBrands();
  }

}