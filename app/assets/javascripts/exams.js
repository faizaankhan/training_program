function editQuestion(){
    //disable all other edits
    $(this).removeClass('edit').addClass('save')
    $('.edit').each(function(){
        $(this).attr('disabled','disabled')
    })

    $(this).off('click');
    
    var examID = $('#exam_id').html();
    var questionBox = this.parentElement;
    var questionId = questionBox.id;
    var questionArea = $(questionBox).children('.question');
    
    var $wrapper = $('<div class="question editing"></div>'),
        $form    = $('<form action="/exams/'+examID+'/questions/'+examID+'/update_question" method="POST" class="form"></form>'),
        $input   = $('<textarea rows="7" name="question_description" class="form-control"></textarea>'),
        $hiddenInput = $('<input name="question_id" type="hidden" value="'+questionId+'">'),
        $csrf_token = $('<input type="hidden" name="authenticity_token" value="'+$('meta[name="csrf-token"]').attr('content')+'" />')
      // Place the original element inside a wrapper:
    questionArea.after($wrapper);
    questionArea.remove().appendTo($wrapper).hide();

    // Build up the form:
    $input.empty().append(questionArea.text().trim()).focus();
    $wrapper.append($form);
    $form.append($input);
    $form.append($hiddenInput);
    $form.append($csrf_token);
    
    this.innerText='Save';

    //Submit the form:
    $(this).click(
     function(){
         var $form = $(questionBox).children('.editing').children('.form')
         $form.submit();
     }   
    )
}

$(document).on('turbolinks:load', function() {
    $('.edit').click(editQuestion)
});