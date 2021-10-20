class MessageSettings {
  String? stepName;
  String? waitMessage;
  String? faceNotFoundMessage;
  String? faceTooFarMessage;
  String? faceTooCloseMessage;
  String? faceNotFittedMessage;
  String? multipleFaceDetectedMessage;
  String? verifyingLivenessMessage;
  String? holdItMessage;
  String? invalidFaceMessage;
  String? eyesClosedMessage;
  String? notCenterXMessage;
  String? notCenterYMessage;
  String? notCenterZMessage;

  MessageSettings(
      {this.stepName,
      this.waitMessage,
      this.faceNotFoundMessage,
      this.faceTooFarMessage,
      this.faceTooCloseMessage,
      this.faceNotFittedMessage,
      this.multipleFaceDetectedMessage,
      this.verifyingLivenessMessage,
      this.holdItMessage,
      this.invalidFaceMessage,
      this.eyesClosedMessage,
      this.notCenterXMessage,
      this.notCenterYMessage,
      this.notCenterZMessage});

  Map asMap() {
    Map<String, dynamic> map = new Map();

    map["stepName"] = stepName;
    map["waitMessage"] = waitMessage;
    map["faceNotFoundMessage"] = faceNotFoundMessage;
    map["faceTooFarMessage"] = faceTooFarMessage;
    map["faceTooCloseMessage"] = faceTooCloseMessage;
    map["faceNotFittedMessage"] = faceNotFittedMessage;
    map["multipleFaceDetectedMessage"] = multipleFaceDetectedMessage;
    map["verifyingLivenessMessage"] = verifyingLivenessMessage;
    map["holdItMessage"] = holdItMessage;
    map["invalidFaceMessage"] = invalidFaceMessage;
    map["eyesClosedMessage"] = eyesClosedMessage;
    map["notCenterXMessage"] = notCenterXMessage;
    map["notCenterYMessage"] = notCenterYMessage;
    map["notCenterZMessage"] = notCenterZMessage;

    return map;
  }
}
