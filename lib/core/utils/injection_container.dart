import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // //! Features - OnBoarding
  // // Bloc
  // sl.registerFactory(
  //     () => OnBoardingCubit(cacheFirstTimer: sl(), isFirstTimer: sl()));
  // // Use cases
  // sl.registerLazySingleton(() => CacheFirstTimer(sl()));
  // sl.registerLazySingleton(() => IsFirstTimer(sl()));
  // // Repository
  // sl.registerLazySingleton<OnBoardingRepository>(
  //   () => OnBoardingRepositoryImpl(
  //     sl(),
  //   ),
  // );
  // // Data sources
  // sl.registerLazySingleton<OnBoardingLocalDataSource>(
  //   () => OnBoardingLocalDataSourceImpl(sl()),
  // );

  // //! Features - Auth
  // //Bloc
  // sl.registerFactory(
  //     () => AuthBloc(logInWithEmailAndPassword: sl(), signUp: sl()));
  // // Use cases
  // sl.registerLazySingleton(() => LogInWithEmailAndPassword(sl()));
  // sl.registerLazySingleton(() => SignUp(sl()));
  // // Repository
  // sl.registerLazySingleton<AuthRepository>(
  //   () => AuthRepositoryImpl(
  //     remoteDataSource: sl(),
  //     localDataSource: sl(),
  //     networkInfo: sl(),
  //   ),
  // );
  // // Data sources
  // sl.registerLazySingleton<AuthRemoteDataSource>(
  //   () => AuthRemoteDataSourceImpl(client: sl()),
  // );
  // sl.registerLazySingleton<AuthLocalDataSource>(
  //     () => AuthLocalDataSourceImpl(sl()));

  // //! Features - Home
  // // Cubit
  // sl.registerFactory(() => CouponCubit(getAllCoupons: sl()));
  // sl.registerFactory(() => OrderCouponCubit());
  // // Use cases
  // sl.registerLazySingleton(() => GetAllCoupons(sl()));
  // // Repository
  // sl.registerLazySingleton<CouponRepository>(() => CouponRepositoryImpl(sl()));
  // // Data sources
  // sl.registerLazySingleton<CouponRemoteDataSource>(
  //     () => CouponRemoteDataSourceImpl(client: sl()));

  // //! Features - Categories
  // // Cubit
  // sl.registerFactory(
  //   () => CategoriesCubit(
  //     getAllCategories: sl(),
  //   ),
  // );
  // sl.registerFactory(
  //   () => PopularCategoriesCubit(
  //     getPopularCategories: sl(),
  //   ),
  // );
  // // Use cases
  // sl.registerLazySingleton(() => GetAllCategories(sl()));
  // sl.registerLazySingleton(() => GetPopularCategories(sl()));
  // // Repository
  // sl.registerLazySingleton<CategoryRepository>(
  //     () => CategoryRepositoryImpl(sl()));
  // // Data sources
  // sl.registerLazySingleton<CategoryRemoteDataSource>(
  //     () => CategoryRemoteDataSourceImpl(client: sl()));

  // //! Features - Products
  // // Bloc
  // sl.registerFactory(() => ProductsBloc(
  //       getAllProductsByCategory: sl(),
  //       getProductById: sl(),
  //       getNewArrivalProducts: sl(),
  //       getPopularProducts: sl(),
  //       searchProductsByName: sl(),
  //       searchProductsByNamePerCategory: sl(),
  //       getRelevantProducts: sl(),
  //       getProductsByBrandPerCategory: sl(),
  //     ));
  // // Use cases
  // sl.registerLazySingleton(() => GetAllProductsByCategory(sl()));
  // sl.registerLazySingleton(() => GetProductById(sl()));
  // sl.registerLazySingleton(() => GetNewArrivalProducts(sl()));
  // sl.registerLazySingleton(() => GetPopularProducts(sl()));
  // sl.registerLazySingleton(() => SearchProductsByName(sl()));
  // sl.registerLazySingleton(() => SearchProductsByNamePerCategory(sl()));
  // sl.registerLazySingleton(() => GetProductsByBrandPerCategory(sl()));
  // sl.registerLazySingleton(() => GetRelevantProducts(sl()));
  // // Repository
  // sl.registerLazySingleton<ProductRepository>(
  //     () => ProductRepositoryImpl(sl()));
  // // Data sources
  // sl.registerLazySingleton<ProductRemoteDataSource>(
  //     () => ProductRemoteDataSourceImpl(client: sl()));

  // //! Features - Review
  // // Cubit
  // sl.registerFactory(
  //   () => ReviewCubit(
  //     getProductReviews: sl(),
  //     reviewProduct: sl(),
  //   ),
  // );
  // sl.registerFactory(
  //   () => ProductRateCubit(),
  // );
  // // Use cases
  // sl.registerLazySingleton(() => GetProductReviews(sl()));
  // sl.registerLazySingleton(() => ReviewProduct(sl()));
  // // Repository
  // sl.registerLazySingleton<ReviewRepository>(() => ReviewRepositoryImpl(sl()));
  // // Data sources
  // sl.registerLazySingleton<ReviewRemoteDataSource>(
  //     () => ReviewRemoteDataSourceImpl(client: sl()));

  // //! Wishlist
  // // Cubit
  // sl.registerFactory(
  //   () => WishlistCubit(
  //     getWishlist: sl(),
  //     addOrRemoveProductFromWishlist: sl(),
  //     removeProductFromWishlist: sl(),
  //   ),
  // );
  // // Use cases
  // sl.registerLazySingleton(() => GetWishlist(sl()));
  // sl.registerLazySingleton(() => AddOrRemoveProductFromWishlist(sl()));
  // sl.registerLazySingleton(() => RemoveProductFromWishlist(sl()));
  // // Repository
  // sl.registerLazySingleton<WishlistRepository>(
  //     () => WishlistRepositoryImpl(sl()));
  // // Data sources
  // sl.registerLazySingleton<WishListRemoteDataSource>(
  //     () => WishlistRemoteDataSourceImpl(client: sl()));

  // //! Profile
  // // Cubit
  // sl.registerFactory(
  //   () => ProfileCubit(
  //     getCurrentUser: sl(),
  //     updateCurrentUser: sl(),
  //   ),
  // );
  // // Use cases
  // sl.registerLazySingleton(() => GetCurrentUser(sl()));
  // sl.registerLazySingleton(() => UpdateCurrentUser(sl()));
  // // Repository
  // sl.registerLazySingleton<ProfileRepository>(
  //     () => ProfileRepositoryImpl(sl()));
  // // Data sources
  // sl.registerLazySingleton<ProfileRemoteDataSource>(
  //     () => ProfileRemoteDataSourceImpl(client: sl()));

  // //! Cart
  // // Cubit
  // sl.registerFactory(
  //   () => CartCubit(
  //     getCart: sl(),
  //     addToCart: sl(),
  //     increaseCartQuantity: sl(),
  //     decreaseCartQuantity: sl(),
  //     removeCartItem: sl(),
  //     emptyCart: sl(),
  //   ),
  // );
  // // Use cases
  // sl.registerLazySingleton(() => GetCart(sl()));
  // sl.registerLazySingleton(() => AddToCart(sl()));
  // sl.registerLazySingleton(() => IncreaseCartQuantity(sl()));
  // sl.registerLazySingleton(() => DecreaseCartQuantity(sl()));
  // sl.registerLazySingleton(() => RemoveCartItem(sl()));
  // sl.registerLazySingleton(() => EmptyCart(sl()));
  // // Repository
  // sl.registerLazySingleton<CartRepository>(() => CartRepositoryImpl(sl()));
  // // Data sources
  // sl.registerLazySingleton<CartRemoteDataSource>(
  //     () => CartRemoteDataSourceImpl(client: sl()));

  // //! Order
  // // Cubit
  // sl.registerFactory(
  //   () => AddressCubit(
  //     getDefaultAddress: sl(),
  //     getAllAddresses: sl(),
  //     addServerAddress: sl(),
  //     updateAddress: sl(),
  //   ),
  // );
  // sl.registerFactory(
  //   () => OrderCubit(
  //     placeOrder: sl(),
  //     getAllOrders: sl(),
  //     updateOrderStatus: sl(),
  //     placeDiscountOrder: sl(),
  //   ),
  // );
  // // Use cases
  // sl.registerLazySingleton(() => GetDefaultAddress(sl()));
  // sl.registerLazySingleton(() => GetAllAddresses(sl()));
  // sl.registerLazySingleton(() => AddAddress(sl()));
  // sl.registerLazySingleton(() => UpdateAddress(sl()));
  // sl.registerLazySingleton(() => PlaceOrder(sl()));
  // sl.registerLazySingleton(() => PlaceDiscountOrder(sl()));
  // sl.registerLazySingleton(() => GetAllOrders(sl()));
  // sl.registerLazySingleton(() => UpdateOrderStatus(sl()));
  // // Repository
  // sl.registerLazySingleton<AddressRepository>(
  //     () => AddressRepositoryImpl(sl()));
  // sl.registerLazySingleton<OrderRepository>(() => OrderRepositoryImpl(sl()));
  // // Data sources
  // sl.registerLazySingleton<AddressRemoteDataSource>(
  //     () => AddressRemoteDataSourceImpl(client: sl()));
  // sl.registerLazySingleton<OrderRemoteDataSource>(
  //     () => OrderRemoteDataSourceImpl(client: sl()));

  // //! Core
  // sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External
  final preferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => preferences);
  // sl.registerLazySingleton(() => InternetConnectionChecker());
  // sl.registerLazySingleton(() => http.Client());
}
