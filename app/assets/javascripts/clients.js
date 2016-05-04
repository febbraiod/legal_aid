function Client(id, first_name, last_name, company_name, home_phone, work_phone, cell_phone, email, address, city, state, zip){
  this.id = id;
  this.first_name = first_name;
  this.last_name = last_name;
  this.company_name = company_name;
  this.home_phone = home_phone;
  this.work_phone = work_phone;
  this.cell_phone = cell_phone;
  this.email = email;
  this.address = address;
  this.city = city;
  this.state = state;
  this.zip = zip;  
}

Note.prototype.clientFormat = function(){
  var fullName = this.first_name + " " + this.last_name;
  return fullName;
};

function getClients(){
  $.get('/clients.json').done(function(data){
      var clients = data.clients;
      for(var i = 0; i < clients.length ; i++){
        var client = new Client(clients[i].id, 
                                clients[i].first_name,
                                clients[i].last_name,
                                clients[i].company_name,
                                clients[i].home_phone,
                                clients[i].work_phone,
                                clients[i].cell_phone,
                                clients[i].email,
                                clients[i].address,
                                clients[i].city,
                                clients[i].state,
                                clients[i].zip);
        renderClient(client);
      }
      bindClients();
  });
}

function renderClient(client){
  $('#clients').append('<p><a href="clients/' + client.id + '" id ="show_client" data-id="' + client.id + '">' + client.first_name + " " + client.last_name + '</a></p>');
  var phones = phoneString(client);
  $('#clients').append('<p>' + phones + '</p>');
  $('#clients').append('<p>' + client.email + '</p><br>');
}

function phoneString(client){
    var phone_numbers = "";
    if(client.home_phone !== ""){
      phone_numbers += client.home_phone + '(h) | ';
    }
    if(client.work_phone !== ""){
      phone_numbers += client.work_phone + '(w) | ';
    }
    if(client.cell_phone !== ""){
      phone_numbers += client.work_phone + '(c) |';
    }
    return phone_numbers.substring(0, phone_numbers.length - 2);
 }

function bindClients(){
  $('#show_client').on('click', function(e){
        e.preventDefault();
        var id = $(this).data('id');
        clearDom();
        showClient(id);
  });
}

function showClient(id){
  // ajax here
}

function clearDom(){
  $('#clients').html('');
}



$(function(){
  getClients();
});