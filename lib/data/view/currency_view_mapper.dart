import 'package:cryptowatcherx/data/investment/model/developed_investment.dart';
import 'package:cryptowatcherx/data/view/model/view_mapper_info.dart';
import 'package:cryptowatcherx/data/view/view_mapper.dart';

class CurrencyViewMapper implements ViewMapper {
  @override
  Future<List<DevelopedInvestment>> mapToView(
    List<DevelopedInvestment> investments,
  ) async {
    // TODO
    return investments;
  }

  @override
  ViewMapperInfo get info => new ViewMapperInfo(
        name: 'currency',
        displayName: 'Currency View',
      );
}
