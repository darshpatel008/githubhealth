import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For date formatting

class PeriodTrackerScreen extends StatefulWidget {
  @override
  _PeriodTrackerScreenState createState() => _PeriodTrackerScreenState();
}

class _PeriodTrackerScreenState extends State<PeriodTrackerScreen> {
  DateTime? _startDate;
  DateTime? _endDate;
  List<String> _periodHistory = []; // In-memory list for storing period history

  void _selectDate(BuildContext context, bool isStartDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        if (isStartDate) {
          _startDate = picked;
        } else {
          _endDate = picked;
        }
      });
    }
  }

  void _submitPeriod() {
    if (_startDate != null && _endDate != null) {
      if (_endDate!.isBefore(_startDate!)) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('End date cannot be before start date.'),
        ));
        return;
      }

      final daysDifference = _endDate!.difference(_startDate!).inDays;

      final String formattedStart = DateFormat('yMMMd').format(_startDate!);
      final String formattedEnd = DateFormat('yMMMd').format(_endDate!);

      String periodEntry =
          'Start: $formattedStart, End: $formattedEnd, Duration: $daysDifference days';

      setState(() {
        _periodHistory.add(periodEntry);
        _startDate = null;
        _endDate = null;
      });

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Your cycle lasted for $daysDifference days.'),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Please select both start and end dates.'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Period Tracker'),
        backgroundColor: Colors.green[300],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              'Track Your Period Cycle',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            _buildDateSelector(
              label: "Period Start Date",
              selectedDate: _startDate,
              onTap: () => _selectDate(context, true),
            ),
            _buildDateSelector(
              label: "Period End Date",
              selectedDate: _endDate,
              onTap: () => _selectDate(context, false),
            ),
            SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: _submitPeriod,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[300],
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text('Submit', style: TextStyle(fontSize: 18)),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Period History:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: _buildPeriodHistoryList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDateSelector({
    required String label,
    required DateTime? selectedDate,
    required VoidCallback onTap,
  }) {
    return ListTile(
      title: Text(label, style: TextStyle(fontSize: 18)),
      subtitle: Text(
        selectedDate == null
            ? 'No date selected'
            : DateFormat('yMMMd').format(selectedDate),
        style: TextStyle(fontSize: 16),
      ),
      trailing: Icon(Icons.calendar_today, color: Colors.green[300]),
      onTap: onTap,
    );
  }

  Widget _buildPeriodHistoryList() {
    return ListView.builder(
      itemCount: _periodHistory.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 3,
          child: ListTile(
            leading: Icon(Icons.history, color: Colors.green[300]),
            title: Text(_periodHistory[index]),
          ),
        );
      },
    );
  }
}