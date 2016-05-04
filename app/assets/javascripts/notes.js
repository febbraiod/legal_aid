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
      $('#case_notes').css('display', 'block');
      var notes = data.notes;
      for(var i = 0; i < notes.length ; i++){
        var note = new Note(notes[i].id, notes[i].content, notes[i].user, notes[i].created_at);
        renderNote(note);  
      }
  });
}

function renderNote(note){
  var noteString = "<p>"+ note.content + "</p>" +"<p>- " + 
  note.userFormat() + "<br><br>" + note.date + "</p>";
  var edit_button = '<p><a href="/notes/' + note.id + '/edit">edit your note</a></p>';
  $('#case_notes').append(noteString);
  $('#case_notes').append(edit_button);


}



function setBinders(){
  $('#getNotes').on('click', function(){
    var case_id = $(this).data('id');
    getNotes(case_id);
  });
}

$(function(){
  setBinders();
});


    // <br>
    // <% @case_notes.each do |note| %>
    //   <p><%=note.content %></p>
    //   <p>- <%=note.user.full_name %><br><br><%= note.created_at.to_formatted_s(:long_ordinal) %></p>
    //   <p><%=link_to 'edit your note', edit_note_path(note)%> &nbsp; &nbsp; &nbsp; <%=link_to 'delete', note_path(note), method: :delete%></p>
    //   <br>
    // <% end %>