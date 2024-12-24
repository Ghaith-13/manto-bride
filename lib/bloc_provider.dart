import 'package:manto_bride/features/all_products/data/repositories/all_products_repo.dart';
import 'package:manto_bride/features/all_products/presentation/cubit/all_products_cubit.dart';
import 'package:manto_bride/features/auth/data/repositories/sign_up_repo.dart';
import 'package:manto_bride/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:manto_bride/features/cart/data/repositories/cart_repo.dart';
import 'package:manto_bride/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:manto_bride/features/favorite/data/repositories/favorite_repo.dart';
import 'package:manto_bride/features/favorite/presentation/cubit/favorite_cubit.dart';
import 'package:manto_bride/features/profile/data/repositories/profile_repo.dart';
import 'package:manto_bride/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manto_bride/Locale/cubit/locale_cubit.dart';
import 'package:manto_bride/features/home/data/repositories/home_Repo.dart';
import 'package:manto_bride/features/home/presentation/cubit/home_cubit.dart';
import 'injection_container.dart' as di;

MultiBlocProvider blocMultiProvider({required child}) {
  return MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (BuildContext context) => HomeCubit(
          homeRepo: di.sl<HomeRepo>(),
        ),
      ),
      BlocProvider(
        create: (BuildContext context) => AuthCubit(
          signUpRepo: di.sl<SignUpRepo>(),
        ),
      ),
      BlocProvider(
        create: (BuildContext context) => FavoriteCubit(
          favoriteRepo: di.sl<FavoriteRepo>(),
        ),
      ),
      BlocProvider(
        create: (BuildContext context) => CartCubit(
          cartRepo: di.sl<CartRepo>(),
        ),
      ),
      BlocProvider(
        create: (BuildContext context) => ProfileCubit(
          profileRepo: di.sl<ProfileRepo>(),
        ),
      ),
      BlocProvider(
        create: (BuildContext context) => AllProductsCubit(
          allProductsRepo: di.sl<AllProductsRepo>(),
        ),
      ),
      BlocProvider(
        create: (BuildContext context) => LocaleCubit()..getSavedLAnguage(),
      ),
    ],
    child: child,
  );
}
