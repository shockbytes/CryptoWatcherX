import 'package:cryptowatcherx/data/investment/model/developed_investment.dart';
import 'package:cryptowatcherx/data/view/view_mapper.dart';

import 'model/view_mapper_info.dart';

class DefaultViewMapper implements ViewMapper {
  @override
  Future<List<DevelopedInvestment>> mapToView(
    List<DevelopedInvestment> investments,
  ) async {
    return investments;
  }

  @override
  ViewMapperInfo get info => new ViewMapperInfo(
    name: 'default',
    displayName: 'Default View',
  );
}
