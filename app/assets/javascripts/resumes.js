$(document).ready(function() {
  function descriptionCounter(descriptionElement) { 
    var textValue = $(descriptionElement).val();
    var textLength = textValue.length;
    var currentPosition = $(descriptionElement).position();
    var currentTop = currentPosition.top;

    $(descriptionElement).parent('.failure .form-wrapper').append($('#counter'));
    $('#counter').css({top: -8, right: 10});
    $('#counter').show();
    
    if (textLength <= 60) {
      $('#counter').html(textLength + '/60');
    } else {
      $('#counter').html('<span>' + textLength + '</span>' + '/60');
    };
  }

  function lessonCounter(lessenElement) {
    var textValue = $(lessenElement).val();
    var textLength = textValue.length;
    var currentPosition = $(lessenElement).position();
    var currentTop = currentPosition.top;

    $(lessenElement).parent('.failure .form-wrapper').append($('#counter'));
    $('#counter').css({top: 100, right: 10});
    $('#counter').show();

    if (textLength <= 400) {
      $('#counter').html(textLength + '/400');
    } else {
      $('#counter').html('<span>' + textLength + '</span>' + '/400');
    };
  }

  $('#counter').hide();

  $("input[type='text'].description").bind('input', function() {
    descriptionCounter($(this));
  });

  $('textarea.lesson').bind('input', function() {
    lessonCounter($(this));
  });

  $('.description').focus(function() {
    $('#counter').hide();
    descriptionCounter($(this));    
  });

  $('.lesson').focus(function() {
    $('#counter').hide();  
    lessonCounter($(this));
  });
});