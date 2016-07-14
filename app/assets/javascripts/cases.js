$(function(){
  bind();
});

function bind(){
  $('#next_case').on('click', function(){
    $('#attrs').html('');
    var id = $(this).data('id');
    getCase(id);
  });
}

function getCase(id){
  $.get("/cases/" + id + ".json", function(resp){
    $('#attrs').append('Client: ' + resp.case.client_name + '<br>');
    $('#attrs').append('Index Num: ' + resp.case.index_num  + '<br>');
    $('#attrs').append('County: ' + resp.case.county + '<br>');
    $('#attrs').append('Caption: ' + resp.case.caption + '<br>');
    $('#attrs').append('Open: ' + resp.case.open + '<br>');
    $('#attrs').append('Created At: ' + resp.case.created_at + '<br>');
    $('#attrs').append('Updated At: ' + resp.case.updated_at + '<br>');
    $('#attrs').append('Exposure: ' + resp.case.exposure + '<br>');
  });
}
