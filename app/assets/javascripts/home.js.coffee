# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
//= require jquery.autoellipsis-1.0.10.min
//= require jquery.color-2.1.2.min

$(document).ready ->
  $("#storyPreview").ellipsis()
  $(".navButton").hover (->
    console.log "fired"
    $(this).animate
      backgroundColor: "#9DEBE9"
      color: "#FFFFFF"
    ,
      200

    return
  ), ->
    console.log "fired"
    $(this).animate
      backgroundColor: "#FFFFFF"
      color: "#444444"
    ,
      200

    return
  $(".newsStory").hover (->
    $(this).find("#storyOverlay").stop().animate
      top: "0%"
    ,
      queue: false
      duration: 300
      easing: "swing"

    $(this).find(".dateStick").stop().animate
      top: "0%"
    ,
      queue: false
      duration: 300
      easing: "swing"

    $(this).find(".preTitle").stop().animate
      opacity: "0.0"
    ,
      queue: false
      duration: 200
      easing: "swing"

    return
  ), ->
    $(this).find("#storyOverlay").stop().animate
      top: "100%"
    ,
      queue: false
      duration: 300
      easing: "swing"

    if $(this).find(".sdsb").length > 0
      console.log "fired"
      $(this).find(".dateStick").stop().animate
        top: "-80%"
      ,
        queue: false
        duration: 300
        easing: "swing"

    else
      $(this).find(".dateStick").stop().animate
        top: "-90%"
      ,
        queue: false
        duration: 300
        easing: "swing"

    $(this).find(".preTitle").stop().animate
      opacity: "1.0"
    ,
      queue: false
      duration: 200
      easing: "swing"

    return

  return



