// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i528;

import '../../api/data_source/remote/auth_remote_data_source_impl.dart'
    as _i1066;
import '../../api/data_source/remote/brand_remote_data_source_impl.dart'
    as _i737;
import '../../api/data_source/remote/category_remote_data_source_impl.dart'
    as _i118;
import '../../api/data_source/remote/product_remote_data_source_impl.dart'
    as _i524;
import '../../api/dio/dio_module.dart' as _i67;
import '../../api/web_services.dart' as _i1069;
import '../../data/data_sources/remote/auth_remote_data_source.dart' as _i865;
import '../../data/data_sources/remote/brand_remote_data_source.dart' as _i114;
import '../../data/data_sources/remote/category_remote_data_source.dart'
    as _i344;
import '../../data/data_sources/remote/product_remote_data_source.dart'
    as _i189;
import '../../data/repository/auth_repository_impl.dart' as _i581;
import '../../data/repository/brand_repository_impl.dart' as _i271;
import '../../data/repository/category_repository_impl.dart' as _i1033;
import '../../data/repository/product_repository_impl.dart' as _i667;
import '../../domain/repository/auth/auth_repository.dart' as _i912;
import '../../domain/repository/brands/brand_repository.dart' as _i506;
import '../../domain/repository/category/category_repository.dart' as _i495;
import '../../domain/repository/product/product_repository.dart' as _i798;
import '../../domain/use_cases/brand_use_case.dart' as _i550;
import '../../domain/use_cases/category_use_case.dart' as _i184;
import '../../domain/use_cases/login_use_case.dart' as _i471;
import '../../domain/use_cases/product_use_case.dart' as _i1045;
import '../../domain/use_cases/register_use_case.dart' as _i479;
import '../../features/ui/auth/login/cubit/login_view_model.dart' as _i245;
import '../../features/ui/auth/register/cubit/register_view_model.dart'
    as _i873;
import '../../features/ui/home/cubit/home_screen_view_model.dart' as _i714;
import '../../features/ui/home/tabs/home/cubit/home_view_model.dart' as _i520;
import '../../features/ui/home/tabs/product/cubit/product_tab_view_model.dart'
    as _i307;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final getItModule = _$GetItModule();
    gh.factory<_i714.HomeScreenViewModel>(() => _i714.HomeScreenViewModel());
    gh.singleton<_i361.BaseOptions>(() => getItModule.provideBaseOptions());
    gh.singleton<_i528.PrettyDioLogger>(
      () => getItModule.providePrettyDioLogger(),
    );
    gh.singleton<_i361.Dio>(
      () => getItModule.provideDio(
        gh<_i361.BaseOptions>(),
        gh<_i528.PrettyDioLogger>(),
      ),
    );
    gh.singleton<_i1069.WebServices>(
      () => getItModule.provideWebServices(gh<_i361.Dio>()),
    );
    gh.factory<_i189.ProductRemoteDataSource>(
      () => _i524.ProductRemoteDataSourceImpl(
        webServices: gh<_i1069.WebServices>(),
      ),
    );
    gh.factory<_i114.BrandRemoteDataSource>(
      () => _i737.BrandRemoteDataSourceImpl(
        webServices: gh<_i1069.WebServices>(),
      ),
    );
    gh.factory<_i865.AuthRemoteDataSource>(
      () => _i1066.AuthRemoteDataSourceImpl(
        webServices: gh<_i1069.WebServices>(),
      ),
    );
    gh.factory<_i798.ProductRepository>(
      () => _i667.ProductRepositoryImpl(
        productRemoteDataSource: gh<_i189.ProductRemoteDataSource>(),
      ),
    );
    gh.factory<_i1045.ProductUseCase>(
      () => _i1045.ProductUseCase(
        productRepository: gh<_i798.ProductRepository>(),
      ),
    );
    gh.factory<_i344.CategoryRemoteDataSource>(
      () => _i118.CategoryRemoteDataSourceImpl(
        webServices: gh<_i1069.WebServices>(),
      ),
    );
    gh.factory<_i506.BrandRepository>(
      () => _i271.BrandRepositoryImpl(
        brandRemoteDataSource: gh<_i114.BrandRemoteDataSource>(),
      ),
    );
    gh.factory<_i307.ProductTabViewModel>(
      () => _i307.ProductTabViewModel(
        getAllProductsUseCase: gh<_i1045.ProductUseCase>(),
      ),
    );
    gh.factory<_i550.BrandUseCase>(
      () => _i550.BrandUseCase(brandRepository: gh<_i506.BrandRepository>()),
    );
    gh.factory<_i495.CategoryRepository>(
      () => _i1033.CategoryRepositoryImpl(
        categoryRemoteDataSource: gh<_i344.CategoryRemoteDataSource>(),
      ),
    );
    gh.factory<_i912.AuthRepository>(
      () => _i581.AuthRepositoryImpl(
        authRemoteDataSource: gh<_i865.AuthRemoteDataSource>(),
      ),
    );
    gh.factory<_i471.LoginUseCase>(
      () => _i471.LoginUseCase(authRepository: gh<_i912.AuthRepository>()),
    );
    gh.factory<_i479.RegisterUseCase>(
      () => _i479.RegisterUseCase(authRepository: gh<_i912.AuthRepository>()),
    );
    gh.factory<_i245.LoginViewModel>(
      () => _i245.LoginViewModel(loginUseCase: gh<_i471.LoginUseCase>()),
    );
    gh.factory<_i184.CategoryUseCase>(
      () => _i184.CategoryUseCase(
        categoryRepository: gh<_i495.CategoryRepository>(),
      ),
    );
    gh.factory<_i873.RegisterViewModel>(
      () =>
          _i873.RegisterViewModel(registerUseCase: gh<_i479.RegisterUseCase>()),
    );
    gh.factory<_i520.HomeViewModel>(
      () => _i520.HomeViewModel(
        categoryUseCase: gh<_i184.CategoryUseCase>(),
        brandUseCase: gh<_i550.BrandUseCase>(),
      ),
    );
    return this;
  }
}

class _$GetItModule extends _i67.GetItModule {}
