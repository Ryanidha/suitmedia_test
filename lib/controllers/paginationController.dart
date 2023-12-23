import 'package:get/get.dart';
import 'package:suitmedia_test/models/paginationFilter.dart';
import 'package:suitmedia_test/models/repository.dart';
import 'package:suitmedia_test/models/userModel.dart';


class PaginationController extends GetxController {
  final Repository _userRepo;
  final _users = <UserModel>[].obs;
  final _paginationFilter = PaginationFilter().obs;
  final _lastPage = false.obs;

  PaginationController(this._userRepo);

  List<UserModel> get users => _users.toList();
  int? get limit => _paginationFilter.value.limit;
  int? get _page => _paginationFilter.value.page;
  bool get lastPage => _lastPage.value;

  @override
  onInit() {
    ever(_paginationFilter, (_) => _getAllUsers());
    _changePaginationFilter(1, 15);
    super.onInit();
  }

  Future<void> _getAllUsers() async {
    final usersData = await _userRepo.getUser(_paginationFilter.value);
    if (usersData.isEmpty) {
      _lastPage.value = true;
    }
    _users.addAll(usersData);
  }

  void changeTotalPerPage(int limitValue) {
    _users.clear();
    _lastPage.value = false;
    _changePaginationFilter(1, limitValue);
  }

  void _changePaginationFilter(int page, int limit) {
    _paginationFilter.update((val) {
      val?.page = page;
      val?.limit = limit;
    });
  }

  void loadNextPage() => _changePaginationFilter(_page! + 1, limit!);

  Future<void> refreshUsers() async {
    _users.clear();
    _lastPage.value = false;
    await _getAllUsers();
  }
}