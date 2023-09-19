
import 'package:get/get.dart';
import 'package:payment_app/services/data_services.dart';

class DataController extends GetxController {
  var list = [].obs;
  final service = DataServices();
  final _loading = false.obs;

  get loading => _loading.value;

  @override
  void onInit(){
    _loadData();
    super.onInit();
  }

  get newList => list.where((e) => e["status"]).map((e) => e).toList();

  _loadData() async {
    _loading.value = false;
    try{
      var info = service.getUsers();
      list.addAll(await info);
    }catch(e){
      print("Encountered Error");
      print(e);
    }finally{
      _loading.value = true;
    }

  }

}