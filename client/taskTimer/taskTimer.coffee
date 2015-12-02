saveTaskTimer = (doc, end) ->
  TaskTimers.insert
    task : doc.task
    start : doc.start
    end : end
    duration : moment(end).diff moment(doc.start)
    active : false

Template.newButton.helpers

  newTaskTimer : -> newTaskTimer()



Template.taskTimerRack.helpers

  taskTimers : -> TaskTimers.find { active : true }


Template.taskTimerDisplay.helpers

  elapsedTime : ->
    elapsed = if this.active
      switch this.state
        when "fresh"
          0
        when "running"
          myTimer.tick()
          this.added + moment().diff moment(this.start)
        when "paused"
          this.added
    else
      moment(this.end).diff moment(this.start)
    moment.duration(elapsed).format "hh:mm:ss", {trim : false}

  nameSelectOptions : ->
    Tasks.find().map (doc) ->
      label : doc.name
      value : doc.name

  formId : -> "taskTimerDisplayForm-#{this._id}"


Template.taskTimer.events
###
  "click #newButton" : ->
    TaskTimers.insert newTaskTimer()
###


Template.taskTimerDisplay.events

  "click #removeButton" : ->
    TaskTimers.remove this._id

  "click #playButton" : ->
    unless this.state is "running"
      now = new Date()
      TaskTimers.update this._id,
        $set :
          state : "running"
          start : now

  "click #pauseButton" : ->
    if this.state is "running"
      now = new Date()
      saveTaskTimer this, now
      TaskTimers.update this._id,
        $set :
          state : "paused"
          added : this.added + moment(now).diff moment(this.start)


  "click #stopButton" : ->
    if this.state is "running"
      now = new Date()
      saveTaskTimer this, now
    TaskTimers.update this._id,
      $set :
        state : "fresh"
        added : 0

Template.taskTimerLog.helpers

  taskTimers : TaskTimers.find { active : false }

Template.taskTimerRow.helpers

  formatStart : -> moment(this.start).calendar()

  formatEnd : -> moment(this.end).format "LT"
    #moment(this.end).calendar(this.start)


  formatDuration : ->
    moment.duration(this.duration).format "hh:mm:ss", {trim : false}



