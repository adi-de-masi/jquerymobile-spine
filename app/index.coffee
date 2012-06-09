require('lib/setup')

Spine = require('spine')
Pocs = require('controllers/pocs')

class App extends Spine.Controller
  constructor: ->
    super
    @configureJqueryMobile()
    @pocs = new Pocs(el: @el)
    
  # Cannot use the Spine shortcut to events because those are
  # bound to the @el (which is body here)
  configureJqueryMobile: =>
    $.mobile.defaultPageTransition = "slide"
    # this redirects calls to the hash-less url to /#/welcome
    $( document ).delegate "body", "pagebeforecreate", =>
      $.mobile.changePage( "/#/welcome", { transition: "slideup"} )
    # all calls to this site with a hash will be handled manually
    $(document).bind "pagebeforechange", (e, data) =>
      if (typeof data.toPage is "string")
        e.preventDefault()
        @navigate(data)

  navigate: (jqmData) =>
    #page = @pocs.render()
    page = new Pocs(el: @el).render()
    page = $(page)
    page.page().appendTo("body")
    page.find(":jqmData(role=button)").button()
    u = $.mobile.path.parseUrl( jqmData.toPage )
    jqmData.options.dataUrl = u.href
    $.mobile.changePage( page, jqmData.options )

module.exports = App
