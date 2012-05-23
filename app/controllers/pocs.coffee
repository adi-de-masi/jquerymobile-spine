Spine = require('spine')

class Pocs extends Spine.Controller
  constructor: ->
    super
    @count = 0

  incrementCount: ->
    @count = @count + 1
    return @count

  nextHref: ->
    '/#'+"#{@count}"

  render: =>
    @incrementCount()
    require('views/pocs')(@)

    
module.exports = Pocs
