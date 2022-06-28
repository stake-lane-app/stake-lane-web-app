Map toBeDefined = {"code": "TBD", "description": "Time To Be Defined"};
Map notStarted = {"code": "NS", "description": "Not Started"};
Map firstHalf = {"code": "1H", "description": "First Half"};
Map halfTime = {"code": "HT", "description": "Half time"};
Map secondHalf = {"code": "2H", "description": "Second Half"};
Map extraTime = {"code": "ET", "description": "Extra Time"};
Map penalties = {"code": "P", "description": "Penalty In Progress"};
Map finished = {"code": "FT", "description": "Finished"};
Map extraTimeFinished = {
  "code": "AET",
  "description": "Match Finished After Extra Time"
};
Map penaltiesFinished = {
  "code": "PEN",
  "description": "Match Finished After Penalty"
};
Map breakTime = {"code": "BT", "description": "Break Time (in Extra Time)"};

Map suspended = {"code": "SUSP", "description": "Match Suspended"};
Map interrupted = {"code": "INT", "description": "Match Interrupted"};
Map postponed = {"code": "PST", "description": "Match Postponed"};
Map cancelled = {"code": "CANC", "description": "Match Cancelled"};
Map abandoned = {"code": "ABD", "description": "Match Abandoned"};
Map technialLoss = {"code": "AWD", "description": "Technical Loss"};
Map walkover = {"code": "WO", "description": "Walkover"};

List allowPredictionStatusCode = [
  toBeDefined["code"],
  notStarted["code"],
];

List runningStatusCode = [
  firstHalf["code"],
  halfTime["code"],
  secondHalf["code"],
  extraTime["code"],
  breakTime["code"],
  penalties["code"],
];

List finishedStatusCode = [
  finished["code"],
  extraTimeFinished["code"],
  penaltiesFinished["code"],
  technialLoss["code"]
];

List specialEndingStatusCode = [
  suspended["code"],
  interrupted["code"],
  postponed["code"],
  cancelled["code"],
  abandoned["code"],
  walkover["code"],
];
