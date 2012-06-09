Spine = require('spine')

class Pocs extends Spine.Controller
  constructor: ->
    super
    @count = 0
    @startTalking()

  incrementCount: ->
    @count = @count + 1
    return @count

  nextHref: ->
    '/#'+"#{@count}"

  render: =>
    @incrementCount()
    require('views/pocs')(@)

  startTalking: =>
    setInterval(@talk,1000, null)

  talk: =>
    @log "This is controller #{@count} talking..."
    
module.exports = Pocs
