part of 'page.dart';

class PageEmployeeList extends StatefulWidget {
  const PageEmployeeList({Key? key}) : super(key: key);
  @override
  PageEmployeeListState createState() => PageEmployeeListState();
}

class PageEmployeeListState extends State<PageEmployeeList> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ProviderEmployeeList>(context, listen: false).loadData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<ProviderEmployeeList>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Employee"),
      ),
      //
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DataTable(
              sortColumnIndex: 1,
              showCheckboxColumn: false,
              border: TableBorder.all(width: 1.0),
              columns: const [
                DataColumn(
                    label: Text(
                  "ID",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                )),
                DataColumn(
                    label: Text(
                  "Nama",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                )),
                DataColumn(
                    label: Text(
                  "Email",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                )),
              ],
              rows: prov.datas.employee
                  .map((data) => DataRow(cells: [
                        DataCell(
                          Text(data.employeeId.toString(),
                              style: const TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.w500)),
                        ),
                        DataCell(Text(data.employeeName.toString(),
                            style: const TextStyle(
                                fontSize: 26, fontWeight: FontWeight.w500))),
                        DataCell(
                          Text(data.employeeMail.toString(),
                              style: const TextStyle(
                                  fontSize: 26, fontWeight: FontWeight.w500)),
                        ),
                      ]))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
