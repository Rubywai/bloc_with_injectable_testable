// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../data/api/apiservice.dart';
import '../data/database/contact_dao.dart';
import '../data/database/contact_database.dart';
import 'injection.dart';
import '../data/contact_repository.dart';
import '../data/contact_repositoryImpl.dart';
import '../bloc/put/cubit/editcontact_cubit.dart';
import '../bloc/get/cubit/getcontact_cubit.dart';
import '../bloc/post/cubit/postcontact_cubit.dart';
import '../bloc/theme/theme_cubit.dart';
import '../common/theme/theme_repository.dart';
import '../common/theme/theme_repository_impl.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

Future<GetIt> $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) async {
  final gh = GetItHelper(get, environment, environmentFilter);
  final contactModule = _$ContactModule();
  final contactDatabase = await contactModule.contactDatabase;
  gh.lazySingleton<ContactDatabase>(() => contactDatabase);
  gh.lazySingleton<Dio>(() => contactModule.dio);
  gh.lazySingleton<LogInterceptor>(() => contactModule.loggingInter);
  gh.lazySingleton<ApiService>(
      () => contactModule.apiService(get<Dio>(), get<LogInterceptor>()));
  gh.lazySingleton<ContactDao>(
      () => contactModule.contactDao(get<ContactDatabase>()));
  gh.factory<ContactRepository>(() => ContactRepositoryImpl(get<ApiService>()));
  gh.factory<EditContactCubit>(
      () => EditContactCubit(get<ContactRepository>()));
  gh.factory<GetContactCubit>(() => GetContactCubit(get<ContactRepository>()));
  gh.factory<PostcontactCubit>(
      () => PostcontactCubit(get<ContactRepository>()));
  gh.factory<ThemeCubit>(() => ThemeCubit(get<ThemePreference>()));

  // Eager singletons must be registered in the right order
  gh.singleton<ThemePreference>(ThemeRepositoryImpl());
  return get;
}

class _$ContactModule extends ContactModule {}
