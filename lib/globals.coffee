@Projects = new Mongo.Collection "projects"
Projects.attachSchema new SimpleSchema
  name :
    type :String
  tags :
    type : [String]
    optional : true
    autoform :
      type : "hidden"

@newProject = (name = "new Project")->
  name : name


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
    autoform :
      type : "hidden"
  dateDo :
    type : Date
    optional : true
    autoform :
      afFieldInput :
        type : "bootstrap-datetimepicker"
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

findOrder = (project) ->
  Tasks.findOne project : project,
    sort :
      order : -1
    limit : 1
  ?.order + 1 or 0

@newTask = (project="none", name = "newTask") ->
  name : name
  project : project
  status : "fresh"
  order : findOrder project

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


