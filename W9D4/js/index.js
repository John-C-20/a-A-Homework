console.log("Hello from the JavaScript console!");

// Your AJAX request here
$.ajax({
    type: 'get',
    url: 'http://api.openweathermap.org/data/2.5/weather?q=new%20york,US&appid=bcb83c4b54aee8418983c2aff3073b3b',
    success: function(data) {
        // Object.keys(data).forEach (ele => console.log(ele, data[ele]))
        console.log(data['weather'][0])
        console.log('ajax is asynchronous')
    }  
})

// Add another console log here, outside your AJAX request
console.log('this will print before ajax')