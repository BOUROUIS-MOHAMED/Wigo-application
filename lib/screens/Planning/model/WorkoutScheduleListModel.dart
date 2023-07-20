class WorkoutScheduleListModel {
  final String title;
  final String? type;
  final String timestamp;

  WorkoutScheduleListModel({required this.title, required this.timestamp, this.type});
}

class WorkoutScheduleListModelItems {
  static List<WorkoutScheduleListModel> loadItems(context) {
    return <WorkoutScheduleListModel>[
      WorkoutScheduleListModel(
        title: "Team introduction",
        type: "Event Type",
        timestamp: "9:30",
      ),
      WorkoutScheduleListModel(
        title: "Gather feedback from usability tests",
        type: "Event Type",
        timestamp: "10:30",
      ),
      WorkoutScheduleListModel(
        title: "Short Break",
        timestamp: "12:00",
      ),
      WorkoutScheduleListModel(
        title: "Design internal team meeting",
        type: "Event Type",
        timestamp: "1:30",
      ),
      WorkoutScheduleListModel(
        title: "Code export to dev",
        type: "Event Type",
        timestamp: "3:30",
      ),
      WorkoutScheduleListModel(
        title: "Finalize all tasks",
        type: "Event Type",
        timestamp: "5:00",
      ),
      WorkoutScheduleListModel(
        title: "Team introduction",
        type: "Event Type",
        timestamp: "7:00",
      ),
      WorkoutScheduleListModel(
        title: "Gather feedback from usability tests",
        type: "Event Type",
        timestamp: "8:30",
      ),
      WorkoutScheduleListModel(
        title: "Short Break",
        timestamp: "9:00",
      ),
      WorkoutScheduleListModel(
        title: "Design internal team meeting",
        type: "Event Type",
        timestamp: "9:30",
      ),
      WorkoutScheduleListModel(
        title: "Code export to dev",
        type: "Event Type",
        timestamp: "9:40",
      ),
      WorkoutScheduleListModel(
        title: "Finalize all tasks",
        type: "Event Type",
        timestamp: "8:50",
      ),
    ];
  }
}