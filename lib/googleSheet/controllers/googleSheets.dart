import 'package:first_app/googleSheet/models/sheets_column.dart';
import 'package:gsheets/gsheets.dart';


class SheetFlutter {
  static final String _sheetId = "sheet id";
  static const _sheetCredentials = r'''
  {
add you token info
}
''';
  static Worksheet? _userSheet;
  static final _gSheets = GSheets(_sheetCredentials);

  static Future init() async {
    try {
      final spreadSheet = await _gSheets.spreadsheet(_sheetId);
      _userSheet = await _getWorkSheet(spreadSheet, title: "firstPage");
      final firstRow = SheetsColumn.getColumns();
      _userSheet?.values.insertRow(1, firstRow);
    } catch (e) {
      print(e);
    }
  }

  static Future<Worksheet> _getWorkSheet(Spreadsheet spreedSheet,
      {required String title}) async {
    try {
      return await spreedSheet.addWorksheet(title);
    } catch (e) {
      return spreedSheet.worksheetByTitle(title)!;
    }
  }

  static Future insert(Map<String, dynamic> rowMap) async {
    final rowList = [rowMap];
    await _userSheet!.values.map.appendRows(rowList);
  }

}
