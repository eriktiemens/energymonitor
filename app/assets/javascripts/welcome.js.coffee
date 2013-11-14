class EnergyApplication.Welcome
  
  constructor: -> 
    @data = [[]]
    @xVal = 0
    
  index: ->
    @setOptions()
    @plot = $.plot($('#placeholder'), @data, @options)
    setInterval @getData, 2000
     
  getData: =>
    $.ajax(
      type: "GET"
      url: "/actual_usage"
    ).always (result) =>
      datum1 = [@xVal, result["value"]]
      @data[0].push(datum1)
      @xVal++
      @plot.setData(@data)
      @plot.setupGrid()
      @plot.draw()
      $("#actual_value").text(result["value"])
      $("#date").text(result["date"])
  
  setOptions: =>
    @options =
      xaxis:
        min: 1
        ticks: []
        tickDecimals: 1
    
