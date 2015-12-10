Template.lists.helpers

  projects : -> Projects.find()

Template.displayProject.helpers

  newProjectTask : ->
    newTask(this._id)
  
  projectTasks : -> Tasks.find
    project : this._id
  ,
    sort :
      order : 1
  
  taskSortableOptions : ->
    selector :
      project : this._id
    sort :
      order : 1
    sortField : "order"
    draggable : ".draggable"
    group :
      name : "tasks"
      pull : true
      put : true
    animation : 200
    ghostClass : "ghost"
    handle : ".handle"
    onAdd : (event, templateInstance) ->
      event.stopElementInsertion = true
      templateInstance.collection.update event.data._id,
        $set :
          project : templateInstance.options.projectId
          order : event.newIndex - 1
    onRemove : (event, templateInstance) ->
      event.stopDefaultMeteorPropagation = true


Template.displayTask.helpers

  dateDoMoment : ->
    moment(this.dateDo).fromNow()


