@Projects = new Mongo.Collection "projects"
Projects.attachSchema new SimpleSchema
  name :
    type :String
  tags :
    type : [String]
    optional : true
    autoform :
      type : "hidden"


@Tasks = new Mongo.Collection "tasks"
Tasks.attachSchema new SimpleSchema
  name :
    type : String
  project :
    type : String
    autoform :
      type : "hidden"
  tags :
    type : [String]
    optional : true
    autoform :
      type : "hidden"
  status :
    type : String
    autoform :
      type : "hidden"
  onMAL :
    type : Boolean
    optional : true
    label : "on Master Action List"
  dateDo :
    type : Date
    optional : true
    autoform :
      type : "hidden"
  dateDone :
    type : Date
    optional : true
    autoform :
      type : "hidden"
  order :
    type : Number
    optional : true
    autoform :
      type : "hidden"

@newTask = (project="none") ->
  # name : "new Task"
  project : project
  status : "fresh"
  order : Tasks.find({project : project}).count() + 1


@TaskTimers = new Mongo.Collection "taskTimers"
TaskTimers.attachSchema new SimpleSchema
  task :
    type : String
  start :
    type : Date
    autoform :
      type : "hidden"
  end :
    type : Date
    optional : true
    autoform :
      type : "hidden"
  added :
    type : Number
    optional : true
    autoform :
      type : "hidden"
  duration :
    type : Number
    optional : true
    autoform :
      type : "hidden"
  active :
    type : Boolean
    autoform :
      type : "hidden"
  state :
    #fresh, running, paused
    type : String
    optional : true
    autoform :
      type : "hidden"

@newTaskTimer = ->
  task : "workwork"
  start : new Date()
  added : 0
  active : true
  state : "fresh"


