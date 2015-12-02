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
    draggable : ".draggable"
    group :
      name : "tasks"
      pull : true
      put : true
    animation : 150
    handle : ".handle"
    onAdd : (event, templateInstance) ->
      event.stopDefaultMeteorPropagation = true
      templateInstance.collection.update event.data._id,
        $set :
          project : templateInstance.options.projectId
    onRemove : (event, templateInstance) ->
      event.stopDefaultMeteorPropagation = true


