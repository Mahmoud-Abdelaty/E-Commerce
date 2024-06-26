import 'package:Buyify/core/network/response/failure.dart';
import 'package:Buyify/features/home/data/models/home_model.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepo {
  Future<Either<Failure?, List<ProductModel>>> searchProduct(
      {required Map<String, dynamic> productName});
}
