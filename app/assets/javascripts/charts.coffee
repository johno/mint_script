$ ->
  charts.registerBarChartWithHandlebars()

window.charts =
  registerBarChartWithHandlebars: ->
    Handlebars.registerHelper('bar_chart', (thing) ->
      console.log("Helper nailed")
      return Handlebars.SafeString("<h1>hslkjfhkljsdhfkjhsdf</h1>") )