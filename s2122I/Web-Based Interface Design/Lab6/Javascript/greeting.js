const num_of_hours = prompt("Input Number of Hours");
if(isNaN(num_of_hours)){
    document.getElementById("greeting").innerHTML = "What is "+num_of_hours+"!?";
}else if(num_of_hours < 18){
    document.getElementById("greeting").innerHTML ="Good day";
}else{
    document.getElementById("greeting").innerHTML ="Good evening";
}