import 'package:cryptowatcherx/data/investment/model/developed_investment.dart';
import 'package:cryptowatcherx/data/view/model/view_mapper_info.dart';

abstract class ViewMapper {

  ViewMapperInfo get info;

  Future<List<DevelopedInvestment>> mapToView(
    List<DevelopedInvestment> investments,
  );
}
