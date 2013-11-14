root = exports ? this
root.EnergyApplication ||= {}
window.EnergyApplication = {}

root.Application = ->
Application.exec = (options) ->
  controller = options.controller.toLowerCase()
  action = options.action.toLowerCase()
  Application.initializePage({controller: controller, action: action})
    
Application.initializePage = (options) ->
  controller = options.controller
  action = options.action
  pageclass = new EnergyApplication[controller.capitalize()]
  if typeof pageclass[action] is 'function' then pageclass[action].call(pageclass) else pageclass.init()

jQuery(document).ready ->
  controller = $('body').data('controller')
  action = $('body').data('action')
  Application.exec({controller: controller, action: action})
