
const String baseApiUrl = 'https://student.valuxapps.com';
const String version = '/api';
const String loginEndPoint = '/login';
const String profileEndPoint = '/profile';
const String registerEndPoint = '/register';
const String homeEndPoint = '/home';
const String categoriesEndPoint = '/categories';
String categoriesDetailsEndPoint(int categoriesId)=> '/categories/$categoriesId';

String productsDetailsEndPoint(int productsId)=>'/products/$productsId';



 String? token = '';