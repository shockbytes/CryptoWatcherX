


import 'model/view_mapper_info.dart';
import 'view_mapper.dart';

abstract class ViewProvider {

  ViewMapper provideView();

  List<ViewMapperInfo> providedViewMappers();
}