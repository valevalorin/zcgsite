# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
//= require jquery.autoellipsis-1.0.10.min
//= require jquery.color-2.1.2.min

$(window).bind 'page:change', ->
	$(".overlay").click ->
	  $(".overlay").css "display", "none"
	  $(".block").css "display", "none"
	  $(".block").removeClass "block"
	  return

	$(".calendarDayBlock").each (index) ->
	  if $(this).find("img").length > 0
	    $(this).click ->
	      $(".overlay").css "display", "block"
	      id = $(this).attr("id")
	      $("." + id).css "display", "block"
	      $("." + id).addClass "block"
	      return

	  return

  return
