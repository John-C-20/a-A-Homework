document.addEventListener("DOMContentLoaded", function(){
    const canvas =  document.getElementById("mycanvas") 
    const ctx = canvas.getContext('2d')
    //What is ctx / what will it be used for? 
    canvas.height = 500 
    canvas.width = 500 


    ctx.fillStyle = 'rgb(215,255,155)'
    ctx.fillRect(0,0,500,500)

    ctx.beginPath();
    ctx.strokeStyle = 'red'
    ctx.lineWidth = 15 
    ctx.arc(250,250, 50, 0, 2*Math.PI)
    ctx.stroke() 
    ctx.fillStyle = 'white'
    ctx.fill()
});
