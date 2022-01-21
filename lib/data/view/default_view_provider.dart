

import 'package:cryptowatcherx/data/view/model/view_mapper_info.dart';
import 'package:cryptowatcherx/data/view/view_mapper.dart';
import 'package:cryptowatcherx/data/view/view_provider.dart';

class DefaultViewProvider implements ViewProvider {

  final List<ViewMapper> _viewMappers;

  DefaultViewProvider(this._viewMappers);

  @override
  ViewMapper provideView() {
    return _viewMappers.first;
  }

  @override
  List<ViewMapperInfo> providedViewMappers() {
    return _viewMappers.map((v) => v.info).toList();
  }

}