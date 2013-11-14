
String.prototype.capitalize = () ->
  return @charAt(0).toUpperCase() + @slice(1)
