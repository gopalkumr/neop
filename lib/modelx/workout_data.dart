import 'package:flutter/cupertino.dart';
import 'package:neop/modelx/excersise.dart';

import 'workout.dart';

class WorkOutData extends ChangeNotifier {
  /*
  * 1. WorkOutData


  */

  List<Workout> WorkOutList = [
    //default workout
    Workout(
      name: "Upper body",
      excersises: [
        Excersise(name: "Bicep Curls", weight: "18", reps: "10", sets: "3"),
      ],
    ),
    Workout(
      name: "Upper body",
      excersises: [
        Excersise(name: "Bicep Curls", weight: "18", reps: "10", sets: "3"),
      ],
    )
  ];

  //getting the list of workout

  List<Workout> getWorkOutList() {
    return WorkOutList;
  }

  //get length of workout list
  int numbeOfExecisesInWorkout(String workoutName) {
    Workout releventWorkout = getReleventWorkOut(workoutName);
    return releventWorkout.excersises.length;
  }

  //add a workout
  void addWorkOut(String name) {
    WorkOutList.add(Workout(name: name, excersises: []));

    notifyListeners();
  }

  //add an excersise to a workout
  void addExcersise(String exceriseName, String weight, String reps,
      String sets, String workoutName) {
    //find the relevant workout
    Workout releventWorkout = getReleventWorkOut(workoutName);

    releventWorkout.excersises.add(Excersise(
      name: exceriseName,
      weight: weight,
      reps: reps,
      sets: sets,
    ));
    notifyListeners();
  }

  //check off an excersise
  void checkOffExcersise(String workoutName, String exceriseName) {
    //find the relevant workout --generated
    Workout releventWorkout =
        WorkOutList.firstWhere((element) => element.name == workoutName);
    //find the relevant excersise --generated
    Excersise releventExcersise =
        getReleventExcersise(workoutName, exceriseName);
    //check off the excersise --generated
    releventExcersise.isCompleted = !releventExcersise.isCompleted;

    notifyListeners();
  }

  //return relevent workout object, given the name of the workout
  Workout getReleventWorkOut(String workoutName) {
    Workout releventWorkout =
        WorkOutList.firstWhere((element) => element.name == workoutName);

    return releventWorkout;
  }

  //return the relevent excersise object, given the name of the workout and the name of the excersise
  Excersise getReleventExcersise(String workoutName, String exceriseName) {
    //find the relevant workout --generated
    Workout releventWorkout = getReleventWorkOut(workoutName);
    //find the relevant excersise --generated
    Excersise releventExcersise = releventWorkout.excersises
        .firstWhere((element) => element.name == exceriseName);

    return releventExcersise;
  }
}
