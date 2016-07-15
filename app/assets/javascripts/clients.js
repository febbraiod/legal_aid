function Client(id, first_name, last_name, company_name, home_phone, work_phone, cell_phone, email, address, city, state, zip, cases){
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
  this.cases = cases;
}

Client.prototype.fullName = function(){
  var fullName = this.first_name + " " + this.last_name;
  return fullName;
};

function makeClient(c){
  var client = new Client(c.id, 
                          c.first_name,
                          c.last_name,
                          c.company_name,
                          c.home_phone,
                          c.work_phone,
                          c.cell_phone,
                          c.email,
                          c.address,
                          c.city,
                          c.state,
                          c.zip,
                          c.cases);
  return client;
}

function getClients(){
  $.get('/clients.json').done(function(data){
      var clients = data.clients;
      for(var i = 0; i < clients.length ; i++){
        var c = clients[i];
        var client = makeClient(c);
        renderClientSummary(client);
      }
  });
}

function renderClientSummary(client){
  $('#clients').append('<p><a href="clients/' + client.id + '" id ="show_client" data-id="' + client.id + '">' + client.fullName() + '</a></p>');
  $('#clients').append('<p>' + phoneString(client) + '</p>');
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
      phone_numbers += client.cell_phone + '(c) |';
    }
    return phone_numbers.substring(0, phone_numbers.length - 2);
 }

function bindClients(){
  $('body').on('click','#show_client', function(e){
        e.preventDefault();
        var id = $(this).data('id');
        clearDom();
        getSingleClient(id);
  });
}

function getSingleClient(id){
  $.get('clients/' + id + '.json').done(function(data){
      c = data.client;
      var client = makeClient(c);
      $('#client_cases').show();
      renderClient(client);
      getClientCases(client);
      });
}

function renderClient(client){
  $('.col-2').html("");
  $('h1').html(client.fullName() + '<br>');
  if(client.company_name !== ""){
  $('#clients').append('<p>Company: ' + client.company_name + '</p><br>');
  }
  if(client.home_phone !== ""){
  $('#clients').append('<p>Home Phone: ' + client.home_phone + '</p><br>');
  }
  if(client.work_phone !== ""){
  $('#clients').append('<p>Work Phone: ' + client.work_phone + '</p><br>');
  }
  if(client.cell_phone !== ""){
  $('#clients').append('<p>Cell Phone: ' + client.cell_phone + '</p><br>');
  }
  if(client.email !== ""){
  $('#clients').append('<p>Email: ' + client.email + '</p><br>');
  }
  if(client.address !== ""){
  $('#clients').append('<p>Address: ' + client.address + '</p><br>');
  }
  if(client.city !== ""){
  $('#clients').append('<p>City: ' + client.city + '</p><br>');
  }
  if(client.state !== ""){
  $('#clients').append('<p>State: ' + client.state + '</p><br>');
  }
  if(client.zip !== ""){
  $('#clients').append('<p>Zip: ' + client.zip + '</p><br>');
  }
  $('#clients').append('<p><a href="clients/' + client.id + '/edit">Edit client info</a></p>');
  $('#hide_on_show').hide();
  $('#seeClientCases').show();
}

function clearDom(){
  $('#clients').html('');
}

function getClientCases(client){
  $('h4').html(client.fullName() +"'s cases").show();
  arrayOfCases = client.cases;
  for(var i = 0; i < arrayOfCases.length ;i++){
    var a = arrayOfCases[i];
    $('#client_cases').append('<p><a href="cases/'+ a.id + '">' + a.caption + '</a></p>');
  }
}

$(function(){
  getClients();
  $('#client_cases').hide();
  bindClients();
});