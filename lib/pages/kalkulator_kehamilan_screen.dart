import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class KalkulatorKehamilanScreen extends StatefulWidget {
  @override
  _KalkulatorKehamilanScreen createState() => _KalkulatorKehamilanScreen();
}

class _KalkulatorKehamilanScreen extends State<KalkulatorKehamilanScreen> {
  DateTime? lastMenstrualPeriod;
  DateTime? estimatedDueDate;

  void calculateDueDate() {
    if (lastMenstrualPeriod != null) {
      // Pregnancy usually lasts about 280 days (40 weeks) from the first day of the last menstrual period
      estimatedDueDate = lastMenstrualPeriod!.add(Duration(days: 280));
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kalkulator Kehamilan"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Tanggal Hari Pertama Haid Terakhir:",
                style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            ListTile(
              title: Text(
                  lastMenstrualPeriod == null
                      ? "Pilih tanggal"
                      : DateFormat('dd MMMM yyyy').format(lastMenstrualPeriod!),
                  style: TextStyle(fontSize: 18, color: Colors.black54)),
              trailing: Icon(Icons.calendar_today),
              onTap: () async {
                DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: lastMenstrualPeriod ?? DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                );
                if (picked != null) {
                  setState(() {
                    lastMenstrualPeriod = picked;
                  });
                }
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculateDueDate,
              child: Text("Hitung Tanggal Perkiraan Lahir"),
            ),
            SizedBox(height: 20),
            if (estimatedDueDate != null)
              Text("Tanggal Perkiraan Lahir:",
                  style: TextStyle(fontSize: 16)),
            if (estimatedDueDate != null)
              Text(DateFormat('dd MMMM yyyy').format(estimatedDueDate!),
                  style: TextStyle(fontSize: 18, color: Colors.deepPurple)),
          ],
        ),
      ),
    );
  }
}

