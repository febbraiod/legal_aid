function Note(id, content, user, date){
  this.id = id;
  this.content = content;
  this.user = user;
  this.date = date;
}

Note.prototype.userFormat = function(){
  var fullName = this.user.first_name + " " + this.user.last_name;
  return fullName;
};

function getNotes(case_id){
  $.get('/notes', {case_id: case_id}).done(function(data){
      $('#getNotes').hide();
      $('#case_notes').css('display', 'block');
      var notes = data.notes;
      for(var i = 0; i < notes.length ; i++){
        var note = new Note(notes[i].id, notes[i].content, notes[i].user, new Date(notes[i].created_at));
        renderNote(note);  
      }
  });
}

function renderNote(note){
  var noteString = "<p>"+ note.content + "</p>" +"<p>- " + 
  note.userFormat() + "<br><br>" + note.date + "</p>";
  var edit_button = '<p><a href="/notes/' + note.id + '/edit">edit your note</a></p><br>';
  $('#case_notes').append(noteString);
  $('#case_notes').append(edit_button);

}

function setBinders(){
  $('#getNotes').on('click', function(){
    $('h4').show();
    var case_id = $(this).data('id');
    getNotes(case_id);
  });
}

function hiJackForm(){
  $('#new_note').submit(function(e){
    e.preventDefault();
    var noteValues = $(this).serialize();
    $.post('/notes', noteValues).done(function(resp){
      var note = new Note(resp.note.id, resp.note.content, resp.note.user, new Date(resp.note.created_at));
      var noteString = "<br><p>"+ note.content + "</p>" +"<p>- " + 
      note.userFormat() + "<br><br>" + note.date + "</p>";
      var edit_button = '<p><a href="/notes/' + note.id + '/edit">edit your note</a></p>';
      $('#case_notes').prepend(edit_button);
      $('#case_notes').prepend(noteString);
      document.getElementById("note_box").value = '';
    });
  });
}

$(function(){
  setBinders();
  hiJackForm();
  $('h4').hide();
});