import 'package:logging/logging.dart';

import 'lib/directshow.dart';

final logger = Logger('main');

void main() async {
  Logger.root.level = Level.ALL; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.time}: ${record.message}');
  });

  logger.info(await getDirectshowDeviceList());
}
