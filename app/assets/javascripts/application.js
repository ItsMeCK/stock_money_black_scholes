// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .


function validateform(){

  return_val = true
  n = $('#black_schole_stock_price').val();
  if(n >>> 0 === parseFloat(n) == false){
    $('#error_message_stock_price').html('Please Enter valid Stock Price greater than 0');
  	return_val = false;
  }
  else{
    $('#error_message_stock_price').html('');
  }

  n = $('#black_schole_strike_price').val();
  if(n >>> 0 === parseFloat(n) == false){
    $('#error_message_strike_price').html('Please Enter valid Strick Price greater than 0');
  	return_val = false;
  }
  else{
    $('#error_message_strike_price').html('');
  }

  n = $('#black_schole_interest_rate').val();
  if(n >>> 0 === parseFloat(n) == false){
    $('#error_message_interest_rate').html('Please Enter valid interest rate greater than 0');
  	return_val = false;
  }
  else{
    $('#error_message_interest_rate').html('');
  }

  n = $('#black_schole_volatility').val();
  if(n >>> 0 === parseFloat(n) == false){
    $('#error_message_volatility').html('Please Enter valid Stock Volatility must be grater than 0');
  	return_val = false;
  }
  else{
    $('#error_message_volatility').html('');
  }

  n = $('#black_schole_time').val();
  if(n >>> 0 === parseFloat(n) == false){
    $('#error_message_time').html('Please Enter valid Stock time must be grater than 0');
  	return_val = false;
  }
  else{
    $('#error_message_time').html('');
  }
  
  return return_val;
 }