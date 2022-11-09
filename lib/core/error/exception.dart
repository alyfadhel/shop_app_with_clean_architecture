
import 'package:shop_app_with_clean_architecture/core/utils/error_message_model.dart';

class ServerException implements Exception
{
  final StatusErrorMessageModel statusErrorMessageModel;

  ServerException({
    required this.statusErrorMessageModel,
  });
}


class LocalDataBaseException implements Exception
{
  final String message;

  LocalDataBaseException(this.message);
}