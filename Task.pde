
class Task {

  String name;
  float timeEstimate; // hours
  Date hardDeadline;
  Date softDeadline;
  int urgency; // 0 = ! , 1 = !! , 2 = !!!
  
  public Task (String name, float timeEstimate, Date hardDeadline, Date softDeadline, int urgency) {
    this.name = name; this.timeEstimate = timeEstimate; this.hardDeadline = hardDeadline;
    this.softDeadline = softDeadline; this.urgency = urgency;
  }
  
  Date deadline () {
    if(softDeadline != null) return softDeadline;
    else return hardDeadline;
  }
  
  String toString() {
    return "Task:" + name + " Time:" + timeEstimate + "hr HD:" + hardDeadline + " SD:" + softDeadline + " U:" + urgency; 
  }
}
